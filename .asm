
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
      7c:	05 0c 46 01 00       	add    $0x1460c,%eax
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
      8e:	c7 05 20 46 01 00 00 	movl   $0x0,0x14620
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
      c6:	e8 b8 4e 00 00       	call   4f83 <initRect>
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
      fa:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
     101:	e8 69 4f 00 00       	call   506f <createClickable>
				- (BUTTON_HEIGHT + 3), 100, BUTTON_HEIGHT), MSG_LPRESS, h_searchbox);
	if (isSearching == 0) {
     106:	a1 e0 3c 01 00       	mov    0x13ce0,%eax
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
     137:	a1 00 46 01 00       	mov    0x14600,%eax
     13c:	89 04 24             	mov    %eax,(%esp)
     13f:	a1 04 46 01 00       	mov    0x14604,%eax
     144:	89 44 24 04          	mov    %eax,0x4(%esp)
     148:	a1 08 46 01 00       	mov    0x14608,%eax
     14d:	89 44 24 08          	mov    %eax,0x8(%esp)
     151:	e8 e3 39 00 00       	call   3b39 <fill_rect>
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
     180:	a1 00 46 01 00       	mov    0x14600,%eax
     185:	89 04 24             	mov    %eax,(%esp)
     188:	a1 04 46 01 00       	mov    0x14604,%eax
     18d:	89 44 24 04          	mov    %eax,0x4(%esp)
     191:	a1 08 46 01 00       	mov    0x14608,%eax
     196:	89 44 24 08          	mov    %eax,0x8(%esp)
     19a:	e8 9a 39 00 00       	call   3b39 <fill_rect>
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
     1a8:	a1 00 46 01 00       	mov    0x14600,%eax
     1ad:	89 04 24             	mov    %eax,(%esp)
     1b0:	a1 04 46 01 00       	mov    0x14604,%eax
     1b5:	89 44 24 04          	mov    %eax,0x4(%esp)
     1b9:	a1 08 46 01 00       	mov    0x14608,%eax
     1be:	89 44 24 08          	mov    %eax,0x8(%esp)
     1c2:	e8 81 0c 00 00       	call   e48 <updateFileList>
	struct fileItem *head;
	head = fileItemList;
     1c7:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
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
     1f2:	a1 c8 0e 01 00       	mov    0x10ec8,%eax
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
     231:	e8 91 54 00 00       	call   56c7 <strcmp>
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
     272:	e8 50 54 00 00       	call   56c7 <strcmp>
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
     2b0:	a1 c8 0e 01 00       	mov    0x10ec8,%eax
     2b5:	85 c0                	test   %eax,%eax
     2b7:	74 0c                	je     2c5 <fileSortByName+0x124>
    	flag_fileSort = 0;
     2b9:	c7 05 c8 0e 01 00 00 	movl   $0x0,0x10ec8
     2c0:	00 00 00 
     2c3:	eb 0a                	jmp    2cf <fileSortByName+0x12e>
    else
    	flag_fileSort = 1;
     2c5:	c7 05 c8 0e 01 00 01 	movl   $0x1,0x10ec8
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
     2ea:	a1 00 46 01 00       	mov    0x14600,%eax
     2ef:	89 44 24 04          	mov    %eax,0x4(%esp)
     2f3:	a1 04 46 01 00       	mov    0x14604,%eax
     2f8:	89 44 24 08          	mov    %eax,0x8(%esp)
     2fc:	a1 08 46 01 00       	mov    0x14608,%eax
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
     33a:	a3 d0 0e 01 00       	mov    %eax,0x10ed0
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
     352:	e8 57 5a 00 00       	call   5dae <malloc>
     357:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
     35a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
     361:	e8 48 5a 00 00       	call   5dae <malloc>
     366:	8b 55 f4             	mov    -0xc(%ebp),%edx
     369:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
     36c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     36f:	8b 40 14             	mov    0x14(%eax),%eax
     372:	8b 55 1c             	mov    0x1c(%ebp),%edx
     375:	89 54 24 04          	mov    %edx,0x4(%esp)
     379:	89 04 24             	mov    %eax,(%esp)
     37c:	e8 16 53 00 00       	call   5697 <strcpy>
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
     3a1:	8b 15 d4 0e 01 00    	mov    0x10ed4,%edx
     3a7:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     3aa:	8d 45 d8             	lea    -0x28(%ebp),%eax
     3ad:	89 54 24 10          	mov    %edx,0x10(%esp)
     3b1:	8b 15 00 46 01 00    	mov    0x14600,%edx
     3b7:	89 54 24 04          	mov    %edx,0x4(%esp)
     3bb:	8b 15 04 46 01 00    	mov    0x14604,%edx
     3c1:	89 54 24 08          	mov    %edx,0x8(%esp)
     3c5:	8b 15 08 46 01 00    	mov    0x14608,%edx
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
     3f2:	8b 15 d0 0e 01 00    	mov    0x10ed0,%edx
     3f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3fb:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
     3fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
     401:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
     408:	8b 45 f4             	mov    -0xc(%ebp),%eax
     40b:	a3 d0 0e 01 00       	mov    %eax,0x10ed0
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
     41b:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
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
     43d:	e8 33 58 00 00       	call   5c75 <free>
		free(temp);
     442:	8b 45 f0             	mov    -0x10(%ebp),%eax
     445:	89 04 24             	mov    %eax,(%esp)
     448:	e8 28 58 00 00       	call   5c75 <free>
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
     453:	c7 05 d0 0e 01 00 00 	movl   $0x0,0x10ed0
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
     46b:	e8 96 52 00 00       	call   5706 <strlen>
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
     4ff:	c7 05 d4 0e 01 00 00 	movl   $0x0,0x10ed4
     506:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     509:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     510:	00 
     511:	8b 45 08             	mov    0x8(%ebp),%eax
     514:	89 04 24             	mov    %eax,(%esp)
     517:	e8 fe 53 00 00       	call   591a <open>
     51c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     51f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     523:	79 20                	jns    545 <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     525:	8b 45 08             	mov    0x8(%ebp),%eax
     528:	89 44 24 08          	mov    %eax,0x8(%esp)
     52c:	c7 44 24 04 40 c1 00 	movl   $0xc140,0x4(%esp)
     533:	00 
     534:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     53b:	e8 82 55 00 00       	call   5ac2 <printf>
		return;
     540:	e9 8f 02 00 00       	jmp    7d4 <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     545:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     54b:	89 44 24 04          	mov    %eax,0x4(%esp)
     54f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     552:	89 04 24             	mov    %eax,(%esp)
     555:	e8 d8 53 00 00       	call   5932 <fstat>
     55a:	85 c0                	test   %eax,%eax
     55c:	79 2b                	jns    589 <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     55e:	8b 45 08             	mov    0x8(%ebp),%eax
     561:	89 44 24 08          	mov    %eax,0x8(%esp)
     565:	c7 44 24 04 54 c1 00 	movl   $0xc154,0x4(%esp)
     56c:	00 
     56d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     574:	e8 49 55 00 00       	call   5ac2 <printf>
		close(fd);
     579:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     57c:	89 04 24             	mov    %eax,(%esp)
     57f:	e8 7e 53 00 00       	call   5902 <close>
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
     5d0:	c7 44 24 04 68 c1 00 	movl   $0xc168,0x4(%esp)
     5d7:	00 
     5d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5df:	e8 de 54 00 00       	call   5ac2 <printf>
		break;
     5e4:	e9 e0 01 00 00       	jmp    7c9 <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     5e9:	8b 45 08             	mov    0x8(%ebp),%eax
     5ec:	89 04 24             	mov    %eax,(%esp)
     5ef:	e8 12 51 00 00       	call   5706 <strlen>
     5f4:	83 c0 10             	add    $0x10,%eax
     5f7:	3d 00 02 00 00       	cmp    $0x200,%eax
     5fc:	76 19                	jbe    617 <list+0x124>
			printf(1, "ls: path too long\n");
     5fe:	c7 44 24 04 75 c1 00 	movl   $0xc175,0x4(%esp)
     605:	00 
     606:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     60d:	e8 b0 54 00 00       	call   5ac2 <printf>
			break;
     612:	e9 b2 01 00 00       	jmp    7c9 <list+0x2d6>
		}
		strcpy(buf, path);
     617:	8b 45 08             	mov    0x8(%ebp),%eax
     61a:	89 44 24 04          	mov    %eax,0x4(%esp)
     61e:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     624:	89 04 24             	mov    %eax,(%esp)
     627:	e8 6b 50 00 00       	call   5697 <strcpy>
		p = buf + strlen(buf);
     62c:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     632:	89 04 24             	mov    %eax,(%esp)
     635:	e8 cc 50 00 00       	call   5706 <strlen>
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
     682:	e8 0e 52 00 00       	call   5895 <memmove>
			p[DIRSIZ] = 0;
     687:	8b 45 e0             	mov    -0x20(%ebp),%eax
     68a:	83 c0 0e             	add    $0xe,%eax
     68d:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     690:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     696:	89 44 24 04          	mov    %eax,0x4(%esp)
     69a:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     6a0:	89 04 24             	mov    %eax,(%esp)
     6a3:	e8 52 51 00 00       	call   57fa <stat>
     6a8:	85 c0                	test   %eax,%eax
     6aa:	79 23                	jns    6cf <list+0x1dc>
				printf(1, "ls: cannot stat %s\n", buf);
     6ac:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     6b2:	89 44 24 08          	mov    %eax,0x8(%esp)
     6b6:	c7 44 24 04 54 c1 00 	movl   $0xc154,0x4(%esp)
     6bd:	00 
     6be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6c5:	e8 f8 53 00 00       	call   5ac2 <printf>
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
     6fb:	8b 15 d4 0e 01 00    	mov    0x10ed4,%edx
     701:	8d 45 d0             	lea    -0x30(%ebp),%eax
     704:	89 54 24 10          	mov    %edx,0x10(%esp)
     708:	8b 15 00 46 01 00    	mov    0x14600,%edx
     70e:	89 54 24 04          	mov    %edx,0x4(%esp)
     712:	8b 15 04 46 01 00    	mov    0x14604,%edx
     718:	89 54 24 08          	mov    %edx,0x8(%esp)
     71c:	8b 15 08 46 01 00    	mov    0x14608,%edx
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
     795:	a1 d4 0e 01 00       	mov    0x10ed4,%eax
     79a:	83 c0 01             	add    $0x1,%eax
     79d:	a3 d4 0e 01 00       	mov    %eax,0x10ed4
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
     7ba:	e8 33 51 00 00       	call   58f2 <read>
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
     7cf:	e8 2e 51 00 00       	call   5902 <close>
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
     83e:	e8 f6 32 00 00       	call   3b39 <fill_rect>
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
     889:	e8 ab 32 00 00       	call   3b39 <fill_rect>
	}
	if (style == ICON_STYLE) {
     88e:	a1 64 05 01 00       	mov    0x10564,%eax
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
     8c3:	a1 a8 05 01 00       	mov    0x105a8,%eax
     8c8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     8cc:	a1 ac 05 01 00       	mov    0x105ac,%eax
     8d1:	89 44 24 10          	mov    %eax,0x10(%esp)
     8d5:	a1 b0 05 01 00       	mov    0x105b0,%eax
     8da:	89 44 24 14          	mov    %eax,0x14(%esp)
     8de:	8b 45 08             	mov    0x8(%ebp),%eax
     8e1:	89 04 24             	mov    %eax,(%esp)
     8e4:	8b 45 0c             	mov    0xc(%ebp),%eax
     8e7:	89 44 24 04          	mov    %eax,0x4(%esp)
     8eb:	8b 45 10             	mov    0x10(%ebp),%eax
     8ee:	89 44 24 08          	mov    %eax,0x8(%esp)
     8f2:	e8 e1 38 00 00       	call   41d8 <draw_picture>
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
     90d:	a1 10 06 01 00       	mov    0x10610,%eax
     912:	89 44 24 0c          	mov    %eax,0xc(%esp)
     916:	a1 14 06 01 00       	mov    0x10614,%eax
     91b:	89 44 24 10          	mov    %eax,0x10(%esp)
     91f:	a1 18 06 01 00       	mov    0x10618,%eax
     924:	89 44 24 14          	mov    %eax,0x14(%esp)
     928:	8b 45 08             	mov    0x8(%ebp),%eax
     92b:	89 04 24             	mov    %eax,(%esp)
     92e:	8b 45 0c             	mov    0xc(%ebp),%eax
     931:	89 44 24 04          	mov    %eax,0x4(%esp)
     935:	8b 45 10             	mov    0x10(%ebp),%eax
     938:	89 44 24 08          	mov    %eax,0x8(%esp)
     93c:	e8 97 38 00 00       	call   41d8 <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     941:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     942:	8b 45 14             	mov    0x14(%ebp),%eax
     945:	89 04 24             	mov    %eax,(%esp)
     948:	e8 b9 4d 00 00       	call   5706 <strlen>
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
     9a5:	e8 6e 37 00 00       	call   4118 <puts_str>
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
     9da:	a1 dc 05 01 00       	mov    0x105dc,%eax
     9df:	89 44 24 0c          	mov    %eax,0xc(%esp)
     9e3:	a1 e0 05 01 00       	mov    0x105e0,%eax
     9e8:	89 44 24 10          	mov    %eax,0x10(%esp)
     9ec:	a1 e4 05 01 00       	mov    0x105e4,%eax
     9f1:	89 44 24 14          	mov    %eax,0x14(%esp)
     9f5:	8b 45 08             	mov    0x8(%ebp),%eax
     9f8:	89 04 24             	mov    %eax,(%esp)
     9fb:	8b 45 0c             	mov    0xc(%ebp),%eax
     9fe:	89 44 24 04          	mov    %eax,0x4(%esp)
     a02:	8b 45 10             	mov    0x10(%ebp),%eax
     a05:	89 44 24 08          	mov    %eax,0x8(%esp)
     a09:	e8 ca 37 00 00       	call   41d8 <draw_picture>
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
     a56:	e8 bd 36 00 00       	call   4118 <puts_str>
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
     a71:	a1 44 06 01 00       	mov    0x10644,%eax
     a76:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a7a:	a1 48 06 01 00       	mov    0x10648,%eax
     a7f:	89 44 24 10          	mov    %eax,0x10(%esp)
     a83:	a1 4c 06 01 00       	mov    0x1064c,%eax
     a88:	89 44 24 14          	mov    %eax,0x14(%esp)
     a8c:	8b 45 08             	mov    0x8(%ebp),%eax
     a8f:	89 04 24             	mov    %eax,(%esp)
     a92:	8b 45 0c             	mov    0xc(%ebp),%eax
     a95:	89 44 24 04          	mov    %eax,0x4(%esp)
     a99:	8b 45 10             	mov    0x10(%ebp),%eax
     a9c:	89 44 24 08          	mov    %eax,0x8(%esp)
     aa0:	e8 33 37 00 00       	call   41d8 <draw_picture>
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
     add:	e8 36 36 00 00       	call   4118 <puts_str>
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
     af6:	e8 b3 52 00 00       	call   5dae <malloc>
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
     c8d:	e8 1c 36 00 00       	call   42ae <draw_line>
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
     cd4:	e8 d5 35 00 00       	call   42ae <draw_line>
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
     d1b:	e8 8e 35 00 00       	call   42ae <draw_line>
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
     d5e:	e8 4b 35 00 00       	call   42ae <draw_line>
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
     da1:	e8 93 2d 00 00       	call   3b39 <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, currentPath, 0, 42, 3);
     da6:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     dad:	00 
     dae:	c7 44 24 14 2a 00 00 	movl   $0x2a,0x14(%esp)
     db5:	00 
     db6:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     dbd:	00 
     dbe:	c7 44 24 0c 40 46 01 	movl   $0x14640,0xc(%esp)
     dc5:	00 
     dc6:	8b 45 08             	mov    0x8(%ebp),%eax
     dc9:	89 04 24             	mov    %eax,(%esp)
     dcc:	8b 45 0c             	mov    0xc(%ebp),%eax
     dcf:	89 44 24 04          	mov    %eax,0x4(%esp)
     dd3:	8b 45 10             	mov    0x10(%ebp),%eax
     dd6:	89 44 24 08          	mov    %eax,0x8(%esp)
     dda:	e8 39 33 00 00       	call   4118 <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     ddf:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
     de6:	00 
     de7:	c7 44 24 0c 60 06 01 	movl   $0x10660,0xc(%esp)
     dee:	00 
     def:	8b 45 08             	mov    0x8(%ebp),%eax
     df2:	89 04 24             	mov    %eax,(%esp)
     df5:	8b 45 0c             	mov    0xc(%ebp),%eax
     df8:	89 44 24 04          	mov    %eax,0x4(%esp)
     dfc:	8b 45 10             	mov    0x10(%ebp),%eax
     dff:	89 44 24 08          	mov    %eax,0x8(%esp)
     e03:	e8 81 38 00 00       	call   4689 <draw_iconlist>
	draw_searchbox();
     e08:	e8 8d f2 ff ff       	call   9a <draw_searchbox>
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     e0d:	c7 44 24 18 28 00 00 	movl   $0x28,0x18(%esp)
     e14:	00 
     e15:	c7 44 24 14 a4 01 00 	movl   $0x1a4,0x14(%esp)
     e1c:	00 
     e1d:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     e24:	00 
     e25:	c7 44 24 0c 0c 46 01 	movl   $0x1460c,0xc(%esp)
     e2c:	00 
     e2d:	8b 45 08             	mov    0x8(%ebp),%eax
     e30:	89 04 24             	mov    %eax,(%esp)
     e33:	8b 45 0c             	mov    0xc(%ebp),%eax
     e36:	89 44 24 04          	mov    %eax,0x4(%esp)
     e3a:	8b 45 10             	mov    0x10(%ebp),%eax
     e3d:	89 44 24 08          	mov    %eax,0x8(%esp)
     e41:	e8 d2 32 00 00       	call   4118 <puts_str>
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
     e5b:	c7 04 24 88 c1 00 00 	movl   $0xc188,(%esp)
     e62:	e8 8c f6 ff ff       	call   4f3 <list>
	if (keyContent.length <= 0)
     e67:	a1 20 46 01 00       	mov    0x14620,%eax
     e6c:	85 c0                	test   %eax,%eax
     e6e:	7f 05                	jg     e75 <updateFileList+0x2d>
		return;
     e70:	e9 1d 01 00 00       	jmp    f92 <updateFileList+0x14a>
	p = fileItemList;
     e75:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
     e7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	q = 0;
     e7d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	while(p != 0) {
     e84:	e9 9d 00 00 00       	jmp    f26 <updateFileList+0xde>
		if(!strstr(p->name, keyContent.content)) {
     e89:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e8c:	8b 40 14             	mov    0x14(%eax),%eax
     e8f:	c7 44 24 04 0c 46 01 	movl   $0x1460c,0x4(%esp)
     e96:	00 
     e97:	89 04 24             	mov    %eax,(%esp)
     e9a:	e8 61 f1 ff ff       	call   0 <strstr>
     e9f:	85 c0                	test   %eax,%eax
     ea1:	75 70                	jne    f13 <updateFileList+0xcb>
			if(q == 0) {
     ea3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     ea7:	75 30                	jne    ed9 <updateFileList+0x91>
				fileItemList = fileItemList->next;
     ea9:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
     eae:	8b 40 2c             	mov    0x2c(%eax),%eax
     eb1:	a3 d0 0e 01 00       	mov    %eax,0x10ed0
				free(p->name);
     eb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eb9:	8b 40 14             	mov    0x14(%eax),%eax
     ebc:	89 04 24             	mov    %eax,(%esp)
     ebf:	e8 b1 4d 00 00       	call   5c75 <free>
				free(p);
     ec4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ec7:	89 04 24             	mov    %eax,(%esp)
     eca:	e8 a6 4d 00 00       	call   5c75 <free>
				p = fileItemList;
     ecf:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
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
     ef8:	e8 78 4d 00 00       	call   5c75 <free>
				free(p);
     efd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f00:	89 04 24             	mov    %eax,(%esp)
     f03:	e8 6d 4d 00 00       	call   5c75 <free>
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
     f30:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
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
     fa4:	a1 64 05 01 00       	mov    0x10564,%eax
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
     ff5:	e8 3f 2b 00 00       	call   3b39 <fill_rect>
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
    103c:	e8 6d 32 00 00       	call   42ae <draw_line>
//	q = 0;
	// if (keyContent.length == 0) {
	// 	printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
    1041:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
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
    10cb:	a1 64 05 01 00       	mov    0x10564,%eax
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
    1115:	e8 1f 2a 00 00       	call   3b39 <fill_rect>
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
    1156:	e8 de 29 00 00       	call   3b39 <fill_rect>
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
    119b:	e8 99 29 00 00       	call   3b39 <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
    11a0:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
    11a7:	00 
    11a8:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
    11af:	00 
    11b0:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    11b7:	00 
    11b8:	c7 44 24 0c 8a c1 00 	movl   $0xc18a,0xc(%esp)
    11bf:	00 
    11c0:	8b 45 08             	mov    0x8(%ebp),%eax
    11c3:	89 04 24             	mov    %eax,(%esp)
    11c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    11c9:	89 44 24 04          	mov    %eax,0x4(%esp)
    11cd:	8b 45 10             	mov    0x10(%ebp),%eax
    11d0:	89 44 24 08          	mov    %eax,0x8(%esp)
    11d4:	e8 3f 2f 00 00       	call   4118 <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
    11d9:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
    11e0:	00 
    11e1:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
    11e8:	00 
    11e9:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    11f0:	00 
    11f1:	c7 44 24 0c 8f c1 00 	movl   $0xc18f,0xc(%esp)
    11f8:	00 
    11f9:	8b 45 08             	mov    0x8(%ebp),%eax
    11fc:	89 04 24             	mov    %eax,(%esp)
    11ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    1202:	89 44 24 04          	mov    %eax,0x4(%esp)
    1206:	8b 45 10             	mov    0x10(%ebp),%eax
    1209:	89 44 24 08          	mov    %eax,0x8(%esp)
    120d:	e8 06 2f 00 00       	call   4118 <puts_str>
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
    1229:	e8 80 4b 00 00       	call   5dae <malloc>
    122e:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
    1231:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    1238:	e8 71 4b 00 00       	call   5dae <malloc>
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
    12ea:	e8 86 49 00 00       	call   5c75 <free>
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
    12fe:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
    1303:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    1306:	eb 27                	jmp    132f <printItemList+0x37>
		printf(0, "%s\n", p->name);
    1308:	8b 45 f4             	mov    -0xc(%ebp),%eax
    130b:	8b 40 14             	mov    0x14(%eax),%eax
    130e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1312:	c7 44 24 04 94 c1 00 	movl   $0xc194,0x4(%esp)
    1319:	00 
    131a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1321:	e8 9c 47 00 00       	call   5ac2 <printf>
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
    133d:	a1 64 05 01 00       	mov    0x10564,%eax
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
    1395:	8b 15 c0 0e 01 00    	mov    0x10ec0,%edx
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
    13c1:	e8 bd 3b 00 00       	call   4f83 <initRect>
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
    13db:	a1 c0 0e 01 00       	mov    0x10ec0,%eax
    13e0:	01 c2                	add    %eax,%edx
    13e2:	8b 45 08             	mov    0x8(%ebp),%eax
    13e5:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    13ec:	00 
    13ed:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    13f1:	89 54 24 08          	mov    %edx,0x8(%esp)
    13f5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    13fc:	00 
    13fd:	89 04 24             	mov    %eax,(%esp)
    1400:	e8 7e 3b 00 00       	call   4f83 <initRect>
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
    1415:	a1 64 05 01 00       	mov    0x10564,%eax
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
    144c:	c7 44 24 18 87 2e 00 	movl   $0x2e87,0x18(%esp)
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
    147e:	e8 ec 3b 00 00       	call   506f <createClickable>
		break;
    1483:	e9 84 00 00 00       	jmp    150c <addItemEvent+0xfd>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    1488:	c7 44 24 18 87 2e 00 	movl   $0x2e87,0x18(%esp)
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
    14ba:	e8 b0 3b 00 00       	call   506f <createClickable>
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
    14f1:	e8 79 3b 00 00       	call   506f <createClickable>
		break;
    14f6:	eb 14                	jmp    150c <addItemEvent+0xfd>
	default:
		printf(0, "unknown file type!");
    14f8:	c7 44 24 04 98 c1 00 	movl   $0xc198,0x4(%esp)
    14ff:	00 
    1500:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1507:	e8 b6 45 00 00       	call   5ac2 <printf>
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
    1514:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
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
    15b5:	8b 1c 85 80 09 01 00 	mov    0x10980(,%eax,4),%ebx
    15bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15bf:	6b c0 34             	imul   $0x34,%eax,%eax
    15c2:	05 80 06 01 00       	add    $0x10680,%eax
    15c7:	8b 78 10             	mov    0x10(%eax),%edi
    15ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15cd:	6b c0 34             	imul   $0x34,%eax,%eax
    15d0:	05 80 06 01 00       	add    $0x10680,%eax
    15d5:	8b 70 0c             	mov    0xc(%eax),%esi
    15d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15db:	6b c0 34             	imul   $0x34,%eax,%eax
    15de:	05 80 06 01 00       	add    $0x10680,%eax
    15e3:	8b 48 04             	mov    0x4(%eax),%ecx
    15e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15e9:	6b c0 34             	imul   $0x34,%eax,%eax
    15ec:	05 80 06 01 00       	add    $0x10680,%eax
    15f1:	8b 10                	mov    (%eax),%edx
    15f3:	8d 45 c0             	lea    -0x40(%ebp),%eax
    15f6:	89 7c 24 10          	mov    %edi,0x10(%esp)
    15fa:	89 74 24 0c          	mov    %esi,0xc(%esp)
    15fe:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1602:	89 54 24 04          	mov    %edx,0x4(%esp)
    1606:	89 04 24             	mov    %eax,(%esp)
    1609:	e8 75 39 00 00       	call   4f83 <initRect>
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
    163f:	e8 2b 3a 00 00       	call   506f <createClickable>
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
    167a:	e8 04 39 00 00       	call   4f83 <initRect>
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
    16b4:	e8 b6 39 00 00       	call   506f <createClickable>
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
    16c7:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
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
    16fd:	e8 dc 38 00 00       	call   4fde <isIn>
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
    1727:	c7 44 24 04 ab c1 00 	movl   $0xc1ab,0x4(%esp)
    172e:	00 
    172f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1736:	e8 87 43 00 00       	call   5ac2 <printf>
	fileSortByName();
    173b:	e8 61 ea ff ff       	call   1a1 <fileSortByName>
	drawFinderContent(context);
    1740:	a1 00 46 01 00       	mov    0x14600,%eax
    1745:	89 04 24             	mov    %eax,(%esp)
    1748:	a1 04 46 01 00       	mov    0x14604,%eax
    174d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1751:	a1 08 46 01 00       	mov    0x14608,%eax
    1756:	89 44 24 08          	mov    %eax,0x8(%esp)
    175a:	e8 38 f8 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    175f:	a1 00 46 01 00       	mov    0x14600,%eax
    1764:	89 04 24             	mov    %eax,(%esp)
    1767:	a1 04 46 01 00       	mov    0x14604,%eax
    176c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1770:	a1 08 46 01 00       	mov    0x14608,%eax
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
    17a4:	e8 da 37 00 00       	call   4f83 <initRect>
    17a9:	83 ec 04             	sub    $0x4,%esp
    17ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17af:	89 44 24 04          	mov    %eax,0x4(%esp)
    17b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17b6:	89 44 24 08          	mov    %eax,0x8(%esp)
    17ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17bd:	89 44 24 0c          	mov    %eax,0xc(%esp)
    17c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17c4:	89 44 24 10          	mov    %eax,0x10(%esp)
    17c8:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    17cf:	e8 b2 39 00 00       	call   5186 <deleteClickable>
	addWndEvent(&cm);
    17d4:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    17db:	e8 b6 fd ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    17e0:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    17e7:	e8 22 fd ff ff       	call   150e <addListEvent>
}
    17ec:	c9                   	leave  
    17ed:	c3                   	ret    

000017ee <h_searchbox>:

void h_searchbox(Point p) {
    17ee:	55                   	push   %ebp
    17ef:	89 e5                	mov    %esp,%ebp
	isSearching = 1;
    17f1:	c7 05 e0 3c 01 00 01 	movl   $0x1,0x13ce0
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
    1803:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
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
    182d:	8b 15 c0 0e 01 00    	mov    0x10ec0,%edx
    1833:	8b 45 08             	mov    0x8(%ebp),%eax
    1836:	01 d0                	add    %edx,%eax
    1838:	a3 c0 0e 01 00       	mov    %eax,0x10ec0
}
    183d:	c9                   	leave  
    183e:	c3                   	ret    

0000183f <scrollDown>:

void scrollDown() {
    183f:	55                   	push   %ebp
    1840:	89 e5                	mov    %esp,%ebp
    1842:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    1845:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
    184a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	printf(0, "have you ever had sex?%d\n%d", fileItemList->pos.start.y, (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    184d:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
    1852:	8b 40 1c             	mov    0x1c(%eax),%eax
    1855:	c7 44 24 0c a4 01 00 	movl   $0x1a4,0xc(%esp)
    185c:	00 
    185d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1861:	c7 44 24 04 b5 c1 00 	movl   $0xc1b5,0x4(%esp)
    1868:	00 
    1869:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1870:	e8 4d 42 00 00       	call   5ac2 <printf>
	if (style == ICON_STYLE){
    1875:	a1 64 05 01 00       	mov    0x10564,%eax
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
    18ff:	a1 c0 0e 01 00       	mov    0x10ec0,%eax
    1904:	89 44 24 08          	mov    %eax,0x8(%esp)
    1908:	c7 44 24 04 d4 c1 00 	movl   $0xc1d4,0x4(%esp)
    190f:	00 
    1910:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1917:	e8 a6 41 00 00       	call   5ac2 <printf>
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
    1929:	a1 00 46 01 00       	mov    0x14600,%eax
    192e:	89 04 24             	mov    %eax,(%esp)
    1931:	a1 04 46 01 00       	mov    0x14604,%eax
    1936:	89 44 24 04          	mov    %eax,0x4(%esp)
    193a:	a1 08 46 01 00       	mov    0x14608,%eax
    193f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1943:	e8 4f f6 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    1948:	a1 00 46 01 00       	mov    0x14600,%eax
    194d:	89 04 24             	mov    %eax,(%esp)
    1950:	a1 04 46 01 00       	mov    0x14604,%eax
    1955:	89 44 24 04          	mov    %eax,0x4(%esp)
    1959:	a1 08 46 01 00       	mov    0x14608,%eax
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
    198d:	e8 f1 35 00 00       	call   4f83 <initRect>
    1992:	83 ec 04             	sub    $0x4,%esp
    1995:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1998:	89 44 24 04          	mov    %eax,0x4(%esp)
    199c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    199f:	89 44 24 08          	mov    %eax,0x8(%esp)
    19a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19a6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    19aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ad:	89 44 24 10          	mov    %eax,0x10(%esp)
    19b1:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    19b8:	e8 c9 37 00 00       	call   5186 <deleteClickable>
	addWndEvent(&cm);
    19bd:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    19c4:	e8 cd fb ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    19c9:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
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
    19dd:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
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
    1a06:	c7 44 24 04 f3 c1 00 	movl   $0xc1f3,0x4(%esp)
    1a0d:	00 
    1a0e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a15:	e8 a8 40 00 00       	call   5ac2 <printf>
	printf(0, "have you ever had sex?%d\n", fileItemList->pos.start.y);
    1a1a:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
    1a1f:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a22:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a26:	c7 44 24 04 11 c2 00 	movl   $0xc211,0x4(%esp)
    1a2d:	00 
    1a2e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a35:	e8 88 40 00 00       	call   5ac2 <printf>
	if (style == ICON_STYLE){
    1a3a:	a1 64 05 01 00       	mov    0x10564,%eax
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
    1abc:	a1 c0 0e 01 00       	mov    0x10ec0,%eax
    1ac1:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ac5:	c7 44 24 04 2b c2 00 	movl   $0xc22b,0x4(%esp)
    1acc:	00 
    1acd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ad4:	e8 e9 3f 00 00       	call   5ac2 <printf>
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
    1ae6:	a1 00 46 01 00       	mov    0x14600,%eax
    1aeb:	89 04 24             	mov    %eax,(%esp)
    1aee:	a1 04 46 01 00       	mov    0x14604,%eax
    1af3:	89 44 24 04          	mov    %eax,0x4(%esp)
    1af7:	a1 08 46 01 00       	mov    0x14608,%eax
    1afc:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b00:	e8 92 f4 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    1b05:	a1 00 46 01 00       	mov    0x14600,%eax
    1b0a:	89 04 24             	mov    %eax,(%esp)
    1b0d:	a1 04 46 01 00       	mov    0x14604,%eax
    1b12:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b16:	a1 08 46 01 00       	mov    0x14608,%eax
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
    1b4a:	e8 34 34 00 00       	call   4f83 <initRect>
    1b4f:	83 ec 04             	sub    $0x4,%esp
    1b52:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1b55:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b59:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b5c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b60:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b63:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1b67:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b6a:	89 44 24 10          	mov    %eax,0x10(%esp)
    1b6e:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    1b75:	e8 0c 36 00 00       	call   5186 <deleteClickable>
	addWndEvent(&cm);
    1b7a:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    1b81:	e8 10 fa ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    1b86:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
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
    1ba0:	e8 61 3b 00 00       	call   5706 <strlen>
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
    1bc9:	c7 04 24 40 46 01 00 	movl   $0x14640,(%esp)
    1bd0:	e8 31 3b 00 00       	call   5706 <strlen>
    1bd5:	83 f8 01             	cmp    $0x1,%eax
    1bd8:	75 0b                	jne    1be5 <updatePath+0x51>
    1bda:	0f b6 05 40 46 01 00 	movzbl 0x14640,%eax
    1be1:	3c 2f                	cmp    $0x2f,%al
    1be3:	74 4f                	je     1c34 <updatePath+0xa0>
		{
			int tmpn = strlen(currentPath);
    1be5:	c7 04 24 40 46 01 00 	movl   $0x14640,(%esp)
    1bec:	e8 15 3b 00 00       	call   5706 <strlen>
    1bf1:	89 45 ec             	mov    %eax,-0x14(%ebp)
			currentPath[tmpn - 1] = '\0';
    1bf4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1bf7:	83 e8 01             	sub    $0x1,%eax
    1bfa:	c6 80 40 46 01 00 00 	movb   $0x0,0x14640(%eax)
			for (i = tmpn - 2; i > 0; i--)
    1c01:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1c04:	83 e8 02             	sub    $0x2,%eax
    1c07:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1c0a:	eb 22                	jmp    1c2e <updatePath+0x9a>
			{
				if (currentPath[i] != '/')
    1c0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c0f:	05 40 46 01 00       	add    $0x14640,%eax
    1c14:	0f b6 00             	movzbl (%eax),%eax
    1c17:	3c 2f                	cmp    $0x2f,%al
    1c19:	74 11                	je     1c2c <updatePath+0x98>
					currentPath[i] = '\0';
    1c1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c1e:	05 40 46 01 00       	add    $0x14640,%eax
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
    1c36:	c7 04 24 40 46 01 00 	movl   $0x14640,(%esp)
    1c3d:	e8 c4 3a 00 00       	call   5706 <strlen>
    1c42:	89 45 e8             	mov    %eax,-0x18(%ebp)
		strcpy(currentPath + tmpn, name);
    1c45:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c48:	8d 90 40 46 01 00    	lea    0x14640(%eax),%edx
    1c4e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c51:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c55:	89 14 24             	mov    %edx,(%esp)
    1c58:	e8 3a 3a 00 00       	call   5697 <strcpy>
		tmpn = strlen(currentPath);
    1c5d:	c7 04 24 40 46 01 00 	movl   $0x14640,(%esp)
    1c64:	e8 9d 3a 00 00       	call   5706 <strlen>
    1c69:	89 45 e8             	mov    %eax,-0x18(%ebp)
		currentPath[tmpn] = '/';
    1c6c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c6f:	05 40 46 01 00       	add    $0x14640,%eax
    1c74:	c6 00 2f             	movb   $0x2f,(%eax)
		currentPath[tmpn + 1] = '\0';
    1c77:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c7a:	83 c0 01             	add    $0x1,%eax
    1c7d:	c6 80 40 46 01 00 00 	movb   $0x0,0x14640(%eax)
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
    1c8c:	c7 05 c0 0e 01 00 00 	movl   $0x0,0x10ec0
    1c93:	00 00 00 
	printf(0, "entering : %s\n", name);
    1c96:	8b 45 08             	mov    0x8(%ebp),%eax
    1c99:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c9d:	c7 44 24 04 48 c2 00 	movl   $0xc248,0x4(%esp)
    1ca4:	00 
    1ca5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cac:	e8 11 3e 00 00       	call   5ac2 <printf>
	if (chdir(name) < 0)
    1cb1:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb4:	89 04 24             	mov    %eax,(%esp)
    1cb7:	e8 8e 3c 00 00       	call   594a <chdir>
    1cbc:	85 c0                	test   %eax,%eax
    1cbe:	79 1d                	jns    1cdd <enterDir+0x57>
		printf(2, "cannot cd %s\n", name);
    1cc0:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc3:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cc7:	c7 44 24 04 57 c2 00 	movl   $0xc257,0x4(%esp)
    1cce:	00 
    1ccf:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1cd6:	e8 e7 3d 00 00       	call   5ac2 <printf>
    1cdb:	eb 0b                	jmp    1ce8 <enterDir+0x62>
	else
		updatePath(name);
    1cdd:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce0:	89 04 24             	mov    %eax,(%esp)
    1ce3:	e8 ac fe ff ff       	call   1b94 <updatePath>
	printf(0, "currentPath: %s\n", currentPath);
    1ce8:	c7 44 24 08 40 46 01 	movl   $0x14640,0x8(%esp)
    1cef:	00 
    1cf0:	c7 44 24 04 65 c2 00 	movl   $0xc265,0x4(%esp)
    1cf7:	00 
    1cf8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cff:	e8 be 3d 00 00       	call   5ac2 <printf>
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
    1d2f:	a1 00 46 01 00       	mov    0x14600,%eax
    1d34:	89 04 24             	mov    %eax,(%esp)
    1d37:	a1 04 46 01 00       	mov    0x14604,%eax
    1d3c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d40:	a1 08 46 01 00       	mov    0x14608,%eax
    1d45:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d49:	e8 fa f0 ff ff       	call   e48 <updateFileList>
	drawFinderContent(context);
    1d4e:	a1 00 46 01 00       	mov    0x14600,%eax
    1d53:	89 04 24             	mov    %eax,(%esp)
    1d56:	a1 04 46 01 00       	mov    0x14604,%eax
    1d5b:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d5f:	a1 08 46 01 00       	mov    0x14608,%eax
    1d64:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d68:	e8 2a f2 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    1d6d:	a1 00 46 01 00       	mov    0x14600,%eax
    1d72:	89 04 24             	mov    %eax,(%esp)
    1d75:	a1 04 46 01 00       	mov    0x14604,%eax
    1d7a:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d7e:	a1 08 46 01 00       	mov    0x14608,%eax
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
    1db2:	e8 cc 31 00 00       	call   4f83 <initRect>
    1db7:	83 ec 04             	sub    $0x4,%esp
    1dba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1dbd:	89 44 24 04          	mov    %eax,0x4(%esp)
    1dc1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1dc4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1dc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1dcb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1dcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1dd2:	89 44 24 10          	mov    %eax,0x10(%esp)
    1dd6:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    1ddd:	e8 a4 33 00 00       	call   5186 <deleteClickable>
	addWndEvent(&cm);
    1de2:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    1de9:	e8 a8 f7 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    1dee:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
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
    1e08:	e8 f9 38 00 00       	call   5706 <strlen>
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
    1e1f:	e8 e2 38 00 00       	call   5706 <strlen>
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
    1e43:	e8 00 3a 00 00       	call   5848 <atoi>
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
    1e69:	e8 29 38 00 00       	call   5697 <strcpy>
		close(fd);
    1e6e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e71:	89 04 24             	mov    %eax,(%esp)
    1e74:	e8 89 3a 00 00       	call   5902 <close>
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
    1e87:	e8 8e 3a 00 00       	call   591a <open>
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
    1ea3:	e8 72 3a 00 00       	call   591a <open>
    1ea8:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1eab:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1eaf:	79 20                	jns    1ed1 <newFile+0xd5>
		printf(0, "cat: cannot open %s\n", name);
    1eb1:	8b 45 08             	mov    0x8(%ebp),%eax
    1eb4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1eb8:	c7 44 24 04 76 c2 00 	movl   $0xc276,0x4(%esp)
    1ebf:	00 
    1ec0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ec7:	e8 f6 3b 00 00       	call   5ac2 <printf>
		exit();
    1ecc:	e8 09 3a 00 00       	call   58da <exit>
	}
	close(fd);
    1ed1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ed4:	89 04 24             	mov    %eax,(%esp)
    1ed7:	e8 26 3a 00 00       	call   5902 <close>
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
    1f27:	a1 00 46 01 00       	mov    0x14600,%eax
    1f2c:	89 04 24             	mov    %eax,(%esp)
    1f2f:	a1 04 46 01 00       	mov    0x14604,%eax
    1f34:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f38:	a1 08 46 01 00       	mov    0x14608,%eax
    1f3d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f41:	e8 02 ef ff ff       	call   e48 <updateFileList>
	drawFinderContent(context);
    1f46:	a1 00 46 01 00       	mov    0x14600,%eax
    1f4b:	89 04 24             	mov    %eax,(%esp)
    1f4e:	a1 04 46 01 00       	mov    0x14604,%eax
    1f53:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f57:	a1 08 46 01 00       	mov    0x14608,%eax
    1f5c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f60:	e8 32 f0 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    1f65:	a1 00 46 01 00       	mov    0x14600,%eax
    1f6a:	89 04 24             	mov    %eax,(%esp)
    1f6d:	a1 04 46 01 00       	mov    0x14604,%eax
    1f72:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f76:	a1 08 46 01 00       	mov    0x14608,%eax
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
    1faa:	e8 d4 2f 00 00       	call   4f83 <initRect>
    1faf:	83 ec 04             	sub    $0x4,%esp
    1fb2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1fb5:	89 44 24 04          	mov    %eax,0x4(%esp)
    1fb9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1fbc:	89 44 24 08          	mov    %eax,0x8(%esp)
    1fc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1fc3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1fc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fca:	89 44 24 10          	mov    %eax,0x10(%esp)
    1fce:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    1fd5:	e8 ac 31 00 00       	call   5186 <deleteClickable>
	addWndEvent(&cm);
    1fda:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    1fe1:	e8 b0 f5 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    1fe6:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
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
    2000:	e8 01 37 00 00       	call   5706 <strlen>
    2005:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    2008:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    200f:	eb 55                	jmp    2066 <newFolder+0x72>
		n = strlen(name);
    2011:	8b 45 08             	mov    0x8(%ebp),%eax
    2014:	89 04 24             	mov    %eax,(%esp)
    2017:	e8 ea 36 00 00       	call   5706 <strlen>
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
    203b:	e8 08 38 00 00       	call   5848 <atoi>
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
    2061:	e8 31 36 00 00       	call   5697 <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    2066:	8b 45 08             	mov    0x8(%ebp),%eax
    2069:	89 04 24             	mov    %eax,(%esp)
    206c:	e8 d1 38 00 00       	call   5942 <mkdir>
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
    20c0:	c7 44 24 04 8b c2 00 	movl   $0xc28b,0x4(%esp)
    20c7:	00 
    20c8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    20cf:	e8 ee 39 00 00       	call   5ac2 <printf>
	updateFileList(context);
    20d4:	a1 00 46 01 00       	mov    0x14600,%eax
    20d9:	89 04 24             	mov    %eax,(%esp)
    20dc:	a1 04 46 01 00       	mov    0x14604,%eax
    20e1:	89 44 24 04          	mov    %eax,0x4(%esp)
    20e5:	a1 08 46 01 00       	mov    0x14608,%eax
    20ea:	89 44 24 08          	mov    %eax,0x8(%esp)
    20ee:	e8 55 ed ff ff       	call   e48 <updateFileList>
	printItemList();
    20f3:	e8 00 f2 ff ff       	call   12f8 <printItemList>
	drawFinderContent(context);
    20f8:	a1 00 46 01 00       	mov    0x14600,%eax
    20fd:	89 04 24             	mov    %eax,(%esp)
    2100:	a1 04 46 01 00       	mov    0x14604,%eax
    2105:	89 44 24 04          	mov    %eax,0x4(%esp)
    2109:	a1 08 46 01 00       	mov    0x14608,%eax
    210e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2112:	e8 80 ee ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    2117:	a1 00 46 01 00       	mov    0x14600,%eax
    211c:	89 04 24             	mov    %eax,(%esp)
    211f:	a1 04 46 01 00       	mov    0x14604,%eax
    2124:	89 44 24 04          	mov    %eax,0x4(%esp)
    2128:	a1 08 46 01 00       	mov    0x14608,%eax
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
    215c:	e8 22 2e 00 00       	call   4f83 <initRect>
    2161:	83 ec 04             	sub    $0x4,%esp
    2164:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2167:	89 44 24 04          	mov    %eax,0x4(%esp)
    216b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    216e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2172:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2175:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2179:	8b 45 f4             	mov    -0xc(%ebp),%eax
    217c:	89 44 24 10          	mov    %eax,0x10(%esp)
    2180:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    2187:	e8 fa 2f 00 00       	call   5186 <deleteClickable>
	addWndEvent(&cm);
    218c:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    2193:	e8 fe f3 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    2198:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
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
    21b3:	c7 44 24 04 98 c2 00 	movl   $0xc298,0x4(%esp)
    21ba:	00 
    21bb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    21c2:	e8 fb 38 00 00       	call   5ac2 <printf>
	if(unlink(name) < 0){
    21c7:	8b 45 08             	mov    0x8(%ebp),%eax
    21ca:	89 04 24             	mov    %eax,(%esp)
    21cd:	e8 58 37 00 00       	call   592a <unlink>
    21d2:	85 c0                	test   %eax,%eax
    21d4:	0f 89 c9 00 00 00    	jns    22a3 <deleteFile+0xfd>
		if (chdir(name) < 0){
    21da:	8b 45 08             	mov    0x8(%ebp),%eax
    21dd:	89 04 24             	mov    %eax,(%esp)
    21e0:	e8 65 37 00 00       	call   594a <chdir>
    21e5:	85 c0                	test   %eax,%eax
    21e7:	79 20                	jns    2209 <deleteFile+0x63>
			printf(2, "rm: %s failed to delete\n", name);
    21e9:	8b 45 08             	mov    0x8(%ebp),%eax
    21ec:	89 44 24 08          	mov    %eax,0x8(%esp)
    21f0:	c7 44 24 04 b6 c2 00 	movl   $0xc2b6,0x4(%esp)
    21f7:	00 
    21f8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    21ff:	e8 be 38 00 00       	call   5ac2 <printf>
    2204:	e9 9a 00 00 00       	jmp    22a3 <deleteFile+0xfd>
		}
		else{
			updateFileList(context);
    2209:	a1 00 46 01 00       	mov    0x14600,%eax
    220e:	89 04 24             	mov    %eax,(%esp)
    2211:	a1 04 46 01 00       	mov    0x14604,%eax
    2216:	89 44 24 04          	mov    %eax,0x4(%esp)
    221a:	a1 08 46 01 00       	mov    0x14608,%eax
    221f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2223:	e8 20 ec ff ff       	call   e48 <updateFileList>
			struct fileItem *p;
			p = fileItemList;
    2228:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
    222d:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    2230:	eb 35                	jmp    2267 <deleteFile+0xc1>
				deleteFile(p->name);
    2232:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2235:	8b 40 14             	mov    0x14(%eax),%eax
    2238:	89 04 24             	mov    %eax,(%esp)
    223b:	e8 66 ff ff ff       	call   21a6 <deleteFile>
				updateFileList(context);
    2240:	a1 00 46 01 00       	mov    0x14600,%eax
    2245:	89 04 24             	mov    %eax,(%esp)
    2248:	a1 04 46 01 00       	mov    0x14604,%eax
    224d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2251:	a1 08 46 01 00       	mov    0x14608,%eax
    2256:	89 44 24 08          	mov    %eax,0x8(%esp)
    225a:	e8 e9 eb ff ff       	call   e48 <updateFileList>
				p = fileItemList;
    225f:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
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
    226d:	c7 04 24 cf c2 00 00 	movl   $0xc2cf,(%esp)
    2274:	e8 d1 36 00 00       	call   594a <chdir>
			updateFileList(context);
    2279:	a1 00 46 01 00       	mov    0x14600,%eax
    227e:	89 04 24             	mov    %eax,(%esp)
    2281:	a1 04 46 01 00       	mov    0x14604,%eax
    2286:	89 44 24 04          	mov    %eax,0x4(%esp)
    228a:	a1 08 46 01 00       	mov    0x14608,%eax
    228f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2293:	e8 b0 eb ff ff       	call   e48 <updateFileList>
			unlink(name);
    2298:	8b 45 08             	mov    0x8(%ebp),%eax
    229b:	89 04 24             	mov    %eax,(%esp)
    229e:	e8 87 36 00 00       	call   592a <unlink>
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
    22ab:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
    22b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    22b3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    22ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
    22bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    22c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    22c6:	c7 44 24 04 d2 c2 00 	movl   $0xc2d2,0x4(%esp)
    22cd:	00 
    22ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    22d5:	e8 e8 37 00 00       	call   5ac2 <printf>
	while (q != 0)
    22da:	e9 8d 00 00 00       	jmp    236c <h_deleteFile+0xc7>
	{
		printf(0, "hi2\n");
    22df:	c7 44 24 04 d7 c2 00 	movl   $0xc2d7,0x4(%esp)
    22e6:	00 
    22e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    22ee:	e8 cf 37 00 00       	call   5ac2 <printf>
		if (q->chosen)
    22f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22f6:	8b 40 28             	mov    0x28(%eax),%eax
    22f9:	85 c0                	test   %eax,%eax
    22fb:	74 66                	je     2363 <h_deleteFile+0xbe>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    22fd:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    2304:	e8 a5 3a 00 00       	call   5dae <malloc>
    2309:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    230c:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    2313:	e8 96 3a 00 00       	call   5dae <malloc>
    2318:	8b 55 f0             	mov    -0x10(%ebp),%edx
    231b:	89 42 14             	mov    %eax,0x14(%edx)
			strcpy(p1->name, q->name);
    231e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2321:	8b 50 14             	mov    0x14(%eax),%edx
    2324:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2327:	8b 40 14             	mov    0x14(%eax),%eax
    232a:	89 54 24 04          	mov    %edx,0x4(%esp)
    232e:	89 04 24             	mov    %eax,(%esp)
    2331:	e8 61 33 00 00       	call   5697 <strcpy>
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
    237c:	c7 44 24 04 dc c2 00 	movl   $0xc2dc,0x4(%esp)
    2383:	00 
    2384:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    238b:	e8 32 37 00 00       	call   5ac2 <printf>
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
    23af:	c7 44 24 04 44 c3 00 	movl   $0xc344,0x4(%esp)
    23b6:	00 
    23b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23be:	e8 ff 36 00 00       	call   5ac2 <printf>
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
    23db:	c7 44 24 04 5a c3 00 	movl   $0xc35a,0x4(%esp)
    23e2:	00 
    23e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23ea:	e8 d3 36 00 00       	call   5ac2 <printf>
		p1 = p1->next;
    23ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23f2:	8b 40 2c             	mov    0x2c(%eax),%eax
    23f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    23f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    23fb:	8b 40 14             	mov    0x14(%eax),%eax
    23fe:	89 04 24             	mov    %eax,(%esp)
    2401:	e8 6f 38 00 00       	call   5c75 <free>
		free(p2);
    2406:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2409:	89 04 24             	mov    %eax,(%esp)
    240c:	e8 64 38 00 00       	call   5c75 <free>
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
    2417:	c7 44 24 04 66 c3 00 	movl   $0xc366,0x4(%esp)
    241e:	00 
    241f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2426:	e8 97 36 00 00       	call   5ac2 <printf>
	updateFileList(context);
    242b:	a1 00 46 01 00       	mov    0x14600,%eax
    2430:	89 04 24             	mov    %eax,(%esp)
    2433:	a1 04 46 01 00       	mov    0x14604,%eax
    2438:	89 44 24 04          	mov    %eax,0x4(%esp)
    243c:	a1 08 46 01 00       	mov    0x14608,%eax
    2441:	89 44 24 08          	mov    %eax,0x8(%esp)
    2445:	e8 fe e9 ff ff       	call   e48 <updateFileList>
	printItemList();
    244a:	e8 a9 ee ff ff       	call   12f8 <printItemList>
	drawFinderContent(context);
    244f:	a1 00 46 01 00       	mov    0x14600,%eax
    2454:	89 04 24             	mov    %eax,(%esp)
    2457:	a1 04 46 01 00       	mov    0x14604,%eax
    245c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2460:	a1 08 46 01 00       	mov    0x14608,%eax
    2465:	89 44 24 08          	mov    %eax,0x8(%esp)
    2469:	e8 29 eb ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    246e:	a1 00 46 01 00       	mov    0x14600,%eax
    2473:	89 04 24             	mov    %eax,(%esp)
    2476:	a1 04 46 01 00       	mov    0x14604,%eax
    247b:	89 44 24 04          	mov    %eax,0x4(%esp)
    247f:	a1 08 46 01 00       	mov    0x14608,%eax
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
    24b3:	e8 cb 2a 00 00       	call   4f83 <initRect>
    24b8:	83 ec 04             	sub    $0x4,%esp
    24bb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    24be:	89 44 24 04          	mov    %eax,0x4(%esp)
    24c2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    24c5:	89 44 24 08          	mov    %eax,0x8(%esp)
    24c9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    24cc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    24d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    24d3:	89 44 24 10          	mov    %eax,0x10(%esp)
    24d7:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    24de:	e8 a3 2c 00 00       	call   5186 <deleteClickable>
		addWndEvent(&cm);
    24e3:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    24ea:	e8 a7 f0 ff ff       	call   1596 <addWndEvent>
		addListEvent(&cm);
    24ef:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
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
    2507:	c7 44 24 04 40 46 01 	movl   $0x14640,0x4(%esp)
    250e:	00 
    250f:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    2515:	89 04 24             	mov    %eax,(%esp)
    2518:	e8 7a 31 00 00       	call   5697 <strcpy>
	strcpy(tempName, currentlyRenaming->name);
    251d:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
    2522:	8b 40 14             	mov    0x14(%eax),%eax
    2525:	89 44 24 04          	mov    %eax,0x4(%esp)
    2529:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    252f:	89 04 24             	mov    %eax,(%esp)
    2532:	e8 60 31 00 00       	call   5697 <strcpy>
	strcpy(tempNameFrom + strlen(tempNameFrom), renameFrom);
    2537:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    253d:	89 04 24             	mov    %eax,(%esp)
    2540:	e8 c1 31 00 00       	call   5706 <strlen>
    2545:	8d 95 f4 fd ff ff    	lea    -0x20c(%ebp),%edx
    254b:	01 d0                	add    %edx,%eax
    254d:	c7 44 24 04 00 45 01 	movl   $0x14500,0x4(%esp)
    2554:	00 
    2555:	89 04 24             	mov    %eax,(%esp)
    2558:	e8 3a 31 00 00       	call   5697 <strcpy>
	printf(0, "why? %s", tempName);
    255d:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    2563:	89 44 24 08          	mov    %eax,0x8(%esp)
    2567:	c7 44 24 04 78 c3 00 	movl   $0xc378,0x4(%esp)
    256e:	00 
    256f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2576:	e8 47 35 00 00       	call   5ac2 <printf>
	if(currentlyRenaming->st.type != T_DIR){
    257b:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
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
    25e0:	e8 21 31 00 00       	call   5706 <strlen>
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
    260f:	c7 44 24 04 80 c3 00 	movl   $0xc380,0x4(%esp)
    2616:	00 
    2617:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    261e:	e8 9f 34 00 00       	call   5ac2 <printf>
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
    265c:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
    2661:	8b 40 14             	mov    0x14(%eax),%eax
    2664:	89 44 24 08          	mov    %eax,0x8(%esp)
    2668:	c7 44 24 04 94 c3 00 	movl   $0xc394,0x4(%esp)
    266f:	00 
    2670:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2677:	e8 46 34 00 00       	call   5ac2 <printf>
	saveRename();
    267c:	e8 7c fe ff ff       	call   24fd <saveRename>
	currentlyRenaming->chosen = 1;
    2681:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
    2686:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	currentlyRenaming = 0;
    268d:	c7 05 cc 0e 01 00 00 	movl   $0x0,0x10ecc
    2694:	00 00 00 
	renaming = 0;
    2697:	c7 05 54 47 01 00 00 	movl   $0x0,0x14754
    269e:	00 00 00 
	freeFileItemList();
    26a1:	e8 6f dd ff ff       	call   415 <freeFileItemList>
	list(".");
    26a6:	c7 04 24 88 c1 00 00 	movl   $0xc188,(%esp)
    26ad:	e8 41 de ff ff       	call   4f3 <list>
	printItemList();
    26b2:	e8 41 ec ff ff       	call   12f8 <printItemList>
	drawFinderContent(context);
    26b7:	a1 00 46 01 00       	mov    0x14600,%eax
    26bc:	89 04 24             	mov    %eax,(%esp)
    26bf:	a1 04 46 01 00       	mov    0x14604,%eax
    26c4:	89 44 24 04          	mov    %eax,0x4(%esp)
    26c8:	a1 08 46 01 00       	mov    0x14608,%eax
    26cd:	89 44 24 08          	mov    %eax,0x8(%esp)
    26d1:	e8 c1 e8 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    26d6:	a1 00 46 01 00       	mov    0x14600,%eax
    26db:	89 04 24             	mov    %eax,(%esp)
    26de:	a1 04 46 01 00       	mov    0x14604,%eax
    26e3:	89 44 24 04          	mov    %eax,0x4(%esp)
    26e7:	a1 08 46 01 00       	mov    0x14608,%eax
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
    271b:	e8 63 28 00 00       	call   4f83 <initRect>
    2720:	83 ec 04             	sub    $0x4,%esp
    2723:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2726:	89 44 24 04          	mov    %eax,0x4(%esp)
    272a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    272d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2731:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2734:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2738:	8b 45 f4             	mov    -0xc(%ebp),%eax
    273b:	89 44 24 10          	mov    %eax,0x10(%esp)
    273f:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    2746:	e8 3b 2a 00 00       	call   5186 <deleteClickable>
	addWndEvent(&cm);
    274b:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    2752:	e8 3f ee ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    2757:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
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
    276d:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
    2772:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    2775:	e9 0f 01 00 00       	jmp    2889 <copyFile+0x124>
		if (p->chosen == 1){
    277a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    277d:	8b 40 28             	mov    0x28(%eax),%eax
    2780:	83 f8 01             	cmp    $0x1,%eax
    2783:	0f 85 f7 00 00 00    	jne    2880 <copyFile+0x11b>
			if(lenOfWaited >= MAX_COPY_SIZE){
    2789:	a1 58 47 01 00       	mov    0x14758,%eax
    278e:	83 f8 07             	cmp    $0x7,%eax
    2791:	7e 22                	jle    27b5 <copyFile+0x50>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    2793:	a1 58 47 01 00       	mov    0x14758,%eax
    2798:	89 44 24 08          	mov    %eax,0x8(%esp)
    279c:	c7 44 24 04 b5 c3 00 	movl   $0xc3b5,0x4(%esp)
    27a3:	00 
    27a4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    27ab:	e8 12 33 00 00       	call   5ac2 <printf>
    27b0:	e9 cb 00 00 00       	jmp    2880 <copyFile+0x11b>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    27b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27b8:	8b 40 14             	mov    0x14(%eax),%eax
    27bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    27c2:	00 
    27c3:	89 04 24             	mov    %eax,(%esp)
    27c6:	e8 4f 31 00 00       	call   591a <open>
    27cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    27ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    27d2:	0f 88 8a 00 00 00    	js     2862 <copyFile+0xfd>
					strcpy(filesWaited[lenOfWaited], currentPath);
    27d8:	a1 58 47 01 00       	mov    0x14758,%eax
    27dd:	c1 e0 08             	shl    $0x8,%eax
    27e0:	05 00 3d 01 00       	add    $0x13d00,%eax
    27e5:	c7 44 24 04 40 46 01 	movl   $0x14640,0x4(%esp)
    27ec:	00 
    27ed:	89 04 24             	mov    %eax,(%esp)
    27f0:	e8 a2 2e 00 00       	call   5697 <strcpy>
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    27f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27f8:	8b 58 14             	mov    0x14(%eax),%ebx
    27fb:	a1 58 47 01 00       	mov    0x14758,%eax
    2800:	c1 e0 08             	shl    $0x8,%eax
    2803:	8d b0 00 3d 01 00    	lea    0x13d00(%eax),%esi
    2809:	c7 04 24 40 46 01 00 	movl   $0x14640,(%esp)
    2810:	e8 f1 2e 00 00       	call   5706 <strlen>
    2815:	01 f0                	add    %esi,%eax
    2817:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    281b:	89 04 24             	mov    %eax,(%esp)
    281e:	e8 74 2e 00 00       	call   5697 <strcpy>
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    2823:	a1 58 47 01 00       	mov    0x14758,%eax
    2828:	c1 e0 08             	shl    $0x8,%eax
    282b:	05 00 3d 01 00       	add    $0x13d00,%eax
    2830:	89 44 24 08          	mov    %eax,0x8(%esp)
    2834:	c7 44 24 04 d0 c3 00 	movl   $0xc3d0,0x4(%esp)
    283b:	00 
    283c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2843:	e8 7a 32 00 00       	call   5ac2 <printf>
					lenOfWaited++;
    2848:	a1 58 47 01 00       	mov    0x14758,%eax
    284d:	83 c0 01             	add    $0x1,%eax
    2850:	a3 58 47 01 00       	mov    %eax,0x14758
					close(fd);
    2855:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2858:	89 04 24             	mov    %eax,(%esp)
    285b:	e8 a2 30 00 00       	call   5902 <close>
    2860:	eb 1e                	jmp    2880 <copyFile+0x11b>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    2862:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2865:	8b 40 14             	mov    0x14(%eax),%eax
    2868:	89 44 24 08          	mov    %eax,0x8(%esp)
    286c:	c7 44 24 04 e6 c3 00 	movl   $0xc3e6,0x4(%esp)
    2873:	00 
    2874:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    287b:	e8 42 32 00 00       	call   5ac2 <printf>
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
    28a0:	c7 05 c4 0e 01 00 00 	movl   $0x0,0x10ec4
    28a7:	00 00 00 
	lenOfWaited = 0;
    28aa:	c7 05 58 47 01 00 00 	movl   $0x0,0x14758
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
    28d0:	05 00 3d 01 00       	add    $0x13d00,%eax
    28d5:	89 04 24             	mov    %eax,(%esp)
    28d8:	e8 c9 f8 ff ff       	call   21a6 <deleteFile>
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
    28dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    28e1:	a1 58 47 01 00       	mov    0x14758,%eax
    28e6:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    28e9:	7c df                	jl     28ca <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    28eb:	c7 05 58 47 01 00 00 	movl   $0x0,0x14758
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
    28fd:	c7 05 c4 0e 01 00 01 	movl   $0x1,0x10ec4
    2904:	00 00 00 
	lenOfWaited = 0;
    2907:	c7 05 58 47 01 00 00 	movl   $0x0,0x14758
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
	printf(0, "currentPath: %s, copying from %s, to %s~", currentPath, src, filename);
    2921:	8b 45 0c             	mov    0xc(%ebp),%eax
    2924:	89 44 24 10          	mov    %eax,0x10(%esp)
    2928:	8b 45 08             	mov    0x8(%ebp),%eax
    292b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    292f:	c7 44 24 08 40 46 01 	movl   $0x14640,0x8(%esp)
    2936:	00 
    2937:	c7 44 24 04 fc c3 00 	movl   $0xc3fc,0x4(%esp)
    293e:	00 
    293f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2946:	e8 77 31 00 00       	call   5ac2 <printf>
	int size = 0;
    294b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
	int file_src, file_dest;
	struct fileItem *p = fileItemList;
    2952:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
    2957:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char* buff = (char*)malloc(4096 * sizeof(char));
    295a:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2961:	e8 48 34 00 00       	call   5dae <malloc>
    2966:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	char tempSrc[MAX_NAME_LEN];
	char tempName[MAX_NAME_LEN];
	memset(tempName, '\0', sizeof(tempName)/sizeof(char));
    2969:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    2970:	00 
    2971:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2978:	00 
    2979:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    297f:	89 04 24             	mov    %eax,(%esp)
    2982:	e8 a6 2d 00 00       	call   572d <memset>
	memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
    2987:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    298e:	00 
    298f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2996:	00 
    2997:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    299d:	89 04 24             	mov    %eax,(%esp)
    29a0:	e8 88 2d 00 00       	call   572d <memset>
	memset(buff, 0, 4096);
    29a5:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    29ac:	00 
    29ad:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    29b4:	00 
    29b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    29b8:	89 04 24             	mov    %eax,(%esp)
    29bb:	e8 6d 2d 00 00       	call   572d <memset>
	if(chdir(filename) >= 0){
    29c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    29c3:	89 04 24             	mov    %eax,(%esp)
    29c6:	e8 7f 2f 00 00       	call   594a <chdir>
    29cb:	85 c0                	test   %eax,%eax
    29cd:	78 3c                	js     2a0b <pasteJustFile+0xf3>
		printf(0, "Directory %s already exist\n", filename);
    29cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    29d2:	89 44 24 08          	mov    %eax,0x8(%esp)
    29d6:	c7 44 24 04 25 c4 00 	movl   $0xc425,0x4(%esp)
    29dd:	00 
    29de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29e5:	e8 d8 30 00 00       	call   5ac2 <printf>
		free(buff);
    29ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    29ed:	89 04 24             	mov    %eax,(%esp)
    29f0:	e8 80 32 00 00       	call   5c75 <free>
		chdir("..");
    29f5:	c7 04 24 cf c2 00 00 	movl   $0xc2cf,(%esp)
    29fc:	e8 49 2f 00 00       	call   594a <chdir>
		return 0;
    2a01:	b8 00 00 00 00       	mov    $0x0,%eax
    2a06:	e9 b0 02 00 00       	jmp    2cbb <pasteJustFile+0x3a3>
	}
	else if(chdir(src) >= 0){
    2a0b:	8b 45 08             	mov    0x8(%ebp),%eax
    2a0e:	89 04 24             	mov    %eax,(%esp)
    2a11:	e8 34 2f 00 00       	call   594a <chdir>
    2a16:	85 c0                	test   %eax,%eax
    2a18:	0f 88 62 01 00 00    	js     2b80 <pasteJustFile+0x268>
		freeFileItemList();
    2a1e:	e8 f2 d9 ff ff       	call   415 <freeFileItemList>
		list(".");
    2a23:	c7 04 24 88 c1 00 00 	movl   $0xc188,(%esp)
    2a2a:	e8 c4 da ff ff       	call   4f3 <list>
		chdir(currentPath);
    2a2f:	c7 04 24 40 46 01 00 	movl   $0x14640,(%esp)
    2a36:	e8 0f 2f 00 00       	call   594a <chdir>
		mkdir(filename);
    2a3b:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a3e:	89 04 24             	mov    %eax,(%esp)
    2a41:	e8 fc 2e 00 00       	call   5942 <mkdir>
		updatePath(filename);
    2a46:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a49:	89 04 24             	mov    %eax,(%esp)
    2a4c:	e8 43 f1 ff ff       	call   1b94 <updatePath>
		chdir(currentPath);
    2a51:	c7 04 24 40 46 01 00 	movl   $0x14640,(%esp)
    2a58:	e8 ed 2e 00 00       	call   594a <chdir>
		p = fileItemList;
    2a5d:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
    2a62:	89 45 ec             	mov    %eax,-0x14(%ebp)
		while(p != 0){
    2a65:	e9 ef 00 00 00       	jmp    2b59 <pasteJustFile+0x241>
			strcpy(tempSrc, src);
    2a6a:	8b 45 08             	mov    0x8(%ebp),%eax
    2a6d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a71:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    2a77:	89 04 24             	mov    %eax,(%esp)
    2a7a:	e8 18 2c 00 00       	call   5697 <strcpy>
			strcpy(tempName, p->name);
    2a7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a82:	8b 40 14             	mov    0x14(%eax),%eax
    2a85:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a89:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    2a8f:	89 04 24             	mov    %eax,(%esp)
    2a92:	e8 00 2c 00 00       	call   5697 <strcpy>
			tempSrc[strlen(tempSrc) + 1] = 0;
    2a97:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    2a9d:	89 04 24             	mov    %eax,(%esp)
    2aa0:	e8 61 2c 00 00       	call   5706 <strlen>
    2aa5:	83 c0 01             	add    $0x1,%eax
    2aa8:	c6 84 05 e4 fe ff ff 	movb   $0x0,-0x11c(%ebp,%eax,1)
    2aaf:	00 
			tempSrc[strlen(tempSrc)] = '/';
    2ab0:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    2ab6:	89 04 24             	mov    %eax,(%esp)
    2ab9:	e8 48 2c 00 00       	call   5706 <strlen>
    2abe:	c6 84 05 e4 fe ff ff 	movb   $0x2f,-0x11c(%ebp,%eax,1)
    2ac5:	2f 
			strcpy(tempSrc+strlen(tempSrc), tempName);
    2ac6:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    2acc:	89 04 24             	mov    %eax,(%esp)
    2acf:	e8 32 2c 00 00       	call   5706 <strlen>
    2ad4:	8d 95 e4 fe ff ff    	lea    -0x11c(%ebp),%edx
    2ada:	01 c2                	add    %eax,%edx
    2adc:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    2ae2:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ae6:	89 14 24             	mov    %edx,(%esp)
    2ae9:	e8 a9 2b 00 00       	call   5697 <strcpy>
			if(!pasteJustFile(tempSrc, tempName)) return 0;
    2aee:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    2af4:	89 44 24 04          	mov    %eax,0x4(%esp)
    2af8:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    2afe:	89 04 24             	mov    %eax,(%esp)
    2b01:	e8 12 fe ff ff       	call   2918 <pasteJustFile>
    2b06:	85 c0                	test   %eax,%eax
    2b08:	75 0a                	jne    2b14 <pasteJustFile+0x1fc>
    2b0a:	b8 00 00 00 00       	mov    $0x0,%eax
    2b0f:	e9 a7 01 00 00       	jmp    2cbb <pasteJustFile+0x3a3>
			memset(tempName, '\0', sizeof(tempName)/sizeof(char));
    2b14:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    2b1b:	00 
    2b1c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b23:	00 
    2b24:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    2b2a:	89 04 24             	mov    %eax,(%esp)
    2b2d:	e8 fb 2b 00 00       	call   572d <memset>
			memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
    2b32:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    2b39:	00 
    2b3a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b41:	00 
    2b42:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    2b48:	89 04 24             	mov    %eax,(%esp)
    2b4b:	e8 dd 2b 00 00       	call   572d <memset>
			p = p->next;
    2b50:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b53:	8b 40 2c             	mov    0x2c(%eax),%eax
    2b56:	89 45 ec             	mov    %eax,-0x14(%ebp)
		chdir(currentPath);
		mkdir(filename);
		updatePath(filename);
		chdir(currentPath);
		p = fileItemList;
		while(p != 0){
    2b59:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2b5d:	0f 85 07 ff ff ff    	jne    2a6a <pasteJustFile+0x152>
			if(!pasteJustFile(tempSrc, tempName)) return 0;
			memset(tempName, '\0', sizeof(tempName)/sizeof(char));
			memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
			p = p->next;
		}
		chdir("..");
    2b63:	c7 04 24 cf c2 00 00 	movl   $0xc2cf,(%esp)
    2b6a:	e8 db 2d 00 00       	call   594a <chdir>
		updatePath("..");
    2b6f:	c7 04 24 cf c2 00 00 	movl   $0xc2cf,(%esp)
    2b76:	e8 19 f0 ff ff       	call   1b94 <updatePath>
    2b7b:	e9 15 01 00 00       	jmp    2c95 <pasteJustFile+0x37d>
	}
	else{
		file_src = open(src, O_RDONLY);
    2b80:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b87:	00 
    2b88:	8b 45 08             	mov    0x8(%ebp),%eax
    2b8b:	89 04 24             	mov    %eax,(%esp)
    2b8e:	e8 87 2d 00 00       	call   591a <open>
    2b93:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if((file_dest = open(filename, O_RDONLY)) >= 0){
    2b96:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b9d:	00 
    2b9e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ba1:	89 04 24             	mov    %eax,(%esp)
    2ba4:	e8 71 2d 00 00       	call   591a <open>
    2ba9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2bac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2bb0:	78 46                	js     2bf8 <pasteJustFile+0x2e0>
			printf(0, "File %s already exist\n", filename);
    2bb2:	8b 45 0c             	mov    0xc(%ebp),%eax
    2bb5:	89 44 24 08          	mov    %eax,0x8(%esp)
    2bb9:	c7 44 24 04 41 c4 00 	movl   $0xc441,0x4(%esp)
    2bc0:	00 
    2bc1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2bc8:	e8 f5 2e 00 00       	call   5ac2 <printf>
			close(file_dest);
    2bcd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2bd0:	89 04 24             	mov    %eax,(%esp)
    2bd3:	e8 2a 2d 00 00       	call   5902 <close>
			close(file_src);
    2bd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bdb:	89 04 24             	mov    %eax,(%esp)
    2bde:	e8 1f 2d 00 00       	call   5902 <close>
			free(buff);
    2be3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2be6:	89 04 24             	mov    %eax,(%esp)
    2be9:	e8 87 30 00 00       	call   5c75 <free>
			return 0;
    2bee:	b8 00 00 00 00       	mov    $0x0,%eax
    2bf3:	e9 c3 00 00 00       	jmp    2cbb <pasteJustFile+0x3a3>
		}
		else{
			file_dest = open(filename, O_CREATE);
    2bf8:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2bff:	00 
    2c00:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c03:	89 04 24             	mov    %eax,(%esp)
    2c06:	e8 0f 2d 00 00       	call   591a <open>
    2c0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
			while((size = read(file_src, buff, 4096)) > 0)
    2c0e:	eb 19                	jmp    2c29 <pasteJustFile+0x311>
				write(file_dest, buff, size);
    2c10:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c13:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c17:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2c1a:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c21:	89 04 24             	mov    %eax,(%esp)
    2c24:	e8 d1 2c 00 00       	call   58fa <write>
			free(buff);
			return 0;
		}
		else{
			file_dest = open(filename, O_CREATE);
			while((size = read(file_src, buff, 4096)) > 0)
    2c29:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    2c30:	00 
    2c31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2c34:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c38:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c3b:	89 04 24             	mov    %eax,(%esp)
    2c3e:	e8 af 2c 00 00       	call   58f2 <read>
    2c43:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2c46:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2c4a:	7f c4                	jg     2c10 <pasteJustFile+0x2f8>
				write(file_dest, buff, size);
			if(size < 0)
    2c4c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2c50:	79 43                	jns    2c95 <pasteJustFile+0x37d>
			{
				//printf(2, "copy file error!!!\r\n");
				printf(0, "File %s error\n", filename);
    2c52:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c55:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c59:	c7 44 24 04 58 c4 00 	movl   $0xc458,0x4(%esp)
    2c60:	00 
    2c61:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c68:	e8 55 2e 00 00       	call   5ac2 <printf>
				close(file_dest);
    2c6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c70:	89 04 24             	mov    %eax,(%esp)
    2c73:	e8 8a 2c 00 00       	call   5902 <close>
				close(file_src);
    2c78:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c7b:	89 04 24             	mov    %eax,(%esp)
    2c7e:	e8 7f 2c 00 00       	call   5902 <close>
				free(buff);
    2c83:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2c86:	89 04 24             	mov    %eax,(%esp)
    2c89:	e8 e7 2f 00 00       	call   5c75 <free>
				return 0;
    2c8e:	b8 00 00 00 00       	mov    $0x0,%eax
    2c93:	eb 26                	jmp    2cbb <pasteJustFile+0x3a3>
			}
		}
	}
	close(file_dest);
    2c95:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c98:	89 04 24             	mov    %eax,(%esp)
    2c9b:	e8 62 2c 00 00       	call   5902 <close>
	close(file_src);
    2ca0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ca3:	89 04 24             	mov    %eax,(%esp)
    2ca6:	e8 57 2c 00 00       	call   5902 <close>
	free(buff);
    2cab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2cae:	89 04 24             	mov    %eax,(%esp)
    2cb1:	e8 bf 2f 00 00       	call   5c75 <free>
	return 1;
    2cb6:	b8 01 00 00 00       	mov    $0x1,%eax
}
    2cbb:	c9                   	leave  
    2cbc:	c3                   	ret    

00002cbd <pasteFile>:

void pasteFile(){
    2cbd:	55                   	push   %ebp
    2cbe:	89 e5                	mov    %esp,%ebp
    2cc0:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
    2cc3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2cca:	e9 c1 00 00 00       	jmp    2d90 <pasteFile+0xd3>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    2ccf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2cd2:	c1 e0 08             	shl    $0x8,%eax
    2cd5:	05 00 3d 01 00       	add    $0x13d00,%eax
    2cda:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2cde:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ce1:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ce5:	c7 44 24 04 67 c4 00 	movl   $0xc467,0x4(%esp)
    2cec:	00 
    2ced:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cf4:	e8 c9 2d 00 00       	call   5ac2 <printf>
		for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    2cf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2cfc:	c1 e0 08             	shl    $0x8,%eax
    2cff:	05 00 3d 01 00       	add    $0x13d00,%eax
    2d04:	89 04 24             	mov    %eax,(%esp)
    2d07:	e8 fa 29 00 00       	call   5706 <strlen>
    2d0c:	83 e8 01             	sub    $0x1,%eax
    2d0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2d12:	eb 35                	jmp    2d49 <pasteFile+0x8c>
			if (*(filesWaited[i]+j) == '/'){
    2d14:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d17:	c1 e0 08             	shl    $0x8,%eax
    2d1a:	8d 90 00 3d 01 00    	lea    0x13d00(%eax),%edx
    2d20:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d23:	01 d0                	add    %edx,%eax
    2d25:	0f b6 00             	movzbl (%eax),%eax
    2d28:	3c 2f                	cmp    $0x2f,%al
    2d2a:	75 19                	jne    2d45 <pasteFile+0x88>
				filename = filesWaited[i] + j + 1;
    2d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d2f:	c1 e0 08             	shl    $0x8,%eax
    2d32:	8d 90 00 3d 01 00    	lea    0x13d00(%eax),%edx
    2d38:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d3b:	83 c0 01             	add    $0x1,%eax
    2d3e:	01 d0                	add    %edx,%eax
    2d40:	89 45 ec             	mov    %eax,-0x14(%ebp)
				break;
    2d43:	eb 0a                	jmp    2d4f <pasteFile+0x92>
void pasteFile(){
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
		for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    2d45:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    2d49:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2d4d:	79 c5                	jns    2d14 <pasteFile+0x57>
			if (*(filesWaited[i]+j) == '/'){
				filename = filesWaited[i] + j + 1;
				break;
			}
		}
		printf(0, "NO.%d file %s name get\n", i, filename);
    2d4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d52:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2d56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d59:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d5d:	c7 44 24 04 84 c4 00 	movl   $0xc484,0x4(%esp)
    2d64:	00 
    2d65:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d6c:	e8 51 2d 00 00       	call   5ac2 <printf>
		pasteJustFile(filesWaited[i], filename);
    2d71:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d74:	c1 e0 08             	shl    $0x8,%eax
    2d77:	8d 90 00 3d 01 00    	lea    0x13d00(%eax),%edx
    2d7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d80:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d84:	89 14 24             	mov    %edx,(%esp)
    2d87:	e8 8c fb ff ff       	call   2918 <pasteJustFile>
}

void pasteFile(){
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
    2d8c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2d90:	a1 58 47 01 00       	mov    0x14758,%eax
    2d95:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    2d98:	0f 8c 31 ff ff ff    	jl     2ccf <pasteFile+0x12>
			}
		}
		printf(0, "NO.%d file %s name get\n", i, filename);
		pasteJustFile(filesWaited[i], filename);
	}
}
    2d9e:	c9                   	leave  
    2d9f:	c3                   	ret    

00002da0 <h_pasteFile>:

void h_pasteFile(Point p){
    2da0:	55                   	push   %ebp
    2da1:	89 e5                	mov    %esp,%ebp
    2da3:	83 ec 38             	sub    $0x38,%esp
	pasteFile();
    2da6:	e8 12 ff ff ff       	call   2cbd <pasteFile>
	if(copyOrCut == 1)
    2dab:	a1 c4 0e 01 00       	mov    0x10ec4,%eax
    2db0:	83 f8 01             	cmp    $0x1,%eax
    2db3:	75 05                	jne    2dba <h_pasteFile+0x1a>
		moveFile();
    2db5:	e8 01 fb ff ff       	call   28bb <moveFile>
    updateFileList(context);
    2dba:	a1 00 46 01 00       	mov    0x14600,%eax
    2dbf:	89 04 24             	mov    %eax,(%esp)
    2dc2:	a1 04 46 01 00       	mov    0x14604,%eax
    2dc7:	89 44 24 04          	mov    %eax,0x4(%esp)
    2dcb:	a1 08 46 01 00       	mov    0x14608,%eax
    2dd0:	89 44 24 08          	mov    %eax,0x8(%esp)
    2dd4:	e8 6f e0 ff ff       	call   e48 <updateFileList>
	drawFinderContent(context);
    2dd9:	a1 00 46 01 00       	mov    0x14600,%eax
    2dde:	89 04 24             	mov    %eax,(%esp)
    2de1:	a1 04 46 01 00       	mov    0x14604,%eax
    2de6:	89 44 24 04          	mov    %eax,0x4(%esp)
    2dea:	a1 08 46 01 00       	mov    0x14608,%eax
    2def:	89 44 24 08          	mov    %eax,0x8(%esp)
    2df3:	e8 9f e1 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    2df8:	a1 00 46 01 00       	mov    0x14600,%eax
    2dfd:	89 04 24             	mov    %eax,(%esp)
    2e00:	a1 04 46 01 00       	mov    0x14604,%eax
    2e05:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e09:	a1 08 46 01 00       	mov    0x14608,%eax
    2e0e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e12:	e8 32 de ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2e17:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2e1a:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2e21:	00 
    2e22:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2e29:	00 
    2e2a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2e31:	00 
    2e32:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2e39:	00 
    2e3a:	89 04 24             	mov    %eax,(%esp)
    2e3d:	e8 41 21 00 00       	call   4f83 <initRect>
    2e42:	83 ec 04             	sub    $0x4,%esp
    2e45:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e48:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e4f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e53:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e56:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2e5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e5d:	89 44 24 10          	mov    %eax,0x10(%esp)
    2e61:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    2e68:	e8 19 23 00 00       	call   5186 <deleteClickable>
	addWndEvent(&cm);
    2e6d:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    2e74:	e8 1d e7 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    2e79:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    2e80:	e8 89 e6 ff ff       	call   150e <addListEvent>
}
    2e85:	c9                   	leave  
    2e86:	c3                   	ret    

00002e87 <h_chooseFile>:

void h_chooseFile(Point p) {
    2e87:	55                   	push   %ebp
    2e88:	89 e5                	mov    %esp,%ebp
    2e8a:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    2e8d:	8b 45 08             	mov    0x8(%ebp),%eax
    2e90:	8b 55 0c             	mov    0xc(%ebp),%edx
    2e93:	89 04 24             	mov    %eax,(%esp)
    2e96:	89 54 24 04          	mov    %edx,0x4(%esp)
    2e9a:	e8 22 e8 ff ff       	call   16c1 <getFileItem>
    2e9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    2ea2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ea5:	8b 40 28             	mov    0x28(%eax),%eax
    2ea8:	85 c0                	test   %eax,%eax
    2eaa:	74 20                	je     2ecc <h_chooseFile+0x45>
	{
		printf(0, "unchooseFile!\n");
    2eac:	c7 44 24 04 9c c4 00 	movl   $0xc49c,0x4(%esp)
    2eb3:	00 
    2eb4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ebb:	e8 02 2c 00 00       	call   5ac2 <printf>
		temp->chosen = 0;
    2ec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ec3:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    2eca:	eb 1e                	jmp    2eea <h_chooseFile+0x63>
	}
	else
	{
		printf(0, "chooseFile!\n");
    2ecc:	c7 44 24 04 ab c4 00 	movl   $0xc4ab,0x4(%esp)
    2ed3:	00 
    2ed4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2edb:	e8 e2 2b 00 00       	call   5ac2 <printf>
		temp->chosen = 1;
    2ee0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ee3:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    2eea:	a1 00 46 01 00       	mov    0x14600,%eax
    2eef:	89 04 24             	mov    %eax,(%esp)
    2ef2:	a1 04 46 01 00       	mov    0x14604,%eax
    2ef7:	89 44 24 04          	mov    %eax,0x4(%esp)
    2efb:	a1 08 46 01 00       	mov    0x14608,%eax
    2f00:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f04:	e8 8e e0 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    2f09:	a1 00 46 01 00       	mov    0x14600,%eax
    2f0e:	89 04 24             	mov    %eax,(%esp)
    2f11:	a1 04 46 01 00       	mov    0x14604,%eax
    2f16:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f1a:	a1 08 46 01 00       	mov    0x14608,%eax
    2f1f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f23:	e8 21 dd ff ff       	call   c49 <drawFinderWnd>
}
    2f28:	c9                   	leave  
    2f29:	c3                   	ret    

00002f2a <h_closeWnd>:

void h_closeWnd(Point p) {
    2f2a:	55                   	push   %ebp
    2f2b:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    2f2d:	c7 05 60 05 01 00 00 	movl   $0x0,0x10560
    2f34:	00 00 00 
}
    2f37:	5d                   	pop    %ebp
    2f38:	c3                   	ret    

00002f39 <h_chvm1>:

void h_chvm1(Point p) {
    2f39:	55                   	push   %ebp
    2f3a:	89 e5                	mov    %esp,%ebp
    2f3c:	83 ec 38             	sub    $0x38,%esp
	style = ICON_STYLE;
    2f3f:	c7 05 64 05 01 00 01 	movl   $0x1,0x10564
    2f46:	00 00 00 
	updateFileList(context);
    2f49:	a1 00 46 01 00       	mov    0x14600,%eax
    2f4e:	89 04 24             	mov    %eax,(%esp)
    2f51:	a1 04 46 01 00       	mov    0x14604,%eax
    2f56:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f5a:	a1 08 46 01 00       	mov    0x14608,%eax
    2f5f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f63:	e8 e0 de ff ff       	call   e48 <updateFileList>
		drawFinderContent(context);
    2f68:	a1 00 46 01 00       	mov    0x14600,%eax
    2f6d:	89 04 24             	mov    %eax,(%esp)
    2f70:	a1 04 46 01 00       	mov    0x14604,%eax
    2f75:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f79:	a1 08 46 01 00       	mov    0x14608,%eax
    2f7e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f82:	e8 10 e0 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    2f87:	a1 00 46 01 00       	mov    0x14600,%eax
    2f8c:	89 04 24             	mov    %eax,(%esp)
    2f8f:	a1 04 46 01 00       	mov    0x14604,%eax
    2f94:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f98:	a1 08 46 01 00       	mov    0x14608,%eax
    2f9d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fa1:	e8 a3 dc ff ff       	call   c49 <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2fa6:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2fa9:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2fb0:	00 
    2fb1:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2fb8:	00 
    2fb9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2fc0:	00 
    2fc1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2fc8:	00 
    2fc9:	89 04 24             	mov    %eax,(%esp)
    2fcc:	e8 b2 1f 00 00       	call   4f83 <initRect>
    2fd1:	83 ec 04             	sub    $0x4,%esp
    2fd4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2fd7:	89 44 24 04          	mov    %eax,0x4(%esp)
    2fdb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2fde:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fe2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2fe5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2fe9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fec:	89 44 24 10          	mov    %eax,0x10(%esp)
    2ff0:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    2ff7:	e8 8a 21 00 00       	call   5186 <deleteClickable>
			addWndEvent(&cm);
    2ffc:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    3003:	e8 8e e5 ff ff       	call   1596 <addWndEvent>
			addListEvent(&cm);
    3008:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    300f:	e8 fa e4 ff ff       	call   150e <addListEvent>
}
    3014:	c9                   	leave  
    3015:	c3                   	ret    

00003016 <h_chvm2>:

void h_chvm2(Point p) {
    3016:	55                   	push   %ebp
    3017:	89 e5                	mov    %esp,%ebp
    3019:	83 ec 38             	sub    $0x38,%esp
	style = LIST_STYLE;
    301c:	c7 05 64 05 01 00 02 	movl   $0x2,0x10564
    3023:	00 00 00 
	updateFileList(context);
    3026:	a1 00 46 01 00       	mov    0x14600,%eax
    302b:	89 04 24             	mov    %eax,(%esp)
    302e:	a1 04 46 01 00       	mov    0x14604,%eax
    3033:	89 44 24 04          	mov    %eax,0x4(%esp)
    3037:	a1 08 46 01 00       	mov    0x14608,%eax
    303c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3040:	e8 03 de ff ff       	call   e48 <updateFileList>
		drawFinderContent(context);
    3045:	a1 00 46 01 00       	mov    0x14600,%eax
    304a:	89 04 24             	mov    %eax,(%esp)
    304d:	a1 04 46 01 00       	mov    0x14604,%eax
    3052:	89 44 24 04          	mov    %eax,0x4(%esp)
    3056:	a1 08 46 01 00       	mov    0x14608,%eax
    305b:	89 44 24 08          	mov    %eax,0x8(%esp)
    305f:	e8 33 df ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    3064:	a1 00 46 01 00       	mov    0x14600,%eax
    3069:	89 04 24             	mov    %eax,(%esp)
    306c:	a1 04 46 01 00       	mov    0x14604,%eax
    3071:	89 44 24 04          	mov    %eax,0x4(%esp)
    3075:	a1 08 46 01 00       	mov    0x14608,%eax
    307a:	89 44 24 08          	mov    %eax,0x8(%esp)
    307e:	e8 c6 db ff ff       	call   c49 <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    3083:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3086:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    308d:	00 
    308e:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    3095:	00 
    3096:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    309d:	00 
    309e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    30a5:	00 
    30a6:	89 04 24             	mov    %eax,(%esp)
    30a9:	e8 d5 1e 00 00       	call   4f83 <initRect>
    30ae:	83 ec 04             	sub    $0x4,%esp
    30b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    30b4:	89 44 24 04          	mov    %eax,0x4(%esp)
    30b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    30bb:	89 44 24 08          	mov    %eax,0x8(%esp)
    30bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    30c2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    30c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30c9:	89 44 24 10          	mov    %eax,0x10(%esp)
    30cd:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    30d4:	e8 ad 20 00 00       	call   5186 <deleteClickable>
			addWndEvent(&cm);
    30d9:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    30e0:	e8 b1 e4 ff ff       	call   1596 <addWndEvent>
			addListEvent(&cm);
    30e5:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    30ec:	e8 1d e4 ff ff       	call   150e <addListEvent>
}
    30f1:	c9                   	leave  
    30f2:	c3                   	ret    

000030f3 <h_goUp>:

void h_goUp(Point p) {
    30f3:	55                   	push   %ebp
    30f4:	89 e5                	mov    %esp,%ebp
    30f6:	83 ec 38             	sub    $0x38,%esp
	enterDir("..");
    30f9:	c7 04 24 cf c2 00 00 	movl   $0xc2cf,(%esp)
    3100:	e8 81 eb ff ff       	call   1c86 <enterDir>
	updateFileList(context);
    3105:	a1 00 46 01 00       	mov    0x14600,%eax
    310a:	89 04 24             	mov    %eax,(%esp)
    310d:	a1 04 46 01 00       	mov    0x14604,%eax
    3112:	89 44 24 04          	mov    %eax,0x4(%esp)
    3116:	a1 08 46 01 00       	mov    0x14608,%eax
    311b:	89 44 24 08          	mov    %eax,0x8(%esp)
    311f:	e8 24 dd ff ff       	call   e48 <updateFileList>
	drawFinderContent(context);
    3124:	a1 00 46 01 00       	mov    0x14600,%eax
    3129:	89 04 24             	mov    %eax,(%esp)
    312c:	a1 04 46 01 00       	mov    0x14604,%eax
    3131:	89 44 24 04          	mov    %eax,0x4(%esp)
    3135:	a1 08 46 01 00       	mov    0x14608,%eax
    313a:	89 44 24 08          	mov    %eax,0x8(%esp)
    313e:	e8 54 de ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    3143:	a1 00 46 01 00       	mov    0x14600,%eax
    3148:	89 04 24             	mov    %eax,(%esp)
    314b:	a1 04 46 01 00       	mov    0x14604,%eax
    3150:	89 44 24 04          	mov    %eax,0x4(%esp)
    3154:	a1 08 46 01 00       	mov    0x14608,%eax
    3159:	89 44 24 08          	mov    %eax,0x8(%esp)
    315d:	e8 e7 da ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    3162:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3165:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    316c:	00 
    316d:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    3174:	00 
    3175:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    317c:	00 
    317d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3184:	00 
    3185:	89 04 24             	mov    %eax,(%esp)
    3188:	e8 f6 1d 00 00       	call   4f83 <initRect>
    318d:	83 ec 04             	sub    $0x4,%esp
    3190:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3193:	89 44 24 04          	mov    %eax,0x4(%esp)
    3197:	8b 45 ec             	mov    -0x14(%ebp),%eax
    319a:	89 44 24 08          	mov    %eax,0x8(%esp)
    319e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31a1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    31a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31a8:	89 44 24 10          	mov    %eax,0x10(%esp)
    31ac:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    31b3:	e8 ce 1f 00 00       	call   5186 <deleteClickable>
	addWndEvent(&cm);
    31b8:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    31bf:	e8 d2 e3 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    31c4:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    31cb:	e8 3e e3 ff ff       	call   150e <addListEvent>
}
    31d0:	c9                   	leave  
    31d1:	c3                   	ret    

000031d2 <h_empty>:

void h_empty(Point p) {
    31d2:	55                   	push   %ebp
    31d3:	89 e5                	mov    %esp,%ebp

}
    31d5:	5d                   	pop    %ebp
    31d6:	c3                   	ret    

000031d7 <rename>:

void rename() {
    31d7:	55                   	push   %ebp
    31d8:	89 e5                	mov    %esp,%ebp
    31da:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = fileItemList;
    31dd:	a1 d0 0e 01 00       	mov    0x10ed0,%eax
    31e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (temp != 0){
    31e5:	eb 48                	jmp    322f <rename+0x58>
		if (temp->chosen == 1){
    31e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31ea:	8b 40 28             	mov    0x28(%eax),%eax
    31ed:	83 f8 01             	cmp    $0x1,%eax
    31f0:	75 34                	jne    3226 <rename+0x4f>
			currentlyRenaming = temp;
    31f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31f5:	a3 cc 0e 01 00       	mov    %eax,0x10ecc
			temp->chosen = 2;
    31fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31fd:	c7 40 28 02 00 00 00 	movl   $0x2,0x28(%eax)
			strcpy(renameFrom, temp->name);
    3204:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3207:	8b 40 14             	mov    0x14(%eax),%eax
    320a:	89 44 24 04          	mov    %eax,0x4(%esp)
    320e:	c7 04 24 00 45 01 00 	movl   $0x14500,(%esp)
    3215:	e8 7d 24 00 00       	call   5697 <strcpy>
			renaming = 1;
    321a:	c7 05 54 47 01 00 01 	movl   $0x1,0x14754
    3221:	00 00 00 
			break;
    3224:	eb 0f                	jmp    3235 <rename+0x5e>
		}
		else
			temp = temp->next;
    3226:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3229:	8b 40 2c             	mov    0x2c(%eax),%eax
    322c:	89 45 f4             	mov    %eax,-0xc(%ebp)

}

void rename() {
	struct fileItem *temp = fileItemList;
	while (temp != 0){
    322f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3233:	75 b2                	jne    31e7 <rename+0x10>
			break;
		}
		else
			temp = temp->next;
	}
}
    3235:	c9                   	leave  
    3236:	c3                   	ret    

00003237 <h_rename>:

void h_rename(Point p) {
    3237:	55                   	push   %ebp
    3238:	89 e5                	mov    %esp,%ebp
    323a:	83 ec 18             	sub    $0x18,%esp
	rename();
    323d:	e8 95 ff ff ff       	call   31d7 <rename>
	drawFinderContent(context);
    3242:	a1 00 46 01 00       	mov    0x14600,%eax
    3247:	89 04 24             	mov    %eax,(%esp)
    324a:	a1 04 46 01 00       	mov    0x14604,%eax
    324f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3253:	a1 08 46 01 00       	mov    0x14608,%eax
    3258:	89 44 24 08          	mov    %eax,0x8(%esp)
    325c:	e8 36 dd ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    3261:	a1 00 46 01 00       	mov    0x14600,%eax
    3266:	89 04 24             	mov    %eax,(%esp)
    3269:	a1 04 46 01 00       	mov    0x14604,%eax
    326e:	89 44 24 04          	mov    %eax,0x4(%esp)
    3272:	a1 08 46 01 00       	mov    0x14608,%eax
    3277:	89 44 24 08          	mov    %eax,0x8(%esp)
    327b:	e8 c9 d9 ff ff       	call   c49 <drawFinderWnd>
}
    3280:	c9                   	leave  
    3281:	c3                   	ret    

00003282 <main>:

int main(int argc, char *argv[]) {
    3282:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    3286:	83 e4 f0             	and    $0xfffffff0,%esp
    3289:	ff 71 fc             	pushl  -0x4(%ecx)
    328c:	55                   	push   %ebp
    328d:	89 e5                	mov    %esp,%ebp
    328f:	56                   	push   %esi
    3290:	53                   	push   %ebx
    3291:	51                   	push   %ecx
    3292:	81 ec ac 00 00 00    	sub    $0xac,%esp
	struct Msg msg;
	char key;

	Point p;

	init_keyContent();
    3298:	e8 cd cd ff ff       	call   6a <init_keyContent>
	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    329d:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    32a4:	00 
    32a5:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    32ac:	00 
    32ad:	c7 04 24 00 46 01 00 	movl   $0x14600,(%esp)
    32b4:	e8 94 07 00 00       	call   3a4d <init_context>
    32b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    32bc:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
    32c2:	8b 15 00 46 01 00    	mov    0x14600,%edx
    32c8:	89 54 24 04          	mov    %edx,0x4(%esp)
    32cc:	8b 15 04 46 01 00    	mov    0x14604,%edx
    32d2:	89 54 24 08          	mov    %edx,0x8(%esp)
    32d6:	8b 15 08 46 01 00    	mov    0x14608,%edx
    32dc:	89 54 24 0c          	mov    %edx,0xc(%esp)
    32e0:	89 04 24             	mov    %eax,(%esp)
    32e3:	e8 39 1d 00 00       	call   5021 <initClickManager>
    32e8:	83 ec 04             	sub    $0x4,%esp
    32eb:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
    32f1:	a3 40 47 01 00       	mov    %eax,0x14740
    32f6:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
    32fc:	a3 44 47 01 00       	mov    %eax,0x14744
    3301:	8b 45 80             	mov    -0x80(%ebp),%eax
    3304:	a3 48 47 01 00       	mov    %eax,0x14748
    3309:	8b 45 84             	mov    -0x7c(%ebp),%eax
    330c:	a3 4c 47 01 00       	mov    %eax,0x1474c
    3311:	8b 45 88             	mov    -0x78(%ebp),%eax
    3314:	a3 50 47 01 00       	mov    %eax,0x14750
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    3319:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
    3320:	00 
    3321:	c7 04 24 60 06 01 00 	movl   $0x10660,(%esp)
    3328:	e8 1a 13 00 00       	call   4647 <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    332d:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    3334:	00 
    3335:	c7 04 24 80 05 01 00 	movl   $0x10580,(%esp)
    333c:	e8 06 13 00 00       	call   4647 <load_iconlist>
	//testHandlers();
	strcpy(currentPath, "/");
    3341:	c7 44 24 04 b8 c4 00 	movl   $0xc4b8,0x4(%esp)
    3348:	00 
    3349:	c7 04 24 40 46 01 00 	movl   $0x14640,(%esp)
    3350:	e8 42 23 00 00       	call   5697 <strcpy>
	mkdir("userfolder");
    3355:	c7 04 24 ba c4 00 00 	movl   $0xc4ba,(%esp)
    335c:	e8 e1 25 00 00       	call   5942 <mkdir>
	enterDir("userfolder");
    3361:	c7 04 24 ba c4 00 00 	movl   $0xc4ba,(%esp)
    3368:	e8 19 e9 ff ff       	call   1c86 <enterDir>
	updateFileList(context);
    336d:	a1 00 46 01 00       	mov    0x14600,%eax
    3372:	89 04 24             	mov    %eax,(%esp)
    3375:	a1 04 46 01 00       	mov    0x14604,%eax
    337a:	89 44 24 04          	mov    %eax,0x4(%esp)
    337e:	a1 08 46 01 00       	mov    0x14608,%eax
    3383:	89 44 24 08          	mov    %eax,0x8(%esp)
    3387:	e8 bc da ff ff       	call   e48 <updateFileList>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    338c:	8d 45 c0             	lea    -0x40(%ebp),%eax
    338f:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    3396:	00 
    3397:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    339e:	00 
    339f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    33a6:	00 
    33a7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    33ae:	00 
    33af:	89 04 24             	mov    %eax,(%esp)
    33b2:	e8 cc 1b 00 00       	call   4f83 <initRect>
    33b7:	83 ec 04             	sub    $0x4,%esp
    33ba:	8b 45 c0             	mov    -0x40(%ebp),%eax
    33bd:	89 44 24 04          	mov    %eax,0x4(%esp)
    33c1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    33c4:	89 44 24 08          	mov    %eax,0x8(%esp)
    33c8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    33cb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    33cf:	8b 45 cc             	mov    -0x34(%ebp),%eax
    33d2:	89 44 24 10          	mov    %eax,0x10(%esp)
    33d6:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    33dd:	e8 a4 1d 00 00       	call   5186 <deleteClickable>
	addWndEvent(&cm);
    33e2:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    33e9:	e8 a8 e1 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    33ee:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    33f5:	e8 14 e1 ff ff       	call   150e <addListEvent>
	lenOfWaited = 0;
    33fa:	c7 05 58 47 01 00 00 	movl   $0x0,0x14758
    3401:	00 00 00 
	while (isRun) {
    3404:	e9 14 05 00 00       	jmp    391d <main+0x69b>
		getMsg(&msg);
    3409:	8d 45 a8             	lea    -0x58(%ebp),%eax
    340c:	89 04 24             	mov    %eax,(%esp)
    340f:	e8 66 25 00 00       	call   597a <getMsg>
		switch (msg.msg_type) {
    3414:	8b 45 a8             	mov    -0x58(%ebp),%eax
    3417:	83 f8 08             	cmp    $0x8,%eax
    341a:	0f 87 fc 04 00 00    	ja     391c <main+0x69a>
    3420:	8b 04 85 c8 c4 00 00 	mov    0xc4c8(,%eax,4),%eax
    3427:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    3429:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    342c:	8b 55 ac             	mov    -0x54(%ebp),%edx
    342f:	8d 45 a0             	lea    -0x60(%ebp),%eax
    3432:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3436:	89 54 24 04          	mov    %edx,0x4(%esp)
    343a:	89 04 24             	mov    %eax,(%esp)
    343d:	e8 1a 1b 00 00       	call   4f5c <initPoint>
    3442:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    3445:	8b 0d 44 47 01 00    	mov    0x14744,%ecx
    344b:	8b 45 a0             	mov    -0x60(%ebp),%eax
    344e:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    3451:	89 44 24 04          	mov    %eax,0x4(%esp)
    3455:	89 54 24 08          	mov    %edx,0x8(%esp)
    3459:	89 0c 24             	mov    %ecx,(%esp)
    345c:	e8 05 1e 00 00       	call   5266 <executeHandler>
    3461:	85 c0                	test   %eax,%eax
    3463:	74 19                	je     347e <main+0x1fc>
				updateWindow(winid, context.addr);
    3465:	a1 00 46 01 00       	mov    0x14600,%eax
    346a:	89 44 24 04          	mov    %eax,0x4(%esp)
    346e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3471:	89 04 24             	mov    %eax,(%esp)
    3474:	e8 19 25 00 00       	call   5992 <updateWindow>
			}
			break;
    3479:	e9 9f 04 00 00       	jmp    391d <main+0x69b>
    347e:	e9 9a 04 00 00       	jmp    391d <main+0x69b>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    3483:	a1 00 46 01 00       	mov    0x14600,%eax
    3488:	89 04 24             	mov    %eax,(%esp)
    348b:	a1 04 46 01 00       	mov    0x14604,%eax
    3490:	89 44 24 04          	mov    %eax,0x4(%esp)
    3494:	a1 08 46 01 00       	mov    0x14608,%eax
    3499:	89 44 24 08          	mov    %eax,0x8(%esp)
    349d:	e8 f5 da ff ff       	call   f97 <drawFinderContent>
			drawFinderWnd(context);
    34a2:	a1 00 46 01 00       	mov    0x14600,%eax
    34a7:	89 04 24             	mov    %eax,(%esp)
    34aa:	a1 04 46 01 00       	mov    0x14604,%eax
    34af:	89 44 24 04          	mov    %eax,0x4(%esp)
    34b3:	a1 08 46 01 00       	mov    0x14608,%eax
    34b8:	89 44 24 08          	mov    %eax,0x8(%esp)
    34bc:	e8 88 d7 ff ff       	call   c49 <drawFinderWnd>
			updateWindow(winid, context.addr);
    34c1:	a1 00 46 01 00       	mov    0x14600,%eax
    34c6:	89 44 24 04          	mov    %eax,0x4(%esp)
    34ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    34cd:	89 04 24             	mov    %eax,(%esp)
    34d0:	e8 bd 24 00 00       	call   5992 <updateWindow>
			break;
    34d5:	e9 43 04 00 00       	jmp    391d <main+0x69b>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    34da:	8b 75 b8             	mov    -0x48(%ebp),%esi
    34dd:	8b 5d b4             	mov    -0x4c(%ebp),%ebx
    34e0:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    34e3:	8b 55 ac             	mov    -0x54(%ebp),%edx
    34e6:	a1 00 46 01 00       	mov    0x14600,%eax
    34eb:	89 74 24 14          	mov    %esi,0x14(%esp)
    34ef:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    34f3:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    34f7:	89 54 24 08          	mov    %edx,0x8(%esp)
    34fb:	89 44 24 04          	mov    %eax,0x4(%esp)
    34ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3502:	89 04 24             	mov    %eax,(%esp)
    3505:	e8 90 24 00 00       	call   599a <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    350a:	e9 0e 04 00 00       	jmp    391d <main+0x69b>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    350f:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    3512:	8b 55 ac             	mov    -0x54(%ebp),%edx
    3515:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    351b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    351f:	89 54 24 04          	mov    %edx,0x4(%esp)
    3523:	89 04 24             	mov    %eax,(%esp)
    3526:	e8 31 1a 00 00       	call   4f5c <initPoint>
    352b:	83 ec 04             	sub    $0x4,%esp
    352e:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    3534:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
    353a:	89 45 a0             	mov    %eax,-0x60(%ebp)
    353d:	89 55 a4             	mov    %edx,-0x5c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			// if (executeHandler(cm.left_click, p)) {
			// 	updateWindow(winid, context.addr);
			// }
			if(renaming == 1){
    3540:	a1 54 47 01 00       	mov    0x14754,%eax
    3545:	83 f8 01             	cmp    $0x1,%eax
    3548:	75 19                	jne    3563 <main+0x2e1>
				unrename();
    354a:	e8 07 f1 ff ff       	call   2656 <unrename>
				updateWindow(winid, context.addr);
    354f:	a1 00 46 01 00       	mov    0x14600,%eax
    3554:	89 44 24 04          	mov    %eax,0x4(%esp)
    3558:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    355b:	89 04 24             	mov    %eax,(%esp)
    355e:	e8 2f 24 00 00       	call   5992 <updateWindow>
			}
			executeHandler(cm.left_click, p);
    3563:	8b 0d 40 47 01 00    	mov    0x14740,%ecx
    3569:	8b 45 a0             	mov    -0x60(%ebp),%eax
    356c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    356f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3573:	89 54 24 08          	mov    %edx,0x8(%esp)
    3577:	89 0c 24             	mov    %ecx,(%esp)
    357a:	e8 e7 1c 00 00       	call   5266 <executeHandler>
			draw_searchbox();
    357f:	e8 16 cb ff ff       	call   9a <draw_searchbox>
			puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
    3584:	c7 44 24 18 28 00 00 	movl   $0x28,0x18(%esp)
    358b:	00 
    358c:	c7 44 24 14 a4 01 00 	movl   $0x1a4,0x14(%esp)
    3593:	00 
    3594:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    359b:	00 
    359c:	c7 44 24 0c 0c 46 01 	movl   $0x1460c,0xc(%esp)
    35a3:	00 
    35a4:	a1 00 46 01 00       	mov    0x14600,%eax
    35a9:	89 04 24             	mov    %eax,(%esp)
    35ac:	a1 04 46 01 00       	mov    0x14604,%eax
    35b1:	89 44 24 04          	mov    %eax,0x4(%esp)
    35b5:	a1 08 46 01 00       	mov    0x14608,%eax
    35ba:	89 44 24 08          	mov    %eax,0x8(%esp)
    35be:	e8 55 0b 00 00       	call   4118 <puts_str>
				- (BUTTON_HEIGHT + 3) + 5);
			updateWindow(winid, context.addr);
    35c3:	a1 00 46 01 00       	mov    0x14600,%eax
    35c8:	89 44 24 04          	mov    %eax,0x4(%esp)
    35cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35cf:	89 04 24             	mov    %eax,(%esp)
    35d2:	e8 bb 23 00 00       	call   5992 <updateWindow>
			break;
    35d7:	e9 41 03 00 00       	jmp    391d <main+0x69b>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    35dc:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    35df:	8b 55 ac             	mov    -0x54(%ebp),%edx
    35e2:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    35e8:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    35ec:	89 54 24 04          	mov    %edx,0x4(%esp)
    35f0:	89 04 24             	mov    %eax,(%esp)
    35f3:	e8 64 19 00 00       	call   4f5c <initPoint>
    35f8:	83 ec 04             	sub    $0x4,%esp
    35fb:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    3601:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
    3607:	89 45 a0             	mov    %eax,-0x60(%ebp)
    360a:	89 55 a4             	mov    %edx,-0x5c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    360d:	8b 0d 48 47 01 00    	mov    0x14748,%ecx
    3613:	8b 45 a0             	mov    -0x60(%ebp),%eax
    3616:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    3619:	89 44 24 04          	mov    %eax,0x4(%esp)
    361d:	89 54 24 08          	mov    %edx,0x8(%esp)
    3621:	89 0c 24             	mov    %ecx,(%esp)
    3624:	e8 3d 1c 00 00       	call   5266 <executeHandler>
    3629:	85 c0                	test   %eax,%eax
    362b:	74 19                	je     3646 <main+0x3c4>
				updateWindow(winid, context.addr);
    362d:	a1 00 46 01 00       	mov    0x14600,%eax
    3632:	89 44 24 04          	mov    %eax,0x4(%esp)
    3636:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3639:	89 04 24             	mov    %eax,(%esp)
    363c:	e8 51 23 00 00       	call   5992 <updateWindow>
			}
			break;
    3641:	e9 d7 02 00 00       	jmp    391d <main+0x69b>
    3646:	e9 d2 02 00 00       	jmp    391d <main+0x69b>
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
    364b:	0f b6 45 ac          	movzbl -0x54(%ebp),%eax
    364f:	88 45 e3             	mov    %al,-0x1d(%ebp)
			if (isSearching) {
    3652:	a1 e0 3c 01 00       	mov    0x13ce0,%eax
    3657:	85 c0                	test   %eax,%eax
    3659:	0f 84 8b 01 00 00    	je     37ea <main+0x568>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
    365f:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    3663:	74 2a                	je     368f <main+0x40d>
    3665:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    3669:	74 24                	je     368f <main+0x40d>
    366b:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    366f:	7e 06                	jle    3677 <main+0x3f5>
    3671:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    3675:	7e 18                	jle    368f <main+0x40d>
    3677:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    367b:	7e 06                	jle    3683 <main+0x401>
    367d:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    3681:	7e 0c                	jle    368f <main+0x40d>
    3683:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    3687:	7e 50                	jle    36d9 <main+0x457>
    3689:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    368d:	7f 4a                	jg     36d9 <main+0x457>
    368f:	a1 20 46 01 00       	mov    0x14620,%eax
    3694:	83 f8 13             	cmp    $0x13,%eax
    3697:	7f 40                	jg     36d9 <main+0x457>
					keyContent.content[keyContent.length++] = key;
    3699:	a1 20 46 01 00       	mov    0x14620,%eax
    369e:	8d 50 01             	lea    0x1(%eax),%edx
    36a1:	89 15 20 46 01 00    	mov    %edx,0x14620
    36a7:	0f b6 55 e3          	movzbl -0x1d(%ebp),%edx
    36ab:	88 90 0c 46 01 00    	mov    %dl,0x1460c(%eax)
					scrollOffset = 0;
    36b1:	c7 05 c0 0e 01 00 00 	movl   $0x0,0x10ec0
    36b8:	00 00 00 
					printf(0, "%s\n", keyContent.content);
    36bb:	c7 44 24 08 0c 46 01 	movl   $0x1460c,0x8(%esp)
    36c2:	00 
    36c3:	c7 44 24 04 94 c1 00 	movl   $0xc194,0x4(%esp)
    36ca:	00 
    36cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36d2:	e8 eb 23 00 00       	call   5ac2 <printf>
    36d7:	eb 32                	jmp    370b <main+0x489>
				}
				else if (key == 8 && keyContent.length > 0) {
    36d9:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    36dd:	75 2c                	jne    370b <main+0x489>
    36df:	a1 20 46 01 00       	mov    0x14620,%eax
    36e4:	85 c0                	test   %eax,%eax
    36e6:	7e 23                	jle    370b <main+0x489>
					keyContent.content[--keyContent.length] = 0;
    36e8:	a1 20 46 01 00       	mov    0x14620,%eax
    36ed:	83 e8 01             	sub    $0x1,%eax
    36f0:	a3 20 46 01 00       	mov    %eax,0x14620
    36f5:	a1 20 46 01 00       	mov    0x14620,%eax
    36fa:	c6 80 0c 46 01 00 00 	movb   $0x0,0x1460c(%eax)
					scrollOffset = 0;
    3701:	c7 05 c0 0e 01 00 00 	movl   $0x0,0x10ec0
    3708:	00 00 00 
				}
				deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    370b:	8d 45 d0             	lea    -0x30(%ebp),%eax
    370e:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    3715:	00 
    3716:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    371d:	00 
    371e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3725:	00 
    3726:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    372d:	00 
    372e:	89 04 24             	mov    %eax,(%esp)
    3731:	e8 4d 18 00 00       	call   4f83 <initRect>
    3736:	83 ec 04             	sub    $0x4,%esp
    3739:	8b 45 d0             	mov    -0x30(%ebp),%eax
    373c:	89 44 24 04          	mov    %eax,0x4(%esp)
    3740:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3743:	89 44 24 08          	mov    %eax,0x8(%esp)
    3747:	8b 45 d8             	mov    -0x28(%ebp),%eax
    374a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    374e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3751:	89 44 24 10          	mov    %eax,0x10(%esp)
    3755:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    375c:	e8 25 1a 00 00       	call   5186 <deleteClickable>
				addWndEvent(&cm);
    3761:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    3768:	e8 29 de ff ff       	call   1596 <addWndEvent>
				updateFileList(context);
    376d:	a1 00 46 01 00       	mov    0x14600,%eax
    3772:	89 04 24             	mov    %eax,(%esp)
    3775:	a1 04 46 01 00       	mov    0x14604,%eax
    377a:	89 44 24 04          	mov    %eax,0x4(%esp)
    377e:	a1 08 46 01 00       	mov    0x14608,%eax
    3783:	89 44 24 08          	mov    %eax,0x8(%esp)
    3787:	e8 bc d6 ff ff       	call   e48 <updateFileList>
				addListEvent(&cm);
    378c:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    3793:	e8 76 dd ff ff       	call   150e <addListEvent>
				drawFinderContent(context);
    3798:	a1 00 46 01 00       	mov    0x14600,%eax
    379d:	89 04 24             	mov    %eax,(%esp)
    37a0:	a1 04 46 01 00       	mov    0x14604,%eax
    37a5:	89 44 24 04          	mov    %eax,0x4(%esp)
    37a9:	a1 08 46 01 00       	mov    0x14608,%eax
    37ae:	89 44 24 08          	mov    %eax,0x8(%esp)
    37b2:	e8 e0 d7 ff ff       	call   f97 <drawFinderContent>
				drawFinderWnd(context);
    37b7:	a1 00 46 01 00       	mov    0x14600,%eax
    37bc:	89 04 24             	mov    %eax,(%esp)
    37bf:	a1 04 46 01 00       	mov    0x14604,%eax
    37c4:	89 44 24 04          	mov    %eax,0x4(%esp)
    37c8:	a1 08 46 01 00       	mov    0x14608,%eax
    37cd:	89 44 24 08          	mov    %eax,0x8(%esp)
    37d1:	e8 73 d4 ff ff       	call   c49 <drawFinderWnd>
				updateWindow(winid, context.addr);
    37d6:	a1 00 46 01 00       	mov    0x14600,%eax
    37db:	89 44 24 04          	mov    %eax,0x4(%esp)
    37df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    37e2:	89 04 24             	mov    %eax,(%esp)
    37e5:	e8 a8 21 00 00       	call   5992 <updateWindow>
			}
			if (renaming) {
    37ea:	a1 54 47 01 00       	mov    0x14754,%eax
    37ef:	85 c0                	test   %eax,%eax
    37f1:	0f 84 23 01 00 00    	je     391a <main+0x698>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (strlen(currentlyRenaming->name)<30)) {
    37f7:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    37fb:	74 2a                	je     3827 <main+0x5a5>
    37fd:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    3801:	74 24                	je     3827 <main+0x5a5>
    3803:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    3807:	7e 06                	jle    380f <main+0x58d>
    3809:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    380d:	7e 18                	jle    3827 <main+0x5a5>
    380f:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    3813:	7e 06                	jle    381b <main+0x599>
    3815:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    3819:	7e 0c                	jle    3827 <main+0x5a5>
    381b:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    381f:	7e 5e                	jle    387f <main+0x5fd>
    3821:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    3825:	7f 58                	jg     387f <main+0x5fd>
    3827:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
    382c:	8b 40 14             	mov    0x14(%eax),%eax
    382f:	89 04 24             	mov    %eax,(%esp)
    3832:	e8 cf 1e 00 00       	call   5706 <strlen>
    3837:	83 f8 1d             	cmp    $0x1d,%eax
    383a:	77 43                	ja     387f <main+0x5fd>
					currentlyRenaming->name[strlen(currentlyRenaming->name) + 1] = 0;
    383c:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
    3841:	8b 58 14             	mov    0x14(%eax),%ebx
    3844:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
    3849:	8b 40 14             	mov    0x14(%eax),%eax
    384c:	89 04 24             	mov    %eax,(%esp)
    384f:	e8 b2 1e 00 00       	call   5706 <strlen>
    3854:	83 c0 01             	add    $0x1,%eax
    3857:	01 d8                	add    %ebx,%eax
    3859:	c6 00 00             	movb   $0x0,(%eax)
					currentlyRenaming->name[strlen(currentlyRenaming->name)] = key;
    385c:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
    3861:	8b 58 14             	mov    0x14(%eax),%ebx
    3864:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
    3869:	8b 40 14             	mov    0x14(%eax),%eax
    386c:	89 04 24             	mov    %eax,(%esp)
    386f:	e8 92 1e 00 00       	call   5706 <strlen>
    3874:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    3877:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
    387b:	88 02                	mov    %al,(%edx)
    387d:	eb 47                	jmp    38c6 <main+0x644>
				}
				else if (key == 8 && (strlen(currentlyRenaming->name)>0)) {
    387f:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    3883:	75 36                	jne    38bb <main+0x639>
    3885:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
    388a:	8b 40 14             	mov    0x14(%eax),%eax
    388d:	89 04 24             	mov    %eax,(%esp)
    3890:	e8 71 1e 00 00       	call   5706 <strlen>
    3895:	85 c0                	test   %eax,%eax
    3897:	74 22                	je     38bb <main+0x639>
					currentlyRenaming->name[strlen(currentlyRenaming->name) - 1] = 0;
    3899:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
    389e:	8b 58 14             	mov    0x14(%eax),%ebx
    38a1:	a1 cc 0e 01 00       	mov    0x10ecc,%eax
    38a6:	8b 40 14             	mov    0x14(%eax),%eax
    38a9:	89 04 24             	mov    %eax,(%esp)
    38ac:	e8 55 1e 00 00       	call   5706 <strlen>
    38b1:	83 e8 01             	sub    $0x1,%eax
    38b4:	01 d8                	add    %ebx,%eax
    38b6:	c6 00 00             	movb   $0x0,(%eax)
    38b9:	eb 0b                	jmp    38c6 <main+0x644>
				} else if (key == '\n') {
    38bb:	80 7d e3 0a          	cmpb   $0xa,-0x1d(%ebp)
    38bf:	75 05                	jne    38c6 <main+0x644>
					unrename();
    38c1:	e8 90 ed ff ff       	call   2656 <unrename>
				}
				drawFinderContent(context);
    38c6:	a1 00 46 01 00       	mov    0x14600,%eax
    38cb:	89 04 24             	mov    %eax,(%esp)
    38ce:	a1 04 46 01 00       	mov    0x14604,%eax
    38d3:	89 44 24 04          	mov    %eax,0x4(%esp)
    38d7:	a1 08 46 01 00       	mov    0x14608,%eax
    38dc:	89 44 24 08          	mov    %eax,0x8(%esp)
    38e0:	e8 b2 d6 ff ff       	call   f97 <drawFinderContent>
				drawFinderWnd(context);
    38e5:	a1 00 46 01 00       	mov    0x14600,%eax
    38ea:	89 04 24             	mov    %eax,(%esp)
    38ed:	a1 04 46 01 00       	mov    0x14604,%eax
    38f2:	89 44 24 04          	mov    %eax,0x4(%esp)
    38f6:	a1 08 46 01 00       	mov    0x14608,%eax
    38fb:	89 44 24 08          	mov    %eax,0x8(%esp)
    38ff:	e8 45 d3 ff ff       	call   c49 <drawFinderWnd>
				updateWindow(winid, context.addr);
    3904:	a1 00 46 01 00       	mov    0x14600,%eax
    3909:	89 44 24 04          	mov    %eax,0x4(%esp)
    390d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3910:	89 04 24             	mov    %eax,(%esp)
    3913:	e8 7a 20 00 00       	call   5992 <updateWindow>
			}
			break;
    3918:	eb 03                	jmp    391d <main+0x69b>
    391a:	eb 01                	jmp    391d <main+0x69b>
		default:
			break;
    391c:	90                   	nop
	updateFileList(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    391d:	a1 60 05 01 00       	mov    0x10560,%eax
    3922:	85 c0                	test   %eax,%eax
    3924:	0f 85 df fa ff ff    	jne    3409 <main+0x187>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    392a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    392d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3931:	c7 04 24 00 46 01 00 	movl   $0x14600,(%esp)
    3938:	e8 93 01 00 00       	call   3ad0 <free_context>
	exit();
    393d:	e8 98 1f 00 00       	call   58da <exit>

00003942 <testHandlers>:
}

void testHandlers() {
    3942:	55                   	push   %ebp
    3943:	89 e5                	mov    %esp,%ebp
    3945:	83 ec 18             	sub    $0x18,%esp

	list(".");
    3948:	c7 04 24 88 c1 00 00 	movl   $0xc188,(%esp)
    394f:	e8 9f cb ff ff       	call   4f3 <list>
	printf(0, "original list:\n");
    3954:	c7 44 24 04 ec c4 00 	movl   $0xc4ec,0x4(%esp)
    395b:	00 
    395c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3963:	e8 5a 21 00 00       	call   5ac2 <printf>
	printItemList();
    3968:	e8 8b d9 ff ff       	call   12f8 <printItemList>
	printf(0, "\n");
    396d:	c7 44 24 04 fc c4 00 	movl   $0xc4fc,0x4(%esp)
    3974:	00 
    3975:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    397c:	e8 41 21 00 00       	call   5ac2 <printf>
	printf(0, "new a folder:\n");
    3981:	c7 44 24 04 fe c4 00 	movl   $0xc4fe,0x4(%esp)
    3988:	00 
    3989:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3990:	e8 2d 21 00 00       	call   5ac2 <printf>
	newFolder("newfolder");
    3995:	c7 04 24 0d c5 00 00 	movl   $0xc50d,(%esp)
    399c:	e8 53 e6 ff ff       	call   1ff4 <newFolder>
	freeFileItemList();
    39a1:	e8 6f ca ff ff       	call   415 <freeFileItemList>
	list(".");
    39a6:	c7 04 24 88 c1 00 00 	movl   $0xc188,(%esp)
    39ad:	e8 41 cb ff ff       	call   4f3 <list>
	printItemList();
    39b2:	e8 41 d9 ff ff       	call   12f8 <printItemList>
	printf(0, "\n");
    39b7:	c7 44 24 04 fc c4 00 	movl   $0xc4fc,0x4(%esp)
    39be:	00 
    39bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    39c6:	e8 f7 20 00 00       	call   5ac2 <printf>
	printf(0, "enter new folder:\n");
    39cb:	c7 44 24 04 17 c5 00 	movl   $0xc517,0x4(%esp)
    39d2:	00 
    39d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    39da:	e8 e3 20 00 00       	call   5ac2 <printf>
	enterDir("newfolder");
    39df:	c7 04 24 0d c5 00 00 	movl   $0xc50d,(%esp)
    39e6:	e8 9b e2 ff ff       	call   1c86 <enterDir>
	freeFileItemList();
    39eb:	e8 25 ca ff ff       	call   415 <freeFileItemList>
	list(".");
    39f0:	c7 04 24 88 c1 00 00 	movl   $0xc188,(%esp)
    39f7:	e8 f7 ca ff ff       	call   4f3 <list>
	printItemList();
    39fc:	e8 f7 d8 ff ff       	call   12f8 <printItemList>
	printf(0, "\n");
    3a01:	c7 44 24 04 fc c4 00 	movl   $0xc4fc,0x4(%esp)
    3a08:	00 
    3a09:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a10:	e8 ad 20 00 00       	call   5ac2 <printf>
	printf(0, "new a file:\n");
    3a15:	c7 44 24 04 2a c5 00 	movl   $0xc52a,0x4(%esp)
    3a1c:	00 
    3a1d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a24:	e8 99 20 00 00       	call   5ac2 <printf>
	newFile("newfile.txt");
    3a29:	c7 04 24 37 c5 00 00 	movl   $0xc537,(%esp)
    3a30:	e8 c7 e3 ff ff       	call   1dfc <newFile>
	freeFileItemList();
    3a35:	e8 db c9 ff ff       	call   415 <freeFileItemList>
	list(".");
    3a3a:	c7 04 24 88 c1 00 00 	movl   $0xc188,(%esp)
    3a41:	e8 ad ca ff ff       	call   4f3 <list>
	printItemList();
    3a46:	e8 ad d8 ff ff       	call   12f8 <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    3a4b:	c9                   	leave  
    3a4c:	c3                   	ret    

00003a4d <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    3a4d:	55                   	push   %ebp
    3a4e:	89 e5                	mov    %esp,%ebp
    3a50:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    3a53:	8b 45 08             	mov    0x8(%ebp),%eax
    3a56:	8b 55 0c             	mov    0xc(%ebp),%edx
    3a59:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    3a5c:	8b 45 08             	mov    0x8(%ebp),%eax
    3a5f:	8b 55 10             	mov    0x10(%ebp),%edx
    3a62:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    3a65:	8b 55 0c             	mov    0xc(%ebp),%edx
    3a68:	8b 45 10             	mov    0x10(%ebp),%eax
    3a6b:	0f af c2             	imul   %edx,%eax
    3a6e:	01 c0                	add    %eax,%eax
    3a70:	89 04 24             	mov    %eax,(%esp)
    3a73:	e8 36 23 00 00       	call   5dae <malloc>
    3a78:	8b 55 08             	mov    0x8(%ebp),%edx
    3a7b:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    3a7d:	8b 55 0c             	mov    0xc(%ebp),%edx
    3a80:	8b 45 10             	mov    0x10(%ebp),%eax
    3a83:	0f af c2             	imul   %edx,%eax
    3a86:	8d 14 00             	lea    (%eax,%eax,1),%edx
    3a89:	8b 45 08             	mov    0x8(%ebp),%eax
    3a8c:	8b 00                	mov    (%eax),%eax
    3a8e:	89 54 24 08          	mov    %edx,0x8(%esp)
    3a92:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3a99:	00 
    3a9a:	89 04 24             	mov    %eax,(%esp)
    3a9d:	e8 8b 1c 00 00       	call   572d <memset>
    initializeASCII();
    3aa2:	e8 93 01 00 00       	call   3c3a <initializeASCII>
    initializeGBK();
    3aa7:	e8 17 03 00 00       	call   3dc3 <initializeGBK>
    return createWindow(0, 0, width, height);
    3aac:	8b 45 10             	mov    0x10(%ebp),%eax
    3aaf:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3ab3:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ab6:	89 44 24 08          	mov    %eax,0x8(%esp)
    3aba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3ac1:	00 
    3ac2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ac9:	e8 b4 1e 00 00       	call   5982 <createWindow>
}
    3ace:	c9                   	leave  
    3acf:	c3                   	ret    

00003ad0 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    3ad0:	55                   	push   %ebp
    3ad1:	89 e5                	mov    %esp,%ebp
    3ad3:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    3ad6:	8b 45 08             	mov    0x8(%ebp),%eax
    3ad9:	8b 00                	mov    (%eax),%eax
    3adb:	89 04 24             	mov    %eax,(%esp)
    3ade:	e8 92 21 00 00       	call   5c75 <free>
    freeASCII();
    3ae3:	e8 c6 02 00 00       	call   3dae <freeASCII>
    freeGBK();
    3ae8:	e8 7e 03 00 00       	call   3e6b <freeGBK>
    destroyWindow(winid);
    3aed:	8b 45 0c             	mov    0xc(%ebp),%eax
    3af0:	89 04 24             	mov    %eax,(%esp)
    3af3:	e8 92 1e 00 00       	call   598a <destroyWindow>
}
    3af8:	c9                   	leave  
    3af9:	c3                   	ret    

00003afa <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    3afa:	55                   	push   %ebp
    3afb:	89 e5                	mov    %esp,%ebp
    3afd:	83 ec 04             	sub    $0x4,%esp
    3b00:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3b03:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    3b07:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b0a:	3b 45 14             	cmp    0x14(%ebp),%eax
    3b0d:	77 02                	ja     3b11 <draw_point+0x17>
    return;
    3b0f:	eb 26                	jmp    3b37 <draw_point+0x3d>
  if(y >= c.height)
    3b11:	8b 45 10             	mov    0x10(%ebp),%eax
    3b14:	3b 45 18             	cmp    0x18(%ebp),%eax
    3b17:	77 02                	ja     3b1b <draw_point+0x21>
    return;
    3b19:	eb 1c                	jmp    3b37 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    3b1b:	8b 55 08             	mov    0x8(%ebp),%edx
    3b1e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b21:	0f af 45 18          	imul   0x18(%ebp),%eax
    3b25:	89 c1                	mov    %eax,%ecx
    3b27:	8b 45 14             	mov    0x14(%ebp),%eax
    3b2a:	01 c8                	add    %ecx,%eax
    3b2c:	01 c0                	add    %eax,%eax
    3b2e:	01 c2                	add    %eax,%edx
    3b30:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    3b34:	66 89 02             	mov    %ax,(%edx)
}
    3b37:	c9                   	leave  
    3b38:	c3                   	ret    

00003b39 <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    3b39:	55                   	push   %ebp
    3b3a:	89 e5                	mov    %esp,%ebp
    3b3c:	83 ec 2c             	sub    $0x2c,%esp
    3b3f:	8b 45 24             	mov    0x24(%ebp),%eax
    3b42:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    3b46:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3b49:	8b 55 14             	mov    0x14(%ebp),%edx
    3b4c:	01 c2                	add    %eax,%edx
    3b4e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b51:	39 c2                	cmp    %eax,%edx
    3b53:	0f 46 c2             	cmovbe %edx,%eax
    3b56:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    3b59:	8b 45 20             	mov    0x20(%ebp),%eax
    3b5c:	8b 55 18             	mov    0x18(%ebp),%edx
    3b5f:	01 c2                	add    %eax,%edx
    3b61:	8b 45 10             	mov    0x10(%ebp),%eax
    3b64:	39 c2                	cmp    %eax,%edx
    3b66:	0f 46 c2             	cmovbe %edx,%eax
    3b69:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    3b6c:	8b 45 18             	mov    0x18(%ebp),%eax
    3b6f:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3b72:	eb 47                	jmp    3bbb <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    3b74:	8b 45 14             	mov    0x14(%ebp),%eax
    3b77:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3b7a:	eb 33                	jmp    3baf <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    3b7c:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    3b80:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3b83:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3b86:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3b8a:	89 54 24 10          	mov    %edx,0x10(%esp)
    3b8e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3b92:	8b 45 08             	mov    0x8(%ebp),%eax
    3b95:	89 04 24             	mov    %eax,(%esp)
    3b98:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b9b:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b9f:	8b 45 10             	mov    0x10(%ebp),%eax
    3ba2:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ba6:	e8 4f ff ff ff       	call   3afa <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    3bab:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3baf:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3bb2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3bb5:	7c c5                	jl     3b7c <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    3bb7:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3bbb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3bbe:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3bc1:	7c b1                	jl     3b74 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    3bc3:	c9                   	leave  
    3bc4:	c3                   	ret    

00003bc5 <printBinary>:

void printBinary(char c)
{
    3bc5:	55                   	push   %ebp
    3bc6:	89 e5                	mov    %esp,%ebp
    3bc8:	83 ec 28             	sub    $0x28,%esp
    3bcb:	8b 45 08             	mov    0x8(%ebp),%eax
    3bce:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    3bd1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3bd8:	eb 44                	jmp    3c1e <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    3bda:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    3bde:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3be1:	89 c1                	mov    %eax,%ecx
    3be3:	d3 e2                	shl    %cl,%edx
    3be5:	89 d0                	mov    %edx,%eax
    3be7:	25 80 00 00 00       	and    $0x80,%eax
    3bec:	85 c0                	test   %eax,%eax
    3bee:	74 16                	je     3c06 <printBinary+0x41>
		{
			printf(0, "1");
    3bf0:	c7 44 24 04 43 c5 00 	movl   $0xc543,0x4(%esp)
    3bf7:	00 
    3bf8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3bff:	e8 be 1e 00 00       	call   5ac2 <printf>
    3c04:	eb 14                	jmp    3c1a <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    3c06:	c7 44 24 04 45 c5 00 	movl   $0xc545,0x4(%esp)
    3c0d:	00 
    3c0e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c15:	e8 a8 1e 00 00       	call   5ac2 <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    3c1a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3c1e:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3c22:	7e b6                	jle    3bda <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    3c24:	c7 44 24 04 47 c5 00 	movl   $0xc547,0x4(%esp)
    3c2b:	00 
    3c2c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c33:	e8 8a 1e 00 00       	call   5ac2 <printf>
}
    3c38:	c9                   	leave  
    3c39:	c3                   	ret    

00003c3a <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    3c3a:	55                   	push   %ebp
    3c3b:	89 e5                	mov    %esp,%ebp
    3c3d:	56                   	push   %esi
    3c3e:	53                   	push   %ebx
    3c3f:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    3c42:	c7 44 24 04 49 c5 00 	movl   $0xc549,0x4(%esp)
    3c49:	00 
    3c4a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c51:	e8 6c 1e 00 00       	call   5ac2 <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    3c56:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3c5d:	00 
    3c5e:	c7 04 24 5c c5 00 00 	movl   $0xc55c,(%esp)
    3c65:	e8 b0 1c 00 00       	call   591a <open>
    3c6a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3c6d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3c71:	79 21                	jns    3c94 <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    3c73:	c7 44 24 08 5c c5 00 	movl   $0xc55c,0x8(%esp)
    3c7a:	00 
    3c7b:	c7 44 24 04 68 c5 00 	movl   $0xc568,0x4(%esp)
    3c82:	00 
    3c83:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c8a:	e8 33 1e 00 00       	call   5ac2 <printf>
	  return;
    3c8f:	e9 13 01 00 00       	jmp    3da7 <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    3c94:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3c9b:	e8 0e 21 00 00       	call   5dae <malloc>
    3ca0:	a3 60 47 01 00       	mov    %eax,0x14760
	for (i = 0; i < ASCII_NUM; i++)
    3ca5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3cac:	eb 12                	jmp    3cc0 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    3cae:	8b 15 60 47 01 00    	mov    0x14760,%edx
    3cb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cb7:	01 d0                	add    %edx,%eax
    3cb9:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    3cbc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3cc0:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    3cc7:	7e e5                	jle    3cae <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    3cc9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    3cd0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    3cd7:	e9 84 00 00 00       	jmp    3d60 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    3cdc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3ce3:	eb 73                	jmp    3d58 <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    3ce5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ce8:	05 80 47 01 00       	add    $0x14780,%eax
    3ced:	0f b6 00             	movzbl (%eax),%eax
    3cf0:	3c 2a                	cmp    $0x2a,%al
    3cf2:	74 0f                	je     3d03 <initializeASCII+0xc9>
    3cf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cf7:	05 80 47 01 00       	add    $0x14780,%eax
    3cfc:	0f b6 00             	movzbl (%eax),%eax
    3cff:	3c 2e                	cmp    $0x2e,%al
    3d01:	75 51                	jne    3d54 <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    3d03:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d06:	05 80 47 01 00       	add    $0x14780,%eax
    3d0b:	0f b6 00             	movzbl (%eax),%eax
    3d0e:	3c 2a                	cmp    $0x2a,%al
    3d10:	75 2d                	jne    3d3f <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    3d12:	8b 15 60 47 01 00    	mov    0x14760,%edx
    3d18:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d1b:	01 c2                	add    %eax,%edx
    3d1d:	8b 0d 60 47 01 00    	mov    0x14760,%ecx
    3d23:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d26:	01 c8                	add    %ecx,%eax
    3d28:	0f b6 00             	movzbl (%eax),%eax
    3d2b:	89 c3                	mov    %eax,%ebx
    3d2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3d30:	be 80 00 00 00       	mov    $0x80,%esi
    3d35:	89 c1                	mov    %eax,%ecx
    3d37:	d3 fe                	sar    %cl,%esi
    3d39:	89 f0                	mov    %esi,%eax
    3d3b:	09 d8                	or     %ebx,%eax
    3d3d:	88 02                	mov    %al,(%edx)
				}
				x ++;
    3d3f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    3d43:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    3d47:	7e 0b                	jle    3d54 <initializeASCII+0x11a>
				{
					x = 0;
    3d49:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    3d50:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    3d54:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3d58:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d5b:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    3d5e:	7c 85                	jl     3ce5 <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    3d60:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    3d67:	00 
    3d68:	c7 44 24 04 80 47 01 	movl   $0x14780,0x4(%esp)
    3d6f:	00 
    3d70:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3d73:	89 04 24             	mov    %eax,(%esp)
    3d76:	e8 77 1b 00 00       	call   58f2 <read>
    3d7b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3d7e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3d82:	0f 8f 54 ff ff ff    	jg     3cdc <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    3d88:	c7 44 24 04 78 c5 00 	movl   $0xc578,0x4(%esp)
    3d8f:	00 
    3d90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d97:	e8 26 1d 00 00       	call   5ac2 <printf>
	close(fd);
    3d9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3d9f:	89 04 24             	mov    %eax,(%esp)
    3da2:	e8 5b 1b 00 00       	call   5902 <close>
}
    3da7:	83 c4 30             	add    $0x30,%esp
    3daa:	5b                   	pop    %ebx
    3dab:	5e                   	pop    %esi
    3dac:	5d                   	pop    %ebp
    3dad:	c3                   	ret    

00003dae <freeASCII>:

void freeASCII(){
    3dae:	55                   	push   %ebp
    3daf:	89 e5                	mov    %esp,%ebp
    3db1:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    3db4:	a1 60 47 01 00       	mov    0x14760,%eax
    3db9:	89 04 24             	mov    %eax,(%esp)
    3dbc:	e8 b4 1e 00 00       	call   5c75 <free>
}
    3dc1:	c9                   	leave  
    3dc2:	c3                   	ret    

00003dc3 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    3dc3:	55                   	push   %ebp
    3dc4:	89 e5                	mov    %esp,%ebp
    3dc6:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    3dc9:	c7 44 24 04 95 c5 00 	movl   $0xc595,0x4(%esp)
    3dd0:	00 
    3dd1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3dd8:	e8 e5 1c 00 00       	call   5ac2 <printf>
	if((fd = open(HZK16, 0)) < 0){
    3ddd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3de4:	00 
    3de5:	c7 04 24 a6 c5 00 00 	movl   $0xc5a6,(%esp)
    3dec:	e8 29 1b 00 00       	call   591a <open>
    3df1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3df4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3df8:	79 1e                	jns    3e18 <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    3dfa:	c7 44 24 08 a6 c5 00 	movl   $0xc5a6,0x8(%esp)
    3e01:	00 
    3e02:	c7 44 24 04 68 c5 00 	movl   $0xc568,0x4(%esp)
    3e09:	00 
    3e0a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e11:	e8 ac 1c 00 00       	call   5ac2 <printf>
		return;
    3e16:	eb 51                	jmp    3e69 <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    3e18:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    3e1f:	e8 8a 1f 00 00       	call   5dae <malloc>
    3e24:	a3 64 47 01 00       	mov    %eax,0x14764
	fontFile.size = read(fd, fontFile.buf, 27000);
    3e29:	a1 64 47 01 00       	mov    0x14764,%eax
    3e2e:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    3e35:	00 
    3e36:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e3d:	89 04 24             	mov    %eax,(%esp)
    3e40:	e8 ad 1a 00 00       	call   58f2 <read>
    3e45:	a3 68 47 01 00       	mov    %eax,0x14768
	printf(0,"initialzing gbk complete!\n");
    3e4a:	c7 44 24 04 b0 c5 00 	movl   $0xc5b0,0x4(%esp)
    3e51:	00 
    3e52:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e59:	e8 64 1c 00 00       	call   5ac2 <printf>
	close(fd);
    3e5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e61:	89 04 24             	mov    %eax,(%esp)
    3e64:	e8 99 1a 00 00       	call   5902 <close>
}
    3e69:	c9                   	leave  
    3e6a:	c3                   	ret    

00003e6b <freeGBK>:

void freeGBK(){
    3e6b:	55                   	push   %ebp
    3e6c:	89 e5                	mov    %esp,%ebp
    3e6e:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    3e71:	a1 64 47 01 00       	mov    0x14764,%eax
    3e76:	89 04 24             	mov    %eax,(%esp)
    3e79:	e8 f7 1d 00 00       	call   5c75 <free>
}
    3e7e:	c9                   	leave  
    3e7f:	c3                   	ret    

00003e80 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    3e80:	55                   	push   %ebp
    3e81:	89 e5                	mov    %esp,%ebp
    3e83:	53                   	push   %ebx
    3e84:	83 ec 30             	sub    $0x30,%esp
    3e87:	8b 55 14             	mov    0x14(%ebp),%edx
    3e8a:	8b 45 18             	mov    0x18(%ebp),%eax
    3e8d:	88 55 e8             	mov    %dl,-0x18(%ebp)
    3e90:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    3e94:	8b 45 20             	mov    0x20(%ebp),%eax
    3e97:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3e9a:	eb 7f                	jmp    3f1b <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    3e9c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3ea3:	eb 6c                	jmp    3f11 <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    3ea5:	a1 60 47 01 00       	mov    0x14760,%eax
    3eaa:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    3eae:	c1 e2 04             	shl    $0x4,%edx
    3eb1:	89 d1                	mov    %edx,%ecx
    3eb3:	8b 55 20             	mov    0x20(%ebp),%edx
    3eb6:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3eb9:	29 d3                	sub    %edx,%ebx
    3ebb:	89 da                	mov    %ebx,%edx
    3ebd:	01 ca                	add    %ecx,%edx
    3ebf:	01 d0                	add    %edx,%eax
    3ec1:	0f b6 00             	movzbl (%eax),%eax
    3ec4:	0f b6 d0             	movzbl %al,%edx
    3ec7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3eca:	89 c1                	mov    %eax,%ecx
    3ecc:	d3 e2                	shl    %cl,%edx
    3ece:	89 d0                	mov    %edx,%eax
    3ed0:	25 80 00 00 00       	and    $0x80,%eax
    3ed5:	85 c0                	test   %eax,%eax
    3ed7:	74 34                	je     3f0d <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    3ed9:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    3edd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3ee0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3ee3:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3ee6:	01 d8                	add    %ebx,%eax
    3ee8:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3eec:	89 54 24 10          	mov    %edx,0x10(%esp)
    3ef0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3ef4:	8b 45 08             	mov    0x8(%ebp),%eax
    3ef7:	89 04 24             	mov    %eax,(%esp)
    3efa:	8b 45 0c             	mov    0xc(%ebp),%eax
    3efd:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f01:	8b 45 10             	mov    0x10(%ebp),%eax
    3f04:	89 44 24 08          	mov    %eax,0x8(%esp)
    3f08:	e8 ed fb ff ff       	call   3afa <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    3f0d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3f11:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    3f15:	7e 8e                	jle    3ea5 <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    3f17:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3f1b:	8b 45 20             	mov    0x20(%ebp),%eax
    3f1e:	83 c0 10             	add    $0x10,%eax
    3f21:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3f24:	0f 8f 72 ff ff ff    	jg     3e9c <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    3f2a:	83 c4 30             	add    $0x30,%esp
    3f2d:	5b                   	pop    %ebx
    3f2e:	5d                   	pop    %ebp
    3f2f:	c3                   	ret    

00003f30 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    3f30:	55                   	push   %ebp
    3f31:	89 e5                	mov    %esp,%ebp
    3f33:	53                   	push   %ebx
    3f34:	83 ec 34             	sub    $0x34,%esp
    3f37:	8b 55 14             	mov    0x14(%ebp),%edx
    3f3a:	8b 45 18             	mov    0x18(%ebp),%eax
    3f3d:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    3f41:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    3f45:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    3f49:	0f b6 c0             	movzbl %al,%eax
    3f4c:	3d a0 00 00 00       	cmp    $0xa0,%eax
    3f51:	0f 8e 40 01 00 00    	jle    4097 <put_gbk+0x167>
    3f57:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    3f5b:	66 c1 f8 08          	sar    $0x8,%ax
    3f5f:	98                   	cwtl   
    3f60:	0f b6 c0             	movzbl %al,%eax
    3f63:	3d a0 00 00 00       	cmp    $0xa0,%eax
    3f68:	0f 8e 29 01 00 00    	jle    4097 <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    3f6e:	a1 64 47 01 00       	mov    0x14764,%eax
    3f73:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    3f76:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    3f7a:	0f b6 c0             	movzbl %al,%eax
    3f7d:	2d a1 00 00 00       	sub    $0xa1,%eax
    3f82:	6b c0 5e             	imul   $0x5e,%eax,%eax
    3f85:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    3f89:	66 c1 fa 08          	sar    $0x8,%dx
    3f8d:	0f bf d2             	movswl %dx,%edx
    3f90:	0f b6 d2             	movzbl %dl,%edx
    3f93:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    3f99:	01 d0                	add    %edx,%eax
    3f9b:	c1 e0 05             	shl    $0x5,%eax
    3f9e:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    3fa1:	8b 45 20             	mov    0x20(%ebp),%eax
    3fa4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3fa7:	e9 da 00 00 00       	jmp    4086 <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    3fac:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3fb3:	eb 58                	jmp    400d <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    3fb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3fb8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3fbb:	01 d0                	add    %edx,%eax
    3fbd:	0f b6 00             	movzbl (%eax),%eax
    3fc0:	0f b6 d0             	movzbl %al,%edx
    3fc3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fc6:	89 c1                	mov    %eax,%ecx
    3fc8:	d3 e2                	shl    %cl,%edx
    3fca:	89 d0                	mov    %edx,%eax
    3fcc:	25 80 00 00 00       	and    $0x80,%eax
    3fd1:	85 c0                	test   %eax,%eax
    3fd3:	74 34                	je     4009 <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    3fd5:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    3fd9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3fdc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fdf:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3fe2:	01 d8                	add    %ebx,%eax
    3fe4:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3fe8:	89 54 24 10          	mov    %edx,0x10(%esp)
    3fec:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3ff0:	8b 45 08             	mov    0x8(%ebp),%eax
    3ff3:	89 04 24             	mov    %eax,(%esp)
    3ff6:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ff9:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ffd:	8b 45 10             	mov    0x10(%ebp),%eax
    4000:	89 44 24 08          	mov    %eax,0x8(%esp)
    4004:	e8 f1 fa ff ff       	call   3afa <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    4009:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    400d:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    4011:	7e a2                	jle    3fb5 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    4013:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    4017:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    401e:	eb 58                	jmp    4078 <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    4020:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4023:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4026:	01 d0                	add    %edx,%eax
    4028:	0f b6 00             	movzbl (%eax),%eax
    402b:	0f b6 d0             	movzbl %al,%edx
    402e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4031:	89 c1                	mov    %eax,%ecx
    4033:	d3 e2                	shl    %cl,%edx
    4035:	89 d0                	mov    %edx,%eax
    4037:	25 80 00 00 00       	and    $0x80,%eax
    403c:	85 c0                	test   %eax,%eax
    403e:	74 34                	je     4074 <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    4040:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    4044:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4047:	8b 45 f8             	mov    -0x8(%ebp),%eax
    404a:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    404d:	01 d8                	add    %ebx,%eax
    404f:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    4053:	89 54 24 10          	mov    %edx,0x10(%esp)
    4057:	89 44 24 0c          	mov    %eax,0xc(%esp)
    405b:	8b 45 08             	mov    0x8(%ebp),%eax
    405e:	89 04 24             	mov    %eax,(%esp)
    4061:	8b 45 0c             	mov    0xc(%ebp),%eax
    4064:	89 44 24 04          	mov    %eax,0x4(%esp)
    4068:	8b 45 10             	mov    0x10(%ebp),%eax
    406b:	89 44 24 08          	mov    %eax,0x8(%esp)
    406f:	e8 86 fa ff ff       	call   3afa <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    4074:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    4078:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    407c:	7e a2                	jle    4020 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    407e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    4082:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4086:	8b 45 20             	mov    0x20(%ebp),%eax
    4089:	83 c0 10             	add    $0x10,%eax
    408c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    408f:	0f 8f 17 ff ff ff    	jg     3fac <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    4095:	eb 7b                	jmp    4112 <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    4097:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    409b:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    409f:	0f b6 c0             	movzbl %al,%eax
    40a2:	8b 4d 20             	mov    0x20(%ebp),%ecx
    40a5:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    40a9:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    40ac:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    40b0:	89 54 24 10          	mov    %edx,0x10(%esp)
    40b4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    40b8:	8b 45 08             	mov    0x8(%ebp),%eax
    40bb:	89 04 24             	mov    %eax,(%esp)
    40be:	8b 45 0c             	mov    0xc(%ebp),%eax
    40c1:	89 44 24 04          	mov    %eax,0x4(%esp)
    40c5:	8b 45 10             	mov    0x10(%ebp),%eax
    40c8:	89 44 24 08          	mov    %eax,0x8(%esp)
    40cc:	e8 af fd ff ff       	call   3e80 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    40d1:	8b 45 1c             	mov    0x1c(%ebp),%eax
    40d4:	8d 58 08             	lea    0x8(%eax),%ebx
    40d7:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    40db:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    40df:	66 c1 f8 08          	sar    $0x8,%ax
    40e3:	0f b6 c0             	movzbl %al,%eax
    40e6:	8b 4d 20             	mov    0x20(%ebp),%ecx
    40e9:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    40ed:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    40f1:	89 54 24 10          	mov    %edx,0x10(%esp)
    40f5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    40f9:	8b 45 08             	mov    0x8(%ebp),%eax
    40fc:	89 04 24             	mov    %eax,(%esp)
    40ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    4102:	89 44 24 04          	mov    %eax,0x4(%esp)
    4106:	8b 45 10             	mov    0x10(%ebp),%eax
    4109:	89 44 24 08          	mov    %eax,0x8(%esp)
    410d:	e8 6e fd ff ff       	call   3e80 <put_ascii>
	}
}
    4112:	83 c4 34             	add    $0x34,%esp
    4115:	5b                   	pop    %ebx
    4116:	5d                   	pop    %ebp
    4117:	c3                   	ret    

00004118 <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    4118:	55                   	push   %ebp
    4119:	89 e5                	mov    %esp,%ebp
    411b:	83 ec 38             	sub    $0x38,%esp
    411e:	8b 45 18             	mov    0x18(%ebp),%eax
    4121:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    4125:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    412c:	8b 45 14             	mov    0x14(%ebp),%eax
    412f:	89 04 24             	mov    %eax,(%esp)
    4132:	e8 cf 15 00 00       	call   5706 <strlen>
    4137:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    413a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4141:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4144:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4147:	eb 49                	jmp    4192 <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    4149:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    414d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    4150:	8b 45 14             	mov    0x14(%ebp),%eax
    4153:	01 c8                	add    %ecx,%eax
    4155:	0f b6 00             	movzbl (%eax),%eax
    4158:	0f b6 c0             	movzbl %al,%eax
    415b:	8b 4d 20             	mov    0x20(%ebp),%ecx
    415e:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4162:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    4165:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    4169:	89 54 24 10          	mov    %edx,0x10(%esp)
    416d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4171:	8b 45 08             	mov    0x8(%ebp),%eax
    4174:	89 04 24             	mov    %eax,(%esp)
    4177:	8b 45 0c             	mov    0xc(%ebp),%eax
    417a:	89 44 24 04          	mov    %eax,0x4(%esp)
    417e:	8b 45 10             	mov    0x10(%ebp),%eax
    4181:	89 44 24 08          	mov    %eax,0x8(%esp)
    4185:	e8 f6 fc ff ff       	call   3e80 <put_ascii>
			xTmp += 8;
    418a:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    418e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    4192:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4195:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4198:	72 af                	jb     4149 <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    419a:	c9                   	leave  
    419b:	c3                   	ret    

0000419c <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    419c:	55                   	push   %ebp
    419d:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    419f:	8b 45 10             	mov    0x10(%ebp),%eax
    41a2:	8d 50 07             	lea    0x7(%eax),%edx
    41a5:	85 c0                	test   %eax,%eax
    41a7:	0f 48 c2             	cmovs  %edx,%eax
    41aa:	c1 f8 03             	sar    $0x3,%eax
    41ad:	89 c2                	mov    %eax,%edx
    41af:	8b 45 0c             	mov    0xc(%ebp),%eax
    41b2:	8d 48 03             	lea    0x3(%eax),%ecx
    41b5:	85 c0                	test   %eax,%eax
    41b7:	0f 48 c1             	cmovs  %ecx,%eax
    41ba:	c1 f8 02             	sar    $0x2,%eax
    41bd:	c1 e0 05             	shl    $0x5,%eax
    41c0:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    41c3:	8b 45 08             	mov    0x8(%ebp),%eax
    41c6:	8d 50 07             	lea    0x7(%eax),%edx
    41c9:	85 c0                	test   %eax,%eax
    41cb:	0f 48 c2             	cmovs  %edx,%eax
    41ce:	c1 f8 03             	sar    $0x3,%eax
    41d1:	c1 e0 0b             	shl    $0xb,%eax
    41d4:	01 c8                	add    %ecx,%eax
}
    41d6:	5d                   	pop    %ebp
    41d7:	c3                   	ret    

000041d8 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    41d8:	55                   	push   %ebp
    41d9:	89 e5                	mov    %esp,%ebp
    41db:	53                   	push   %ebx
    41dc:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    41df:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    41e6:	e9 b1 00 00 00       	jmp    429c <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    41eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    41f2:	e9 95 00 00 00       	jmp    428c <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    41f7:	8b 55 14             	mov    0x14(%ebp),%edx
    41fa:	8b 45 18             	mov    0x18(%ebp),%eax
    41fd:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    4201:	89 c1                	mov    %eax,%ecx
    4203:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4206:	01 c8                	add    %ecx,%eax
    4208:	c1 e0 02             	shl    $0x2,%eax
    420b:	01 d0                	add    %edx,%eax
    420d:	8b 00                	mov    (%eax),%eax
    420f:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    4212:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    4216:	3c 01                	cmp    $0x1,%al
    4218:	75 02                	jne    421c <draw_picture+0x44>
    421a:	eb 6c                	jmp    4288 <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    421c:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    4220:	0f b6 c8             	movzbl %al,%ecx
    4223:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4227:	0f b6 d0             	movzbl %al,%edx
    422a:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    422e:	0f b6 c0             	movzbl %al,%eax
    4231:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    4235:	89 54 24 04          	mov    %edx,0x4(%esp)
    4239:	89 04 24             	mov    %eax,(%esp)
    423c:	e8 5b ff ff ff       	call   419c <_RGB16BIT565>
    4241:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    4245:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    4249:	8b 45 1c             	mov    0x1c(%ebp),%eax
    424c:	83 e8 01             	sub    $0x1,%eax
    424f:	2b 45 f8             	sub    -0x8(%ebp),%eax
    4252:	89 c2                	mov    %eax,%edx
    4254:	8b 45 24             	mov    0x24(%ebp),%eax
    4257:	01 d0                	add    %edx,%eax
    4259:	89 c2                	mov    %eax,%edx
    425b:	8b 45 20             	mov    0x20(%ebp),%eax
    425e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    4261:	01 d8                	add    %ebx,%eax
    4263:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    4267:	89 54 24 10          	mov    %edx,0x10(%esp)
    426b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    426f:	8b 45 08             	mov    0x8(%ebp),%eax
    4272:	89 04 24             	mov    %eax,(%esp)
    4275:	8b 45 0c             	mov    0xc(%ebp),%eax
    4278:	89 44 24 04          	mov    %eax,0x4(%esp)
    427c:	8b 45 10             	mov    0x10(%ebp),%eax
    427f:	89 44 24 08          	mov    %eax,0x8(%esp)
    4283:	e8 72 f8 ff ff       	call   3afa <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    4288:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    428c:	8b 45 18             	mov    0x18(%ebp),%eax
    428f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4292:	0f 8f 5f ff ff ff    	jg     41f7 <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    4298:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    429c:	8b 45 1c             	mov    0x1c(%ebp),%eax
    429f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    42a2:	0f 8f 43 ff ff ff    	jg     41eb <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    42a8:	83 c4 28             	add    $0x28,%esp
    42ab:	5b                   	pop    %ebx
    42ac:	5d                   	pop    %ebp
    42ad:	c3                   	ret    

000042ae <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    42ae:	55                   	push   %ebp
    42af:	89 e5                	mov    %esp,%ebp
    42b1:	83 ec 3c             	sub    $0x3c,%esp
    42b4:	8b 45 24             	mov    0x24(%ebp),%eax
    42b7:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    42bb:	8b 45 14             	mov    0x14(%ebp),%eax
    42be:	8b 55 1c             	mov    0x1c(%ebp),%edx
    42c1:	29 c2                	sub    %eax,%edx
    42c3:	89 d0                	mov    %edx,%eax
    42c5:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    42c8:	8b 45 18             	mov    0x18(%ebp),%eax
    42cb:	8b 55 20             	mov    0x20(%ebp),%edx
    42ce:	29 c2                	sub    %eax,%edx
    42d0:	89 d0                	mov    %edx,%eax
    42d2:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    42d5:	8b 45 14             	mov    0x14(%ebp),%eax
    42d8:	c1 e0 0a             	shl    $0xa,%eax
    42db:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    42de:	8b 45 18             	mov    0x18(%ebp),%eax
    42e1:	c1 e0 0a             	shl    $0xa,%eax
    42e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    42e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42ea:	c1 f8 1f             	sar    $0x1f,%eax
    42ed:	31 45 fc             	xor    %eax,-0x4(%ebp)
    42f0:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    42f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42f6:	c1 f8 1f             	sar    $0x1f,%eax
    42f9:	31 45 f8             	xor    %eax,-0x8(%ebp)
    42fc:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    42ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4302:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4305:	7c 57                	jl     435e <draw_line+0xb0>
		len = dx + 1;
    4307:	8b 45 fc             	mov    -0x4(%ebp),%eax
    430a:	83 c0 01             	add    $0x1,%eax
    430d:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    4310:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4313:	3b 45 14             	cmp    0x14(%ebp),%eax
    4316:	7e 07                	jle    431f <draw_line+0x71>
    4318:	b8 00 04 00 00       	mov    $0x400,%eax
    431d:	eb 05                	jmp    4324 <draw_line+0x76>
    431f:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    4324:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    4327:	8b 45 20             	mov    0x20(%ebp),%eax
    432a:	3b 45 18             	cmp    0x18(%ebp),%eax
    432d:	7c 16                	jl     4345 <draw_line+0x97>
    432f:	8b 45 18             	mov    0x18(%ebp),%eax
    4332:	8b 55 20             	mov    0x20(%ebp),%edx
    4335:	29 c2                	sub    %eax,%edx
    4337:	89 d0                	mov    %edx,%eax
    4339:	83 c0 01             	add    $0x1,%eax
    433c:	c1 e0 0a             	shl    $0xa,%eax
    433f:	99                   	cltd   
    4340:	f7 7d ec             	idivl  -0x14(%ebp)
    4343:	eb 14                	jmp    4359 <draw_line+0xab>
    4345:	8b 45 18             	mov    0x18(%ebp),%eax
    4348:	8b 55 20             	mov    0x20(%ebp),%edx
    434b:	29 c2                	sub    %eax,%edx
    434d:	89 d0                	mov    %edx,%eax
    434f:	83 e8 01             	sub    $0x1,%eax
    4352:	c1 e0 0a             	shl    $0xa,%eax
    4355:	99                   	cltd   
    4356:	f7 7d ec             	idivl  -0x14(%ebp)
    4359:	89 45 f8             	mov    %eax,-0x8(%ebp)
    435c:	eb 55                	jmp    43b3 <draw_line+0x105>
	}
	else {
		len = dy + 1;
    435e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4361:	83 c0 01             	add    $0x1,%eax
    4364:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    4367:	8b 45 20             	mov    0x20(%ebp),%eax
    436a:	3b 45 18             	cmp    0x18(%ebp),%eax
    436d:	7e 07                	jle    4376 <draw_line+0xc8>
    436f:	b8 00 04 00 00       	mov    $0x400,%eax
    4374:	eb 05                	jmp    437b <draw_line+0xcd>
    4376:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    437b:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    437e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4381:	3b 45 14             	cmp    0x14(%ebp),%eax
    4384:	7c 16                	jl     439c <draw_line+0xee>
    4386:	8b 45 14             	mov    0x14(%ebp),%eax
    4389:	8b 55 1c             	mov    0x1c(%ebp),%edx
    438c:	29 c2                	sub    %eax,%edx
    438e:	89 d0                	mov    %edx,%eax
    4390:	83 c0 01             	add    $0x1,%eax
    4393:	c1 e0 0a             	shl    $0xa,%eax
    4396:	99                   	cltd   
    4397:	f7 7d ec             	idivl  -0x14(%ebp)
    439a:	eb 14                	jmp    43b0 <draw_line+0x102>
    439c:	8b 45 14             	mov    0x14(%ebp),%eax
    439f:	8b 55 1c             	mov    0x1c(%ebp),%edx
    43a2:	29 c2                	sub    %eax,%edx
    43a4:	89 d0                	mov    %edx,%eax
    43a6:	83 e8 01             	sub    $0x1,%eax
    43a9:	c1 e0 0a             	shl    $0xa,%eax
    43ac:	99                   	cltd   
    43ad:	f7 7d ec             	idivl  -0x14(%ebp)
    43b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    43b3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    43ba:	eb 47                	jmp    4403 <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    43bc:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    43c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    43c3:	c1 f8 0a             	sar    $0xa,%eax
    43c6:	89 c2                	mov    %eax,%edx
    43c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43cb:	c1 f8 0a             	sar    $0xa,%eax
    43ce:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    43d2:	89 54 24 10          	mov    %edx,0x10(%esp)
    43d6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    43da:	8b 45 08             	mov    0x8(%ebp),%eax
    43dd:	89 04 24             	mov    %eax,(%esp)
    43e0:	8b 45 0c             	mov    0xc(%ebp),%eax
    43e3:	89 44 24 04          	mov    %eax,0x4(%esp)
    43e7:	8b 45 10             	mov    0x10(%ebp),%eax
    43ea:	89 44 24 08          	mov    %eax,0x8(%esp)
    43ee:	e8 07 f7 ff ff       	call   3afa <draw_point>
		y += dy;
    43f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    43f6:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    43f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43fc:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    43ff:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    4403:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4406:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4409:	7c b1                	jl     43bc <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    440b:	c9                   	leave  
    440c:	c3                   	ret    

0000440d <draw_window>:

void
draw_window(Context c, char *title)
{
    440d:	55                   	push   %ebp
    440e:	89 e5                	mov    %esp,%ebp
    4410:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    4413:	8b 45 0c             	mov    0xc(%ebp),%eax
    4416:	83 e8 01             	sub    $0x1,%eax
    4419:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    4420:	00 
    4421:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    4428:	00 
    4429:	89 44 24 14          	mov    %eax,0x14(%esp)
    442d:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    4434:	00 
    4435:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    443c:	00 
    443d:	8b 45 08             	mov    0x8(%ebp),%eax
    4440:	89 04 24             	mov    %eax,(%esp)
    4443:	8b 45 0c             	mov    0xc(%ebp),%eax
    4446:	89 44 24 04          	mov    %eax,0x4(%esp)
    444a:	8b 45 10             	mov    0x10(%ebp),%eax
    444d:	89 44 24 08          	mov    %eax,0x8(%esp)
    4451:	e8 58 fe ff ff       	call   42ae <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    4456:	8b 45 10             	mov    0x10(%ebp),%eax
    4459:	8d 48 ff             	lea    -0x1(%eax),%ecx
    445c:	8b 45 0c             	mov    0xc(%ebp),%eax
    445f:	8d 50 ff             	lea    -0x1(%eax),%edx
    4462:	8b 45 0c             	mov    0xc(%ebp),%eax
    4465:	83 e8 01             	sub    $0x1,%eax
    4468:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    446f:	00 
    4470:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4474:	89 54 24 14          	mov    %edx,0x14(%esp)
    4478:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    447f:	00 
    4480:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4484:	8b 45 08             	mov    0x8(%ebp),%eax
    4487:	89 04 24             	mov    %eax,(%esp)
    448a:	8b 45 0c             	mov    0xc(%ebp),%eax
    448d:	89 44 24 04          	mov    %eax,0x4(%esp)
    4491:	8b 45 10             	mov    0x10(%ebp),%eax
    4494:	89 44 24 08          	mov    %eax,0x8(%esp)
    4498:	e8 11 fe ff ff       	call   42ae <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    449d:	8b 45 10             	mov    0x10(%ebp),%eax
    44a0:	8d 48 ff             	lea    -0x1(%eax),%ecx
    44a3:	8b 45 10             	mov    0x10(%ebp),%eax
    44a6:	8d 50 ff             	lea    -0x1(%eax),%edx
    44a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    44ac:	83 e8 01             	sub    $0x1,%eax
    44af:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    44b6:	00 
    44b7:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    44bb:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    44c2:	00 
    44c3:	89 54 24 10          	mov    %edx,0x10(%esp)
    44c7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    44cb:	8b 45 08             	mov    0x8(%ebp),%eax
    44ce:	89 04 24             	mov    %eax,(%esp)
    44d1:	8b 45 0c             	mov    0xc(%ebp),%eax
    44d4:	89 44 24 04          	mov    %eax,0x4(%esp)
    44d8:	8b 45 10             	mov    0x10(%ebp),%eax
    44db:	89 44 24 08          	mov    %eax,0x8(%esp)
    44df:	e8 ca fd ff ff       	call   42ae <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    44e4:	8b 45 10             	mov    0x10(%ebp),%eax
    44e7:	83 e8 01             	sub    $0x1,%eax
    44ea:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    44f1:	00 
    44f2:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    44f9:	00 
    44fa:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    4501:	00 
    4502:	89 44 24 10          	mov    %eax,0x10(%esp)
    4506:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    450d:	00 
    450e:	8b 45 08             	mov    0x8(%ebp),%eax
    4511:	89 04 24             	mov    %eax,(%esp)
    4514:	8b 45 0c             	mov    0xc(%ebp),%eax
    4517:	89 44 24 04          	mov    %eax,0x4(%esp)
    451b:	8b 45 10             	mov    0x10(%ebp),%eax
    451e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4522:	e8 87 fd ff ff       	call   42ae <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    4527:	8b 45 0c             	mov    0xc(%ebp),%eax
    452a:	83 e8 02             	sub    $0x2,%eax
    452d:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    4534:	00 
    4535:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    453c:	00 
    453d:	89 44 24 14          	mov    %eax,0x14(%esp)
    4541:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    4548:	00 
    4549:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    4550:	00 
    4551:	8b 45 08             	mov    0x8(%ebp),%eax
    4554:	89 04 24             	mov    %eax,(%esp)
    4557:	8b 45 0c             	mov    0xc(%ebp),%eax
    455a:	89 44 24 04          	mov    %eax,0x4(%esp)
    455e:	8b 45 10             	mov    0x10(%ebp),%eax
    4561:	89 44 24 08          	mov    %eax,0x8(%esp)
    4565:	e8 cf f5 ff ff       	call   3b39 <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    456a:	8b 45 0c             	mov    0xc(%ebp),%eax
    456d:	83 e8 02             	sub    $0x2,%eax
    4570:	89 c2                	mov    %eax,%edx
    4572:	8b 45 10             	mov    0x10(%ebp),%eax
    4575:	83 e8 15             	sub    $0x15,%eax
    4578:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    457f:	00 
    4580:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    4587:	00 
    4588:	89 54 24 14          	mov    %edx,0x14(%esp)
    458c:	89 44 24 10          	mov    %eax,0x10(%esp)
    4590:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    4597:	00 
    4598:	8b 45 08             	mov    0x8(%ebp),%eax
    459b:	89 04 24             	mov    %eax,(%esp)
    459e:	8b 45 0c             	mov    0xc(%ebp),%eax
    45a1:	89 44 24 04          	mov    %eax,0x4(%esp)
    45a5:	8b 45 10             	mov    0x10(%ebp),%eax
    45a8:	89 44 24 08          	mov    %eax,0x8(%esp)
    45ac:	e8 88 f5 ff ff       	call   3b39 <fill_rect>

  loadBitmap(&pic, "close.bmp");
    45b1:	c7 44 24 04 cb c5 00 	movl   $0xc5cb,0x4(%esp)
    45b8:	00 
    45b9:	8d 45 ec             	lea    -0x14(%ebp),%eax
    45bc:	89 04 24             	mov    %eax,(%esp)
    45bf:	e8 44 01 00 00       	call   4708 <loadBitmap>
  draw_picture(c, pic, 3, 3);
    45c4:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    45cb:	00 
    45cc:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    45d3:	00 
    45d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    45d7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    45db:	8b 45 f0             	mov    -0x10(%ebp),%eax
    45de:	89 44 24 10          	mov    %eax,0x10(%esp)
    45e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    45e5:	89 44 24 14          	mov    %eax,0x14(%esp)
    45e9:	8b 45 08             	mov    0x8(%ebp),%eax
    45ec:	89 04 24             	mov    %eax,(%esp)
    45ef:	8b 45 0c             	mov    0xc(%ebp),%eax
    45f2:	89 44 24 04          	mov    %eax,0x4(%esp)
    45f6:	8b 45 10             	mov    0x10(%ebp),%eax
    45f9:	89 44 24 08          	mov    %eax,0x8(%esp)
    45fd:	e8 d6 fb ff ff       	call   41d8 <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    4602:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    4609:	00 
    460a:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    4611:	00 
    4612:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    4619:	00 
    461a:	8b 45 14             	mov    0x14(%ebp),%eax
    461d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4621:	8b 45 08             	mov    0x8(%ebp),%eax
    4624:	89 04 24             	mov    %eax,(%esp)
    4627:	8b 45 0c             	mov    0xc(%ebp),%eax
    462a:	89 44 24 04          	mov    %eax,0x4(%esp)
    462e:	8b 45 10             	mov    0x10(%ebp),%eax
    4631:	89 44 24 08          	mov    %eax,0x8(%esp)
    4635:	e8 de fa ff ff       	call   4118 <puts_str>
  freepic(&pic);
    463a:	8d 45 ec             	lea    -0x14(%ebp),%eax
    463d:	89 04 24             	mov    %eax,(%esp)
    4640:	e8 6f 06 00 00       	call   4cb4 <freepic>
}
    4645:	c9                   	leave  
    4646:	c3                   	ret    

00004647 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    4647:	55                   	push   %ebp
    4648:	89 e5                	mov    %esp,%ebp
    464a:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    464d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4654:	eb 29                	jmp    467f <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    4656:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4659:	6b d0 34             	imul   $0x34,%eax,%edx
    465c:	8b 45 08             	mov    0x8(%ebp),%eax
    465f:	01 d0                	add    %edx,%eax
    4661:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4664:	6b ca 34             	imul   $0x34,%edx,%ecx
    4667:	8b 55 08             	mov    0x8(%ebp),%edx
    466a:	01 ca                	add    %ecx,%edx
    466c:	83 c2 28             	add    $0x28,%edx
    466f:	89 44 24 04          	mov    %eax,0x4(%esp)
    4673:	89 14 24             	mov    %edx,(%esp)
    4676:	e8 8d 00 00 00       	call   4708 <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    467b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    467f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4682:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4685:	7c cf                	jl     4656 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    4687:	c9                   	leave  
    4688:	c3                   	ret    

00004689 <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    4689:	55                   	push   %ebp
    468a:	89 e5                	mov    %esp,%ebp
    468c:	53                   	push   %ebx
    468d:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    4690:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    4697:	eb 61                	jmp    46fa <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    4699:	8b 45 f8             	mov    -0x8(%ebp),%eax
    469c:	6b d0 34             	imul   $0x34,%eax,%edx
    469f:	8b 45 14             	mov    0x14(%ebp),%eax
    46a2:	01 d0                	add    %edx,%eax
    46a4:	8b 48 24             	mov    0x24(%eax),%ecx
    46a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    46aa:	6b d0 34             	imul   $0x34,%eax,%edx
    46ad:	8b 45 14             	mov    0x14(%ebp),%eax
    46b0:	01 d0                	add    %edx,%eax
    46b2:	8b 50 20             	mov    0x20(%eax),%edx
    46b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    46b8:	6b d8 34             	imul   $0x34,%eax,%ebx
    46bb:	8b 45 14             	mov    0x14(%ebp),%eax
    46be:	01 d8                	add    %ebx,%eax
    46c0:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    46c4:	89 54 24 18          	mov    %edx,0x18(%esp)
    46c8:	8b 50 28             	mov    0x28(%eax),%edx
    46cb:	89 54 24 0c          	mov    %edx,0xc(%esp)
    46cf:	8b 50 2c             	mov    0x2c(%eax),%edx
    46d2:	89 54 24 10          	mov    %edx,0x10(%esp)
    46d6:	8b 40 30             	mov    0x30(%eax),%eax
    46d9:	89 44 24 14          	mov    %eax,0x14(%esp)
    46dd:	8b 45 08             	mov    0x8(%ebp),%eax
    46e0:	89 04 24             	mov    %eax,(%esp)
    46e3:	8b 45 0c             	mov    0xc(%ebp),%eax
    46e6:	89 44 24 04          	mov    %eax,0x4(%esp)
    46ea:	8b 45 10             	mov    0x10(%ebp),%eax
    46ed:	89 44 24 08          	mov    %eax,0x8(%esp)
    46f1:	e8 e2 fa ff ff       	call   41d8 <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    46f6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    46fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    46fd:	3b 45 18             	cmp    0x18(%ebp),%eax
    4700:	7c 97                	jl     4699 <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    4702:	83 c4 30             	add    $0x30,%esp
    4705:	5b                   	pop    %ebx
    4706:	5d                   	pop    %ebp
    4707:	c3                   	ret    

00004708 <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    4708:	55                   	push   %ebp
    4709:	89 e5                	mov    %esp,%ebp
    470b:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    4711:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    4718:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    471f:	00 
    4720:	8b 45 0c             	mov    0xc(%ebp),%eax
    4723:	89 04 24             	mov    %eax,(%esp)
    4726:	e8 ef 11 00 00       	call   591a <open>
    472b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    472e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4732:	79 20                	jns    4754 <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    4734:	8b 45 0c             	mov    0xc(%ebp),%eax
    4737:	89 44 24 08          	mov    %eax,0x8(%esp)
    473b:	c7 44 24 04 d8 c5 00 	movl   $0xc5d8,0x4(%esp)
    4742:	00 
    4743:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    474a:	e8 73 13 00 00       	call   5ac2 <printf>
		return;
    474f:	e9 ef 02 00 00       	jmp    4a43 <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    4754:	8b 45 0c             	mov    0xc(%ebp),%eax
    4757:	89 44 24 08          	mov    %eax,0x8(%esp)
    475b:	c7 44 24 04 e8 c5 00 	movl   $0xc5e8,0x4(%esp)
    4762:	00 
    4763:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    476a:	e8 53 13 00 00       	call   5ac2 <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    476f:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    4776:	e8 33 16 00 00       	call   5dae <malloc>
    477b:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    477e:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    4785:	00 
    4786:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4789:	89 44 24 04          	mov    %eax,0x4(%esp)
    478d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4790:	89 04 24             	mov    %eax,(%esp)
    4793:	e8 5a 11 00 00       	call   58f2 <read>
    4798:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    479b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    479e:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    47a1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47a4:	0f b7 00             	movzwl (%eax),%eax
    47a7:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    47ab:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    47af:	66 3d 42 4d          	cmp    $0x4d42,%ax
    47b3:	74 19                	je     47ce <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    47b5:	c7 44 24 04 fc c5 00 	movl   $0xc5fc,0x4(%esp)
    47bc:	00 
    47bd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    47c4:	e8 f9 12 00 00       	call   5ac2 <printf>
		return;
    47c9:	e9 75 02 00 00       	jmp    4a43 <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    47ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    47d1:	83 c0 02             	add    $0x2,%eax
    47d4:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    47d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    47da:	8b 00                	mov    (%eax),%eax
    47dc:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    47df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    47e2:	83 c0 06             	add    $0x6,%eax
    47e5:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    47e8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47eb:	0f b7 00             	movzwl (%eax),%eax
    47ee:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    47f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    47f5:	83 c0 08             	add    $0x8,%eax
    47f8:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    47fb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47fe:	0f b7 00             	movzwl (%eax),%eax
    4801:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    4805:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4808:	83 c0 0a             	add    $0xa,%eax
    480b:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    480e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4811:	8b 00                	mov    (%eax),%eax
    4813:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    4816:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    481d:	00 
    481e:	8d 45 84             	lea    -0x7c(%ebp),%eax
    4821:	89 44 24 04          	mov    %eax,0x4(%esp)
    4825:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4828:	89 04 24             	mov    %eax,(%esp)
    482b:	e8 c2 10 00 00       	call   58f2 <read>
	width = bitInfoHead.biWidth;
    4830:	8b 45 88             	mov    -0x78(%ebp),%eax
    4833:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    4836:	8b 45 8c             	mov    -0x74(%ebp),%eax
    4839:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    483c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    483f:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    4843:	c1 e0 02             	shl    $0x2,%eax
    4846:	89 44 24 10          	mov    %eax,0x10(%esp)
    484a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    484d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4851:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4854:	89 44 24 08          	mov    %eax,0x8(%esp)
    4858:	c7 44 24 04 14 c6 00 	movl   $0xc614,0x4(%esp)
    485f:	00 
    4860:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4867:	e8 56 12 00 00       	call   5ac2 <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    486c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    4870:	75 14                	jne    4886 <loadBitmap+0x17e>
		printf(0, "0");
    4872:	c7 44 24 04 39 c6 00 	movl   $0xc639,0x4(%esp)
    4879:	00 
    487a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4881:	e8 3c 12 00 00       	call   5ac2 <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    4886:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    488a:	0f b7 c0             	movzwl %ax,%eax
    488d:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    4891:	83 c0 1f             	add    $0x1f,%eax
    4894:	8d 50 1f             	lea    0x1f(%eax),%edx
    4897:	85 c0                	test   %eax,%eax
    4899:	0f 48 c2             	cmovs  %edx,%eax
    489c:	c1 f8 05             	sar    $0x5,%eax
    489f:	c1 e0 02             	shl    $0x2,%eax
    48a2:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    48a5:	8b 45 d0             	mov    -0x30(%ebp),%eax
    48a8:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    48ac:	89 04 24             	mov    %eax,(%esp)
    48af:	e8 fa 14 00 00       	call   5dae <malloc>
    48b4:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    48b7:	8b 55 d0             	mov    -0x30(%ebp),%edx
    48ba:	8b 45 cc             	mov    -0x34(%ebp),%eax
    48bd:	0f af c2             	imul   %edx,%eax
    48c0:	89 44 24 08          	mov    %eax,0x8(%esp)
    48c4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    48cb:	00 
    48cc:	8b 45 c8             	mov    -0x38(%ebp),%eax
    48cf:	89 04 24             	mov    %eax,(%esp)
    48d2:	e8 56 0e 00 00       	call   572d <memset>
	long nData = height * l_width;
    48d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
    48da:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    48de:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    48e1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    48e4:	89 44 24 08          	mov    %eax,0x8(%esp)
    48e8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    48eb:	89 44 24 04          	mov    %eax,0x4(%esp)
    48ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
    48f2:	89 04 24             	mov    %eax,(%esp)
    48f5:	e8 f8 0f 00 00       	call   58f2 <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    48fa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    48fd:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    4901:	c1 e0 02             	shl    $0x2,%eax
    4904:	89 04 24             	mov    %eax,(%esp)
    4907:	e8 a2 14 00 00       	call   5dae <malloc>
    490c:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    490f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4912:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4915:	0f af c2             	imul   %edx,%eax
    4918:	c1 e0 02             	shl    $0x2,%eax
    491b:	89 44 24 08          	mov    %eax,0x8(%esp)
    491f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4926:	00 
    4927:	8b 45 c0             	mov    -0x40(%ebp),%eax
    492a:	89 04 24             	mov    %eax,(%esp)
    492d:	e8 fb 0d 00 00       	call   572d <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    4932:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    4936:	66 83 f8 17          	cmp    $0x17,%ax
    493a:	77 19                	ja     4955 <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    493c:	c7 44 24 04 3c c6 00 	movl   $0xc63c,0x4(%esp)
    4943:	00 
    4944:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    494b:	e8 72 11 00 00       	call   5ac2 <printf>
		return;
    4950:	e9 ee 00 00 00       	jmp    4a43 <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    4955:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    495c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4963:	e9 94 00 00 00       	jmp    49fc <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    4968:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    496f:	eb 7b                	jmp    49ec <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    4971:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4974:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    4978:	89 c1                	mov    %eax,%ecx
    497a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    497d:	89 d0                	mov    %edx,%eax
    497f:	01 c0                	add    %eax,%eax
    4981:	01 d0                	add    %edx,%eax
    4983:	01 c8                	add    %ecx,%eax
    4985:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    4988:	8b 45 ec             	mov    -0x14(%ebp),%eax
    498b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4992:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4995:	01 c2                	add    %eax,%edx
    4997:	8b 45 bc             	mov    -0x44(%ebp),%eax
    499a:	8d 48 02             	lea    0x2(%eax),%ecx
    499d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    49a0:	01 c8                	add    %ecx,%eax
    49a2:	0f b6 00             	movzbl (%eax),%eax
    49a5:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    49a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    49ab:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    49b2:	8b 45 c0             	mov    -0x40(%ebp),%eax
    49b5:	01 c2                	add    %eax,%edx
    49b7:	8b 45 bc             	mov    -0x44(%ebp),%eax
    49ba:	8d 48 01             	lea    0x1(%eax),%ecx
    49bd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    49c0:	01 c8                	add    %ecx,%eax
    49c2:	0f b6 00             	movzbl (%eax),%eax
    49c5:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    49c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    49cb:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    49d2:	8b 45 c0             	mov    -0x40(%ebp),%eax
    49d5:	01 c2                	add    %eax,%edx
    49d7:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    49da:	8b 45 c8             	mov    -0x38(%ebp),%eax
    49dd:	01 c8                	add    %ecx,%eax
    49df:	0f b6 00             	movzbl (%eax),%eax
    49e2:	88 02                	mov    %al,(%edx)
				index++;
    49e4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    49e8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    49ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    49ef:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    49f2:	0f 8c 79 ff ff ff    	jl     4971 <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    49f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    49fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    49ff:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    4a02:	0f 8c 60 ff ff ff    	jl     4968 <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    4a08:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4a0b:	89 04 24             	mov    %eax,(%esp)
    4a0e:	e8 ef 0e 00 00       	call   5902 <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    4a13:	8b 45 08             	mov    0x8(%ebp),%eax
    4a16:	8b 55 c0             	mov    -0x40(%ebp),%edx
    4a19:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    4a1b:	8b 45 08             	mov    0x8(%ebp),%eax
    4a1e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4a21:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    4a24:	8b 45 08             	mov    0x8(%ebp),%eax
    4a27:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4a2a:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    4a2d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4a30:	89 04 24             	mov    %eax,(%esp)
    4a33:	e8 3d 12 00 00       	call   5c75 <free>
	free(BmpFileHeader);
    4a38:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4a3b:	89 04 24             	mov    %eax,(%esp)
    4a3e:	e8 32 12 00 00       	call   5c75 <free>
	//printf("\n");
}
    4a43:	c9                   	leave  
    4a44:	c3                   	ret    

00004a45 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    4a45:	55                   	push   %ebp
    4a46:	89 e5                	mov    %esp,%ebp
    4a48:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    4a4b:	c7 44 24 04 5c c6 00 	movl   $0xc65c,0x4(%esp)
    4a52:	00 
    4a53:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4a5a:	e8 63 10 00 00       	call   5ac2 <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    4a5f:	8b 45 08             	mov    0x8(%ebp),%eax
    4a62:	0f b7 00             	movzwl (%eax),%eax
    4a65:	0f b7 c0             	movzwl %ax,%eax
    4a68:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a6c:	c7 44 24 04 6e c6 00 	movl   $0xc66e,0x4(%esp)
    4a73:	00 
    4a74:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4a7b:	e8 42 10 00 00       	call   5ac2 <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    4a80:	8b 45 08             	mov    0x8(%ebp),%eax
    4a83:	8b 40 04             	mov    0x4(%eax),%eax
    4a86:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a8a:	c7 44 24 04 8c c6 00 	movl   $0xc68c,0x4(%esp)
    4a91:	00 
    4a92:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4a99:	e8 24 10 00 00       	call   5ac2 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    4a9e:	8b 45 08             	mov    0x8(%ebp),%eax
    4aa1:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    4aa5:	0f b7 c0             	movzwl %ax,%eax
    4aa8:	89 44 24 08          	mov    %eax,0x8(%esp)
    4aac:	c7 44 24 04 9d c6 00 	movl   $0xc69d,0x4(%esp)
    4ab3:	00 
    4ab4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4abb:	e8 02 10 00 00       	call   5ac2 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    4ac0:	8b 45 08             	mov    0x8(%ebp),%eax
    4ac3:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    4ac7:	0f b7 c0             	movzwl %ax,%eax
    4aca:	89 44 24 08          	mov    %eax,0x8(%esp)
    4ace:	c7 44 24 04 9d c6 00 	movl   $0xc69d,0x4(%esp)
    4ad5:	00 
    4ad6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4add:	e8 e0 0f 00 00       	call   5ac2 <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    4ae2:	8b 45 08             	mov    0x8(%ebp),%eax
    4ae5:	8b 40 0c             	mov    0xc(%eax),%eax
    4ae8:	89 44 24 08          	mov    %eax,0x8(%esp)
    4aec:	c7 44 24 04 ac c6 00 	movl   $0xc6ac,0x4(%esp)
    4af3:	00 
    4af4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4afb:	e8 c2 0f 00 00       	call   5ac2 <printf>
}
    4b00:	c9                   	leave  
    4b01:	c3                   	ret    

00004b02 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    4b02:	55                   	push   %ebp
    4b03:	89 e5                	mov    %esp,%ebp
    4b05:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    4b08:	c7 44 24 04 d5 c6 00 	movl   $0xc6d5,0x4(%esp)
    4b0f:	00 
    4b10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4b17:	e8 a6 0f 00 00       	call   5ac2 <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    4b1c:	8b 45 08             	mov    0x8(%ebp),%eax
    4b1f:	8b 00                	mov    (%eax),%eax
    4b21:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b25:	c7 44 24 04 e7 c6 00 	movl   $0xc6e7,0x4(%esp)
    4b2c:	00 
    4b2d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4b34:	e8 89 0f 00 00       	call   5ac2 <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    4b39:	8b 45 08             	mov    0x8(%ebp),%eax
    4b3c:	8b 40 04             	mov    0x4(%eax),%eax
    4b3f:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b43:	c7 44 24 04 fe c6 00 	movl   $0xc6fe,0x4(%esp)
    4b4a:	00 
    4b4b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4b52:	e8 6b 0f 00 00       	call   5ac2 <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    4b57:	8b 45 08             	mov    0x8(%ebp),%eax
    4b5a:	8b 40 08             	mov    0x8(%eax),%eax
    4b5d:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b61:	c7 44 24 04 0c c7 00 	movl   $0xc70c,0x4(%esp)
    4b68:	00 
    4b69:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4b70:	e8 4d 0f 00 00       	call   5ac2 <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    4b75:	8b 45 08             	mov    0x8(%ebp),%eax
    4b78:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    4b7c:	0f b7 c0             	movzwl %ax,%eax
    4b7f:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b83:	c7 44 24 04 1a c7 00 	movl   $0xc71a,0x4(%esp)
    4b8a:	00 
    4b8b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4b92:	e8 2b 0f 00 00       	call   5ac2 <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    4b97:	8b 45 08             	mov    0x8(%ebp),%eax
    4b9a:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    4b9e:	0f b7 c0             	movzwl %ax,%eax
    4ba1:	89 44 24 08          	mov    %eax,0x8(%esp)
    4ba5:	c7 44 24 04 30 c7 00 	movl   $0xc730,0x4(%esp)
    4bac:	00 
    4bad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4bb4:	e8 09 0f 00 00       	call   5ac2 <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    4bb9:	8b 45 08             	mov    0x8(%ebp),%eax
    4bbc:	8b 40 10             	mov    0x10(%eax),%eax
    4bbf:	89 44 24 08          	mov    %eax,0x8(%esp)
    4bc3:	c7 44 24 04 51 c7 00 	movl   $0xc751,0x4(%esp)
    4bca:	00 
    4bcb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4bd2:	e8 eb 0e 00 00       	call   5ac2 <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    4bd7:	8b 45 08             	mov    0x8(%ebp),%eax
    4bda:	8b 40 14             	mov    0x14(%eax),%eax
    4bdd:	89 44 24 08          	mov    %eax,0x8(%esp)
    4be1:	c7 44 24 04 64 c7 00 	movl   $0xc764,0x4(%esp)
    4be8:	00 
    4be9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4bf0:	e8 cd 0e 00 00       	call   5ac2 <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    4bf5:	8b 45 08             	mov    0x8(%ebp),%eax
    4bf8:	8b 40 18             	mov    0x18(%eax),%eax
    4bfb:	89 44 24 08          	mov    %eax,0x8(%esp)
    4bff:	c7 44 24 04 98 c7 00 	movl   $0xc798,0x4(%esp)
    4c06:	00 
    4c07:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c0e:	e8 af 0e 00 00       	call   5ac2 <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    4c13:	8b 45 08             	mov    0x8(%ebp),%eax
    4c16:	8b 40 1c             	mov    0x1c(%eax),%eax
    4c19:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c1d:	c7 44 24 04 ad c7 00 	movl   $0xc7ad,0x4(%esp)
    4c24:	00 
    4c25:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c2c:	e8 91 0e 00 00       	call   5ac2 <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    4c31:	8b 45 08             	mov    0x8(%ebp),%eax
    4c34:	8b 40 20             	mov    0x20(%eax),%eax
    4c37:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c3b:	c7 44 24 04 c2 c7 00 	movl   $0xc7c2,0x4(%esp)
    4c42:	00 
    4c43:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c4a:	e8 73 0e 00 00       	call   5ac2 <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    4c4f:	8b 45 08             	mov    0x8(%ebp),%eax
    4c52:	8b 40 24             	mov    0x24(%eax),%eax
    4c55:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c59:	c7 44 24 04 d9 c7 00 	movl   $0xc7d9,0x4(%esp)
    4c60:	00 
    4c61:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c68:	e8 55 0e 00 00       	call   5ac2 <printf>
}
    4c6d:	c9                   	leave  
    4c6e:	c3                   	ret    

00004c6f <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    4c6f:	55                   	push   %ebp
    4c70:	89 e5                	mov    %esp,%ebp
    4c72:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    4c75:	8b 45 08             	mov    0x8(%ebp),%eax
    4c78:	0f b6 00             	movzbl (%eax),%eax
    4c7b:	0f b6 c8             	movzbl %al,%ecx
    4c7e:	8b 45 08             	mov    0x8(%ebp),%eax
    4c81:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4c85:	0f b6 d0             	movzbl %al,%edx
    4c88:	8b 45 08             	mov    0x8(%ebp),%eax
    4c8b:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    4c8f:	0f b6 c0             	movzbl %al,%eax
    4c92:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4c96:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4c9a:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c9e:	c7 44 24 04 ed c7 00 	movl   $0xc7ed,0x4(%esp)
    4ca5:	00 
    4ca6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4cad:	e8 10 0e 00 00       	call   5ac2 <printf>
}
    4cb2:	c9                   	leave  
    4cb3:	c3                   	ret    

00004cb4 <freepic>:

void freepic(PICNODE *pic) {
    4cb4:	55                   	push   %ebp
    4cb5:	89 e5                	mov    %esp,%ebp
    4cb7:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    4cba:	8b 45 08             	mov    0x8(%ebp),%eax
    4cbd:	8b 00                	mov    (%eax),%eax
    4cbf:	89 04 24             	mov    %eax,(%esp)
    4cc2:	e8 ae 0f 00 00       	call   5c75 <free>
}
    4cc7:	c9                   	leave  
    4cc8:	c3                   	ret    

00004cc9 <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    4cc9:	55                   	push   %ebp
    4cca:	89 e5                	mov    %esp,%ebp
    4ccc:	53                   	push   %ebx
    4ccd:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    4cd3:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    4cda:	8d 45 dc             	lea    -0x24(%ebp),%eax
    4cdd:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4ce0:	89 54 24 10          	mov    %edx,0x10(%esp)
    4ce4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4ce7:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4ceb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    4cf2:	00 
    4cf3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4cfa:	00 
    4cfb:	89 04 24             	mov    %eax,(%esp)
    4cfe:	e8 80 02 00 00       	call   4f83 <initRect>
    4d03:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    4d06:	8b 45 08             	mov    0x8(%ebp),%eax
    4d09:	8b 40 04             	mov    0x4(%eax),%eax
    4d0c:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4d0f:	89 c2                	mov    %eax,%edx
    4d11:	8d 45 cc             	lea    -0x34(%ebp),%eax
    4d14:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4d17:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4d1b:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4d1e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4d22:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    4d29:	00 
    4d2a:	89 54 24 04          	mov    %edx,0x4(%esp)
    4d2e:	89 04 24             	mov    %eax,(%esp)
    4d31:	e8 4d 02 00 00       	call   4f83 <initRect>
    4d36:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    4d39:	8b 45 08             	mov    0x8(%ebp),%eax
    4d3c:	8b 40 08             	mov    0x8(%eax),%eax
    4d3f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4d42:	89 c1                	mov    %eax,%ecx
    4d44:	8b 45 08             	mov    0x8(%ebp),%eax
    4d47:	8b 40 04             	mov    0x4(%eax),%eax
    4d4a:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4d4d:	89 c2                	mov    %eax,%edx
    4d4f:	8d 45 bc             	lea    -0x44(%ebp),%eax
    4d52:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    4d55:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    4d59:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    4d5c:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    4d60:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    4d64:	89 54 24 04          	mov    %edx,0x4(%esp)
    4d68:	89 04 24             	mov    %eax,(%esp)
    4d6b:	e8 13 02 00 00       	call   4f83 <initRect>
    4d70:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    4d73:	8b 45 08             	mov    0x8(%ebp),%eax
    4d76:	8b 40 08             	mov    0x8(%eax),%eax
    4d79:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4d7c:	89 c2                	mov    %eax,%edx
    4d7e:	8d 45 ac             	lea    -0x54(%ebp),%eax
    4d81:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4d84:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4d88:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4d8b:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4d8f:	89 54 24 08          	mov    %edx,0x8(%esp)
    4d93:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4d9a:	00 
    4d9b:	89 04 24             	mov    %eax,(%esp)
    4d9e:	e8 e0 01 00 00       	call   4f83 <initRect>
    4da3:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    4da6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4dad:	e9 96 01 00 00       	jmp    4f48 <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    4db2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4db9:	e9 77 01 00 00       	jmp    4f35 <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    4dbe:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4dc1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4dc4:	89 54 24 08          	mov    %edx,0x8(%esp)
    4dc8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4dcb:	89 54 24 04          	mov    %edx,0x4(%esp)
    4dcf:	89 04 24             	mov    %eax,(%esp)
    4dd2:	e8 85 01 00 00       	call   4f5c <initPoint>
    4dd7:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    4dda:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4ddd:	89 44 24 08          	mov    %eax,0x8(%esp)
    4de1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4de4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4de8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4deb:	89 44 24 10          	mov    %eax,0x10(%esp)
    4def:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4df2:	89 44 24 14          	mov    %eax,0x14(%esp)
    4df6:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4df9:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4dfc:	89 04 24             	mov    %eax,(%esp)
    4dff:	89 54 24 04          	mov    %edx,0x4(%esp)
    4e03:	e8 d6 01 00 00       	call   4fde <isIn>
    4e08:	85 c0                	test   %eax,%eax
    4e0a:	0f 85 9a 00 00 00    	jne    4eaa <set_icon_alpha+0x1e1>
    4e10:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4e13:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e17:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4e1a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4e1e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4e21:	89 44 24 10          	mov    %eax,0x10(%esp)
    4e25:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4e28:	89 44 24 14          	mov    %eax,0x14(%esp)
    4e2c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4e2f:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4e32:	89 04 24             	mov    %eax,(%esp)
    4e35:	89 54 24 04          	mov    %edx,0x4(%esp)
    4e39:	e8 a0 01 00 00       	call   4fde <isIn>
    4e3e:	85 c0                	test   %eax,%eax
    4e40:	75 68                	jne    4eaa <set_icon_alpha+0x1e1>
    4e42:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4e45:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e49:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4e4c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4e50:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4e53:	89 44 24 10          	mov    %eax,0x10(%esp)
    4e57:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4e5a:	89 44 24 14          	mov    %eax,0x14(%esp)
    4e5e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4e61:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4e64:	89 04 24             	mov    %eax,(%esp)
    4e67:	89 54 24 04          	mov    %edx,0x4(%esp)
    4e6b:	e8 6e 01 00 00       	call   4fde <isIn>
    4e70:	85 c0                	test   %eax,%eax
    4e72:	75 36                	jne    4eaa <set_icon_alpha+0x1e1>
    4e74:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4e77:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e7b:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4e7e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4e82:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4e85:	89 44 24 10          	mov    %eax,0x10(%esp)
    4e89:	8b 45 b8             	mov    -0x48(%ebp),%eax
    4e8c:	89 44 24 14          	mov    %eax,0x14(%esp)
    4e90:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4e93:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4e96:	89 04 24             	mov    %eax,(%esp)
    4e99:	89 54 24 04          	mov    %edx,0x4(%esp)
    4e9d:	e8 3c 01 00 00       	call   4fde <isIn>
    4ea2:	85 c0                	test   %eax,%eax
    4ea4:	0f 84 87 00 00 00    	je     4f31 <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    4eaa:	8b 45 08             	mov    0x8(%ebp),%eax
    4ead:	8b 10                	mov    (%eax),%edx
    4eaf:	8b 45 08             	mov    0x8(%ebp),%eax
    4eb2:	8b 40 04             	mov    0x4(%eax),%eax
    4eb5:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    4eb9:	89 c1                	mov    %eax,%ecx
    4ebb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ebe:	01 c8                	add    %ecx,%eax
    4ec0:	c1 e0 02             	shl    $0x2,%eax
    4ec3:	01 d0                	add    %edx,%eax
    4ec5:	0f b6 00             	movzbl (%eax),%eax
    4ec8:	3c ff                	cmp    $0xff,%al
    4eca:	75 65                	jne    4f31 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    4ecc:	8b 45 08             	mov    0x8(%ebp),%eax
    4ecf:	8b 10                	mov    (%eax),%edx
    4ed1:	8b 45 08             	mov    0x8(%ebp),%eax
    4ed4:	8b 40 04             	mov    0x4(%eax),%eax
    4ed7:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    4edb:	89 c1                	mov    %eax,%ecx
    4edd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ee0:	01 c8                	add    %ecx,%eax
    4ee2:	c1 e0 02             	shl    $0x2,%eax
    4ee5:	01 d0                	add    %edx,%eax
    4ee7:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4eeb:	3c ff                	cmp    $0xff,%al
    4eed:	75 42                	jne    4f31 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    4eef:	8b 45 08             	mov    0x8(%ebp),%eax
    4ef2:	8b 10                	mov    (%eax),%edx
    4ef4:	8b 45 08             	mov    0x8(%ebp),%eax
    4ef7:	8b 40 04             	mov    0x4(%eax),%eax
    4efa:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    4efe:	89 c1                	mov    %eax,%ecx
    4f00:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4f03:	01 c8                	add    %ecx,%eax
    4f05:	c1 e0 02             	shl    $0x2,%eax
    4f08:	01 d0                	add    %edx,%eax
    4f0a:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    4f0e:	3c ff                	cmp    $0xff,%al
    4f10:	75 1f                	jne    4f31 <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    4f12:	8b 45 08             	mov    0x8(%ebp),%eax
    4f15:	8b 10                	mov    (%eax),%edx
    4f17:	8b 45 08             	mov    0x8(%ebp),%eax
    4f1a:	8b 40 04             	mov    0x4(%eax),%eax
    4f1d:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    4f21:	89 c1                	mov    %eax,%ecx
    4f23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4f26:	01 c8                	add    %ecx,%eax
    4f28:	c1 e0 02             	shl    $0x2,%eax
    4f2b:	01 d0                	add    %edx,%eax
    4f2d:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    4f31:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4f35:	8b 45 08             	mov    0x8(%ebp),%eax
    4f38:	8b 40 08             	mov    0x8(%eax),%eax
    4f3b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    4f3e:	0f 8f 7a fe ff ff    	jg     4dbe <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    4f44:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4f48:	8b 45 08             	mov    0x8(%ebp),%eax
    4f4b:	8b 40 04             	mov    0x4(%eax),%eax
    4f4e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4f51:	0f 8f 5b fe ff ff    	jg     4db2 <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    4f57:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4f5a:	c9                   	leave  
    4f5b:	c3                   	ret    

00004f5c <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
    4f5c:	55                   	push   %ebp
    4f5d:	89 e5                	mov    %esp,%ebp
    4f5f:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    4f62:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f65:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    4f68:	8b 45 10             	mov    0x10(%ebp),%eax
    4f6b:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    4f6e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4f71:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4f74:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4f77:	89 01                	mov    %eax,(%ecx)
    4f79:	89 51 04             	mov    %edx,0x4(%ecx)
}
    4f7c:	8b 45 08             	mov    0x8(%ebp),%eax
    4f7f:	c9                   	leave  
    4f80:	c2 04 00             	ret    $0x4

00004f83 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    4f83:	55                   	push   %ebp
    4f84:	89 e5                	mov    %esp,%ebp
    4f86:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    4f89:	8d 45 e8             	lea    -0x18(%ebp),%eax
    4f8c:	8b 55 10             	mov    0x10(%ebp),%edx
    4f8f:	89 54 24 08          	mov    %edx,0x8(%esp)
    4f93:	8b 55 0c             	mov    0xc(%ebp),%edx
    4f96:	89 54 24 04          	mov    %edx,0x4(%esp)
    4f9a:	89 04 24             	mov    %eax,(%esp)
    4f9d:	e8 ba ff ff ff       	call   4f5c <initPoint>
    4fa2:	83 ec 04             	sub    $0x4,%esp
    4fa5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4fa8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4fab:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4fae:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    4fb1:	8b 45 14             	mov    0x14(%ebp),%eax
    4fb4:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    4fb7:	8b 45 18             	mov    0x18(%ebp),%eax
    4fba:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    4fbd:	8b 45 08             	mov    0x8(%ebp),%eax
    4fc0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4fc3:	89 10                	mov    %edx,(%eax)
    4fc5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4fc8:	89 50 04             	mov    %edx,0x4(%eax)
    4fcb:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4fce:	89 50 08             	mov    %edx,0x8(%eax)
    4fd1:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4fd4:	89 50 0c             	mov    %edx,0xc(%eax)
}
    4fd7:	8b 45 08             	mov    0x8(%ebp),%eax
    4fda:	c9                   	leave  
    4fdb:	c2 04 00             	ret    $0x4

00004fde <isIn>:

int isIn(Point p, Rect r)
{
    4fde:	55                   	push   %ebp
    4fdf:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    4fe1:	8b 55 08             	mov    0x8(%ebp),%edx
    4fe4:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    4fe7:	39 c2                	cmp    %eax,%edx
    4fe9:	7c 2f                	jl     501a <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    4feb:	8b 45 08             	mov    0x8(%ebp),%eax
    4fee:	8b 4d 10             	mov    0x10(%ebp),%ecx
    4ff1:	8b 55 18             	mov    0x18(%ebp),%edx
    4ff4:	01 ca                	add    %ecx,%edx
    4ff6:	39 d0                	cmp    %edx,%eax
    4ff8:	7d 20                	jge    501a <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    4ffa:	8b 55 0c             	mov    0xc(%ebp),%edx
    4ffd:	8b 45 14             	mov    0x14(%ebp),%eax
    5000:	39 c2                	cmp    %eax,%edx
    5002:	7c 16                	jl     501a <isIn+0x3c>
    5004:	8b 45 0c             	mov    0xc(%ebp),%eax
    5007:	8b 4d 14             	mov    0x14(%ebp),%ecx
    500a:	8b 55 1c             	mov    0x1c(%ebp),%edx
    500d:	01 ca                	add    %ecx,%edx
    500f:	39 d0                	cmp    %edx,%eax
    5011:	7d 07                	jge    501a <isIn+0x3c>
    5013:	b8 01 00 00 00       	mov    $0x1,%eax
    5018:	eb 05                	jmp    501f <isIn+0x41>
    501a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    501f:	5d                   	pop    %ebp
    5020:	c3                   	ret    

00005021 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    5021:	55                   	push   %ebp
    5022:	89 e5                	mov    %esp,%ebp
    5024:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    5027:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    502e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    5035:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    503c:	8b 45 10             	mov    0x10(%ebp),%eax
    503f:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    5042:	8b 45 14             	mov    0x14(%ebp),%eax
    5045:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    5048:	8b 45 08             	mov    0x8(%ebp),%eax
    504b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    504e:	89 10                	mov    %edx,(%eax)
    5050:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5053:	89 50 04             	mov    %edx,0x4(%eax)
    5056:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5059:	89 50 08             	mov    %edx,0x8(%eax)
    505c:	8b 55 f8             	mov    -0x8(%ebp),%edx
    505f:	89 50 0c             	mov    %edx,0xc(%eax)
    5062:	8b 55 fc             	mov    -0x4(%ebp),%edx
    5065:	89 50 10             	mov    %edx,0x10(%eax)
}
    5068:	8b 45 08             	mov    0x8(%ebp),%eax
    506b:	c9                   	leave  
    506c:	c2 04 00             	ret    $0x4

0000506f <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    506f:	55                   	push   %ebp
    5070:	89 e5                	mov    %esp,%ebp
    5072:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    5075:	8b 45 1c             	mov    0x1c(%ebp),%eax
    5078:	83 f8 03             	cmp    $0x3,%eax
    507b:	74 72                	je     50ef <createClickable+0x80>
    507d:	83 f8 04             	cmp    $0x4,%eax
    5080:	74 0a                	je     508c <createClickable+0x1d>
    5082:	83 f8 02             	cmp    $0x2,%eax
    5085:	74 38                	je     50bf <createClickable+0x50>
    5087:	e9 96 00 00 00       	jmp    5122 <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    508c:	8b 45 08             	mov    0x8(%ebp),%eax
    508f:	8d 50 04             	lea    0x4(%eax),%edx
    5092:	8b 45 20             	mov    0x20(%ebp),%eax
    5095:	89 44 24 14          	mov    %eax,0x14(%esp)
    5099:	8b 45 0c             	mov    0xc(%ebp),%eax
    509c:	89 44 24 04          	mov    %eax,0x4(%esp)
    50a0:	8b 45 10             	mov    0x10(%ebp),%eax
    50a3:	89 44 24 08          	mov    %eax,0x8(%esp)
    50a7:	8b 45 14             	mov    0x14(%ebp),%eax
    50aa:	89 44 24 0c          	mov    %eax,0xc(%esp)
    50ae:	8b 45 18             	mov    0x18(%ebp),%eax
    50b1:	89 44 24 10          	mov    %eax,0x10(%esp)
    50b5:	89 14 24             	mov    %edx,(%esp)
    50b8:	e8 7c 00 00 00       	call   5139 <addClickable>
	        break;
    50bd:	eb 78                	jmp    5137 <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    50bf:	8b 45 08             	mov    0x8(%ebp),%eax
    50c2:	8b 55 20             	mov    0x20(%ebp),%edx
    50c5:	89 54 24 14          	mov    %edx,0x14(%esp)
    50c9:	8b 55 0c             	mov    0xc(%ebp),%edx
    50cc:	89 54 24 04          	mov    %edx,0x4(%esp)
    50d0:	8b 55 10             	mov    0x10(%ebp),%edx
    50d3:	89 54 24 08          	mov    %edx,0x8(%esp)
    50d7:	8b 55 14             	mov    0x14(%ebp),%edx
    50da:	89 54 24 0c          	mov    %edx,0xc(%esp)
    50de:	8b 55 18             	mov    0x18(%ebp),%edx
    50e1:	89 54 24 10          	mov    %edx,0x10(%esp)
    50e5:	89 04 24             	mov    %eax,(%esp)
    50e8:	e8 4c 00 00 00       	call   5139 <addClickable>
	    	break;
    50ed:	eb 48                	jmp    5137 <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    50ef:	8b 45 08             	mov    0x8(%ebp),%eax
    50f2:	8d 50 08             	lea    0x8(%eax),%edx
    50f5:	8b 45 20             	mov    0x20(%ebp),%eax
    50f8:	89 44 24 14          	mov    %eax,0x14(%esp)
    50fc:	8b 45 0c             	mov    0xc(%ebp),%eax
    50ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    5103:	8b 45 10             	mov    0x10(%ebp),%eax
    5106:	89 44 24 08          	mov    %eax,0x8(%esp)
    510a:	8b 45 14             	mov    0x14(%ebp),%eax
    510d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5111:	8b 45 18             	mov    0x18(%ebp),%eax
    5114:	89 44 24 10          	mov    %eax,0x10(%esp)
    5118:	89 14 24             	mov    %edx,(%esp)
    511b:	e8 19 00 00 00       	call   5139 <addClickable>
	    	break;
    5120:	eb 15                	jmp    5137 <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    5122:	c7 44 24 04 fc c7 00 	movl   $0xc7fc,0x4(%esp)
    5129:	00 
    512a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5131:	e8 8c 09 00 00       	call   5ac2 <printf>
	    	break;
    5136:	90                   	nop
	}
}
    5137:	c9                   	leave  
    5138:	c3                   	ret    

00005139 <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    5139:	55                   	push   %ebp
    513a:	89 e5                	mov    %esp,%ebp
    513c:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    513f:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    5146:	e8 63 0c 00 00       	call   5dae <malloc>
    514b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    514e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5151:	8b 55 0c             	mov    0xc(%ebp),%edx
    5154:	89 10                	mov    %edx,(%eax)
    5156:	8b 55 10             	mov    0x10(%ebp),%edx
    5159:	89 50 04             	mov    %edx,0x4(%eax)
    515c:	8b 55 14             	mov    0x14(%ebp),%edx
    515f:	89 50 08             	mov    %edx,0x8(%eax)
    5162:	8b 55 18             	mov    0x18(%ebp),%edx
    5165:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    5168:	8b 45 f4             	mov    -0xc(%ebp),%eax
    516b:	8b 55 1c             	mov    0x1c(%ebp),%edx
    516e:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    5171:	8b 45 08             	mov    0x8(%ebp),%eax
    5174:	8b 10                	mov    (%eax),%edx
    5176:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5179:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    517c:	8b 45 08             	mov    0x8(%ebp),%eax
    517f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5182:	89 10                	mov    %edx,(%eax)
}
    5184:	c9                   	leave  
    5185:	c3                   	ret    

00005186 <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    5186:	55                   	push   %ebp
    5187:	89 e5                	mov    %esp,%ebp
    5189:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    518c:	8b 45 08             	mov    0x8(%ebp),%eax
    518f:	8b 00                	mov    (%eax),%eax
    5191:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5194:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5197:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    519a:	e9 bb 00 00 00       	jmp    525a <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    519f:	8b 45 0c             	mov    0xc(%ebp),%eax
    51a2:	89 44 24 08          	mov    %eax,0x8(%esp)
    51a6:	8b 45 10             	mov    0x10(%ebp),%eax
    51a9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    51ad:	8b 45 14             	mov    0x14(%ebp),%eax
    51b0:	89 44 24 10          	mov    %eax,0x10(%esp)
    51b4:	8b 45 18             	mov    0x18(%ebp),%eax
    51b7:	89 44 24 14          	mov    %eax,0x14(%esp)
    51bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    51be:	8b 50 04             	mov    0x4(%eax),%edx
    51c1:	8b 00                	mov    (%eax),%eax
    51c3:	89 04 24             	mov    %eax,(%esp)
    51c6:	89 54 24 04          	mov    %edx,0x4(%esp)
    51ca:	e8 0f fe ff ff       	call   4fde <isIn>
    51cf:	85 c0                	test   %eax,%eax
    51d1:	74 60                	je     5233 <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    51d3:	8b 45 08             	mov    0x8(%ebp),%eax
    51d6:	8b 00                	mov    (%eax),%eax
    51d8:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    51db:	75 2e                	jne    520b <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    51dd:	8b 45 08             	mov    0x8(%ebp),%eax
    51e0:	8b 00                	mov    (%eax),%eax
    51e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    51e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    51e8:	8b 50 14             	mov    0x14(%eax),%edx
    51eb:	8b 45 08             	mov    0x8(%ebp),%eax
    51ee:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    51f0:	8b 45 08             	mov    0x8(%ebp),%eax
    51f3:	8b 00                	mov    (%eax),%eax
    51f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    51f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    51fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5201:	89 04 24             	mov    %eax,(%esp)
    5204:	e8 6c 0a 00 00       	call   5c75 <free>
    5209:	eb 4f                	jmp    525a <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    520b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    520e:	8b 50 14             	mov    0x14(%eax),%edx
    5211:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5214:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    5217:	8b 45 f0             	mov    -0x10(%ebp),%eax
    521a:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    521d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5220:	8b 40 14             	mov    0x14(%eax),%eax
    5223:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    5226:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5229:	89 04 24             	mov    %eax,(%esp)
    522c:	e8 44 0a 00 00       	call   5c75 <free>
    5231:	eb 27                	jmp    525a <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    5233:	8b 45 08             	mov    0x8(%ebp),%eax
    5236:	8b 00                	mov    (%eax),%eax
    5238:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    523b:	75 0b                	jne    5248 <deleteClickable+0xc2>
			{
				cur = cur->next;
    523d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5240:	8b 40 14             	mov    0x14(%eax),%eax
    5243:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5246:	eb 12                	jmp    525a <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    5248:	8b 45 f0             	mov    -0x10(%ebp),%eax
    524b:	8b 40 14             	mov    0x14(%eax),%eax
    524e:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    5251:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5254:	8b 40 14             	mov    0x14(%eax),%eax
    5257:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    525a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    525e:	0f 85 3b ff ff ff    	jne    519f <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    5264:	c9                   	leave  
    5265:	c3                   	ret    

00005266 <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    5266:	55                   	push   %ebp
    5267:	89 e5                	mov    %esp,%ebp
    5269:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    526c:	8b 45 08             	mov    0x8(%ebp),%eax
    526f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    5272:	eb 6d                	jmp    52e1 <executeHandler+0x7b>
	{
		if (isIn(click, cur->area))
    5274:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5277:	8b 10                	mov    (%eax),%edx
    5279:	89 54 24 08          	mov    %edx,0x8(%esp)
    527d:	8b 50 04             	mov    0x4(%eax),%edx
    5280:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5284:	8b 50 08             	mov    0x8(%eax),%edx
    5287:	89 54 24 10          	mov    %edx,0x10(%esp)
    528b:	8b 40 0c             	mov    0xc(%eax),%eax
    528e:	89 44 24 14          	mov    %eax,0x14(%esp)
    5292:	8b 45 0c             	mov    0xc(%ebp),%eax
    5295:	8b 55 10             	mov    0x10(%ebp),%edx
    5298:	89 04 24             	mov    %eax,(%esp)
    529b:	89 54 24 04          	mov    %edx,0x4(%esp)
    529f:	e8 3a fd ff ff       	call   4fde <isIn>
    52a4:	85 c0                	test   %eax,%eax
    52a6:	74 30                	je     52d8 <executeHandler+0x72>
		{
			renaming = 0;
    52a8:	c7 05 54 47 01 00 00 	movl   $0x0,0x14754
    52af:	00 00 00 
			isSearching = 0;
    52b2:	c7 05 e0 3c 01 00 00 	movl   $0x0,0x13ce0
    52b9:	00 00 00 
			cur->handler(click);
    52bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52bf:	8b 48 10             	mov    0x10(%eax),%ecx
    52c2:	8b 45 0c             	mov    0xc(%ebp),%eax
    52c5:	8b 55 10             	mov    0x10(%ebp),%edx
    52c8:	89 04 24             	mov    %eax,(%esp)
    52cb:	89 54 24 04          	mov    %edx,0x4(%esp)
    52cf:	ff d1                	call   *%ecx
			return 1;
    52d1:	b8 01 00 00 00       	mov    $0x1,%eax
    52d6:	eb 4d                	jmp    5325 <executeHandler+0xbf>
		}
		cur = cur->next;
    52d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52db:	8b 40 14             	mov    0x14(%eax),%eax
    52de:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    52e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    52e5:	75 8d                	jne    5274 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
    52e7:	c7 05 e0 3c 01 00 00 	movl   $0x0,0x13ce0
    52ee:	00 00 00 
	if (renaming == 1){
    52f1:	a1 54 47 01 00       	mov    0x14754,%eax
    52f6:	83 f8 01             	cmp    $0x1,%eax
    52f9:	75 11                	jne    530c <executeHandler+0xa6>
		renaming = 0;
    52fb:	c7 05 54 47 01 00 00 	movl   $0x0,0x14754
    5302:	00 00 00 
		return 1;
    5305:	b8 01 00 00 00       	mov    $0x1,%eax
    530a:	eb 19                	jmp    5325 <executeHandler+0xbf>
	}
	printf(0, "execute: none!\n");
    530c:	c7 44 24 04 2a c8 00 	movl   $0xc82a,0x4(%esp)
    5313:	00 
    5314:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    531b:	e8 a2 07 00 00       	call   5ac2 <printf>
	return 0;
    5320:	b8 00 00 00 00       	mov    $0x0,%eax
}
    5325:	c9                   	leave  
    5326:	c3                   	ret    

00005327 <printClickable>:

void printClickable(Clickable *c)
{
    5327:	55                   	push   %ebp
    5328:	89 e5                	mov    %esp,%ebp
    532a:	53                   	push   %ebx
    532b:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    532e:	8b 45 08             	mov    0x8(%ebp),%eax
    5331:	8b 58 0c             	mov    0xc(%eax),%ebx
    5334:	8b 45 08             	mov    0x8(%ebp),%eax
    5337:	8b 48 08             	mov    0x8(%eax),%ecx
    533a:	8b 45 08             	mov    0x8(%ebp),%eax
    533d:	8b 50 04             	mov    0x4(%eax),%edx
    5340:	8b 45 08             	mov    0x8(%ebp),%eax
    5343:	8b 00                	mov    (%eax),%eax
    5345:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    5349:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    534d:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5351:	89 44 24 08          	mov    %eax,0x8(%esp)
    5355:	c7 44 24 04 3a c8 00 	movl   $0xc83a,0x4(%esp)
    535c:	00 
    535d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5364:	e8 59 07 00 00       	call   5ac2 <printf>
}
    5369:	83 c4 24             	add    $0x24,%esp
    536c:	5b                   	pop    %ebx
    536d:	5d                   	pop    %ebp
    536e:	c3                   	ret    

0000536f <printClickableList>:

void printClickableList(Clickable *head)
{
    536f:	55                   	push   %ebp
    5370:	89 e5                	mov    %esp,%ebp
    5372:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    5375:	8b 45 08             	mov    0x8(%ebp),%eax
    5378:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    537b:	c7 44 24 04 4c c8 00 	movl   $0xc84c,0x4(%esp)
    5382:	00 
    5383:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    538a:	e8 33 07 00 00       	call   5ac2 <printf>
	while(cur != 0)
    538f:	eb 14                	jmp    53a5 <printClickableList+0x36>
	{
		printClickable(cur);
    5391:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5394:	89 04 24             	mov    %eax,(%esp)
    5397:	e8 8b ff ff ff       	call   5327 <printClickable>
		cur = cur->next;
    539c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    539f:	8b 40 14             	mov    0x14(%eax),%eax
    53a2:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    53a5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    53a9:	75 e6                	jne    5391 <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    53ab:	c7 44 24 04 5d c8 00 	movl   $0xc85d,0x4(%esp)
    53b2:	00 
    53b3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    53ba:	e8 03 07 00 00       	call   5ac2 <printf>
}
    53bf:	c9                   	leave  
    53c0:	c3                   	ret    

000053c1 <testHanler>:

void testHanler(struct Point p)
{
    53c1:	55                   	push   %ebp
    53c2:	89 e5                	mov    %esp,%ebp
    53c4:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    53c7:	8b 55 0c             	mov    0xc(%ebp),%edx
    53ca:	8b 45 08             	mov    0x8(%ebp),%eax
    53cd:	89 54 24 0c          	mov    %edx,0xc(%esp)
    53d1:	89 44 24 08          	mov    %eax,0x8(%esp)
    53d5:	c7 44 24 04 5f c8 00 	movl   $0xc85f,0x4(%esp)
    53dc:	00 
    53dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    53e4:	e8 d9 06 00 00       	call   5ac2 <printf>
}
    53e9:	c9                   	leave  
    53ea:	c3                   	ret    

000053eb <testClickable>:
void testClickable(struct Context c)
{
    53eb:	55                   	push   %ebp
    53ec:	89 e5                	mov    %esp,%ebp
    53ee:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    53f4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    53f7:	8b 55 08             	mov    0x8(%ebp),%edx
    53fa:	89 54 24 04          	mov    %edx,0x4(%esp)
    53fe:	8b 55 0c             	mov    0xc(%ebp),%edx
    5401:	89 54 24 08          	mov    %edx,0x8(%esp)
    5405:	8b 55 10             	mov    0x10(%ebp),%edx
    5408:	89 54 24 0c          	mov    %edx,0xc(%esp)
    540c:	89 04 24             	mov    %eax,(%esp)
    540f:	e8 0d fc ff ff       	call   5021 <initClickManager>
    5414:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    5417:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    541a:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    5421:	00 
    5422:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    5429:	00 
    542a:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    5431:	00 
    5432:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    5439:	00 
    543a:	89 04 24             	mov    %eax,(%esp)
    543d:	e8 41 fb ff ff       	call   4f83 <initRect>
    5442:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    5445:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    5448:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    544f:	00 
    5450:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    5457:	00 
    5458:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    545f:	00 
    5460:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    5467:	00 
    5468:	89 04 24             	mov    %eax,(%esp)
    546b:	e8 13 fb ff ff       	call   4f83 <initRect>
    5470:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    5473:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    5476:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    547d:	00 
    547e:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    5485:	00 
    5486:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    548d:	00 
    548e:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    5495:	00 
    5496:	89 04 24             	mov    %eax,(%esp)
    5499:	e8 e5 fa ff ff       	call   4f83 <initRect>
    549e:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    54a1:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    54a4:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    54ab:	00 
    54ac:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    54b3:	00 
    54b4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    54bb:	00 
    54bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    54c3:	00 
    54c4:	89 04 24             	mov    %eax,(%esp)
    54c7:	e8 b7 fa ff ff       	call   4f83 <initRect>
    54cc:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    54cf:	8d 45 9c             	lea    -0x64(%ebp),%eax
    54d2:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    54d9:	00 
    54da:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    54e1:	00 
    54e2:	89 04 24             	mov    %eax,(%esp)
    54e5:	e8 72 fa ff ff       	call   4f5c <initPoint>
    54ea:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    54ed:	8d 45 94             	lea    -0x6c(%ebp),%eax
    54f0:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    54f7:	00 
    54f8:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    54ff:	00 
    5500:	89 04 24             	mov    %eax,(%esp)
    5503:	e8 54 fa ff ff       	call   4f5c <initPoint>
    5508:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    550b:	c7 44 24 18 c1 53 00 	movl   $0x53c1,0x18(%esp)
    5512:	00 
    5513:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    551a:	00 
    551b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    551e:	89 44 24 04          	mov    %eax,0x4(%esp)
    5522:	8b 45 d8             	mov    -0x28(%ebp),%eax
    5525:	89 44 24 08          	mov    %eax,0x8(%esp)
    5529:	8b 45 dc             	mov    -0x24(%ebp),%eax
    552c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5530:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5533:	89 44 24 10          	mov    %eax,0x10(%esp)
    5537:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    553a:	89 04 24             	mov    %eax,(%esp)
    553d:	e8 2d fb ff ff       	call   506f <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    5542:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5545:	89 44 24 08          	mov    %eax,0x8(%esp)
    5549:	c7 44 24 04 73 c8 00 	movl   $0xc873,0x4(%esp)
    5550:	00 
    5551:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5558:	e8 65 05 00 00       	call   5ac2 <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    555d:	c7 44 24 18 c1 53 00 	movl   $0x53c1,0x18(%esp)
    5564:	00 
    5565:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    556c:	00 
    556d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5570:	89 44 24 04          	mov    %eax,0x4(%esp)
    5574:	8b 45 c8             	mov    -0x38(%ebp),%eax
    5577:	89 44 24 08          	mov    %eax,0x8(%esp)
    557b:	8b 45 cc             	mov    -0x34(%ebp),%eax
    557e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5582:	8b 45 d0             	mov    -0x30(%ebp),%eax
    5585:	89 44 24 10          	mov    %eax,0x10(%esp)
    5589:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    558c:	89 04 24             	mov    %eax,(%esp)
    558f:	e8 db fa ff ff       	call   506f <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    5594:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5597:	89 44 24 08          	mov    %eax,0x8(%esp)
    559b:	c7 44 24 04 73 c8 00 	movl   $0xc873,0x4(%esp)
    55a2:	00 
    55a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    55aa:	e8 13 05 00 00       	call   5ac2 <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    55af:	c7 44 24 18 c1 53 00 	movl   $0x53c1,0x18(%esp)
    55b6:	00 
    55b7:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    55be:	00 
    55bf:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    55c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    55c6:	8b 45 b8             	mov    -0x48(%ebp),%eax
    55c9:	89 44 24 08          	mov    %eax,0x8(%esp)
    55cd:	8b 45 bc             	mov    -0x44(%ebp),%eax
    55d0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    55d4:	8b 45 c0             	mov    -0x40(%ebp),%eax
    55d7:	89 44 24 10          	mov    %eax,0x10(%esp)
    55db:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    55de:	89 04 24             	mov    %eax,(%esp)
    55e1:	e8 89 fa ff ff       	call   506f <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    55e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    55e9:	89 44 24 08          	mov    %eax,0x8(%esp)
    55ed:	c7 44 24 04 73 c8 00 	movl   $0xc873,0x4(%esp)
    55f4:	00 
    55f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    55fc:	e8 c1 04 00 00       	call   5ac2 <printf>
	printClickableList(cm.left_click);
    5601:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5604:	89 04 24             	mov    %eax,(%esp)
    5607:	e8 63 fd ff ff       	call   536f <printClickableList>
	executeHandler(cm.left_click, p1);
    560c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    560f:	8b 45 9c             	mov    -0x64(%ebp),%eax
    5612:	8b 55 a0             	mov    -0x60(%ebp),%edx
    5615:	89 44 24 04          	mov    %eax,0x4(%esp)
    5619:	89 54 24 08          	mov    %edx,0x8(%esp)
    561d:	89 0c 24             	mov    %ecx,(%esp)
    5620:	e8 41 fc ff ff       	call   5266 <executeHandler>
	executeHandler(cm.left_click, p2);
    5625:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5628:	8b 45 94             	mov    -0x6c(%ebp),%eax
    562b:	8b 55 98             	mov    -0x68(%ebp),%edx
    562e:	89 44 24 04          	mov    %eax,0x4(%esp)
    5632:	89 54 24 08          	mov    %edx,0x8(%esp)
    5636:	89 0c 24             	mov    %ecx,(%esp)
    5639:	e8 28 fc ff ff       	call   5266 <executeHandler>
	deleteClickable(&cm.left_click, r4);
    563e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    5641:	89 44 24 04          	mov    %eax,0x4(%esp)
    5645:	8b 45 a8             	mov    -0x58(%ebp),%eax
    5648:	89 44 24 08          	mov    %eax,0x8(%esp)
    564c:	8b 45 ac             	mov    -0x54(%ebp),%eax
    564f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5653:	8b 45 b0             	mov    -0x50(%ebp),%eax
    5656:	89 44 24 10          	mov    %eax,0x10(%esp)
    565a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    565d:	89 04 24             	mov    %eax,(%esp)
    5660:	e8 21 fb ff ff       	call   5186 <deleteClickable>
	printClickableList(cm.left_click);
    5665:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5668:	89 04 24             	mov    %eax,(%esp)
    566b:	e8 ff fc ff ff       	call   536f <printClickableList>
}
    5670:	c9                   	leave  
    5671:	c3                   	ret    

00005672 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    5672:	55                   	push   %ebp
    5673:	89 e5                	mov    %esp,%ebp
    5675:	57                   	push   %edi
    5676:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    5677:	8b 4d 08             	mov    0x8(%ebp),%ecx
    567a:	8b 55 10             	mov    0x10(%ebp),%edx
    567d:	8b 45 0c             	mov    0xc(%ebp),%eax
    5680:	89 cb                	mov    %ecx,%ebx
    5682:	89 df                	mov    %ebx,%edi
    5684:	89 d1                	mov    %edx,%ecx
    5686:	fc                   	cld    
    5687:	f3 aa                	rep stos %al,%es:(%edi)
    5689:	89 ca                	mov    %ecx,%edx
    568b:	89 fb                	mov    %edi,%ebx
    568d:	89 5d 08             	mov    %ebx,0x8(%ebp)
    5690:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    5693:	5b                   	pop    %ebx
    5694:	5f                   	pop    %edi
    5695:	5d                   	pop    %ebp
    5696:	c3                   	ret    

00005697 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    5697:	55                   	push   %ebp
    5698:	89 e5                	mov    %esp,%ebp
    569a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    569d:	8b 45 08             	mov    0x8(%ebp),%eax
    56a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    56a3:	90                   	nop
    56a4:	8b 45 08             	mov    0x8(%ebp),%eax
    56a7:	8d 50 01             	lea    0x1(%eax),%edx
    56aa:	89 55 08             	mov    %edx,0x8(%ebp)
    56ad:	8b 55 0c             	mov    0xc(%ebp),%edx
    56b0:	8d 4a 01             	lea    0x1(%edx),%ecx
    56b3:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    56b6:	0f b6 12             	movzbl (%edx),%edx
    56b9:	88 10                	mov    %dl,(%eax)
    56bb:	0f b6 00             	movzbl (%eax),%eax
    56be:	84 c0                	test   %al,%al
    56c0:	75 e2                	jne    56a4 <strcpy+0xd>
    ;
  return os;
    56c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    56c5:	c9                   	leave  
    56c6:	c3                   	ret    

000056c7 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    56c7:	55                   	push   %ebp
    56c8:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    56ca:	eb 08                	jmp    56d4 <strcmp+0xd>
    p++, q++;
    56cc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    56d0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    56d4:	8b 45 08             	mov    0x8(%ebp),%eax
    56d7:	0f b6 00             	movzbl (%eax),%eax
    56da:	84 c0                	test   %al,%al
    56dc:	74 10                	je     56ee <strcmp+0x27>
    56de:	8b 45 08             	mov    0x8(%ebp),%eax
    56e1:	0f b6 10             	movzbl (%eax),%edx
    56e4:	8b 45 0c             	mov    0xc(%ebp),%eax
    56e7:	0f b6 00             	movzbl (%eax),%eax
    56ea:	38 c2                	cmp    %al,%dl
    56ec:	74 de                	je     56cc <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    56ee:	8b 45 08             	mov    0x8(%ebp),%eax
    56f1:	0f b6 00             	movzbl (%eax),%eax
    56f4:	0f b6 d0             	movzbl %al,%edx
    56f7:	8b 45 0c             	mov    0xc(%ebp),%eax
    56fa:	0f b6 00             	movzbl (%eax),%eax
    56fd:	0f b6 c0             	movzbl %al,%eax
    5700:	29 c2                	sub    %eax,%edx
    5702:	89 d0                	mov    %edx,%eax
}
    5704:	5d                   	pop    %ebp
    5705:	c3                   	ret    

00005706 <strlen>:

uint
strlen(char *s)
{
    5706:	55                   	push   %ebp
    5707:	89 e5                	mov    %esp,%ebp
    5709:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    570c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    5713:	eb 04                	jmp    5719 <strlen+0x13>
    5715:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    5719:	8b 55 fc             	mov    -0x4(%ebp),%edx
    571c:	8b 45 08             	mov    0x8(%ebp),%eax
    571f:	01 d0                	add    %edx,%eax
    5721:	0f b6 00             	movzbl (%eax),%eax
    5724:	84 c0                	test   %al,%al
    5726:	75 ed                	jne    5715 <strlen+0xf>
    ;
  return n;
    5728:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    572b:	c9                   	leave  
    572c:	c3                   	ret    

0000572d <memset>:

void*
memset(void *dst, int c, uint n)
{
    572d:	55                   	push   %ebp
    572e:	89 e5                	mov    %esp,%ebp
    5730:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    5733:	8b 45 10             	mov    0x10(%ebp),%eax
    5736:	89 44 24 08          	mov    %eax,0x8(%esp)
    573a:	8b 45 0c             	mov    0xc(%ebp),%eax
    573d:	89 44 24 04          	mov    %eax,0x4(%esp)
    5741:	8b 45 08             	mov    0x8(%ebp),%eax
    5744:	89 04 24             	mov    %eax,(%esp)
    5747:	e8 26 ff ff ff       	call   5672 <stosb>
  return dst;
    574c:	8b 45 08             	mov    0x8(%ebp),%eax
}
    574f:	c9                   	leave  
    5750:	c3                   	ret    

00005751 <strchr>:

char*
strchr(const char *s, char c)
{
    5751:	55                   	push   %ebp
    5752:	89 e5                	mov    %esp,%ebp
    5754:	83 ec 04             	sub    $0x4,%esp
    5757:	8b 45 0c             	mov    0xc(%ebp),%eax
    575a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    575d:	eb 14                	jmp    5773 <strchr+0x22>
    if(*s == c)
    575f:	8b 45 08             	mov    0x8(%ebp),%eax
    5762:	0f b6 00             	movzbl (%eax),%eax
    5765:	3a 45 fc             	cmp    -0x4(%ebp),%al
    5768:	75 05                	jne    576f <strchr+0x1e>
      return (char*)s;
    576a:	8b 45 08             	mov    0x8(%ebp),%eax
    576d:	eb 13                	jmp    5782 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    576f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    5773:	8b 45 08             	mov    0x8(%ebp),%eax
    5776:	0f b6 00             	movzbl (%eax),%eax
    5779:	84 c0                	test   %al,%al
    577b:	75 e2                	jne    575f <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    577d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    5782:	c9                   	leave  
    5783:	c3                   	ret    

00005784 <gets>:

char*
gets(char *buf, int max)
{
    5784:	55                   	push   %ebp
    5785:	89 e5                	mov    %esp,%ebp
    5787:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    578a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5791:	eb 4c                	jmp    57df <gets+0x5b>
    cc = read(0, &c, 1);
    5793:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    579a:	00 
    579b:	8d 45 ef             	lea    -0x11(%ebp),%eax
    579e:	89 44 24 04          	mov    %eax,0x4(%esp)
    57a2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    57a9:	e8 44 01 00 00       	call   58f2 <read>
    57ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    57b1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    57b5:	7f 02                	jg     57b9 <gets+0x35>
      break;
    57b7:	eb 31                	jmp    57ea <gets+0x66>
    buf[i++] = c;
    57b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    57bc:	8d 50 01             	lea    0x1(%eax),%edx
    57bf:	89 55 f4             	mov    %edx,-0xc(%ebp)
    57c2:	89 c2                	mov    %eax,%edx
    57c4:	8b 45 08             	mov    0x8(%ebp),%eax
    57c7:	01 c2                	add    %eax,%edx
    57c9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    57cd:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    57cf:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    57d3:	3c 0a                	cmp    $0xa,%al
    57d5:	74 13                	je     57ea <gets+0x66>
    57d7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    57db:	3c 0d                	cmp    $0xd,%al
    57dd:	74 0b                	je     57ea <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    57df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    57e2:	83 c0 01             	add    $0x1,%eax
    57e5:	3b 45 0c             	cmp    0xc(%ebp),%eax
    57e8:	7c a9                	jl     5793 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    57ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
    57ed:	8b 45 08             	mov    0x8(%ebp),%eax
    57f0:	01 d0                	add    %edx,%eax
    57f2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    57f5:	8b 45 08             	mov    0x8(%ebp),%eax
}
    57f8:	c9                   	leave  
    57f9:	c3                   	ret    

000057fa <stat>:

int
stat(char *n, struct stat *st)
{
    57fa:	55                   	push   %ebp
    57fb:	89 e5                	mov    %esp,%ebp
    57fd:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    5800:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    5807:	00 
    5808:	8b 45 08             	mov    0x8(%ebp),%eax
    580b:	89 04 24             	mov    %eax,(%esp)
    580e:	e8 07 01 00 00       	call   591a <open>
    5813:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    5816:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    581a:	79 07                	jns    5823 <stat+0x29>
    return -1;
    581c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5821:	eb 23                	jmp    5846 <stat+0x4c>
  r = fstat(fd, st);
    5823:	8b 45 0c             	mov    0xc(%ebp),%eax
    5826:	89 44 24 04          	mov    %eax,0x4(%esp)
    582a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    582d:	89 04 24             	mov    %eax,(%esp)
    5830:	e8 fd 00 00 00       	call   5932 <fstat>
    5835:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    5838:	8b 45 f4             	mov    -0xc(%ebp),%eax
    583b:	89 04 24             	mov    %eax,(%esp)
    583e:	e8 bf 00 00 00       	call   5902 <close>
  return r;
    5843:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    5846:	c9                   	leave  
    5847:	c3                   	ret    

00005848 <atoi>:

int
atoi(const char *s)
{
    5848:	55                   	push   %ebp
    5849:	89 e5                	mov    %esp,%ebp
    584b:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    584e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    5855:	eb 25                	jmp    587c <atoi+0x34>
    n = n*10 + *s++ - '0';
    5857:	8b 55 fc             	mov    -0x4(%ebp),%edx
    585a:	89 d0                	mov    %edx,%eax
    585c:	c1 e0 02             	shl    $0x2,%eax
    585f:	01 d0                	add    %edx,%eax
    5861:	01 c0                	add    %eax,%eax
    5863:	89 c1                	mov    %eax,%ecx
    5865:	8b 45 08             	mov    0x8(%ebp),%eax
    5868:	8d 50 01             	lea    0x1(%eax),%edx
    586b:	89 55 08             	mov    %edx,0x8(%ebp)
    586e:	0f b6 00             	movzbl (%eax),%eax
    5871:	0f be c0             	movsbl %al,%eax
    5874:	01 c8                	add    %ecx,%eax
    5876:	83 e8 30             	sub    $0x30,%eax
    5879:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    587c:	8b 45 08             	mov    0x8(%ebp),%eax
    587f:	0f b6 00             	movzbl (%eax),%eax
    5882:	3c 2f                	cmp    $0x2f,%al
    5884:	7e 0a                	jle    5890 <atoi+0x48>
    5886:	8b 45 08             	mov    0x8(%ebp),%eax
    5889:	0f b6 00             	movzbl (%eax),%eax
    588c:	3c 39                	cmp    $0x39,%al
    588e:	7e c7                	jle    5857 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    5890:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    5893:	c9                   	leave  
    5894:	c3                   	ret    

00005895 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    5895:	55                   	push   %ebp
    5896:	89 e5                	mov    %esp,%ebp
    5898:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    589b:	8b 45 08             	mov    0x8(%ebp),%eax
    589e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    58a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    58a4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    58a7:	eb 17                	jmp    58c0 <memmove+0x2b>
    *dst++ = *src++;
    58a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    58ac:	8d 50 01             	lea    0x1(%eax),%edx
    58af:	89 55 fc             	mov    %edx,-0x4(%ebp)
    58b2:	8b 55 f8             	mov    -0x8(%ebp),%edx
    58b5:	8d 4a 01             	lea    0x1(%edx),%ecx
    58b8:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    58bb:	0f b6 12             	movzbl (%edx),%edx
    58be:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    58c0:	8b 45 10             	mov    0x10(%ebp),%eax
    58c3:	8d 50 ff             	lea    -0x1(%eax),%edx
    58c6:	89 55 10             	mov    %edx,0x10(%ebp)
    58c9:	85 c0                	test   %eax,%eax
    58cb:	7f dc                	jg     58a9 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    58cd:	8b 45 08             	mov    0x8(%ebp),%eax
}
    58d0:	c9                   	leave  
    58d1:	c3                   	ret    

000058d2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    58d2:	b8 01 00 00 00       	mov    $0x1,%eax
    58d7:	cd 40                	int    $0x40
    58d9:	c3                   	ret    

000058da <exit>:
SYSCALL(exit)
    58da:	b8 02 00 00 00       	mov    $0x2,%eax
    58df:	cd 40                	int    $0x40
    58e1:	c3                   	ret    

000058e2 <wait>:
SYSCALL(wait)
    58e2:	b8 03 00 00 00       	mov    $0x3,%eax
    58e7:	cd 40                	int    $0x40
    58e9:	c3                   	ret    

000058ea <pipe>:
SYSCALL(pipe)
    58ea:	b8 04 00 00 00       	mov    $0x4,%eax
    58ef:	cd 40                	int    $0x40
    58f1:	c3                   	ret    

000058f2 <read>:
SYSCALL(read)
    58f2:	b8 05 00 00 00       	mov    $0x5,%eax
    58f7:	cd 40                	int    $0x40
    58f9:	c3                   	ret    

000058fa <write>:
SYSCALL(write)
    58fa:	b8 10 00 00 00       	mov    $0x10,%eax
    58ff:	cd 40                	int    $0x40
    5901:	c3                   	ret    

00005902 <close>:
SYSCALL(close)
    5902:	b8 15 00 00 00       	mov    $0x15,%eax
    5907:	cd 40                	int    $0x40
    5909:	c3                   	ret    

0000590a <kill>:
SYSCALL(kill)
    590a:	b8 06 00 00 00       	mov    $0x6,%eax
    590f:	cd 40                	int    $0x40
    5911:	c3                   	ret    

00005912 <exec>:
SYSCALL(exec)
    5912:	b8 07 00 00 00       	mov    $0x7,%eax
    5917:	cd 40                	int    $0x40
    5919:	c3                   	ret    

0000591a <open>:
SYSCALL(open)
    591a:	b8 0f 00 00 00       	mov    $0xf,%eax
    591f:	cd 40                	int    $0x40
    5921:	c3                   	ret    

00005922 <mknod>:
SYSCALL(mknod)
    5922:	b8 11 00 00 00       	mov    $0x11,%eax
    5927:	cd 40                	int    $0x40
    5929:	c3                   	ret    

0000592a <unlink>:
SYSCALL(unlink)
    592a:	b8 12 00 00 00       	mov    $0x12,%eax
    592f:	cd 40                	int    $0x40
    5931:	c3                   	ret    

00005932 <fstat>:
SYSCALL(fstat)
    5932:	b8 08 00 00 00       	mov    $0x8,%eax
    5937:	cd 40                	int    $0x40
    5939:	c3                   	ret    

0000593a <link>:
SYSCALL(link)
    593a:	b8 13 00 00 00       	mov    $0x13,%eax
    593f:	cd 40                	int    $0x40
    5941:	c3                   	ret    

00005942 <mkdir>:
SYSCALL(mkdir)
    5942:	b8 14 00 00 00       	mov    $0x14,%eax
    5947:	cd 40                	int    $0x40
    5949:	c3                   	ret    

0000594a <chdir>:
SYSCALL(chdir)
    594a:	b8 09 00 00 00       	mov    $0x9,%eax
    594f:	cd 40                	int    $0x40
    5951:	c3                   	ret    

00005952 <dup>:
SYSCALL(dup)
    5952:	b8 0a 00 00 00       	mov    $0xa,%eax
    5957:	cd 40                	int    $0x40
    5959:	c3                   	ret    

0000595a <getpid>:
SYSCALL(getpid)
    595a:	b8 0b 00 00 00       	mov    $0xb,%eax
    595f:	cd 40                	int    $0x40
    5961:	c3                   	ret    

00005962 <sbrk>:
SYSCALL(sbrk)
    5962:	b8 0c 00 00 00       	mov    $0xc,%eax
    5967:	cd 40                	int    $0x40
    5969:	c3                   	ret    

0000596a <sleep>:
SYSCALL(sleep)
    596a:	b8 0d 00 00 00       	mov    $0xd,%eax
    596f:	cd 40                	int    $0x40
    5971:	c3                   	ret    

00005972 <uptime>:
SYSCALL(uptime)
    5972:	b8 0e 00 00 00       	mov    $0xe,%eax
    5977:	cd 40                	int    $0x40
    5979:	c3                   	ret    

0000597a <getMsg>:
SYSCALL(getMsg)
    597a:	b8 16 00 00 00       	mov    $0x16,%eax
    597f:	cd 40                	int    $0x40
    5981:	c3                   	ret    

00005982 <createWindow>:
SYSCALL(createWindow)
    5982:	b8 17 00 00 00       	mov    $0x17,%eax
    5987:	cd 40                	int    $0x40
    5989:	c3                   	ret    

0000598a <destroyWindow>:
SYSCALL(destroyWindow)
    598a:	b8 18 00 00 00       	mov    $0x18,%eax
    598f:	cd 40                	int    $0x40
    5991:	c3                   	ret    

00005992 <updateWindow>:
SYSCALL(updateWindow)
    5992:	b8 19 00 00 00       	mov    $0x19,%eax
    5997:	cd 40                	int    $0x40
    5999:	c3                   	ret    

0000599a <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    599a:	b8 1a 00 00 00       	mov    $0x1a,%eax
    599f:	cd 40                	int    $0x40
    59a1:	c3                   	ret    

000059a2 <kwrite>:
SYSCALL(kwrite)
    59a2:	b8 1c 00 00 00       	mov    $0x1c,%eax
    59a7:	cd 40                	int    $0x40
    59a9:	c3                   	ret    

000059aa <setSampleRate>:
SYSCALL(setSampleRate)
    59aa:	b8 1b 00 00 00       	mov    $0x1b,%eax
    59af:	cd 40                	int    $0x40
    59b1:	c3                   	ret    

000059b2 <pause>:
SYSCALL(pause)
    59b2:	b8 1d 00 00 00       	mov    $0x1d,%eax
    59b7:	cd 40                	int    $0x40
    59b9:	c3                   	ret    

000059ba <wavdecode>:
SYSCALL(wavdecode)
    59ba:	b8 1e 00 00 00       	mov    $0x1e,%eax
    59bf:	cd 40                	int    $0x40
    59c1:	c3                   	ret    

000059c2 <beginDecode>:
SYSCALL(beginDecode)
    59c2:	b8 1f 00 00 00       	mov    $0x1f,%eax
    59c7:	cd 40                	int    $0x40
    59c9:	c3                   	ret    

000059ca <waitForDecode>:
SYSCALL(waitForDecode)
    59ca:	b8 20 00 00 00       	mov    $0x20,%eax
    59cf:	cd 40                	int    $0x40
    59d1:	c3                   	ret    

000059d2 <endDecode>:
SYSCALL(endDecode)
    59d2:	b8 21 00 00 00       	mov    $0x21,%eax
    59d7:	cd 40                	int    $0x40
    59d9:	c3                   	ret    

000059da <getCoreBuf>:
    59da:	b8 22 00 00 00       	mov    $0x22,%eax
    59df:	cd 40                	int    $0x40
    59e1:	c3                   	ret    

000059e2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    59e2:	55                   	push   %ebp
    59e3:	89 e5                	mov    %esp,%ebp
    59e5:	83 ec 18             	sub    $0x18,%esp
    59e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    59eb:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    59ee:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    59f5:	00 
    59f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    59f9:	89 44 24 04          	mov    %eax,0x4(%esp)
    59fd:	8b 45 08             	mov    0x8(%ebp),%eax
    5a00:	89 04 24             	mov    %eax,(%esp)
    5a03:	e8 f2 fe ff ff       	call   58fa <write>
}
    5a08:	c9                   	leave  
    5a09:	c3                   	ret    

00005a0a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    5a0a:	55                   	push   %ebp
    5a0b:	89 e5                	mov    %esp,%ebp
    5a0d:	56                   	push   %esi
    5a0e:	53                   	push   %ebx
    5a0f:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    5a12:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    5a19:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    5a1d:	74 17                	je     5a36 <printint+0x2c>
    5a1f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5a23:	79 11                	jns    5a36 <printint+0x2c>
    neg = 1;
    5a25:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    5a2c:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a2f:	f7 d8                	neg    %eax
    5a31:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5a34:	eb 06                	jmp    5a3c <printint+0x32>
  } else {
    x = xx;
    5a36:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a39:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    5a3c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    5a43:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5a46:	8d 41 01             	lea    0x1(%ecx),%eax
    5a49:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5a4c:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5a4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5a52:	ba 00 00 00 00       	mov    $0x0,%edx
    5a57:	f7 f3                	div    %ebx
    5a59:	89 d0                	mov    %edx,%eax
    5a5b:	0f b6 80 bc 09 01 00 	movzbl 0x109bc(%eax),%eax
    5a62:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    5a66:	8b 75 10             	mov    0x10(%ebp),%esi
    5a69:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5a6c:	ba 00 00 00 00       	mov    $0x0,%edx
    5a71:	f7 f6                	div    %esi
    5a73:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5a76:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5a7a:	75 c7                	jne    5a43 <printint+0x39>
  if(neg)
    5a7c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5a80:	74 10                	je     5a92 <printint+0x88>
    buf[i++] = '-';
    5a82:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a85:	8d 50 01             	lea    0x1(%eax),%edx
    5a88:	89 55 f4             	mov    %edx,-0xc(%ebp)
    5a8b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    5a90:	eb 1f                	jmp    5ab1 <printint+0xa7>
    5a92:	eb 1d                	jmp    5ab1 <printint+0xa7>
    putc(fd, buf[i]);
    5a94:	8d 55 dc             	lea    -0x24(%ebp),%edx
    5a97:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a9a:	01 d0                	add    %edx,%eax
    5a9c:	0f b6 00             	movzbl (%eax),%eax
    5a9f:	0f be c0             	movsbl %al,%eax
    5aa2:	89 44 24 04          	mov    %eax,0x4(%esp)
    5aa6:	8b 45 08             	mov    0x8(%ebp),%eax
    5aa9:	89 04 24             	mov    %eax,(%esp)
    5aac:	e8 31 ff ff ff       	call   59e2 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    5ab1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    5ab5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5ab9:	79 d9                	jns    5a94 <printint+0x8a>
    putc(fd, buf[i]);
}
    5abb:	83 c4 30             	add    $0x30,%esp
    5abe:	5b                   	pop    %ebx
    5abf:	5e                   	pop    %esi
    5ac0:	5d                   	pop    %ebp
    5ac1:	c3                   	ret    

00005ac2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    5ac2:	55                   	push   %ebp
    5ac3:	89 e5                	mov    %esp,%ebp
    5ac5:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    5ac8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    5acf:	8d 45 0c             	lea    0xc(%ebp),%eax
    5ad2:	83 c0 04             	add    $0x4,%eax
    5ad5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    5ad8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5adf:	e9 7c 01 00 00       	jmp    5c60 <printf+0x19e>
    c = fmt[i] & 0xff;
    5ae4:	8b 55 0c             	mov    0xc(%ebp),%edx
    5ae7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5aea:	01 d0                	add    %edx,%eax
    5aec:	0f b6 00             	movzbl (%eax),%eax
    5aef:	0f be c0             	movsbl %al,%eax
    5af2:	25 ff 00 00 00       	and    $0xff,%eax
    5af7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    5afa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5afe:	75 2c                	jne    5b2c <printf+0x6a>
      if(c == '%'){
    5b00:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    5b04:	75 0c                	jne    5b12 <printf+0x50>
        state = '%';
    5b06:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    5b0d:	e9 4a 01 00 00       	jmp    5c5c <printf+0x19a>
      } else {
        putc(fd, c);
    5b12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5b15:	0f be c0             	movsbl %al,%eax
    5b18:	89 44 24 04          	mov    %eax,0x4(%esp)
    5b1c:	8b 45 08             	mov    0x8(%ebp),%eax
    5b1f:	89 04 24             	mov    %eax,(%esp)
    5b22:	e8 bb fe ff ff       	call   59e2 <putc>
    5b27:	e9 30 01 00 00       	jmp    5c5c <printf+0x19a>
      }
    } else if(state == '%'){
    5b2c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    5b30:	0f 85 26 01 00 00    	jne    5c5c <printf+0x19a>
      if(c == 'd'){
    5b36:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    5b3a:	75 2d                	jne    5b69 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    5b3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5b3f:	8b 00                	mov    (%eax),%eax
    5b41:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5b48:	00 
    5b49:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    5b50:	00 
    5b51:	89 44 24 04          	mov    %eax,0x4(%esp)
    5b55:	8b 45 08             	mov    0x8(%ebp),%eax
    5b58:	89 04 24             	mov    %eax,(%esp)
    5b5b:	e8 aa fe ff ff       	call   5a0a <printint>
        ap++;
    5b60:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5b64:	e9 ec 00 00 00       	jmp    5c55 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    5b69:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    5b6d:	74 06                	je     5b75 <printf+0xb3>
    5b6f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    5b73:	75 2d                	jne    5ba2 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    5b75:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5b78:	8b 00                	mov    (%eax),%eax
    5b7a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    5b81:	00 
    5b82:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    5b89:	00 
    5b8a:	89 44 24 04          	mov    %eax,0x4(%esp)
    5b8e:	8b 45 08             	mov    0x8(%ebp),%eax
    5b91:	89 04 24             	mov    %eax,(%esp)
    5b94:	e8 71 fe ff ff       	call   5a0a <printint>
        ap++;
    5b99:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5b9d:	e9 b3 00 00 00       	jmp    5c55 <printf+0x193>
      } else if(c == 's'){
    5ba2:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    5ba6:	75 45                	jne    5bed <printf+0x12b>
        s = (char*)*ap;
    5ba8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5bab:	8b 00                	mov    (%eax),%eax
    5bad:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    5bb0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    5bb4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5bb8:	75 09                	jne    5bc3 <printf+0x101>
          s = "(null)";
    5bba:	c7 45 f4 83 c8 00 00 	movl   $0xc883,-0xc(%ebp)
        while(*s != 0){
    5bc1:	eb 1e                	jmp    5be1 <printf+0x11f>
    5bc3:	eb 1c                	jmp    5be1 <printf+0x11f>
          putc(fd, *s);
    5bc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bc8:	0f b6 00             	movzbl (%eax),%eax
    5bcb:	0f be c0             	movsbl %al,%eax
    5bce:	89 44 24 04          	mov    %eax,0x4(%esp)
    5bd2:	8b 45 08             	mov    0x8(%ebp),%eax
    5bd5:	89 04 24             	mov    %eax,(%esp)
    5bd8:	e8 05 fe ff ff       	call   59e2 <putc>
          s++;
    5bdd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    5be1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5be4:	0f b6 00             	movzbl (%eax),%eax
    5be7:	84 c0                	test   %al,%al
    5be9:	75 da                	jne    5bc5 <printf+0x103>
    5beb:	eb 68                	jmp    5c55 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    5bed:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    5bf1:	75 1d                	jne    5c10 <printf+0x14e>
        putc(fd, *ap);
    5bf3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5bf6:	8b 00                	mov    (%eax),%eax
    5bf8:	0f be c0             	movsbl %al,%eax
    5bfb:	89 44 24 04          	mov    %eax,0x4(%esp)
    5bff:	8b 45 08             	mov    0x8(%ebp),%eax
    5c02:	89 04 24             	mov    %eax,(%esp)
    5c05:	e8 d8 fd ff ff       	call   59e2 <putc>
        ap++;
    5c0a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5c0e:	eb 45                	jmp    5c55 <printf+0x193>
      } else if(c == '%'){
    5c10:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    5c14:	75 17                	jne    5c2d <printf+0x16b>
        putc(fd, c);
    5c16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c19:	0f be c0             	movsbl %al,%eax
    5c1c:	89 44 24 04          	mov    %eax,0x4(%esp)
    5c20:	8b 45 08             	mov    0x8(%ebp),%eax
    5c23:	89 04 24             	mov    %eax,(%esp)
    5c26:	e8 b7 fd ff ff       	call   59e2 <putc>
    5c2b:	eb 28                	jmp    5c55 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    5c2d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    5c34:	00 
    5c35:	8b 45 08             	mov    0x8(%ebp),%eax
    5c38:	89 04 24             	mov    %eax,(%esp)
    5c3b:	e8 a2 fd ff ff       	call   59e2 <putc>
        putc(fd, c);
    5c40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c43:	0f be c0             	movsbl %al,%eax
    5c46:	89 44 24 04          	mov    %eax,0x4(%esp)
    5c4a:	8b 45 08             	mov    0x8(%ebp),%eax
    5c4d:	89 04 24             	mov    %eax,(%esp)
    5c50:	e8 8d fd ff ff       	call   59e2 <putc>
      }
      state = 0;
    5c55:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    5c5c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5c60:	8b 55 0c             	mov    0xc(%ebp),%edx
    5c63:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5c66:	01 d0                	add    %edx,%eax
    5c68:	0f b6 00             	movzbl (%eax),%eax
    5c6b:	84 c0                	test   %al,%al
    5c6d:	0f 85 71 fe ff ff    	jne    5ae4 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    5c73:	c9                   	leave  
    5c74:	c3                   	ret    

00005c75 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    5c75:	55                   	push   %ebp
    5c76:	89 e5                	mov    %esp,%ebp
    5c78:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    5c7b:	8b 45 08             	mov    0x8(%ebp),%eax
    5c7e:	83 e8 08             	sub    $0x8,%eax
    5c81:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5c84:	a1 e0 0e 01 00       	mov    0x10ee0,%eax
    5c89:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5c8c:	eb 24                	jmp    5cb2 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    5c8e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5c91:	8b 00                	mov    (%eax),%eax
    5c93:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    5c96:	77 12                	ja     5caa <free+0x35>
    5c98:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5c9b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    5c9e:	77 24                	ja     5cc4 <free+0x4f>
    5ca0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5ca3:	8b 00                	mov    (%eax),%eax
    5ca5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    5ca8:	77 1a                	ja     5cc4 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5caa:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5cad:	8b 00                	mov    (%eax),%eax
    5caf:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5cb2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5cb5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    5cb8:	76 d4                	jbe    5c8e <free+0x19>
    5cba:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5cbd:	8b 00                	mov    (%eax),%eax
    5cbf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    5cc2:	76 ca                	jbe    5c8e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    5cc4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5cc7:	8b 40 04             	mov    0x4(%eax),%eax
    5cca:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    5cd1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5cd4:	01 c2                	add    %eax,%edx
    5cd6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5cd9:	8b 00                	mov    (%eax),%eax
    5cdb:	39 c2                	cmp    %eax,%edx
    5cdd:	75 24                	jne    5d03 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    5cdf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5ce2:	8b 50 04             	mov    0x4(%eax),%edx
    5ce5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5ce8:	8b 00                	mov    (%eax),%eax
    5cea:	8b 40 04             	mov    0x4(%eax),%eax
    5ced:	01 c2                	add    %eax,%edx
    5cef:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5cf2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    5cf5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5cf8:	8b 00                	mov    (%eax),%eax
    5cfa:	8b 10                	mov    (%eax),%edx
    5cfc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5cff:	89 10                	mov    %edx,(%eax)
    5d01:	eb 0a                	jmp    5d0d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    5d03:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5d06:	8b 10                	mov    (%eax),%edx
    5d08:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5d0b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    5d0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5d10:	8b 40 04             	mov    0x4(%eax),%eax
    5d13:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    5d1a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5d1d:	01 d0                	add    %edx,%eax
    5d1f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    5d22:	75 20                	jne    5d44 <free+0xcf>
    p->s.size += bp->s.size;
    5d24:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5d27:	8b 50 04             	mov    0x4(%eax),%edx
    5d2a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5d2d:	8b 40 04             	mov    0x4(%eax),%eax
    5d30:	01 c2                	add    %eax,%edx
    5d32:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5d35:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    5d38:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5d3b:	8b 10                	mov    (%eax),%edx
    5d3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5d40:	89 10                	mov    %edx,(%eax)
    5d42:	eb 08                	jmp    5d4c <free+0xd7>
  } else
    p->s.ptr = bp;
    5d44:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5d47:	8b 55 f8             	mov    -0x8(%ebp),%edx
    5d4a:	89 10                	mov    %edx,(%eax)
  freep = p;
    5d4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5d4f:	a3 e0 0e 01 00       	mov    %eax,0x10ee0
}
    5d54:	c9                   	leave  
    5d55:	c3                   	ret    

00005d56 <morecore>:

static Header*
morecore(uint nu)
{
    5d56:	55                   	push   %ebp
    5d57:	89 e5                	mov    %esp,%ebp
    5d59:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    5d5c:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    5d63:	77 07                	ja     5d6c <morecore+0x16>
    nu = 4096;
    5d65:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    5d6c:	8b 45 08             	mov    0x8(%ebp),%eax
    5d6f:	c1 e0 03             	shl    $0x3,%eax
    5d72:	89 04 24             	mov    %eax,(%esp)
    5d75:	e8 e8 fb ff ff       	call   5962 <sbrk>
    5d7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    5d7d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    5d81:	75 07                	jne    5d8a <morecore+0x34>
    return 0;
    5d83:	b8 00 00 00 00       	mov    $0x0,%eax
    5d88:	eb 22                	jmp    5dac <morecore+0x56>
  hp = (Header*)p;
    5d8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5d8d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    5d90:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5d93:	8b 55 08             	mov    0x8(%ebp),%edx
    5d96:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    5d99:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5d9c:	83 c0 08             	add    $0x8,%eax
    5d9f:	89 04 24             	mov    %eax,(%esp)
    5da2:	e8 ce fe ff ff       	call   5c75 <free>
  return freep;
    5da7:	a1 e0 0e 01 00       	mov    0x10ee0,%eax
}
    5dac:	c9                   	leave  
    5dad:	c3                   	ret    

00005dae <malloc>:

void*
malloc(uint nbytes)
{
    5dae:	55                   	push   %ebp
    5daf:	89 e5                	mov    %esp,%ebp
    5db1:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    5db4:	8b 45 08             	mov    0x8(%ebp),%eax
    5db7:	83 c0 07             	add    $0x7,%eax
    5dba:	c1 e8 03             	shr    $0x3,%eax
    5dbd:	83 c0 01             	add    $0x1,%eax
    5dc0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    5dc3:	a1 e0 0e 01 00       	mov    0x10ee0,%eax
    5dc8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5dcb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5dcf:	75 23                	jne    5df4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    5dd1:	c7 45 f0 d8 0e 01 00 	movl   $0x10ed8,-0x10(%ebp)
    5dd8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5ddb:	a3 e0 0e 01 00       	mov    %eax,0x10ee0
    5de0:	a1 e0 0e 01 00       	mov    0x10ee0,%eax
    5de5:	a3 d8 0e 01 00       	mov    %eax,0x10ed8
    base.s.size = 0;
    5dea:	c7 05 dc 0e 01 00 00 	movl   $0x0,0x10edc
    5df1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5df4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5df7:	8b 00                	mov    (%eax),%eax
    5df9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    5dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5dff:	8b 40 04             	mov    0x4(%eax),%eax
    5e02:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    5e05:	72 4d                	jb     5e54 <malloc+0xa6>
      if(p->s.size == nunits)
    5e07:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e0a:	8b 40 04             	mov    0x4(%eax),%eax
    5e0d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    5e10:	75 0c                	jne    5e1e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    5e12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e15:	8b 10                	mov    (%eax),%edx
    5e17:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5e1a:	89 10                	mov    %edx,(%eax)
    5e1c:	eb 26                	jmp    5e44 <malloc+0x96>
      else {
        p->s.size -= nunits;
    5e1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e21:	8b 40 04             	mov    0x4(%eax),%eax
    5e24:	2b 45 ec             	sub    -0x14(%ebp),%eax
    5e27:	89 c2                	mov    %eax,%edx
    5e29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e2c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    5e2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e32:	8b 40 04             	mov    0x4(%eax),%eax
    5e35:	c1 e0 03             	shl    $0x3,%eax
    5e38:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    5e3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e3e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5e41:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    5e44:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5e47:	a3 e0 0e 01 00       	mov    %eax,0x10ee0
      return (void*)(p + 1);
    5e4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e4f:	83 c0 08             	add    $0x8,%eax
    5e52:	eb 38                	jmp    5e8c <malloc+0xde>
    }
    if(p == freep)
    5e54:	a1 e0 0e 01 00       	mov    0x10ee0,%eax
    5e59:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    5e5c:	75 1b                	jne    5e79 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    5e5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5e61:	89 04 24             	mov    %eax,(%esp)
    5e64:	e8 ed fe ff ff       	call   5d56 <morecore>
    5e69:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5e6c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5e70:	75 07                	jne    5e79 <malloc+0xcb>
        return 0;
    5e72:	b8 00 00 00 00       	mov    $0x0,%eax
    5e77:	eb 13                	jmp    5e8c <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5e79:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e7c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5e7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e82:	8b 00                	mov    (%eax),%eax
    5e84:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    5e87:	e9 70 ff ff ff       	jmp    5dfc <malloc+0x4e>
}
    5e8c:	c9                   	leave  
    5e8d:	c3                   	ret    

00005e8e <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    5e8e:	55                   	push   %ebp
    5e8f:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    5e91:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    5e95:	79 07                	jns    5e9e <abs+0x10>
		return x * -1;
    5e97:	8b 45 08             	mov    0x8(%ebp),%eax
    5e9a:	f7 d8                	neg    %eax
    5e9c:	eb 03                	jmp    5ea1 <abs+0x13>
	else
		return x;
    5e9e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    5ea1:	5d                   	pop    %ebp
    5ea2:	c3                   	ret    

00005ea3 <sin>:
double sin(double x)  
{  
    5ea3:	55                   	push   %ebp
    5ea4:	89 e5                	mov    %esp,%ebp
    5ea6:	83 ec 3c             	sub    $0x3c,%esp
    5ea9:	8b 45 08             	mov    0x8(%ebp),%eax
    5eac:	89 45 c8             	mov    %eax,-0x38(%ebp)
    5eaf:	8b 45 0c             	mov    0xc(%ebp),%eax
    5eb2:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    5eb5:	dd 45 c8             	fldl   -0x38(%ebp)
    5eb8:	dd 5d f8             	fstpl  -0x8(%ebp)
    5ebb:	d9 e8                	fld1   
    5ebd:	dd 5d f0             	fstpl  -0x10(%ebp)
    5ec0:	dd 45 c8             	fldl   -0x38(%ebp)
    5ec3:	dd 5d e8             	fstpl  -0x18(%ebp)
    5ec6:	dd 45 c8             	fldl   -0x38(%ebp)
    5ec9:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    5ecc:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    5ed3:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    5eda:	eb 50                	jmp    5f2c <sin+0x89>
	{  
		n = n+1;  
    5edc:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    5ee0:	db 45 dc             	fildl  -0x24(%ebp)
    5ee3:	dc 4d f0             	fmull  -0x10(%ebp)
    5ee6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    5ee9:	83 c0 01             	add    $0x1,%eax
    5eec:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    5eef:	db 45 c4             	fildl  -0x3c(%ebp)
    5ef2:	de c9                	fmulp  %st,%st(1)
    5ef4:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    5ef7:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    5efb:	dd 45 c8             	fldl   -0x38(%ebp)
    5efe:	dc 4d c8             	fmull  -0x38(%ebp)
    5f01:	dd 45 e8             	fldl   -0x18(%ebp)
    5f04:	de c9                	fmulp  %st,%st(1)
    5f06:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    5f09:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    5f0c:	dd 45 e8             	fldl   -0x18(%ebp)
    5f0f:	dc 75 f0             	fdivl  -0x10(%ebp)
    5f12:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    5f15:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    5f19:	7e 08                	jle    5f23 <sin+0x80>
    5f1b:	dd 45 f8             	fldl   -0x8(%ebp)
    5f1e:	dc 45 e0             	faddl  -0x20(%ebp)
    5f21:	eb 06                	jmp    5f29 <sin+0x86>
    5f23:	dd 45 f8             	fldl   -0x8(%ebp)
    5f26:	dc 65 e0             	fsubl  -0x20(%ebp)
    5f29:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    5f2c:	dd 45 e0             	fldl   -0x20(%ebp)
    5f2f:	dd 05 90 c8 00 00    	fldl   0xc890
    5f35:	d9 c9                	fxch   %st(1)
    5f37:	df e9                	fucomip %st(1),%st
    5f39:	dd d8                	fstp   %st(0)
    5f3b:	77 9f                	ja     5edc <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    5f3d:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    5f40:	c9                   	leave  
    5f41:	c3                   	ret    

00005f42 <cos>:
double cos(double x)  
{  
    5f42:	55                   	push   %ebp
    5f43:	89 e5                	mov    %esp,%ebp
    5f45:	83 ec 10             	sub    $0x10,%esp
    5f48:	8b 45 08             	mov    0x8(%ebp),%eax
    5f4b:	89 45 f8             	mov    %eax,-0x8(%ebp)
    5f4e:	8b 45 0c             	mov    0xc(%ebp),%eax
    5f51:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    5f54:	dd 05 98 c8 00 00    	fldl   0xc898
    5f5a:	dc 65 f8             	fsubl  -0x8(%ebp)
    5f5d:	dd 1c 24             	fstpl  (%esp)
    5f60:	e8 3e ff ff ff       	call   5ea3 <sin>
}  
    5f65:	c9                   	leave  
    5f66:	c3                   	ret    

00005f67 <tan>:
double tan(double x)  
{  
    5f67:	55                   	push   %ebp
    5f68:	89 e5                	mov    %esp,%ebp
    5f6a:	83 ec 18             	sub    $0x18,%esp
    5f6d:	8b 45 08             	mov    0x8(%ebp),%eax
    5f70:	89 45 f8             	mov    %eax,-0x8(%ebp)
    5f73:	8b 45 0c             	mov    0xc(%ebp),%eax
    5f76:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    5f79:	dd 45 f8             	fldl   -0x8(%ebp)
    5f7c:	dd 1c 24             	fstpl  (%esp)
    5f7f:	e8 1f ff ff ff       	call   5ea3 <sin>
    5f84:	dd 5d f0             	fstpl  -0x10(%ebp)
    5f87:	dd 45 f8             	fldl   -0x8(%ebp)
    5f8a:	dd 1c 24             	fstpl  (%esp)
    5f8d:	e8 b0 ff ff ff       	call   5f42 <cos>
    5f92:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    5f95:	c9                   	leave  
    5f96:	c3                   	ret    

00005f97 <pow>:

double pow(double x, double y)
{
    5f97:	55                   	push   %ebp
    5f98:	89 e5                	mov    %esp,%ebp
    5f9a:	83 ec 48             	sub    $0x48,%esp
    5f9d:	8b 45 08             	mov    0x8(%ebp),%eax
    5fa0:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5fa3:	8b 45 0c             	mov    0xc(%ebp),%eax
    5fa6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5fa9:	8b 45 10             	mov    0x10(%ebp),%eax
    5fac:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5faf:	8b 45 14             	mov    0x14(%ebp),%eax
    5fb2:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    5fb5:	dd 45 e0             	fldl   -0x20(%ebp)
    5fb8:	d9 ee                	fldz   
    5fba:	df e9                	fucomip %st(1),%st
    5fbc:	dd d8                	fstp   %st(0)
    5fbe:	7a 28                	jp     5fe8 <pow+0x51>
    5fc0:	dd 45 e0             	fldl   -0x20(%ebp)
    5fc3:	d9 ee                	fldz   
    5fc5:	df e9                	fucomip %st(1),%st
    5fc7:	dd d8                	fstp   %st(0)
    5fc9:	75 1d                	jne    5fe8 <pow+0x51>
    5fcb:	dd 45 d8             	fldl   -0x28(%ebp)
    5fce:	d9 ee                	fldz   
    5fd0:	df e9                	fucomip %st(1),%st
    5fd2:	dd d8                	fstp   %st(0)
    5fd4:	7a 0b                	jp     5fe1 <pow+0x4a>
    5fd6:	dd 45 d8             	fldl   -0x28(%ebp)
    5fd9:	d9 ee                	fldz   
    5fdb:	df e9                	fucomip %st(1),%st
    5fdd:	dd d8                	fstp   %st(0)
    5fdf:	74 07                	je     5fe8 <pow+0x51>
    5fe1:	d9 ee                	fldz   
    5fe3:	e9 30 01 00 00       	jmp    6118 <pow+0x181>
	else if(x==0 && y==0) return 1;
    5fe8:	dd 45 e0             	fldl   -0x20(%ebp)
    5feb:	d9 ee                	fldz   
    5fed:	df e9                	fucomip %st(1),%st
    5fef:	dd d8                	fstp   %st(0)
    5ff1:	7a 28                	jp     601b <pow+0x84>
    5ff3:	dd 45 e0             	fldl   -0x20(%ebp)
    5ff6:	d9 ee                	fldz   
    5ff8:	df e9                	fucomip %st(1),%st
    5ffa:	dd d8                	fstp   %st(0)
    5ffc:	75 1d                	jne    601b <pow+0x84>
    5ffe:	dd 45 d8             	fldl   -0x28(%ebp)
    6001:	d9 ee                	fldz   
    6003:	df e9                	fucomip %st(1),%st
    6005:	dd d8                	fstp   %st(0)
    6007:	7a 12                	jp     601b <pow+0x84>
    6009:	dd 45 d8             	fldl   -0x28(%ebp)
    600c:	d9 ee                	fldz   
    600e:	df e9                	fucomip %st(1),%st
    6010:	dd d8                	fstp   %st(0)
    6012:	75 07                	jne    601b <pow+0x84>
    6014:	d9 e8                	fld1   
    6016:	e9 fd 00 00 00       	jmp    6118 <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    601b:	d9 ee                	fldz   
    601d:	dd 45 d8             	fldl   -0x28(%ebp)
    6020:	d9 c9                	fxch   %st(1)
    6022:	df e9                	fucomip %st(1),%st
    6024:	dd d8                	fstp   %st(0)
    6026:	76 1d                	jbe    6045 <pow+0xae>
    6028:	dd 45 d8             	fldl   -0x28(%ebp)
    602b:	d9 e0                	fchs   
    602d:	dd 5c 24 08          	fstpl  0x8(%esp)
    6031:	dd 45 e0             	fldl   -0x20(%ebp)
    6034:	dd 1c 24             	fstpl  (%esp)
    6037:	e8 5b ff ff ff       	call   5f97 <pow>
    603c:	d9 e8                	fld1   
    603e:	de f1                	fdivp  %st,%st(1)
    6040:	e9 d3 00 00 00       	jmp    6118 <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    6045:	d9 ee                	fldz   
    6047:	dd 45 e0             	fldl   -0x20(%ebp)
    604a:	d9 c9                	fxch   %st(1)
    604c:	df e9                	fucomip %st(1),%st
    604e:	dd d8                	fstp   %st(0)
    6050:	76 40                	jbe    6092 <pow+0xfb>
    6052:	dd 45 d8             	fldl   -0x28(%ebp)
    6055:	d9 7d d6             	fnstcw -0x2a(%ebp)
    6058:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    605c:	b4 0c                	mov    $0xc,%ah
    605e:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    6062:	d9 6d d4             	fldcw  -0x2c(%ebp)
    6065:	db 5d d0             	fistpl -0x30(%ebp)
    6068:	d9 6d d6             	fldcw  -0x2a(%ebp)
    606b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    606e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    6071:	db 45 d0             	fildl  -0x30(%ebp)
    6074:	dd 45 d8             	fldl   -0x28(%ebp)
    6077:	de e1                	fsubp  %st,%st(1)
    6079:	d9 ee                	fldz   
    607b:	df e9                	fucomip %st(1),%st
    607d:	7a 0a                	jp     6089 <pow+0xf2>
    607f:	d9 ee                	fldz   
    6081:	df e9                	fucomip %st(1),%st
    6083:	dd d8                	fstp   %st(0)
    6085:	74 0b                	je     6092 <pow+0xfb>
    6087:	eb 02                	jmp    608b <pow+0xf4>
    6089:	dd d8                	fstp   %st(0)
    608b:	d9 ee                	fldz   
    608d:	e9 86 00 00 00       	jmp    6118 <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    6092:	d9 ee                	fldz   
    6094:	dd 45 e0             	fldl   -0x20(%ebp)
    6097:	d9 c9                	fxch   %st(1)
    6099:	df e9                	fucomip %st(1),%st
    609b:	dd d8                	fstp   %st(0)
    609d:	76 63                	jbe    6102 <pow+0x16b>
    609f:	dd 45 d8             	fldl   -0x28(%ebp)
    60a2:	d9 7d d6             	fnstcw -0x2a(%ebp)
    60a5:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    60a9:	b4 0c                	mov    $0xc,%ah
    60ab:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    60af:	d9 6d d4             	fldcw  -0x2c(%ebp)
    60b2:	db 5d d0             	fistpl -0x30(%ebp)
    60b5:	d9 6d d6             	fldcw  -0x2a(%ebp)
    60b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    60bb:	89 45 d0             	mov    %eax,-0x30(%ebp)
    60be:	db 45 d0             	fildl  -0x30(%ebp)
    60c1:	dd 45 d8             	fldl   -0x28(%ebp)
    60c4:	de e1                	fsubp  %st,%st(1)
    60c6:	d9 ee                	fldz   
    60c8:	df e9                	fucomip %st(1),%st
    60ca:	7a 34                	jp     6100 <pow+0x169>
    60cc:	d9 ee                	fldz   
    60ce:	df e9                	fucomip %st(1),%st
    60d0:	dd d8                	fstp   %st(0)
    60d2:	75 2e                	jne    6102 <pow+0x16b>
	{
		double powint=1;
    60d4:	d9 e8                	fld1   
    60d6:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    60d9:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    60e0:	eb 0d                	jmp    60ef <pow+0x158>
    60e2:	dd 45 f0             	fldl   -0x10(%ebp)
    60e5:	dc 4d e0             	fmull  -0x20(%ebp)
    60e8:	dd 5d f0             	fstpl  -0x10(%ebp)
    60eb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    60ef:	db 45 ec             	fildl  -0x14(%ebp)
    60f2:	dd 45 d8             	fldl   -0x28(%ebp)
    60f5:	df e9                	fucomip %st(1),%st
    60f7:	dd d8                	fstp   %st(0)
    60f9:	73 e7                	jae    60e2 <pow+0x14b>
		return powint;
    60fb:	dd 45 f0             	fldl   -0x10(%ebp)
    60fe:	eb 18                	jmp    6118 <pow+0x181>
    6100:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    6102:	dd 45 e0             	fldl   -0x20(%ebp)
    6105:	dd 1c 24             	fstpl  (%esp)
    6108:	e8 36 00 00 00       	call   6143 <ln>
    610d:	dc 4d d8             	fmull  -0x28(%ebp)
    6110:	dd 1c 24             	fstpl  (%esp)
    6113:	e8 0e 02 00 00       	call   6326 <exp>
}
    6118:	c9                   	leave  
    6119:	c3                   	ret    

0000611a <sqrt>:
// 求根
double sqrt(double x)
{
    611a:	55                   	push   %ebp
    611b:	89 e5                	mov    %esp,%ebp
    611d:	83 ec 28             	sub    $0x28,%esp
    6120:	8b 45 08             	mov    0x8(%ebp),%eax
    6123:	89 45 f0             	mov    %eax,-0x10(%ebp)
    6126:	8b 45 0c             	mov    0xc(%ebp),%eax
    6129:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    612c:	dd 05 a0 c8 00 00    	fldl   0xc8a0
    6132:	dd 5c 24 08          	fstpl  0x8(%esp)
    6136:	dd 45 f0             	fldl   -0x10(%ebp)
    6139:	dd 1c 24             	fstpl  (%esp)
    613c:	e8 56 fe ff ff       	call   5f97 <pow>
}
    6141:	c9                   	leave  
    6142:	c3                   	ret    

00006143 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    6143:	55                   	push   %ebp
    6144:	89 e5                	mov    %esp,%ebp
    6146:	81 ec 88 00 00 00    	sub    $0x88,%esp
    614c:	8b 45 08             	mov    0x8(%ebp),%eax
    614f:	89 45 90             	mov    %eax,-0x70(%ebp)
    6152:	8b 45 0c             	mov    0xc(%ebp),%eax
    6155:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    6158:	dd 45 90             	fldl   -0x70(%ebp)
    615b:	d9 e8                	fld1   
    615d:	de e9                	fsubrp %st,%st(1)
    615f:	dd 5d c0             	fstpl  -0x40(%ebp)
    6162:	d9 ee                	fldz   
    6164:	dd 5d f0             	fstpl  -0x10(%ebp)
    6167:	d9 ee                	fldz   
    6169:	dd 5d b8             	fstpl  -0x48(%ebp)
    616c:	d9 ee                	fldz   
    616e:	dd 5d b0             	fstpl  -0x50(%ebp)
    6171:	d9 ee                	fldz   
    6173:	dd 5d e8             	fstpl  -0x18(%ebp)
    6176:	d9 e8                	fld1   
    6178:	dd 5d e0             	fstpl  -0x20(%ebp)
    617b:	d9 e8                	fld1   
    617d:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    6180:	dd 45 90             	fldl   -0x70(%ebp)
    6183:	d9 e8                	fld1   
    6185:	df e9                	fucomip %st(1),%st
    6187:	dd d8                	fstp   %st(0)
    6189:	7a 12                	jp     619d <ln+0x5a>
    618b:	dd 45 90             	fldl   -0x70(%ebp)
    618e:	d9 e8                	fld1   
    6190:	df e9                	fucomip %st(1),%st
    6192:	dd d8                	fstp   %st(0)
    6194:	75 07                	jne    619d <ln+0x5a>
    6196:	d9 ee                	fldz   
    6198:	e9 87 01 00 00       	jmp    6324 <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    619d:	dd 45 90             	fldl   -0x70(%ebp)
    61a0:	dd 05 a8 c8 00 00    	fldl   0xc8a8
    61a6:	d9 c9                	fxch   %st(1)
    61a8:	df e9                	fucomip %st(1),%st
    61aa:	dd d8                	fstp   %st(0)
    61ac:	76 14                	jbe    61c2 <ln+0x7f>
    61ae:	d9 e8                	fld1   
    61b0:	dc 75 90             	fdivl  -0x70(%ebp)
    61b3:	dd 1c 24             	fstpl  (%esp)
    61b6:	e8 88 ff ff ff       	call   6143 <ln>
    61bb:	d9 e0                	fchs   
    61bd:	e9 62 01 00 00       	jmp    6324 <ln+0x1e1>
	else if(x<.1)
    61c2:	dd 05 b0 c8 00 00    	fldl   0xc8b0
    61c8:	dd 45 90             	fldl   -0x70(%ebp)
    61cb:	d9 c9                	fxch   %st(1)
    61cd:	df e9                	fucomip %st(1),%st
    61cf:	dd d8                	fstp   %st(0)
    61d1:	76 59                	jbe    622c <ln+0xe9>
	{
		double n=-1;
    61d3:	d9 e8                	fld1   
    61d5:	d9 e0                	fchs   
    61d7:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    61da:	dd 45 c8             	fldl   -0x38(%ebp)
    61dd:	dd 05 b8 c8 00 00    	fldl   0xc8b8
    61e3:	de e9                	fsubrp %st,%st(1)
    61e5:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    61e8:	dd 45 c8             	fldl   -0x38(%ebp)
    61eb:	dd 1c 24             	fstpl  (%esp)
    61ee:	e8 33 01 00 00       	call   6326 <exp>
    61f3:	dd 45 90             	fldl   -0x70(%ebp)
    61f6:	de f1                	fdivp  %st,%st(1)
    61f8:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    61fb:	dd 45 a0             	fldl   -0x60(%ebp)
    61fe:	dd 05 a8 c8 00 00    	fldl   0xc8a8
    6204:	d9 c9                	fxch   %st(1)
    6206:	df e9                	fucomip %st(1),%st
    6208:	dd d8                	fstp   %st(0)
    620a:	77 ce                	ja     61da <ln+0x97>
    620c:	d9 e8                	fld1   
    620e:	dd 45 a0             	fldl   -0x60(%ebp)
    6211:	d9 c9                	fxch   %st(1)
    6213:	df e9                	fucomip %st(1),%st
    6215:	dd d8                	fstp   %st(0)
    6217:	77 c1                	ja     61da <ln+0x97>
		return ln(a)+n;
    6219:	dd 45 a0             	fldl   -0x60(%ebp)
    621c:	dd 1c 24             	fstpl  (%esp)
    621f:	e8 1f ff ff ff       	call   6143 <ln>
    6224:	dc 45 c8             	faddl  -0x38(%ebp)
    6227:	e9 f8 00 00 00       	jmp    6324 <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    622c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    6233:	d9 e8                	fld1   
    6235:	dd 5d d8             	fstpl  -0x28(%ebp)
    6238:	e9 b6 00 00 00       	jmp    62f3 <ln+0x1b0>
	{
		ln_tmp=ln_px;
    623d:	dd 45 e8             	fldl   -0x18(%ebp)
    6240:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    6243:	dd 45 d8             	fldl   -0x28(%ebp)
    6246:	dc 4d c0             	fmull  -0x40(%ebp)
    6249:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    624c:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    6250:	75 0d                	jne    625f <ln+0x11c>
    6252:	db 45 d4             	fildl  -0x2c(%ebp)
    6255:	dd 45 d8             	fldl   -0x28(%ebp)
    6258:	de f1                	fdivp  %st,%st(1)
    625a:	dd 5d d8             	fstpl  -0x28(%ebp)
    625d:	eb 13                	jmp    6272 <ln+0x12f>
		else tmp=tmp/-l;
    625f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6262:	f7 d8                	neg    %eax
    6264:	89 45 8c             	mov    %eax,-0x74(%ebp)
    6267:	db 45 8c             	fildl  -0x74(%ebp)
    626a:	dd 45 d8             	fldl   -0x28(%ebp)
    626d:	de f1                	fdivp  %st,%st(1)
    626f:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    6272:	dd 45 f0             	fldl   -0x10(%ebp)
    6275:	dc 45 d8             	faddl  -0x28(%ebp)
    6278:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    627b:	dd 45 d8             	fldl   -0x28(%ebp)
    627e:	d9 e0                	fchs   
    6280:	dc 4d c0             	fmull  -0x40(%ebp)
    6283:	db 45 d4             	fildl  -0x2c(%ebp)
    6286:	de c9                	fmulp  %st,%st(1)
    6288:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    628b:	83 c0 01             	add    $0x1,%eax
    628e:	89 45 8c             	mov    %eax,-0x74(%ebp)
    6291:	db 45 8c             	fildl  -0x74(%ebp)
    6294:	de f9                	fdivrp %st,%st(1)
    6296:	dc 45 f0             	faddl  -0x10(%ebp)
    6299:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    629c:	dd 45 d8             	fldl   -0x28(%ebp)
    629f:	dc 4d c0             	fmull  -0x40(%ebp)
    62a2:	dc 4d c0             	fmull  -0x40(%ebp)
    62a5:	db 45 d4             	fildl  -0x2c(%ebp)
    62a8:	de c9                	fmulp  %st,%st(1)
    62aa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    62ad:	83 c0 02             	add    $0x2,%eax
    62b0:	89 45 8c             	mov    %eax,-0x74(%ebp)
    62b3:	db 45 8c             	fildl  -0x74(%ebp)
    62b6:	de f9                	fdivrp %st,%st(1)
    62b8:	dc 45 b8             	faddl  -0x48(%ebp)
    62bb:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    62be:	dd 45 b0             	fldl   -0x50(%ebp)
    62c1:	dc 65 b8             	fsubl  -0x48(%ebp)
    62c4:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    62c7:	dd 45 a8             	fldl   -0x58(%ebp)
    62ca:	dc 4d a8             	fmull  -0x58(%ebp)
    62cd:	dd 45 b8             	fldl   -0x48(%ebp)
    62d0:	d8 c0                	fadd   %st(0),%st
    62d2:	dd 45 b0             	fldl   -0x50(%ebp)
    62d5:	de e1                	fsubp  %st,%st(1)
    62d7:	dc 45 f0             	faddl  -0x10(%ebp)
    62da:	de f9                	fdivrp %st,%st(1)
    62dc:	dd 45 b0             	fldl   -0x50(%ebp)
    62df:	de e1                	fsubp  %st,%st(1)
    62e1:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    62e4:	db 45 d4             	fildl  -0x2c(%ebp)
    62e7:	dd 45 d8             	fldl   -0x28(%ebp)
    62ea:	de c9                	fmulp  %st,%st(1)
    62ec:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    62ef:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    62f3:	dd 45 e8             	fldl   -0x18(%ebp)
    62f6:	dc 65 e0             	fsubl  -0x20(%ebp)
    62f9:	dd 05 c0 c8 00 00    	fldl   0xc8c0
    62ff:	d9 c9                	fxch   %st(1)
    6301:	df e9                	fucomip %st(1),%st
    6303:	dd d8                	fstp   %st(0)
    6305:	0f 87 32 ff ff ff    	ja     623d <ln+0xfa>
    630b:	dd 45 e8             	fldl   -0x18(%ebp)
    630e:	dc 65 e0             	fsubl  -0x20(%ebp)
    6311:	dd 05 c8 c8 00 00    	fldl   0xc8c8
    6317:	df e9                	fucomip %st(1),%st
    6319:	dd d8                	fstp   %st(0)
    631b:	0f 87 1c ff ff ff    	ja     623d <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    6321:	dd 45 e8             	fldl   -0x18(%ebp)
}
    6324:	c9                   	leave  
    6325:	c3                   	ret    

00006326 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    6326:	55                   	push   %ebp
    6327:	89 e5                	mov    %esp,%ebp
    6329:	83 ec 78             	sub    $0x78,%esp
    632c:	8b 45 08             	mov    0x8(%ebp),%eax
    632f:	89 45 a0             	mov    %eax,-0x60(%ebp)
    6332:	8b 45 0c             	mov    0xc(%ebp),%eax
    6335:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    6338:	dd 45 a0             	fldl   -0x60(%ebp)
    633b:	dd 5d c0             	fstpl  -0x40(%ebp)
    633e:	d9 ee                	fldz   
    6340:	dd 5d f0             	fstpl  -0x10(%ebp)
    6343:	d9 ee                	fldz   
    6345:	dd 5d b8             	fstpl  -0x48(%ebp)
    6348:	d9 ee                	fldz   
    634a:	dd 5d b0             	fstpl  -0x50(%ebp)
    634d:	d9 ee                	fldz   
    634f:	dd 5d e8             	fstpl  -0x18(%ebp)
    6352:	d9 e8                	fld1   
    6354:	dd 5d e0             	fstpl  -0x20(%ebp)
    6357:	d9 e8                	fld1   
    6359:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    635c:	dd 45 a0             	fldl   -0x60(%ebp)
    635f:	d9 ee                	fldz   
    6361:	df e9                	fucomip %st(1),%st
    6363:	dd d8                	fstp   %st(0)
    6365:	7a 12                	jp     6379 <exp+0x53>
    6367:	dd 45 a0             	fldl   -0x60(%ebp)
    636a:	d9 ee                	fldz   
    636c:	df e9                	fucomip %st(1),%st
    636e:	dd d8                	fstp   %st(0)
    6370:	75 07                	jne    6379 <exp+0x53>
    6372:	d9 e8                	fld1   
    6374:	e9 08 01 00 00       	jmp    6481 <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    6379:	d9 ee                	fldz   
    637b:	dd 45 a0             	fldl   -0x60(%ebp)
    637e:	d9 c9                	fxch   %st(1)
    6380:	df e9                	fucomip %st(1),%st
    6382:	dd d8                	fstp   %st(0)
    6384:	76 16                	jbe    639c <exp+0x76>
    6386:	dd 45 a0             	fldl   -0x60(%ebp)
    6389:	d9 e0                	fchs   
    638b:	dd 1c 24             	fstpl  (%esp)
    638e:	e8 93 ff ff ff       	call   6326 <exp>
    6393:	d9 e8                	fld1   
    6395:	de f1                	fdivp  %st,%st(1)
    6397:	e9 e5 00 00 00       	jmp    6481 <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    639c:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    63a3:	d9 e8                	fld1   
    63a5:	dd 5d d0             	fstpl  -0x30(%ebp)
    63a8:	e9 92 00 00 00       	jmp    643f <exp+0x119>
	{
		ex_tmp=ex_px;
    63ad:	dd 45 e8             	fldl   -0x18(%ebp)
    63b0:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    63b3:	dd 45 d0             	fldl   -0x30(%ebp)
    63b6:	dc 4d c0             	fmull  -0x40(%ebp)
    63b9:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    63bc:	db 45 cc             	fildl  -0x34(%ebp)
    63bf:	dd 45 d0             	fldl   -0x30(%ebp)
    63c2:	de f1                	fdivp  %st,%st(1)
    63c4:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    63c7:	dd 45 f0             	fldl   -0x10(%ebp)
    63ca:	dc 45 d0             	faddl  -0x30(%ebp)
    63cd:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    63d0:	dd 45 d0             	fldl   -0x30(%ebp)
    63d3:	dc 4d c0             	fmull  -0x40(%ebp)
    63d6:	8b 45 cc             	mov    -0x34(%ebp),%eax
    63d9:	83 c0 01             	add    $0x1,%eax
    63dc:	89 45 9c             	mov    %eax,-0x64(%ebp)
    63df:	db 45 9c             	fildl  -0x64(%ebp)
    63e2:	de f9                	fdivrp %st,%st(1)
    63e4:	dc 45 f0             	faddl  -0x10(%ebp)
    63e7:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    63ea:	dd 45 d0             	fldl   -0x30(%ebp)
    63ed:	dc 4d c0             	fmull  -0x40(%ebp)
    63f0:	dc 4d c0             	fmull  -0x40(%ebp)
    63f3:	8b 45 cc             	mov    -0x34(%ebp),%eax
    63f6:	83 c0 01             	add    $0x1,%eax
    63f9:	89 45 9c             	mov    %eax,-0x64(%ebp)
    63fc:	db 45 9c             	fildl  -0x64(%ebp)
    63ff:	de f9                	fdivrp %st,%st(1)
    6401:	8b 45 cc             	mov    -0x34(%ebp),%eax
    6404:	83 c0 02             	add    $0x2,%eax
    6407:	89 45 9c             	mov    %eax,-0x64(%ebp)
    640a:	db 45 9c             	fildl  -0x64(%ebp)
    640d:	de f9                	fdivrp %st,%st(1)
    640f:	dc 45 b8             	faddl  -0x48(%ebp)
    6412:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    6415:	dd 45 b0             	fldl   -0x50(%ebp)
    6418:	dc 65 b8             	fsubl  -0x48(%ebp)
    641b:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    641e:	dd 45 d8             	fldl   -0x28(%ebp)
    6421:	dc 4d d8             	fmull  -0x28(%ebp)
    6424:	dd 45 b8             	fldl   -0x48(%ebp)
    6427:	d8 c0                	fadd   %st(0),%st
    6429:	dd 45 b0             	fldl   -0x50(%ebp)
    642c:	de e1                	fsubp  %st,%st(1)
    642e:	dc 45 f0             	faddl  -0x10(%ebp)
    6431:	de f9                	fdivrp %st,%st(1)
    6433:	dd 45 b0             	fldl   -0x50(%ebp)
    6436:	de e1                	fsubp  %st,%st(1)
    6438:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    643b:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    643f:	dd 45 e8             	fldl   -0x18(%ebp)
    6442:	dc 65 e0             	fsubl  -0x20(%ebp)
    6445:	dd 05 d0 c8 00 00    	fldl   0xc8d0
    644b:	d9 c9                	fxch   %st(1)
    644d:	df e9                	fucomip %st(1),%st
    644f:	dd d8                	fstp   %st(0)
    6451:	77 12                	ja     6465 <exp+0x13f>
    6453:	dd 45 e8             	fldl   -0x18(%ebp)
    6456:	dc 65 e0             	fsubl  -0x20(%ebp)
    6459:	dd 05 d8 c8 00 00    	fldl   0xc8d8
    645f:	df e9                	fucomip %st(1),%st
    6461:	dd d8                	fstp   %st(0)
    6463:	76 15                	jbe    647a <exp+0x154>
    6465:	dd 45 d8             	fldl   -0x28(%ebp)
    6468:	dd 05 d0 c8 00 00    	fldl   0xc8d0
    646e:	d9 c9                	fxch   %st(1)
    6470:	df e9                	fucomip %st(1),%st
    6472:	dd d8                	fstp   %st(0)
    6474:	0f 87 33 ff ff ff    	ja     63ad <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    647a:	dd 45 e8             	fldl   -0x18(%ebp)
    647d:	d9 e8                	fld1   
    647f:	de c1                	faddp  %st,%st(1)
    6481:	c9                   	leave  
    6482:	c3                   	ret    

00006483 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    6483:	55                   	push   %ebp
    6484:	89 e5                	mov    %esp,%ebp
    6486:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    6489:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    648d:	8b 45 08             	mov    0x8(%ebp),%eax
    6490:	89 44 24 04          	mov    %eax,0x4(%esp)
    6494:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    6497:	89 04 24             	mov    %eax,(%esp)
    649a:	e8 f8 f1 ff ff       	call   5697 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    649f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    64a6:	00 
    64a7:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    64aa:	89 04 24             	mov    %eax,(%esp)
    64ad:	e8 68 f4 ff ff       	call   591a <open>
    64b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    64b5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    64b9:	75 1b                	jne    64d6 <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    64bb:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    64be:	89 44 24 08          	mov    %eax,0x8(%esp)
    64c2:	c7 44 24 04 0c c9 00 	movl   $0xc90c,0x4(%esp)
    64c9:	00 
    64ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    64d1:	e8 ec f5 ff ff       	call   5ac2 <printf>
    }
    return f;
    64d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    64d9:	c9                   	leave  
    64da:	c3                   	ret    

000064db <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    64db:	55                   	push   %ebp
    64dc:	89 e5                	mov    %esp,%ebp
    64de:	57                   	push   %edi
    64df:	56                   	push   %esi
    64e0:	53                   	push   %ebx
    64e1:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    64e4:	8b 45 08             	mov    0x8(%ebp),%eax
    64e7:	8b 00                	mov    (%eax),%eax
    64e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    64ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    64ef:	8b 78 14             	mov    0x14(%eax),%edi
    64f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    64f5:	8b 70 10             	mov    0x10(%eax),%esi
    64f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    64fb:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    64fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6501:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    6504:	85 c0                	test   %eax,%eax
    6506:	0f 94 c0             	sete   %al
    6509:	0f b6 c8             	movzbl %al,%ecx
    650c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    650f:	8b 50 04             	mov    0x4(%eax),%edx
    6512:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6515:	8b 00                	mov    (%eax),%eax
    6517:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    651b:	89 74 24 18          	mov    %esi,0x18(%esp)
    651f:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    6523:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    6527:	89 54 24 0c          	mov    %edx,0xc(%esp)
    652b:	89 44 24 08          	mov    %eax,0x8(%esp)
    652f:	c7 44 24 04 2c c9 00 	movl   $0xc92c,0x4(%esp)
    6536:	00 
    6537:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    653e:	e8 7f f5 ff ff       	call   5ac2 <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    6543:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6546:	8b 78 2c             	mov    0x2c(%eax),%edi
    6549:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    654c:	8b 70 28             	mov    0x28(%eax),%esi
    654f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6552:	8b 58 24             	mov    0x24(%eax),%ebx
    6555:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6558:	8b 48 20             	mov    0x20(%eax),%ecx
    655b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    655e:	8b 50 1c             	mov    0x1c(%eax),%edx
    6561:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6564:	8b 40 18             	mov    0x18(%eax),%eax
    6567:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    656b:	89 74 24 18          	mov    %esi,0x18(%esp)
    656f:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    6573:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    6577:	89 54 24 0c          	mov    %edx,0xc(%esp)
    657b:	89 44 24 08          	mov    %eax,0x8(%esp)
    657f:	c7 44 24 04 6c c9 00 	movl   $0xc96c,0x4(%esp)
    6586:	00 
    6587:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    658e:	e8 2f f5 ff ff       	call   5ac2 <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    6593:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6596:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    6599:	8b 0c 85 e0 0a 01 00 	mov    0x10ae0(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    65a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    65a3:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    65a6:	dd 04 c5 c0 0a 01 00 	fldl   0x10ac0(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    65ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    65b0:	8b 40 04             	mov    0x4(%eax),%eax
    65b3:	8d 50 ff             	lea    -0x1(%eax),%edx
    65b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    65b9:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    65bc:	89 d0                	mov    %edx,%eax
    65be:	c1 e0 04             	shl    $0x4,%eax
    65c1:	29 d0                	sub    %edx,%eax
    65c3:	01 d8                	add    %ebx,%eax
    65c5:	8b 14 85 00 0a 01 00 	mov    0x10a00(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    65cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    65cf:	8b 40 04             	mov    0x4(%eax),%eax
    65d2:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    65d5:	8b 04 85 e0 09 01 00 	mov    0x109e0(,%eax,4),%eax
    65dc:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    65e0:	dd 5c 24 10          	fstpl  0x10(%esp)
    65e4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    65e8:	89 44 24 08          	mov    %eax,0x8(%esp)
    65ec:	c7 44 24 04 94 c9 00 	movl   $0xc994,0x4(%esp)
    65f3:	00 
    65f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    65fb:	e8 c2 f4 ff ff       	call   5ac2 <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    6600:	8b 45 08             	mov    0x8(%ebp),%eax
    6603:	8b 48 08             	mov    0x8(%eax),%ecx
    6606:	8b 45 08             	mov    0x8(%ebp),%eax
    6609:	8b 50 0c             	mov    0xc(%eax),%edx
    660c:	8b 45 08             	mov    0x8(%ebp),%eax
    660f:	8b 40 10             	mov    0x10(%eax),%eax
    6612:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    6616:	89 54 24 0c          	mov    %edx,0xc(%esp)
    661a:	89 44 24 08          	mov    %eax,0x8(%esp)
    661e:	c7 44 24 04 c3 c9 00 	movl   $0xc9c3,0x4(%esp)
    6625:	00 
    6626:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    662d:	e8 90 f4 ff ff       	call   5ac2 <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    6632:	83 c4 3c             	add    $0x3c,%esp
    6635:	5b                   	pop    %ebx
    6636:	5e                   	pop    %esi
    6637:	5f                   	pop    %edi
    6638:	5d                   	pop    %ebp
    6639:	c3                   	ret    

0000663a <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    663a:	55                   	push   %ebp
    663b:	89 e5                	mov    %esp,%ebp
    663d:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    6640:	8b 45 08             	mov    0x8(%ebp),%eax
    6643:	89 04 24             	mov    %eax,(%esp)
    6646:	e8 63 f7 ff ff       	call   5dae <malloc>
    664b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    664e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6652:	74 1c                	je     6670 <mem_alloc+0x36>
		memset(ptr, 0, block);
    6654:	8b 45 08             	mov    0x8(%ebp),%eax
    6657:	89 44 24 08          	mov    %eax,0x8(%esp)
    665b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    6662:	00 
    6663:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6666:	89 04 24             	mov    %eax,(%esp)
    6669:	e8 bf f0 ff ff       	call   572d <memset>
    666e:	eb 20                	jmp    6690 <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    6670:	8b 45 0c             	mov    0xc(%ebp),%eax
    6673:	89 44 24 08          	mov    %eax,0x8(%esp)
    6677:	c7 44 24 04 dd c9 00 	movl   $0xc9dd,0x4(%esp)
    667e:	00 
    667f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6686:	e8 37 f4 ff ff       	call   5ac2 <printf>
		exit();
    668b:	e8 4a f2 ff ff       	call   58da <exit>
	}
	return ptr;
    6690:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    6693:	c9                   	leave  
    6694:	c3                   	ret    

00006695 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    6695:	55                   	push   %ebp
    6696:	89 e5                	mov    %esp,%ebp
    6698:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    669b:	8b 45 0c             	mov    0xc(%ebp),%eax
    669e:	c7 44 24 04 f4 c9 00 	movl   $0xc9f4,0x4(%esp)
    66a5:	00 
    66a6:	89 04 24             	mov    %eax,(%esp)
    66a9:	e8 8c ff ff ff       	call   663a <mem_alloc>
    66ae:	8b 55 08             	mov    0x8(%ebp),%edx
    66b1:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    66b4:	8b 45 08             	mov    0x8(%ebp),%eax
    66b7:	8b 55 0c             	mov    0xc(%ebp),%edx
    66ba:	89 50 08             	mov    %edx,0x8(%eax)
}
    66bd:	c9                   	leave  
    66be:	c3                   	ret    

000066bf <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    66bf:	55                   	push   %ebp
    66c0:	89 e5                	mov    %esp,%ebp
    66c2:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    66c5:	8b 45 08             	mov    0x8(%ebp),%eax
    66c8:	8b 40 04             	mov    0x4(%eax),%eax
    66cb:	89 04 24             	mov    %eax,(%esp)
    66ce:	e8 a2 f5 ff ff       	call   5c75 <free>
}
    66d3:	c9                   	leave  
    66d4:	c3                   	ret    

000066d5 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    66d5:	55                   	push   %ebp
    66d6:	89 e5                	mov    %esp,%ebp
    66d8:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    66db:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    66e2:	00 
    66e3:	8b 45 0c             	mov    0xc(%ebp),%eax
    66e6:	89 04 24             	mov    %eax,(%esp)
    66e9:	e8 2c f2 ff ff       	call   591a <open>
    66ee:	8b 55 08             	mov    0x8(%ebp),%edx
    66f1:	89 02                	mov    %eax,(%edx)
    66f3:	8b 45 08             	mov    0x8(%ebp),%eax
    66f6:	8b 00                	mov    (%eax),%eax
    66f8:	83 f8 ff             	cmp    $0xffffffff,%eax
    66fb:	75 20                	jne    671d <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    66fd:	8b 45 0c             	mov    0xc(%ebp),%eax
    6700:	89 44 24 08          	mov    %eax,0x8(%esp)
    6704:	c7 44 24 04 fb c9 00 	movl   $0xc9fb,0x4(%esp)
    670b:	00 
    670c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6713:	e8 aa f3 ff ff       	call   5ac2 <printf>
		exit();
    6718:	e8 bd f1 ff ff       	call   58da <exit>
	}

	bs->format = BINARY;
    671d:	8b 45 08             	mov    0x8(%ebp),%eax
    6720:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    6724:	8b 45 10             	mov    0x10(%ebp),%eax
    6727:	89 44 24 04          	mov    %eax,0x4(%esp)
    672b:	8b 45 08             	mov    0x8(%ebp),%eax
    672e:	89 04 24             	mov    %eax,(%esp)
    6731:	e8 5f ff ff ff       	call   6695 <alloc_buffer>
	bs->buf_byte_idx=0;
    6736:	8b 45 08             	mov    0x8(%ebp),%eax
    6739:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    6740:	8b 45 08             	mov    0x8(%ebp),%eax
    6743:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    674a:	8b 45 08             	mov    0x8(%ebp),%eax
    674d:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    6754:	8b 45 08             	mov    0x8(%ebp),%eax
    6757:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    675e:	8b 45 08             	mov    0x8(%ebp),%eax
    6761:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    6768:	8b 45 08             	mov    0x8(%ebp),%eax
    676b:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    6772:	c9                   	leave  
    6773:	c3                   	ret    

00006774 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    6774:	55                   	push   %ebp
    6775:	89 e5                	mov    %esp,%ebp
    6777:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    677a:	8b 45 08             	mov    0x8(%ebp),%eax
    677d:	8b 00                	mov    (%eax),%eax
    677f:	89 04 24             	mov    %eax,(%esp)
    6782:	e8 7b f1 ff ff       	call   5902 <close>
	desalloc_buffer(bs);
    6787:	8b 45 08             	mov    0x8(%ebp),%eax
    678a:	89 04 24             	mov    %eax,(%esp)
    678d:	e8 2d ff ff ff       	call   66bf <desalloc_buffer>
}
    6792:	c9                   	leave  
    6793:	c3                   	ret    

00006794 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    6794:	55                   	push   %ebp
    6795:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    6797:	8b 45 08             	mov    0x8(%ebp),%eax
    679a:	8b 40 20             	mov    0x20(%eax),%eax
}
    679d:	5d                   	pop    %ebp
    679e:	c3                   	ret    

0000679f <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    679f:	55                   	push   %ebp
    67a0:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    67a2:	8b 45 08             	mov    0x8(%ebp),%eax
    67a5:	8b 40 0c             	mov    0xc(%eax),%eax
}
    67a8:	5d                   	pop    %ebp
    67a9:	c3                   	ret    

000067aa <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    67aa:	55                   	push   %ebp
    67ab:	89 e5                	mov    %esp,%ebp
    67ad:	56                   	push   %esi
    67ae:	53                   	push   %ebx
    67af:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    67b2:	8b 45 08             	mov    0x8(%ebp),%eax
    67b5:	8b 40 08             	mov    0x8(%eax),%eax
    67b8:	8d 50 fe             	lea    -0x2(%eax),%edx
    67bb:	8b 45 08             	mov    0x8(%ebp),%eax
    67be:	8b 40 10             	mov    0x10(%eax),%eax
    67c1:	89 d3                	mov    %edx,%ebx
    67c3:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    67c5:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    67ca:	eb 35                	jmp    6801 <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    67cc:	8b 45 08             	mov    0x8(%ebp),%eax
    67cf:	8b 50 04             	mov    0x4(%eax),%edx
    67d2:	89 d8                	mov    %ebx,%eax
    67d4:	8d 58 ff             	lea    -0x1(%eax),%ebx
    67d7:	01 c2                	add    %eax,%edx
    67d9:	8b 45 08             	mov    0x8(%ebp),%eax
    67dc:	8b 00                	mov    (%eax),%eax
    67de:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    67e5:	00 
    67e6:	89 54 24 04          	mov    %edx,0x4(%esp)
    67ea:	89 04 24             	mov    %eax,(%esp)
    67ed:	e8 00 f1 ff ff       	call   58f2 <read>
    67f2:	89 c6                	mov    %eax,%esi
		if (!n)
    67f4:	85 f6                	test   %esi,%esi
    67f6:	75 09                	jne    6801 <refill_buffer+0x57>
		bs->eob= i+1;
    67f8:	8d 53 01             	lea    0x1(%ebx),%edx
    67fb:	8b 45 08             	mov    0x8(%ebp),%eax
    67fe:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    6801:	85 db                	test   %ebx,%ebx
    6803:	78 0a                	js     680f <refill_buffer+0x65>
    6805:	8b 45 08             	mov    0x8(%ebp),%eax
    6808:	8b 40 1c             	mov    0x1c(%eax),%eax
    680b:	85 c0                	test   %eax,%eax
    680d:	74 bd                	je     67cc <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    680f:	83 c4 10             	add    $0x10,%esp
    6812:	5b                   	pop    %ebx
    6813:	5e                   	pop    %esi
    6814:	5d                   	pop    %ebp
    6815:	c3                   	ret    

00006816 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    6816:	55                   	push   %ebp
    6817:	89 e5                	mov    %esp,%ebp
    6819:	53                   	push   %ebx
    681a:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    681d:	8b 45 08             	mov    0x8(%ebp),%eax
    6820:	8b 40 0c             	mov    0xc(%eax),%eax
    6823:	8d 50 01             	lea    0x1(%eax),%edx
    6826:	8b 45 08             	mov    0x8(%ebp),%eax
    6829:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    682c:	8b 45 08             	mov    0x8(%ebp),%eax
    682f:	8b 40 14             	mov    0x14(%eax),%eax
    6832:	85 c0                	test   %eax,%eax
    6834:	0f 85 9f 00 00 00    	jne    68d9 <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    683a:	8b 45 08             	mov    0x8(%ebp),%eax
    683d:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    6844:	8b 45 08             	mov    0x8(%ebp),%eax
    6847:	8b 40 10             	mov    0x10(%eax),%eax
    684a:	8d 50 ff             	lea    -0x1(%eax),%edx
    684d:	8b 45 08             	mov    0x8(%ebp),%eax
    6850:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    6853:	8b 45 08             	mov    0x8(%ebp),%eax
    6856:	8b 40 10             	mov    0x10(%eax),%eax
    6859:	83 f8 03             	cmp    $0x3,%eax
    685c:	7e 10                	jle    686e <get1bit+0x58>
    685e:	8b 45 08             	mov    0x8(%ebp),%eax
    6861:	8b 50 10             	mov    0x10(%eax),%edx
    6864:	8b 45 08             	mov    0x8(%ebp),%eax
    6867:	8b 40 1c             	mov    0x1c(%eax),%eax
    686a:	39 c2                	cmp    %eax,%edx
    686c:	7d 6b                	jge    68d9 <get1bit+0xc3>
             if (bs->eob)
    686e:	8b 45 08             	mov    0x8(%ebp),%eax
    6871:	8b 40 1c             	mov    0x1c(%eax),%eax
    6874:	85 c0                	test   %eax,%eax
    6876:	74 0c                	je     6884 <get1bit+0x6e>
                bs->eobs = TRUE;
    6878:	8b 45 08             	mov    0x8(%ebp),%eax
    687b:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    6882:	eb 55                	jmp    68d9 <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    6884:	8b 45 08             	mov    0x8(%ebp),%eax
    6887:	8b 58 10             	mov    0x10(%eax),%ebx
    688a:	eb 2f                	jmp    68bb <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    688c:	8b 45 08             	mov    0x8(%ebp),%eax
    688f:	8b 50 04             	mov    0x4(%eax),%edx
    6892:	8b 45 08             	mov    0x8(%ebp),%eax
    6895:	8b 40 08             	mov    0x8(%eax),%eax
    6898:	8d 48 ff             	lea    -0x1(%eax),%ecx
    689b:	8b 45 08             	mov    0x8(%ebp),%eax
    689e:	8b 40 10             	mov    0x10(%eax),%eax
    68a1:	29 c1                	sub    %eax,%ecx
    68a3:	89 c8                	mov    %ecx,%eax
    68a5:	01 d8                	add    %ebx,%eax
    68a7:	01 c2                	add    %eax,%edx
    68a9:	8b 45 08             	mov    0x8(%ebp),%eax
    68ac:	8b 48 04             	mov    0x4(%eax),%ecx
    68af:	89 d8                	mov    %ebx,%eax
    68b1:	01 c8                	add    %ecx,%eax
    68b3:	0f b6 00             	movzbl (%eax),%eax
    68b6:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    68b8:	83 eb 01             	sub    $0x1,%ebx
    68bb:	85 db                	test   %ebx,%ebx
    68bd:	79 cd                	jns    688c <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    68bf:	8b 45 08             	mov    0x8(%ebp),%eax
    68c2:	89 04 24             	mov    %eax,(%esp)
    68c5:	e8 e0 fe ff ff       	call   67aa <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    68ca:	8b 45 08             	mov    0x8(%ebp),%eax
    68cd:	8b 40 08             	mov    0x8(%eax),%eax
    68d0:	8d 50 ff             	lea    -0x1(%eax),%edx
    68d3:	8b 45 08             	mov    0x8(%ebp),%eax
    68d6:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    68d9:	8b 45 08             	mov    0x8(%ebp),%eax
    68dc:	8b 50 04             	mov    0x4(%eax),%edx
    68df:	8b 45 08             	mov    0x8(%ebp),%eax
    68e2:	8b 40 10             	mov    0x10(%eax),%eax
    68e5:	01 d0                	add    %edx,%eax
    68e7:	0f b6 00             	movzbl (%eax),%eax
    68ea:	0f b6 d0             	movzbl %al,%edx
    68ed:	8b 45 08             	mov    0x8(%ebp),%eax
    68f0:	8b 40 14             	mov    0x14(%eax),%eax
    68f3:	83 e8 01             	sub    $0x1,%eax
    68f6:	8b 04 85 00 0b 01 00 	mov    0x10b00(,%eax,4),%eax
    68fd:	21 d0                	and    %edx,%eax
    68ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    6902:	8b 45 08             	mov    0x8(%ebp),%eax
    6905:	8b 40 14             	mov    0x14(%eax),%eax
    6908:	83 e8 01             	sub    $0x1,%eax
    690b:	89 c1                	mov    %eax,%ecx
    690d:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    6910:	8b 45 08             	mov    0x8(%ebp),%eax
    6913:	8b 40 14             	mov    0x14(%eax),%eax
    6916:	8d 50 ff             	lea    -0x1(%eax),%edx
    6919:	8b 45 08             	mov    0x8(%ebp),%eax
    691c:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    691f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    6922:	83 c4 24             	add    $0x24,%esp
    6925:	5b                   	pop    %ebx
    6926:	5d                   	pop    %ebp
    6927:	c3                   	ret    

00006928 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    6928:	55                   	push   %ebp
    6929:	89 e5                	mov    %esp,%ebp
    692b:	57                   	push   %edi
    692c:	56                   	push   %esi
    692d:	53                   	push   %ebx
    692e:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    6931:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    6938:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    693b:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    693f:	7e 1c                	jle    695d <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    6941:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    6948:	00 
    6949:	c7 44 24 04 14 ca 00 	movl   $0xca14,0x4(%esp)
    6950:	00 
    6951:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6958:	e8 65 f1 ff ff       	call   5ac2 <printf>

	bs->totbit += N;
    695d:	8b 45 08             	mov    0x8(%ebp),%eax
    6960:	8b 50 0c             	mov    0xc(%eax),%edx
    6963:	8b 45 0c             	mov    0xc(%ebp),%eax
    6966:	01 c2                	add    %eax,%edx
    6968:	8b 45 08             	mov    0x8(%ebp),%eax
    696b:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    696e:	e9 0a 01 00 00       	jmp    6a7d <getbits+0x155>
		if (!bs->buf_bit_idx) {
    6973:	8b 45 08             	mov    0x8(%ebp),%eax
    6976:	8b 40 14             	mov    0x14(%eax),%eax
    6979:	85 c0                	test   %eax,%eax
    697b:	0f 85 9f 00 00 00    	jne    6a20 <getbits+0xf8>
			bs->buf_bit_idx = 8;
    6981:	8b 45 08             	mov    0x8(%ebp),%eax
    6984:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    698b:	8b 45 08             	mov    0x8(%ebp),%eax
    698e:	8b 40 10             	mov    0x10(%eax),%eax
    6991:	8d 50 ff             	lea    -0x1(%eax),%edx
    6994:	8b 45 08             	mov    0x8(%ebp),%eax
    6997:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    699a:	8b 45 08             	mov    0x8(%ebp),%eax
    699d:	8b 40 10             	mov    0x10(%eax),%eax
    69a0:	83 f8 03             	cmp    $0x3,%eax
    69a3:	7e 10                	jle    69b5 <getbits+0x8d>
    69a5:	8b 45 08             	mov    0x8(%ebp),%eax
    69a8:	8b 50 10             	mov    0x10(%eax),%edx
    69ab:	8b 45 08             	mov    0x8(%ebp),%eax
    69ae:	8b 40 1c             	mov    0x1c(%eax),%eax
    69b1:	39 c2                	cmp    %eax,%edx
    69b3:	7d 6b                	jge    6a20 <getbits+0xf8>
				if (bs->eob)
    69b5:	8b 45 08             	mov    0x8(%ebp),%eax
    69b8:	8b 40 1c             	mov    0x1c(%eax),%eax
    69bb:	85 c0                	test   %eax,%eax
    69bd:	74 0c                	je     69cb <getbits+0xa3>
					bs->eobs = TRUE;
    69bf:	8b 45 08             	mov    0x8(%ebp),%eax
    69c2:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    69c9:	eb 55                	jmp    6a20 <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    69cb:	8b 45 08             	mov    0x8(%ebp),%eax
    69ce:	8b 70 10             	mov    0x10(%eax),%esi
    69d1:	eb 2f                	jmp    6a02 <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    69d3:	8b 45 08             	mov    0x8(%ebp),%eax
    69d6:	8b 50 04             	mov    0x4(%eax),%edx
    69d9:	8b 45 08             	mov    0x8(%ebp),%eax
    69dc:	8b 40 08             	mov    0x8(%eax),%eax
    69df:	8d 48 ff             	lea    -0x1(%eax),%ecx
    69e2:	8b 45 08             	mov    0x8(%ebp),%eax
    69e5:	8b 40 10             	mov    0x10(%eax),%eax
    69e8:	29 c1                	sub    %eax,%ecx
    69ea:	89 c8                	mov    %ecx,%eax
    69ec:	01 f0                	add    %esi,%eax
    69ee:	01 c2                	add    %eax,%edx
    69f0:	8b 45 08             	mov    0x8(%ebp),%eax
    69f3:	8b 48 04             	mov    0x4(%eax),%ecx
    69f6:	89 f0                	mov    %esi,%eax
    69f8:	01 c8                	add    %ecx,%eax
    69fa:	0f b6 00             	movzbl (%eax),%eax
    69fd:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    69ff:	83 ee 01             	sub    $0x1,%esi
    6a02:	85 f6                	test   %esi,%esi
    6a04:	79 cd                	jns    69d3 <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    6a06:	8b 45 08             	mov    0x8(%ebp),%eax
    6a09:	89 04 24             	mov    %eax,(%esp)
    6a0c:	e8 99 fd ff ff       	call   67aa <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    6a11:	8b 45 08             	mov    0x8(%ebp),%eax
    6a14:	8b 40 08             	mov    0x8(%eax),%eax
    6a17:	8d 50 ff             	lea    -0x1(%eax),%edx
    6a1a:	8b 45 08             	mov    0x8(%ebp),%eax
    6a1d:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    6a20:	8b 45 08             	mov    0x8(%ebp),%eax
    6a23:	8b 40 14             	mov    0x14(%eax),%eax
    6a26:	39 d8                	cmp    %ebx,%eax
    6a28:	0f 4f c3             	cmovg  %ebx,%eax
    6a2b:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    6a2d:	8b 45 08             	mov    0x8(%ebp),%eax
    6a30:	8b 50 04             	mov    0x4(%eax),%edx
    6a33:	8b 45 08             	mov    0x8(%ebp),%eax
    6a36:	8b 40 10             	mov    0x10(%eax),%eax
    6a39:	01 d0                	add    %edx,%eax
    6a3b:	0f b6 00             	movzbl (%eax),%eax
    6a3e:	0f b6 d0             	movzbl %al,%edx
    6a41:	8b 45 08             	mov    0x8(%ebp),%eax
    6a44:	8b 40 14             	mov    0x14(%eax),%eax
    6a47:	8b 04 85 20 0b 01 00 	mov    0x10b20(,%eax,4),%eax
    6a4e:	89 d7                	mov    %edx,%edi
    6a50:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    6a52:	8b 45 08             	mov    0x8(%ebp),%eax
    6a55:	8b 40 14             	mov    0x14(%eax),%eax
    6a58:	29 f0                	sub    %esi,%eax
    6a5a:	89 c1                	mov    %eax,%ecx
    6a5c:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    6a5e:	89 d8                	mov    %ebx,%eax
    6a60:	29 f0                	sub    %esi,%eax
    6a62:	89 c1                	mov    %eax,%ecx
    6a64:	d3 e7                	shl    %cl,%edi
    6a66:	89 f8                	mov    %edi,%eax
    6a68:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    6a6b:	8b 45 08             	mov    0x8(%ebp),%eax
    6a6e:	8b 40 14             	mov    0x14(%eax),%eax
    6a71:	29 f0                	sub    %esi,%eax
    6a73:	89 c2                	mov    %eax,%edx
    6a75:	8b 45 08             	mov    0x8(%ebp),%eax
    6a78:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    6a7b:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    6a7d:	85 db                	test   %ebx,%ebx
    6a7f:	0f 8f ee fe ff ff    	jg     6973 <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    6a85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    6a88:	83 c4 2c             	add    $0x2c,%esp
    6a8b:	5b                   	pop    %ebx
    6a8c:	5e                   	pop    %esi
    6a8d:	5f                   	pop    %edi
    6a8e:	5d                   	pop    %ebp
    6a8f:	c3                   	ret    

00006a90 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    6a90:	55                   	push   %ebp
    6a91:	89 e5                	mov    %esp,%ebp
    6a93:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    6a96:	db 45 10             	fildl  0x10(%ebp)
    6a99:	dd 5c 24 08          	fstpl  0x8(%esp)
    6a9d:	dd 05 80 ca 00 00    	fldl   0xca80
    6aa3:	dd 1c 24             	fstpl  (%esp)
    6aa6:	e8 ec f4 ff ff       	call   5f97 <pow>
    6aab:	d9 7d e6             	fnstcw -0x1a(%ebp)
    6aae:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    6ab2:	b4 0c                	mov    $0xc,%ah
    6ab4:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    6ab8:	d9 6d e4             	fldcw  -0x1c(%ebp)
    6abb:	db 5d e0             	fistpl -0x20(%ebp)
    6abe:	d9 6d e6             	fldcw  -0x1a(%ebp)
    6ac1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6ac4:	83 e8 01             	sub    $0x1,%eax
    6ac7:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    6aca:	8b 45 08             	mov    0x8(%ebp),%eax
    6acd:	89 04 24             	mov    %eax,(%esp)
    6ad0:	e8 ca fc ff ff       	call   679f <sstell>
    6ad5:	83 e0 07             	and    $0x7,%eax
    6ad8:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    6adb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6adf:	74 17                	je     6af8 <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    6ae1:	b8 08 00 00 00       	mov    $0x8,%eax
    6ae6:	2b 45 ec             	sub    -0x14(%ebp),%eax
    6ae9:	89 44 24 04          	mov    %eax,0x4(%esp)
    6aed:	8b 45 08             	mov    0x8(%ebp),%eax
    6af0:	89 04 24             	mov    %eax,(%esp)
    6af3:	e8 30 fe ff ff       	call   6928 <getbits>

	val = getbits(bs, N);
    6af8:	8b 45 10             	mov    0x10(%ebp),%eax
    6afb:	89 44 24 04          	mov    %eax,0x4(%esp)
    6aff:	8b 45 08             	mov    0x8(%ebp),%eax
    6b02:	89 04 24             	mov    %eax,(%esp)
    6b05:	e8 1e fe ff ff       	call   6928 <getbits>
    6b0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    6b0d:	eb 1a                	jmp    6b29 <seek_sync+0x99>
		val <<= ALIGNING;
    6b0f:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    6b13:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    6b1a:	00 
    6b1b:	8b 45 08             	mov    0x8(%ebp),%eax
    6b1e:	89 04 24             	mov    %eax,(%esp)
    6b21:	e8 02 fe ff ff       	call   6928 <getbits>
    6b26:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    6b29:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6b2c:	23 45 f4             	and    -0xc(%ebp),%eax
    6b2f:	3b 45 0c             	cmp    0xc(%ebp),%eax
    6b32:	74 0f                	je     6b43 <seek_sync+0xb3>
    6b34:	8b 45 08             	mov    0x8(%ebp),%eax
    6b37:	89 04 24             	mov    %eax,(%esp)
    6b3a:	e8 55 fc ff ff       	call   6794 <end_bs>
    6b3f:	85 c0                	test   %eax,%eax
    6b41:	74 cc                	je     6b0f <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    6b43:	8b 45 08             	mov    0x8(%ebp),%eax
    6b46:	89 04 24             	mov    %eax,(%esp)
    6b49:	e8 46 fc ff ff       	call   6794 <end_bs>
    6b4e:	85 c0                	test   %eax,%eax
    6b50:	74 07                	je     6b59 <seek_sync+0xc9>
		return(0);
    6b52:	b8 00 00 00 00       	mov    $0x0,%eax
    6b57:	eb 05                	jmp    6b5e <seek_sync+0xce>
	else
		return(1);
    6b59:	b8 01 00 00 00       	mov    $0x1,%eax
}
    6b5e:	c9                   	leave  
    6b5f:	c3                   	ret    

00006b60 <js_bound>:

int js_bound(int lay, int m_ext)
{
    6b60:	55                   	push   %ebp
    6b61:	89 e5                	mov    %esp,%ebp
    6b63:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    6b66:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    6b6a:	7e 12                	jle    6b7e <js_bound+0x1e>
    6b6c:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    6b70:	7f 0c                	jg     6b7e <js_bound+0x1e>
    6b72:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    6b76:	78 06                	js     6b7e <js_bound+0x1e>
    6b78:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    6b7c:	7e 27                	jle    6ba5 <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    6b7e:	8b 45 0c             	mov    0xc(%ebp),%eax
    6b81:	89 44 24 0c          	mov    %eax,0xc(%esp)
    6b85:	8b 45 08             	mov    0x8(%ebp),%eax
    6b88:	89 44 24 08          	mov    %eax,0x8(%esp)
    6b8c:	c7 44 24 04 48 ca 00 	movl   $0xca48,0x4(%esp)
    6b93:	00 
    6b94:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6b9b:	e8 22 ef ff ff       	call   5ac2 <printf>
        exit();
    6ba0:	e8 35 ed ff ff       	call   58da <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    6ba5:	8b 45 08             	mov    0x8(%ebp),%eax
    6ba8:	83 e8 01             	sub    $0x1,%eax
    6bab:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    6bb2:	8b 45 0c             	mov    0xc(%ebp),%eax
    6bb5:	01 d0                	add    %edx,%eax
    6bb7:	8b 04 85 60 0b 01 00 	mov    0x10b60(,%eax,4),%eax
}
    6bbe:	c9                   	leave  
    6bbf:	c3                   	ret    

00006bc0 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    6bc0:	55                   	push   %ebp
    6bc1:	89 e5                	mov    %esp,%ebp
    6bc3:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    6bc6:	8b 45 08             	mov    0x8(%ebp),%eax
    6bc9:	8b 00                	mov    (%eax),%eax
    6bcb:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    6bce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6bd1:	8b 50 1c             	mov    0x1c(%eax),%edx
    6bd4:	8b 45 08             	mov    0x8(%ebp),%eax
    6bd7:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    6bda:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6bdd:	8b 40 1c             	mov    0x1c(%eax),%eax
    6be0:	83 f8 03             	cmp    $0x3,%eax
    6be3:	75 07                	jne    6bec <hdr_to_frps+0x2c>
    6be5:	b8 01 00 00 00       	mov    $0x1,%eax
    6bea:	eb 05                	jmp    6bf1 <hdr_to_frps+0x31>
    6bec:	b8 02 00 00 00       	mov    $0x2,%eax
    6bf1:	8b 55 08             	mov    0x8(%ebp),%edx
    6bf4:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    6bf7:	8b 45 08             	mov    0x8(%ebp),%eax
    6bfa:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    6c01:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6c04:	8b 40 1c             	mov    0x1c(%eax),%eax
    6c07:	83 f8 01             	cmp    $0x1,%eax
    6c0a:	75 20                	jne    6c2c <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    6c0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6c0f:	8b 50 20             	mov    0x20(%eax),%edx
    6c12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6c15:	8b 40 04             	mov    0x4(%eax),%eax
    6c18:	89 54 24 04          	mov    %edx,0x4(%esp)
    6c1c:	89 04 24             	mov    %eax,(%esp)
    6c1f:	e8 3c ff ff ff       	call   6b60 <js_bound>
    6c24:	8b 55 08             	mov    0x8(%ebp),%edx
    6c27:	89 42 0c             	mov    %eax,0xc(%edx)
    6c2a:	eb 0c                	jmp    6c38 <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    6c2c:	8b 45 08             	mov    0x8(%ebp),%eax
    6c2f:	8b 50 10             	mov    0x10(%eax),%edx
    6c32:	8b 45 08             	mov    0x8(%ebp),%eax
    6c35:	89 50 0c             	mov    %edx,0xc(%eax)
}
    6c38:	c9                   	leave  
    6c39:	c3                   	ret    

00006c3a <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    6c3a:	55                   	push   %ebp
    6c3b:	89 e5                	mov    %esp,%ebp
    6c3d:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    6c40:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    6c44:	74 19                	je     6c5f <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    6c46:	c7 44 24 04 6b ca 00 	movl   $0xca6b,0x4(%esp)
    6c4d:	00 
    6c4e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6c55:	e8 68 ee ff ff       	call   5ac2 <printf>
		exit();
    6c5a:	e8 7b ec ff ff       	call   58da <exit>
	}
	getCoreBuf(1, val);
    6c5f:	8b 45 08             	mov    0x8(%ebp),%eax
    6c62:	89 44 24 04          	mov    %eax,0x4(%esp)
    6c66:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    6c6d:	e8 68 ed ff ff       	call   59da <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    6c72:	c9                   	leave  
    6c73:	c3                   	ret    

00006c74 <hsstell>:

unsigned long hsstell()
{
    6c74:	55                   	push   %ebp
    6c75:	89 e5                	mov    %esp,%ebp
    6c77:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    6c7a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    6c81:	00 
    6c82:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    6c89:	e8 4c ed ff ff       	call   59da <getCoreBuf>
//	return(totbit);
}
    6c8e:	c9                   	leave  
    6c8f:	c3                   	ret    

00006c90 <hgetbits>:

unsigned long hgetbits(int N)
{
    6c90:	55                   	push   %ebp
    6c91:	89 e5                	mov    %esp,%ebp
    6c93:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    6c96:	8b 45 08             	mov    0x8(%ebp),%eax
    6c99:	89 44 24 04          	mov    %eax,0x4(%esp)
    6c9d:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    6ca4:	e8 31 ed ff ff       	call   59da <getCoreBuf>
}
    6ca9:	c9                   	leave  
    6caa:	c3                   	ret    

00006cab <hget1bit>:


unsigned int hget1bit()
{
    6cab:	55                   	push   %ebp
    6cac:	89 e5                	mov    %esp,%ebp
    6cae:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    6cb1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    6cb8:	e8 d3 ff ff ff       	call   6c90 <hgetbits>
}
    6cbd:	c9                   	leave  
    6cbe:	c3                   	ret    

00006cbf <rewindNbits>:


void rewindNbits(int N)
{
    6cbf:	55                   	push   %ebp
    6cc0:	89 e5                	mov    %esp,%ebp
    6cc2:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    6cc5:	8b 45 08             	mov    0x8(%ebp),%eax
    6cc8:	89 44 24 04          	mov    %eax,0x4(%esp)
    6ccc:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    6cd3:	e8 02 ed ff ff       	call   59da <getCoreBuf>
}
    6cd8:	c9                   	leave  
    6cd9:	c3                   	ret    

00006cda <rewindNbytes>:


void rewindNbytes(int N)
{
    6cda:	55                   	push   %ebp
    6cdb:	89 e5                	mov    %esp,%ebp
    6cdd:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    6ce0:	8b 45 08             	mov    0x8(%ebp),%eax
    6ce3:	89 44 24 04          	mov    %eax,0x4(%esp)
    6ce7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    6cee:	e8 e7 ec ff ff       	call   59da <getCoreBuf>
}
    6cf3:	c9                   	leave  
    6cf4:	c3                   	ret    

00006cf5 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    6cf5:	55                   	push   %ebp
    6cf6:	89 e5                	mov    %esp,%ebp
    6cf8:	57                   	push   %edi
    6cf9:	56                   	push   %esi
    6cfa:	53                   	push   %ebx
    6cfb:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    6d01:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    6d05:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    6d09:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    6d0d:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    6d11:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    6d15:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    6d19:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    6d1d:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    6d21:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    6d25:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    6d29:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    6d2d:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    6d31:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    6d35:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    6d39:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    6d3d:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    6d41:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    6d45:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    6d49:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    6d4d:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    6d51:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    6d55:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    6d59:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    6d5d:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    6d61:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    6d65:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    6d69:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    6d6d:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    6d71:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    6d75:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    6d79:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    6d7d:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    6d81:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    6d85:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    6d89:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    6d8d:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    6d91:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    6d95:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    6d99:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    6d9d:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    6da1:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    6da5:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    6da9:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    6dad:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    6db1:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    6db5:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    6db9:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    6dbd:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    6dc1:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    6dc5:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    6dc9:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    6dcd:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    6dd1:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    6dd5:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    6dd9:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    6ddd:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    6de1:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    6de5:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    6de9:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    6ded:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    6df1:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    6df5:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    6df9:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    6dfd:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    6e01:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    6e05:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    6e09:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    6e0d:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    6e11:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    6e15:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    6e19:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    6e1d:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    6e21:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    6e25:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    6e29:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    6e2d:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    6e31:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    6e35:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    6e39:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    6e3d:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    6e41:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    6e45:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    6e49:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    6e50:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    6e57:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    6e5e:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    6e65:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    6e6c:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    6e73:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    6e7a:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    6e81:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    6e88:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    6e8f:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    6e96:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    6e9d:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    6ea4:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    6eab:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    6eb2:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    6eb9:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    6ec0:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    6ec7:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    6ece:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    6ed5:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    6edc:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    6ee3:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    6eea:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    6ef1:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    6ef8:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    6eff:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    6f06:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    6f0d:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    6f11:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    6f15:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    6f19:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    6f1d:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    6f21:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    6f25:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    6f29:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    6f2d:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    6f31:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    6f35:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    6f39:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    6f3d:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    6f41:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    6f45:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    6f49:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    6f4d:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    6f51:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    6f55:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    6f59:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    6f5d:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    6f61:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    6f65:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    6f69:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    6f6d:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    6f71:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    6f75:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    6f79:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    6f7d:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    6f81:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    6f85:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    6f89:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    6f8d:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    6f91:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    6f95:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    6f9c:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    6fa3:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    6faa:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    6fb1:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    6fb8:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    6fbf:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    6fc6:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    6fcd:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    6fd4:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    6fdb:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    6fe2:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    6fe9:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    6ff0:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    6ff7:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    6ffe:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    7005:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    700c:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    7013:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    701a:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    7021:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    7028:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    702f:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    7036:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    703d:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    7044:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    704b:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    7052:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    7059:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    7060:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    7067:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    706e:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    7075:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    707c:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    7083:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    708a:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    7091:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    7098:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    709f:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    70a6:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    70ad:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    70b4:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    70bb:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    70c2:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    70c9:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    70d0:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    70d7:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    70de:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    70e5:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    70ec:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    70f3:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    70fa:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    7101:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    7108:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    710f:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    7116:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    711d:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    7124:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    712b:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    7132:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    7139:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    7140:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    7147:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    714d:	b8 a0 ca 00 00       	mov    $0xcaa0,%eax
    7152:	b9 23 00 00 00       	mov    $0x23,%ecx
    7157:	89 d7                	mov    %edx,%edi
    7159:	89 c6                	mov    %eax,%esi
    715b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    715d:	89 f0                	mov    %esi,%eax
    715f:	89 fa                	mov    %edi,%edx
    7161:	0f b7 08             	movzwl (%eax),%ecx
    7164:	66 89 0a             	mov    %cx,(%edx)
    7167:	83 c2 02             	add    $0x2,%edx
    716a:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    716d:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    7173:	ba 40 cb 00 00       	mov    $0xcb40,%edx
    7178:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    717d:	89 c1                	mov    %eax,%ecx
    717f:	83 e1 02             	and    $0x2,%ecx
    7182:	85 c9                	test   %ecx,%ecx
    7184:	74 0f                	je     7195 <read_decoder_table+0x4a0>
    7186:	0f b7 0a             	movzwl (%edx),%ecx
    7189:	66 89 08             	mov    %cx,(%eax)
    718c:	83 c0 02             	add    $0x2,%eax
    718f:	83 c2 02             	add    $0x2,%edx
    7192:	83 eb 02             	sub    $0x2,%ebx
    7195:	89 d9                	mov    %ebx,%ecx
    7197:	c1 e9 02             	shr    $0x2,%ecx
    719a:	89 c7                	mov    %eax,%edi
    719c:	89 d6                	mov    %edx,%esi
    719e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    71a0:	89 f2                	mov    %esi,%edx
    71a2:	89 f8                	mov    %edi,%eax
    71a4:	b9 00 00 00 00       	mov    $0x0,%ecx
    71a9:	89 de                	mov    %ebx,%esi
    71ab:	83 e6 02             	and    $0x2,%esi
    71ae:	85 f6                	test   %esi,%esi
    71b0:	74 0b                	je     71bd <read_decoder_table+0x4c8>
    71b2:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    71b6:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    71ba:	83 c1 02             	add    $0x2,%ecx
    71bd:	83 e3 01             	and    $0x1,%ebx
    71c0:	85 db                	test   %ebx,%ebx
    71c2:	74 07                	je     71cb <read_decoder_table+0x4d6>
    71c4:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    71c8:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    71cb:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    71d1:	b8 e0 cb 00 00       	mov    $0xcbe0,%eax
    71d6:	b9 23 00 00 00       	mov    $0x23,%ecx
    71db:	89 d7                	mov    %edx,%edi
    71dd:	89 c6                	mov    %eax,%esi
    71df:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    71e1:	89 f0                	mov    %esi,%eax
    71e3:	89 fa                	mov    %edi,%edx
    71e5:	0f b7 08             	movzwl (%eax),%ecx
    71e8:	66 89 0a             	mov    %cx,(%edx)
    71eb:	83 c2 02             	add    $0x2,%edx
    71ee:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    71f1:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    71f7:	ba 80 cc 00 00       	mov    $0xcc80,%edx
    71fc:	bb fe 00 00 00       	mov    $0xfe,%ebx
    7201:	89 c1                	mov    %eax,%ecx
    7203:	83 e1 02             	and    $0x2,%ecx
    7206:	85 c9                	test   %ecx,%ecx
    7208:	74 0f                	je     7219 <read_decoder_table+0x524>
    720a:	0f b7 0a             	movzwl (%edx),%ecx
    720d:	66 89 08             	mov    %cx,(%eax)
    7210:	83 c0 02             	add    $0x2,%eax
    7213:	83 c2 02             	add    $0x2,%edx
    7216:	83 eb 02             	sub    $0x2,%ebx
    7219:	89 d9                	mov    %ebx,%ecx
    721b:	c1 e9 02             	shr    $0x2,%ecx
    721e:	89 c7                	mov    %eax,%edi
    7220:	89 d6                	mov    %edx,%esi
    7222:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    7224:	89 f2                	mov    %esi,%edx
    7226:	89 f8                	mov    %edi,%eax
    7228:	b9 00 00 00 00       	mov    $0x0,%ecx
    722d:	89 de                	mov    %ebx,%esi
    722f:	83 e6 02             	and    $0x2,%esi
    7232:	85 f6                	test   %esi,%esi
    7234:	74 0b                	je     7241 <read_decoder_table+0x54c>
    7236:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    723a:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    723e:	83 c1 02             	add    $0x2,%ecx
    7241:	83 e3 01             	and    $0x1,%ebx
    7244:	85 db                	test   %ebx,%ebx
    7246:	74 07                	je     724f <read_decoder_table+0x55a>
    7248:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    724c:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    724f:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    7255:	b8 80 cd 00 00       	mov    $0xcd80,%eax
    725a:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    725f:	89 d7                	mov    %edx,%edi
    7261:	89 c6                	mov    %eax,%esi
    7263:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    7265:	89 f0                	mov    %esi,%eax
    7267:	89 fa                	mov    %edi,%edx
    7269:	0f b7 08             	movzwl (%eax),%ecx
    726c:	66 89 0a             	mov    %cx,(%edx)
    726f:	83 c2 02             	add    $0x2,%edx
    7272:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    7275:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    727b:	ba 80 ce 00 00       	mov    $0xce80,%edx
    7280:	bb fe 00 00 00       	mov    $0xfe,%ebx
    7285:	89 c1                	mov    %eax,%ecx
    7287:	83 e1 02             	and    $0x2,%ecx
    728a:	85 c9                	test   %ecx,%ecx
    728c:	74 0f                	je     729d <read_decoder_table+0x5a8>
    728e:	0f b7 0a             	movzwl (%edx),%ecx
    7291:	66 89 08             	mov    %cx,(%eax)
    7294:	83 c0 02             	add    $0x2,%eax
    7297:	83 c2 02             	add    $0x2,%edx
    729a:	83 eb 02             	sub    $0x2,%ebx
    729d:	89 d9                	mov    %ebx,%ecx
    729f:	c1 e9 02             	shr    $0x2,%ecx
    72a2:	89 c7                	mov    %eax,%edi
    72a4:	89 d6                	mov    %edx,%esi
    72a6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    72a8:	89 f2                	mov    %esi,%edx
    72aa:	89 f8                	mov    %edi,%eax
    72ac:	b9 00 00 00 00       	mov    $0x0,%ecx
    72b1:	89 de                	mov    %ebx,%esi
    72b3:	83 e6 02             	and    $0x2,%esi
    72b6:	85 f6                	test   %esi,%esi
    72b8:	74 0b                	je     72c5 <read_decoder_table+0x5d0>
    72ba:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    72be:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    72c2:	83 c1 02             	add    $0x2,%ecx
    72c5:	83 e3 01             	and    $0x1,%ebx
    72c8:	85 db                	test   %ebx,%ebx
    72ca:	74 07                	je     72d3 <read_decoder_table+0x5de>
    72cc:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    72d0:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    72d3:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    72d9:	b8 80 cf 00 00       	mov    $0xcf80,%eax
    72de:	b9 ff 00 00 00       	mov    $0xff,%ecx
    72e3:	89 d7                	mov    %edx,%edi
    72e5:	89 c6                	mov    %eax,%esi
    72e7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    72e9:	89 f0                	mov    %esi,%eax
    72eb:	89 fa                	mov    %edi,%edx
    72ed:	0f b7 08             	movzwl (%eax),%ecx
    72f0:	66 89 0a             	mov    %cx,(%edx)
    72f3:	83 c2 02             	add    $0x2,%edx
    72f6:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    72f9:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    72ff:	ba 80 d3 00 00       	mov    $0xd380,%edx
    7304:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    7309:	89 c1                	mov    %eax,%ecx
    730b:	83 e1 02             	and    $0x2,%ecx
    730e:	85 c9                	test   %ecx,%ecx
    7310:	74 0f                	je     7321 <read_decoder_table+0x62c>
    7312:	0f b7 0a             	movzwl (%edx),%ecx
    7315:	66 89 08             	mov    %cx,(%eax)
    7318:	83 c0 02             	add    $0x2,%eax
    731b:	83 c2 02             	add    $0x2,%edx
    731e:	83 eb 02             	sub    $0x2,%ebx
    7321:	89 d9                	mov    %ebx,%ecx
    7323:	c1 e9 02             	shr    $0x2,%ecx
    7326:	89 c7                	mov    %eax,%edi
    7328:	89 d6                	mov    %edx,%esi
    732a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    732c:	89 f2                	mov    %esi,%edx
    732e:	89 f8                	mov    %edi,%eax
    7330:	b9 00 00 00 00       	mov    $0x0,%ecx
    7335:	89 de                	mov    %ebx,%esi
    7337:	83 e6 02             	and    $0x2,%esi
    733a:	85 f6                	test   %esi,%esi
    733c:	74 0b                	je     7349 <read_decoder_table+0x654>
    733e:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    7342:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    7346:	83 c1 02             	add    $0x2,%ecx
    7349:	83 e3 01             	and    $0x1,%ebx
    734c:	85 db                	test   %ebx,%ebx
    734e:	74 07                	je     7357 <read_decoder_table+0x662>
    7350:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    7354:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    7357:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    735d:	b8 80 d7 00 00       	mov    $0xd780,%eax
    7362:	b9 ff 00 00 00       	mov    $0xff,%ecx
    7367:	89 d7                	mov    %edx,%edi
    7369:	89 c6                	mov    %eax,%esi
    736b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    736d:	89 f0                	mov    %esi,%eax
    736f:	89 fa                	mov    %edi,%edx
    7371:	0f b7 08             	movzwl (%eax),%ecx
    7374:	66 89 0a             	mov    %cx,(%edx)
    7377:	83 c2 02             	add    $0x2,%edx
    737a:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    737d:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    7383:	bb 80 db 00 00       	mov    $0xdb80,%ebx
    7388:	b8 00 01 00 00       	mov    $0x100,%eax
    738d:	89 d7                	mov    %edx,%edi
    738f:	89 de                	mov    %ebx,%esi
    7391:	89 c1                	mov    %eax,%ecx
    7393:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    7395:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    739c:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    73a3:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    73aa:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    73b1:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    73b8:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    73bf:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    73c6:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    73cd:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    73d4:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    73db:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    73e2:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    73e9:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    73f0:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    73f7:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    73fe:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    7405:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    740c:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    7413:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    741a:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    7421:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    7428:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    742f:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    7436:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    743d:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    7444:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    744b:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    7452:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    7459:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    7460:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    7467:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    746e:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    7475:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    747c:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    7483:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    748a:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    7491:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    7498:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    749f:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    74a6:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    74ad:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    74b4:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    74bb:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    74c2:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    74c9:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    74d0:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    74d7:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    74de:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    74e5:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    74ec:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    74f3:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    74fa:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    7501:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    7508:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    750f:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    7516:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    751d:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    7524:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    752b:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    7532:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    7539:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    7540:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    7547:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    754e:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    7555:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    755c:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    7563:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    756a:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    7571:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    7578:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    757f:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    7586:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    758d:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    7594:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    759b:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    75a2:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    75a9:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    75b0:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    75b7:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    75be:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    75c5:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    75cc:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    75d3:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    75da:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    75e1:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    75e8:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    75ef:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    75f6:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    75fd:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    7604:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    760b:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    7612:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    7619:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    7620:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    7627:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    762e:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    7635:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    763c:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    7643:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    764a:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    7651:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    7658:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    765f:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    7666:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    766d:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    7674:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    767b:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    7682:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    7689:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    7690:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    7697:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    769e:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    76a5:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    76ac:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    76b3:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    76ba:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    76c1:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    76c8:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    76cf:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    76d6:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    76dd:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    76e4:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    76eb:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    76f2:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    76f9:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    7700:	30 00 
    7702:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    7709:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    7710:	00 00 00 
    7713:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    771a:	00 00 00 
    771d:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    7724:	00 00 00 
    7727:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    772e:	00 00 00 
    7731:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    7738:	ff ff ff 
    773b:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    7742:	00 00 00 
    7745:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    774c:	00 00 00 
    774f:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    7756:	00 00 00 
    7759:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    7760:	00 00 00 
    7763:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    776a:	31 00 
    776c:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    7773:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    777a:	00 00 00 
    777d:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    7784:	00 00 00 
    7787:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    778e:	00 00 00 
    7791:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    7798:	00 00 00 
    779b:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    77a2:	ff ff ff 
    77a5:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    77ac:	00 00 00 
    77af:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    77b6:	00 00 00 
    77b9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    77bc:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    77c2:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    77c9:	00 00 00 
    77cc:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    77d3:	32 00 
    77d5:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    77dc:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    77e3:	00 00 00 
    77e6:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    77ed:	00 00 00 
    77f0:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    77f7:	00 00 00 
    77fa:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    7801:	00 00 00 
    7804:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    780b:	ff ff ff 
    780e:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    7815:	00 00 00 
    7818:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    781f:	00 00 00 
    7822:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    7825:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    782b:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    7832:	00 00 00 
    7835:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    783c:	33 00 
    783e:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    7845:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    784c:	00 00 00 
    784f:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    7856:	00 00 00 
    7859:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    7860:	00 00 00 
    7863:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    786a:	00 00 00 
    786d:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    7874:	ff ff ff 
    7877:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    787e:	00 00 00 
    7881:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    7888:	00 00 00 
    788b:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    788e:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    7894:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    789b:	00 00 00 
    789e:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    78a5:	34 00 
    78a7:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    78ae:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    78b5:	00 00 00 
    78b8:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    78bf:	00 00 00 
    78c2:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    78c9:	00 00 00 
    78cc:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    78d3:	00 00 00 
    78d6:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    78dd:	ff ff ff 
    78e0:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    78e7:	00 00 00 
    78ea:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    78f1:	00 00 00 
    78f4:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    78fb:	00 00 00 
    78fe:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    7905:	00 00 00 
    7908:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    790f:	35 00 
    7911:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    7918:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    791f:	00 00 00 
    7922:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    7929:	00 00 00 
    792c:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    7933:	00 00 00 
    7936:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    793d:	00 00 00 
    7940:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    7947:	ff ff ff 
    794a:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    7951:	00 00 00 
    7954:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    795b:	00 00 00 
    795e:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    7964:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    796a:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    7971:	00 00 00 
    7974:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    797b:	36 00 
    797d:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    7984:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    798b:	00 00 00 
    798e:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    7995:	00 00 00 
    7998:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    799f:	00 00 00 
    79a2:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    79a9:	00 00 00 
    79ac:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    79b3:	ff ff ff 
    79b6:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    79bd:	00 00 00 
    79c0:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    79c7:	00 00 00 
    79ca:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    79d0:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    79d6:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    79dd:	00 00 00 
    79e0:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    79e7:	37 00 
    79e9:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    79f0:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    79f7:	00 00 00 
    79fa:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    7a01:	00 00 00 
    7a04:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    7a0b:	00 00 00 
    7a0e:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    7a15:	00 00 00 
    7a18:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    7a1f:	ff ff ff 
    7a22:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    7a29:	00 00 00 
    7a2c:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    7a33:	00 00 00 
    7a36:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    7a3c:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    7a42:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    7a49:	00 00 00 
    7a4c:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    7a53:	38 00 
    7a55:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    7a5c:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    7a63:	00 00 00 
    7a66:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    7a6d:	00 00 00 
    7a70:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    7a77:	00 00 00 
    7a7a:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    7a81:	00 00 00 
    7a84:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    7a8b:	ff ff ff 
    7a8e:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    7a95:	00 00 00 
    7a98:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    7a9f:	00 00 00 
    7aa2:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    7aa8:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    7aae:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    7ab5:	00 00 00 
    7ab8:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    7abf:	39 00 
    7ac1:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    7ac8:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    7acf:	00 00 00 
    7ad2:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    7ad9:	00 00 00 
    7adc:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    7ae3:	00 00 00 
    7ae6:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    7aed:	00 00 00 
    7af0:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    7af7:	ff ff ff 
    7afa:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    7b01:	00 00 00 
    7b04:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    7b0b:	00 00 00 
    7b0e:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    7b14:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    7b1a:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    7b21:	00 00 00 
    7b24:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    7b2b:	31 30 
    7b2d:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    7b34:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    7b3b:	00 00 00 
    7b3e:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    7b45:	00 00 00 
    7b48:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    7b4f:	00 00 00 
    7b52:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    7b59:	00 00 00 
    7b5c:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    7b63:	ff ff ff 
    7b66:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    7b6d:	00 00 00 
    7b70:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    7b77:	00 00 00 
    7b7a:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    7b80:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    7b86:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    7b8d:	00 00 00 
    7b90:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    7b97:	31 31 
    7b99:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    7ba0:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    7ba7:	00 00 00 
    7baa:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    7bb1:	00 00 00 
    7bb4:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    7bbb:	00 00 00 
    7bbe:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    7bc5:	00 00 00 
    7bc8:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    7bcf:	ff ff ff 
    7bd2:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    7bd9:	00 00 00 
    7bdc:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    7be3:	00 00 00 
    7be6:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    7bec:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    7bf2:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    7bf9:	00 00 00 
    7bfc:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    7c03:	31 32 
    7c05:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    7c0c:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    7c13:	00 00 00 
    7c16:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    7c1d:	00 00 00 
    7c20:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    7c27:	00 00 00 
    7c2a:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    7c31:	00 00 00 
    7c34:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    7c3b:	ff ff ff 
    7c3e:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    7c45:	00 00 00 
    7c48:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    7c4f:	00 00 00 
    7c52:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    7c58:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    7c5e:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    7c65:	00 00 00 
    7c68:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    7c6f:	31 33 
    7c71:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    7c78:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    7c7f:	00 00 00 
    7c82:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    7c89:	00 00 00 
    7c8c:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    7c93:	00 00 00 
    7c96:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    7c9d:	00 00 00 
    7ca0:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    7ca7:	ff ff ff 
    7caa:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    7cb1:	00 00 00 
    7cb4:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    7cbb:	00 00 00 
    7cbe:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    7cc4:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    7cca:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    7cd1:	01 00 00 
    7cd4:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    7cdb:	31 34 
    7cdd:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    7ce4:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    7ceb:	00 00 00 
    7cee:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    7cf5:	00 00 00 
    7cf8:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    7cff:	00 00 00 
    7d02:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    7d09:	00 00 00 
    7d0c:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    7d13:	ff ff ff 
    7d16:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    7d1d:	00 00 00 
    7d20:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    7d27:	00 00 00 
    7d2a:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    7d31:	00 00 00 
    7d34:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    7d3b:	00 00 00 
    7d3e:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    7d45:	31 35 
    7d47:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    7d4e:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    7d55:	00 00 00 
    7d58:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    7d5f:	00 00 00 
    7d62:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    7d69:	00 00 00 
    7d6c:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    7d73:	00 00 00 
    7d76:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    7d7d:	ff ff ff 
    7d80:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    7d87:	00 00 00 
    7d8a:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    7d91:	00 00 00 
    7d94:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    7d9a:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    7da0:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    7da7:	01 00 00 
    7daa:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    7db1:	31 36 
    7db3:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    7dba:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    7dc1:	00 00 00 
    7dc4:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    7dcb:	00 00 00 
    7dce:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    7dd5:	00 00 00 
    7dd8:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    7ddf:	00 00 00 
    7de2:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    7de9:	ff ff ff 
    7dec:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    7df3:	00 00 00 
    7df6:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    7dfd:	00 00 00 
    7e00:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7e06:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    7e0c:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    7e13:	01 00 00 
    7e16:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    7e1d:	31 37 
    7e1f:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    7e26:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    7e2d:	00 00 00 
    7e30:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    7e37:	00 00 00 
    7e3a:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    7e41:	00 00 00 
    7e44:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    7e4b:	00 00 00 
    7e4e:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    7e55:	00 00 00 
    7e58:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    7e5f:	00 00 00 
    7e62:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    7e69:	00 00 00 
    7e6c:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7e72:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    7e78:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    7e7f:	01 00 00 
    7e82:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    7e89:	31 38 
    7e8b:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    7e92:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    7e99:	00 00 00 
    7e9c:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    7ea3:	00 00 00 
    7ea6:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    7ead:	00 00 00 
    7eb0:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    7eb7:	00 00 00 
    7eba:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    7ec1:	00 00 00 
    7ec4:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    7ecb:	00 00 00 
    7ece:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    7ed5:	00 00 00 
    7ed8:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7ede:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    7ee4:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    7eeb:	01 00 00 
    7eee:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    7ef5:	31 39 
    7ef7:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    7efe:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    7f05:	00 00 00 
    7f08:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    7f0f:	00 00 00 
    7f12:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    7f19:	00 00 00 
    7f1c:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    7f23:	00 00 00 
    7f26:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    7f2d:	00 00 00 
    7f30:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    7f37:	00 00 00 
    7f3a:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    7f41:	00 00 00 
    7f44:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7f4a:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    7f50:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    7f57:	01 00 00 
    7f5a:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    7f61:	32 30 
    7f63:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    7f6a:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    7f71:	00 00 00 
    7f74:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    7f7b:	00 00 00 
    7f7e:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    7f85:	00 00 00 
    7f88:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    7f8f:	00 00 00 
    7f92:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    7f99:	00 00 00 
    7f9c:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    7fa3:	00 00 00 
    7fa6:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    7fad:	00 00 00 
    7fb0:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7fb6:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    7fbc:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    7fc3:	01 00 00 
    7fc6:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    7fcd:	32 31 
    7fcf:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    7fd6:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    7fdd:	00 00 00 
    7fe0:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    7fe7:	00 00 00 
    7fea:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    7ff1:	00 00 00 
    7ff4:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    7ffb:	00 00 00 
    7ffe:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    8005:	00 00 00 
    8008:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    800f:	00 00 00 
    8012:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    8019:	00 00 00 
    801c:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    8022:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    8028:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    802f:	01 00 00 
    8032:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    8039:	32 32 
    803b:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    8042:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    8049:	00 00 00 
    804c:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    8053:	00 00 00 
    8056:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    805d:	00 00 00 
    8060:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    8067:	03 00 00 
    806a:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    8071:	00 00 00 
    8074:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    807b:	00 00 00 
    807e:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    8085:	00 00 00 
    8088:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    808e:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    8094:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    809b:	01 00 00 
    809e:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    80a5:	32 33 
    80a7:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    80ae:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    80b5:	00 00 00 
    80b8:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    80bf:	00 00 00 
    80c2:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    80c9:	00 00 00 
    80cc:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    80d3:	1f 00 00 
    80d6:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    80dd:	00 00 00 
    80e0:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    80e7:	00 00 00 
    80ea:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    80f1:	00 00 00 
    80f4:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    80fa:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    8100:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    8107:	01 00 00 
    810a:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    8111:	32 34 
    8113:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    811a:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    8121:	00 00 00 
    8124:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    812b:	00 00 00 
    812e:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    8135:	00 00 00 
    8138:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    813f:	00 00 00 
    8142:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    8149:	ff ff ff 
    814c:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    8153:	00 00 00 
    8156:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    815d:	00 00 00 
    8160:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    8166:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    816c:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    8173:	02 00 00 
    8176:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    817d:	32 35 
    817f:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    8186:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    818d:	00 00 00 
    8190:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    8197:	00 00 00 
    819a:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    81a1:	00 00 00 
    81a4:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    81ab:	00 00 00 
    81ae:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    81b5:	00 00 00 
    81b8:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    81bf:	00 00 00 
    81c2:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    81c9:	00 00 00 
    81cc:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    81d2:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    81d8:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    81df:	02 00 00 
    81e2:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    81e9:	32 36 
    81eb:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    81f2:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    81f9:	00 00 00 
    81fc:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    8203:	00 00 00 
    8206:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    820d:	00 00 00 
    8210:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    8217:	00 00 00 
    821a:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    8221:	00 00 00 
    8224:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    822b:	00 00 00 
    822e:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    8235:	00 00 00 
    8238:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    823e:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    8244:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    824b:	02 00 00 
    824e:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    8255:	32 37 
    8257:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    825e:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    8265:	00 00 00 
    8268:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    826f:	00 00 00 
    8272:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    8279:	00 00 00 
    827c:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    8283:	00 00 00 
    8286:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    828d:	00 00 00 
    8290:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    8297:	00 00 00 
    829a:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    82a1:	00 00 00 
    82a4:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    82aa:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    82b0:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    82b7:	02 00 00 
    82ba:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    82c1:	32 38 
    82c3:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    82ca:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    82d1:	00 00 00 
    82d4:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    82db:	00 00 00 
    82de:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    82e5:	00 00 00 
    82e8:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    82ef:	00 00 00 
    82f2:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    82f9:	00 00 00 
    82fc:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    8303:	00 00 00 
    8306:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    830d:	00 00 00 
    8310:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    8316:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    831c:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    8323:	02 00 00 
    8326:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    832d:	32 39 
    832f:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    8336:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    833d:	00 00 00 
    8340:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    8347:	00 00 00 
    834a:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    8351:	00 00 00 
    8354:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    835b:	01 00 00 
    835e:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    8365:	00 00 00 
    8368:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    836f:	00 00 00 
    8372:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    8379:	00 00 00 
    837c:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    8382:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    8388:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    838f:	02 00 00 
    8392:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    8399:	33 30 
    839b:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    83a2:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    83a9:	00 00 00 
    83ac:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    83b3:	00 00 00 
    83b6:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    83bd:	00 00 00 
    83c0:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    83c7:	07 00 00 
    83ca:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    83d1:	00 00 00 
    83d4:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    83db:	00 00 00 
    83de:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    83e5:	00 00 00 
    83e8:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    83ee:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    83f4:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    83fb:	02 00 00 
    83fe:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    8405:	33 31 
    8407:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    840e:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    8415:	00 00 00 
    8418:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    841f:	00 00 00 
    8422:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    8429:	00 00 00 
    842c:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    8433:	1f 00 00 
    8436:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    843d:	00 00 00 
    8440:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    8447:	00 00 00 
    844a:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    8451:	00 00 00 
    8454:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    845a:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    8460:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    8467:	02 00 00 
    846a:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    8471:	33 32 
    8473:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    847a:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    8481:	00 00 00 
    8484:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    848b:	00 00 00 
    848e:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    8495:	00 00 00 
    8498:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    849f:	00 00 00 
    84a2:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    84a9:	ff ff ff 
    84ac:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    84b3:	00 00 00 
    84b6:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    84bd:	00 00 00 
    84c0:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    84c6:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    84cc:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    84d3:	00 00 00 
    84d6:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    84dd:	33 33 
    84df:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    84e6:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    84ed:	00 00 00 
    84f0:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    84f7:	00 00 00 
    84fa:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    8501:	00 00 00 
    8504:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    850b:	00 00 00 
    850e:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    8515:	ff ff ff 
    8518:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    851f:	00 00 00 
    8522:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    8529:	00 00 00 
    852c:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    8532:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    8538:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    853f:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    8542:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    8548:	5b                   	pop    %ebx
    8549:	5e                   	pop    %esi
    854a:	5f                   	pop    %edi
    854b:	5d                   	pop    %ebp
    854c:	c3                   	ret    

0000854d <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    854d:	55                   	push   %ebp
    854e:	89 e5                	mov    %esp,%ebp
    8550:	53                   	push   %ebx
    8551:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    8554:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    855b:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    8562:	a1 90 0b 01 00       	mov    0x10b90,%eax
    8567:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    856a:	8b 45 08             	mov    0x8(%ebp),%eax
    856d:	8b 40 20             	mov    0x20(%eax),%eax
    8570:	85 c0                	test   %eax,%eax
    8572:	75 0a                	jne    857e <huffman_decoder+0x31>
    8574:	b8 02 00 00 00       	mov    $0x2,%eax
    8579:	e9 0d 03 00 00       	jmp    888b <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    857e:	8b 45 08             	mov    0x8(%ebp),%eax
    8581:	8b 40 24             	mov    0x24(%eax),%eax
    8584:	85 c0                	test   %eax,%eax
    8586:	75 1d                	jne    85a5 <huffman_decoder+0x58>
  {  *x = *y = 0;
    8588:	8b 45 10             	mov    0x10(%ebp),%eax
    858b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    8591:	8b 45 10             	mov    0x10(%ebp),%eax
    8594:	8b 10                	mov    (%eax),%edx
    8596:	8b 45 0c             	mov    0xc(%ebp),%eax
    8599:	89 10                	mov    %edx,(%eax)
     return 0;
    859b:	b8 00 00 00 00       	mov    $0x0,%eax
    85a0:	e9 e6 02 00 00       	jmp    888b <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    85a5:	8b 45 08             	mov    0x8(%ebp),%eax
    85a8:	8b 40 20             	mov    0x20(%eax),%eax
    85ab:	8b 55 f0             	mov    -0x10(%ebp),%edx
    85ae:	01 d2                	add    %edx,%edx
    85b0:	01 d0                	add    %edx,%eax
    85b2:	0f b6 00             	movzbl (%eax),%eax
    85b5:	84 c0                	test   %al,%al
    85b7:	75 46                	jne    85ff <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    85b9:	8b 45 08             	mov    0x8(%ebp),%eax
    85bc:	8b 40 20             	mov    0x20(%eax),%eax
    85bf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    85c2:	01 d2                	add    %edx,%edx
    85c4:	01 d0                	add    %edx,%eax
    85c6:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    85ca:	c0 e8 04             	shr    $0x4,%al
    85cd:	0f b6 d0             	movzbl %al,%edx
    85d0:	8b 45 0c             	mov    0xc(%ebp),%eax
    85d3:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    85d5:	8b 45 08             	mov    0x8(%ebp),%eax
    85d8:	8b 40 20             	mov    0x20(%eax),%eax
    85db:	8b 55 f0             	mov    -0x10(%ebp),%edx
    85de:	01 d2                	add    %edx,%edx
    85e0:	01 d0                	add    %edx,%eax
    85e2:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    85e6:	0f b6 c0             	movzbl %al,%eax
    85e9:	83 e0 0f             	and    $0xf,%eax
    85ec:	89 c2                	mov    %eax,%edx
    85ee:	8b 45 10             	mov    0x10(%ebp),%eax
    85f1:	89 10                	mov    %edx,(%eax)

      error = 0;
    85f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    85fa:	e9 af 00 00 00       	jmp    86ae <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    85ff:	e8 a7 e6 ff ff       	call   6cab <hget1bit>
    8604:	85 c0                	test   %eax,%eax
    8606:	74 47                	je     864f <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    8608:	eb 17                	jmp    8621 <huffman_decoder+0xd4>
    860a:	8b 45 08             	mov    0x8(%ebp),%eax
    860d:	8b 40 20             	mov    0x20(%eax),%eax
    8610:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8613:	01 d2                	add    %edx,%edx
    8615:	01 d0                	add    %edx,%eax
    8617:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    861b:	0f b6 c0             	movzbl %al,%eax
    861e:	01 45 f0             	add    %eax,-0x10(%ebp)
    8621:	8b 45 08             	mov    0x8(%ebp),%eax
    8624:	8b 40 20             	mov    0x20(%eax),%eax
    8627:	8b 55 f0             	mov    -0x10(%ebp),%edx
    862a:	01 d2                	add    %edx,%edx
    862c:	01 d0                	add    %edx,%eax
    862e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    8632:	3c f9                	cmp    $0xf9,%al
    8634:	77 d4                	ja     860a <huffman_decoder+0xbd>
      point += h->val[point][1];
    8636:	8b 45 08             	mov    0x8(%ebp),%eax
    8639:	8b 40 20             	mov    0x20(%eax),%eax
    863c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    863f:	01 d2                	add    %edx,%edx
    8641:	01 d0                	add    %edx,%eax
    8643:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    8647:	0f b6 c0             	movzbl %al,%eax
    864a:	01 45 f0             	add    %eax,-0x10(%ebp)
    864d:	eb 42                	jmp    8691 <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    864f:	eb 16                	jmp    8667 <huffman_decoder+0x11a>
    8651:	8b 45 08             	mov    0x8(%ebp),%eax
    8654:	8b 40 20             	mov    0x20(%eax),%eax
    8657:	8b 55 f0             	mov    -0x10(%ebp),%edx
    865a:	01 d2                	add    %edx,%edx
    865c:	01 d0                	add    %edx,%eax
    865e:	0f b6 00             	movzbl (%eax),%eax
    8661:	0f b6 c0             	movzbl %al,%eax
    8664:	01 45 f0             	add    %eax,-0x10(%ebp)
    8667:	8b 45 08             	mov    0x8(%ebp),%eax
    866a:	8b 40 20             	mov    0x20(%eax),%eax
    866d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8670:	01 d2                	add    %edx,%edx
    8672:	01 d0                	add    %edx,%eax
    8674:	0f b6 00             	movzbl (%eax),%eax
    8677:	3c f9                	cmp    $0xf9,%al
    8679:	77 d6                	ja     8651 <huffman_decoder+0x104>
      point += h->val[point][0];
    867b:	8b 45 08             	mov    0x8(%ebp),%eax
    867e:	8b 40 20             	mov    0x20(%eax),%eax
    8681:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8684:	01 d2                	add    %edx,%edx
    8686:	01 d0                	add    %edx,%eax
    8688:	0f b6 00             	movzbl (%eax),%eax
    868b:	0f b6 c0             	movzbl %al,%eax
    868e:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    8691:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    8694:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    8698:	0f 85 07 ff ff ff    	jne    85a5 <huffman_decoder+0x58>
    869e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    86a1:	a1 a4 49 01 00       	mov    0x149a4,%eax
    86a6:	39 c2                	cmp    %eax,%edx
    86a8:	0f 82 f7 fe ff ff    	jb     85a5 <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    86ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    86b2:	74 24                	je     86d8 <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    86b4:	8b 45 08             	mov    0x8(%ebp),%eax
    86b7:	8b 40 04             	mov    0x4(%eax),%eax
    86ba:	83 e8 01             	sub    $0x1,%eax
    86bd:	01 c0                	add    %eax,%eax
    86bf:	89 c2                	mov    %eax,%edx
    86c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    86c4:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    86c6:	8b 45 08             	mov    0x8(%ebp),%eax
    86c9:	8b 40 08             	mov    0x8(%eax),%eax
    86cc:	83 e8 01             	sub    $0x1,%eax
    86cf:	01 c0                	add    %eax,%eax
    86d1:	89 c2                	mov    %eax,%edx
    86d3:	8b 45 10             	mov    0x10(%ebp),%eax
    86d6:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    86d8:	8b 45 08             	mov    0x8(%ebp),%eax
    86db:	0f b6 00             	movzbl (%eax),%eax
    86de:	3c 33                	cmp    $0x33,%al
    86e0:	0f 85 ec 00 00 00    	jne    87d2 <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    86e6:	8b 45 08             	mov    0x8(%ebp),%eax
    86e9:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    86ed:	3c 32                	cmp    $0x32,%al
    86ef:	74 0f                	je     8700 <huffman_decoder+0x1b3>
    86f1:	8b 45 08             	mov    0x8(%ebp),%eax
    86f4:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    86f8:	3c 33                	cmp    $0x33,%al
    86fa:	0f 85 d2 00 00 00    	jne    87d2 <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    8700:	8b 45 10             	mov    0x10(%ebp),%eax
    8703:	8b 00                	mov    (%eax),%eax
    8705:	c1 f8 03             	sar    $0x3,%eax
    8708:	83 e0 01             	and    $0x1,%eax
    870b:	89 c2                	mov    %eax,%edx
    870d:	8b 45 14             	mov    0x14(%ebp),%eax
    8710:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    8712:	8b 45 10             	mov    0x10(%ebp),%eax
    8715:	8b 00                	mov    (%eax),%eax
    8717:	c1 f8 02             	sar    $0x2,%eax
    871a:	83 e0 01             	and    $0x1,%eax
    871d:	89 c2                	mov    %eax,%edx
    871f:	8b 45 18             	mov    0x18(%ebp),%eax
    8722:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    8724:	8b 45 10             	mov    0x10(%ebp),%eax
    8727:	8b 00                	mov    (%eax),%eax
    8729:	d1 f8                	sar    %eax
    872b:	83 e0 01             	and    $0x1,%eax
    872e:	89 c2                	mov    %eax,%edx
    8730:	8b 45 0c             	mov    0xc(%ebp),%eax
    8733:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    8735:	8b 45 10             	mov    0x10(%ebp),%eax
    8738:	8b 00                	mov    (%eax),%eax
    873a:	83 e0 01             	and    $0x1,%eax
    873d:	89 c2                	mov    %eax,%edx
    873f:	8b 45 10             	mov    0x10(%ebp),%eax
    8742:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    8744:	8b 45 14             	mov    0x14(%ebp),%eax
    8747:	8b 00                	mov    (%eax),%eax
    8749:	85 c0                	test   %eax,%eax
    874b:	74 18                	je     8765 <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    874d:	e8 59 e5 ff ff       	call   6cab <hget1bit>
    8752:	83 f8 01             	cmp    $0x1,%eax
    8755:	75 0e                	jne    8765 <huffman_decoder+0x218>
    8757:	8b 45 14             	mov    0x14(%ebp),%eax
    875a:	8b 00                	mov    (%eax),%eax
    875c:	f7 d8                	neg    %eax
    875e:	89 c2                	mov    %eax,%edx
    8760:	8b 45 14             	mov    0x14(%ebp),%eax
    8763:	89 10                	mov    %edx,(%eax)
     if (*w)
    8765:	8b 45 18             	mov    0x18(%ebp),%eax
    8768:	8b 00                	mov    (%eax),%eax
    876a:	85 c0                	test   %eax,%eax
    876c:	74 18                	je     8786 <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    876e:	e8 38 e5 ff ff       	call   6cab <hget1bit>
    8773:	83 f8 01             	cmp    $0x1,%eax
    8776:	75 0e                	jne    8786 <huffman_decoder+0x239>
    8778:	8b 45 18             	mov    0x18(%ebp),%eax
    877b:	8b 00                	mov    (%eax),%eax
    877d:	f7 d8                	neg    %eax
    877f:	89 c2                	mov    %eax,%edx
    8781:	8b 45 18             	mov    0x18(%ebp),%eax
    8784:	89 10                	mov    %edx,(%eax)
     if (*x)
    8786:	8b 45 0c             	mov    0xc(%ebp),%eax
    8789:	8b 00                	mov    (%eax),%eax
    878b:	85 c0                	test   %eax,%eax
    878d:	74 18                	je     87a7 <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    878f:	e8 17 e5 ff ff       	call   6cab <hget1bit>
    8794:	83 f8 01             	cmp    $0x1,%eax
    8797:	75 0e                	jne    87a7 <huffman_decoder+0x25a>
    8799:	8b 45 0c             	mov    0xc(%ebp),%eax
    879c:	8b 00                	mov    (%eax),%eax
    879e:	f7 d8                	neg    %eax
    87a0:	89 c2                	mov    %eax,%edx
    87a2:	8b 45 0c             	mov    0xc(%ebp),%eax
    87a5:	89 10                	mov    %edx,(%eax)
     if (*y)
    87a7:	8b 45 10             	mov    0x10(%ebp),%eax
    87aa:	8b 00                	mov    (%eax),%eax
    87ac:	85 c0                	test   %eax,%eax
    87ae:	74 1d                	je     87cd <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    87b0:	e8 f6 e4 ff ff       	call   6cab <hget1bit>
    87b5:	83 f8 01             	cmp    $0x1,%eax
    87b8:	75 13                	jne    87cd <huffman_decoder+0x280>
    87ba:	8b 45 10             	mov    0x10(%ebp),%eax
    87bd:	8b 00                	mov    (%eax),%eax
    87bf:	f7 d8                	neg    %eax
    87c1:	89 c2                	mov    %eax,%edx
    87c3:	8b 45 10             	mov    0x10(%ebp),%eax
    87c6:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    87c8:	e9 bb 00 00 00       	jmp    8888 <huffman_decoder+0x33b>
    87cd:	e9 b6 00 00 00       	jmp    8888 <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    87d2:	8b 45 08             	mov    0x8(%ebp),%eax
    87d5:	8b 40 0c             	mov    0xc(%eax),%eax
    87d8:	85 c0                	test   %eax,%eax
    87da:	74 30                	je     880c <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    87dc:	8b 45 08             	mov    0x8(%ebp),%eax
    87df:	8b 40 04             	mov    0x4(%eax),%eax
    87e2:	8d 50 ff             	lea    -0x1(%eax),%edx
    87e5:	8b 45 0c             	mov    0xc(%ebp),%eax
    87e8:	8b 00                	mov    (%eax),%eax
    87ea:	39 c2                	cmp    %eax,%edx
    87ec:	75 1e                	jne    880c <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    87ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    87f1:	8b 00                	mov    (%eax),%eax
    87f3:	89 c3                	mov    %eax,%ebx
    87f5:	8b 45 08             	mov    0x8(%ebp),%eax
    87f8:	8b 40 0c             	mov    0xc(%eax),%eax
    87fb:	89 04 24             	mov    %eax,(%esp)
    87fe:	e8 8d e4 ff ff       	call   6c90 <hgetbits>
    8803:	01 d8                	add    %ebx,%eax
    8805:	89 c2                	mov    %eax,%edx
    8807:	8b 45 0c             	mov    0xc(%ebp),%eax
    880a:	89 10                	mov    %edx,(%eax)
     if (*x)
    880c:	8b 45 0c             	mov    0xc(%ebp),%eax
    880f:	8b 00                	mov    (%eax),%eax
    8811:	85 c0                	test   %eax,%eax
    8813:	74 18                	je     882d <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    8815:	e8 91 e4 ff ff       	call   6cab <hget1bit>
    881a:	83 f8 01             	cmp    $0x1,%eax
    881d:	75 0e                	jne    882d <huffman_decoder+0x2e0>
    881f:	8b 45 0c             	mov    0xc(%ebp),%eax
    8822:	8b 00                	mov    (%eax),%eax
    8824:	f7 d8                	neg    %eax
    8826:	89 c2                	mov    %eax,%edx
    8828:	8b 45 0c             	mov    0xc(%ebp),%eax
    882b:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    882d:	8b 45 08             	mov    0x8(%ebp),%eax
    8830:	8b 40 0c             	mov    0xc(%eax),%eax
    8833:	85 c0                	test   %eax,%eax
    8835:	74 30                	je     8867 <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    8837:	8b 45 08             	mov    0x8(%ebp),%eax
    883a:	8b 40 08             	mov    0x8(%eax),%eax
    883d:	8d 50 ff             	lea    -0x1(%eax),%edx
    8840:	8b 45 10             	mov    0x10(%ebp),%eax
    8843:	8b 00                	mov    (%eax),%eax
    8845:	39 c2                	cmp    %eax,%edx
    8847:	75 1e                	jne    8867 <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    8849:	8b 45 10             	mov    0x10(%ebp),%eax
    884c:	8b 00                	mov    (%eax),%eax
    884e:	89 c3                	mov    %eax,%ebx
    8850:	8b 45 08             	mov    0x8(%ebp),%eax
    8853:	8b 40 0c             	mov    0xc(%eax),%eax
    8856:	89 04 24             	mov    %eax,(%esp)
    8859:	e8 32 e4 ff ff       	call   6c90 <hgetbits>
    885e:	01 d8                	add    %ebx,%eax
    8860:	89 c2                	mov    %eax,%edx
    8862:	8b 45 10             	mov    0x10(%ebp),%eax
    8865:	89 10                	mov    %edx,(%eax)
     if (*y)
    8867:	8b 45 10             	mov    0x10(%ebp),%eax
    886a:	8b 00                	mov    (%eax),%eax
    886c:	85 c0                	test   %eax,%eax
    886e:	74 18                	je     8888 <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    8870:	e8 36 e4 ff ff       	call   6cab <hget1bit>
    8875:	83 f8 01             	cmp    $0x1,%eax
    8878:	75 0e                	jne    8888 <huffman_decoder+0x33b>
    887a:	8b 45 10             	mov    0x10(%ebp),%eax
    887d:	8b 00                	mov    (%eax),%eax
    887f:	f7 d8                	neg    %eax
    8881:	89 c2                	mov    %eax,%edx
    8883:	8b 45 10             	mov    0x10(%ebp),%eax
    8886:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    8888:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    888b:	83 c4 24             	add    $0x24,%esp
    888e:	5b                   	pop    %ebx
    888f:	5d                   	pop    %ebp
    8890:	c3                   	ret    

00008891 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    8891:	55                   	push   %ebp
    8892:	89 e5                	mov    %esp,%ebp
    8894:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    8897:	8b 45 0c             	mov    0xc(%ebp),%eax
    889a:	8b 00                	mov    (%eax),%eax
    889c:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    889f:	8b 45 08             	mov    0x8(%ebp),%eax
    88a2:	89 04 24             	mov    %eax,(%esp)
    88a5:	e8 6c df ff ff       	call   6816 <get1bit>
    88aa:	89 c2                	mov    %eax,%edx
    88ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88af:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    88b1:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    88b8:	00 
    88b9:	8b 45 08             	mov    0x8(%ebp),%eax
    88bc:	89 04 24             	mov    %eax,(%esp)
    88bf:	e8 64 e0 ff ff       	call   6928 <getbits>
    88c4:	ba 04 00 00 00       	mov    $0x4,%edx
    88c9:	29 c2                	sub    %eax,%edx
    88cb:	89 d0                	mov    %edx,%eax
    88cd:	89 c2                	mov    %eax,%edx
    88cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88d2:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    88d5:	8b 45 08             	mov    0x8(%ebp),%eax
    88d8:	89 04 24             	mov    %eax,(%esp)
    88db:	e8 36 df ff ff       	call   6816 <get1bit>
    88e0:	85 c0                	test   %eax,%eax
    88e2:	0f 94 c0             	sete   %al
    88e5:	0f b6 d0             	movzbl %al,%edx
    88e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88eb:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    88ee:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    88f5:	00 
    88f6:	8b 45 08             	mov    0x8(%ebp),%eax
    88f9:	89 04 24             	mov    %eax,(%esp)
    88fc:	e8 27 e0 ff ff       	call   6928 <getbits>
    8901:	89 c2                	mov    %eax,%edx
    8903:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8906:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    8909:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8910:	00 
    8911:	8b 45 08             	mov    0x8(%ebp),%eax
    8914:	89 04 24             	mov    %eax,(%esp)
    8917:	e8 0c e0 ff ff       	call   6928 <getbits>
    891c:	89 c2                	mov    %eax,%edx
    891e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8921:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    8924:	8b 45 08             	mov    0x8(%ebp),%eax
    8927:	89 04 24             	mov    %eax,(%esp)
    892a:	e8 e7 de ff ff       	call   6816 <get1bit>
    892f:	89 c2                	mov    %eax,%edx
    8931:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8934:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    8937:	8b 45 08             	mov    0x8(%ebp),%eax
    893a:	89 04 24             	mov    %eax,(%esp)
    893d:	e8 d4 de ff ff       	call   6816 <get1bit>
    8942:	89 c2                	mov    %eax,%edx
    8944:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8947:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    894a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8951:	00 
    8952:	8b 45 08             	mov    0x8(%ebp),%eax
    8955:	89 04 24             	mov    %eax,(%esp)
    8958:	e8 cb df ff ff       	call   6928 <getbits>
    895d:	89 c2                	mov    %eax,%edx
    895f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8962:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    8965:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    896c:	00 
    896d:	8b 45 08             	mov    0x8(%ebp),%eax
    8970:	89 04 24             	mov    %eax,(%esp)
    8973:	e8 b0 df ff ff       	call   6928 <getbits>
    8978:	89 c2                	mov    %eax,%edx
    897a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    897d:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    8980:	8b 45 08             	mov    0x8(%ebp),%eax
    8983:	89 04 24             	mov    %eax,(%esp)
    8986:	e8 8b de ff ff       	call   6816 <get1bit>
    898b:	89 c2                	mov    %eax,%edx
    898d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8990:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    8993:	8b 45 08             	mov    0x8(%ebp),%eax
    8996:	89 04 24             	mov    %eax,(%esp)
    8999:	e8 78 de ff ff       	call   6816 <get1bit>
    899e:	89 c2                	mov    %eax,%edx
    89a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89a3:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    89a6:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    89ad:	00 
    89ae:	8b 45 08             	mov    0x8(%ebp),%eax
    89b1:	89 04 24             	mov    %eax,(%esp)
    89b4:	e8 6f df ff ff       	call   6928 <getbits>
    89b9:	89 c2                	mov    %eax,%edx
    89bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89be:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    89c1:	c9                   	leave  
    89c2:	c3                   	ret    

000089c3 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    89c3:	55                   	push   %ebp
    89c4:	89 e5                	mov    %esp,%ebp
    89c6:	56                   	push   %esi
    89c7:	53                   	push   %ebx
    89c8:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    89cb:	8b 45 10             	mov    0x10(%ebp),%eax
    89ce:	8b 40 08             	mov    0x8(%eax),%eax
    89d1:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    89d4:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    89db:	00 
    89dc:	8b 45 08             	mov    0x8(%ebp),%eax
    89df:	89 04 24             	mov    %eax,(%esp)
    89e2:	e8 41 df ff ff       	call   6928 <getbits>
    89e7:	8b 55 0c             	mov    0xc(%ebp),%edx
    89ea:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    89ec:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    89f0:	75 1b                	jne    8a0d <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    89f2:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    89f9:	00 
    89fa:	8b 45 08             	mov    0x8(%ebp),%eax
    89fd:	89 04 24             	mov    %eax,(%esp)
    8a00:	e8 23 df ff ff       	call   6928 <getbits>
    8a05:	8b 55 0c             	mov    0xc(%ebp),%edx
    8a08:	89 42 04             	mov    %eax,0x4(%edx)
    8a0b:	eb 19                	jmp    8a26 <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    8a0d:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    8a14:	00 
    8a15:	8b 45 08             	mov    0x8(%ebp),%eax
    8a18:	89 04 24             	mov    %eax,(%esp)
    8a1b:	e8 08 df ff ff       	call   6928 <getbits>
    8a20:	8b 55 0c             	mov    0xc(%ebp),%edx
    8a23:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    8a26:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8a2d:	eb 3d                	jmp    8a6c <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    8a2f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8a36:	eb 2a                	jmp    8a62 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    8a38:	8b 45 08             	mov    0x8(%ebp),%eax
    8a3b:	89 04 24             	mov    %eax,(%esp)
    8a3e:	e8 d3 dd ff ff       	call   6816 <get1bit>
    8a43:	89 c1                	mov    %eax,%ecx
    8a45:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8a48:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8a4b:	89 d0                	mov    %edx,%eax
    8a4d:	c1 e0 02             	shl    $0x2,%eax
    8a50:	01 d0                	add    %edx,%eax
    8a52:	c1 e0 03             	shl    $0x3,%eax
    8a55:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8a58:	01 d0                	add    %edx,%eax
    8a5a:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    8a5e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8a62:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    8a66:	7e d0                	jle    8a38 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    8a68:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8a6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a6f:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8a72:	7c bb                	jl     8a2f <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    8a74:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8a7b:	e9 c5 05 00 00       	jmp    9045 <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    8a80:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8a87:	e9 a9 05 00 00       	jmp    9035 <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    8a8c:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    8a93:	00 
    8a94:	8b 45 08             	mov    0x8(%ebp),%eax
    8a97:	89 04 24             	mov    %eax,(%esp)
    8a9a:	e8 89 de ff ff       	call   6928 <getbits>
    8a9f:	89 c3                	mov    %eax,%ebx
    8aa1:	8b 75 0c             	mov    0xc(%ebp),%esi
    8aa4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8aa7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8aaa:	89 c2                	mov    %eax,%edx
    8aac:	c1 e2 03             	shl    $0x3,%edx
    8aaf:	01 c2                	add    %eax,%edx
    8ab1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8ab8:	89 c2                	mov    %eax,%edx
    8aba:	89 c8                	mov    %ecx,%eax
    8abc:	c1 e0 02             	shl    $0x2,%eax
    8abf:	01 c8                	add    %ecx,%eax
    8ac1:	c1 e0 05             	shl    $0x5,%eax
    8ac4:	01 d0                	add    %edx,%eax
    8ac6:	01 f0                	add    %esi,%eax
    8ac8:	83 c0 18             	add    $0x18,%eax
    8acb:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    8acd:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    8ad4:	00 
    8ad5:	8b 45 08             	mov    0x8(%ebp),%eax
    8ad8:	89 04 24             	mov    %eax,(%esp)
    8adb:	e8 48 de ff ff       	call   6928 <getbits>
    8ae0:	89 c3                	mov    %eax,%ebx
    8ae2:	8b 75 0c             	mov    0xc(%ebp),%esi
    8ae5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8ae8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8aeb:	89 c2                	mov    %eax,%edx
    8aed:	c1 e2 03             	shl    $0x3,%edx
    8af0:	01 c2                	add    %eax,%edx
    8af2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8af9:	89 c2                	mov    %eax,%edx
    8afb:	89 c8                	mov    %ecx,%eax
    8afd:	c1 e0 02             	shl    $0x2,%eax
    8b00:	01 c8                	add    %ecx,%eax
    8b02:	c1 e0 05             	shl    $0x5,%eax
    8b05:	01 d0                	add    %edx,%eax
    8b07:	01 f0                	add    %esi,%eax
    8b09:	83 c0 1c             	add    $0x1c,%eax
    8b0c:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    8b0e:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    8b15:	00 
    8b16:	8b 45 08             	mov    0x8(%ebp),%eax
    8b19:	89 04 24             	mov    %eax,(%esp)
    8b1c:	e8 07 de ff ff       	call   6928 <getbits>
    8b21:	89 c3                	mov    %eax,%ebx
    8b23:	8b 75 0c             	mov    0xc(%ebp),%esi
    8b26:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8b29:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8b2c:	89 c2                	mov    %eax,%edx
    8b2e:	c1 e2 03             	shl    $0x3,%edx
    8b31:	01 c2                	add    %eax,%edx
    8b33:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8b3a:	89 c2                	mov    %eax,%edx
    8b3c:	89 c8                	mov    %ecx,%eax
    8b3e:	c1 e0 02             	shl    $0x2,%eax
    8b41:	01 c8                	add    %ecx,%eax
    8b43:	c1 e0 05             	shl    $0x5,%eax
    8b46:	01 d0                	add    %edx,%eax
    8b48:	01 f0                	add    %esi,%eax
    8b4a:	83 c0 20             	add    $0x20,%eax
    8b4d:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    8b4f:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    8b56:	00 
    8b57:	8b 45 08             	mov    0x8(%ebp),%eax
    8b5a:	89 04 24             	mov    %eax,(%esp)
    8b5d:	e8 c6 dd ff ff       	call   6928 <getbits>
    8b62:	89 c3                	mov    %eax,%ebx
    8b64:	8b 75 0c             	mov    0xc(%ebp),%esi
    8b67:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8b6a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8b6d:	89 c2                	mov    %eax,%edx
    8b6f:	c1 e2 03             	shl    $0x3,%edx
    8b72:	01 c2                	add    %eax,%edx
    8b74:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8b7b:	89 c2                	mov    %eax,%edx
    8b7d:	89 c8                	mov    %ecx,%eax
    8b7f:	c1 e0 02             	shl    $0x2,%eax
    8b82:	01 c8                	add    %ecx,%eax
    8b84:	c1 e0 05             	shl    $0x5,%eax
    8b87:	01 d0                	add    %edx,%eax
    8b89:	01 f0                	add    %esi,%eax
    8b8b:	83 c0 24             	add    $0x24,%eax
    8b8e:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    8b90:	8b 45 08             	mov    0x8(%ebp),%eax
    8b93:	89 04 24             	mov    %eax,(%esp)
    8b96:	e8 7b dc ff ff       	call   6816 <get1bit>
    8b9b:	89 c3                	mov    %eax,%ebx
    8b9d:	8b 75 0c             	mov    0xc(%ebp),%esi
    8ba0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8ba3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8ba6:	89 c2                	mov    %eax,%edx
    8ba8:	c1 e2 03             	shl    $0x3,%edx
    8bab:	01 c2                	add    %eax,%edx
    8bad:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8bb4:	89 c2                	mov    %eax,%edx
    8bb6:	89 c8                	mov    %ecx,%eax
    8bb8:	c1 e0 02             	shl    $0x2,%eax
    8bbb:	01 c8                	add    %ecx,%eax
    8bbd:	c1 e0 05             	shl    $0x5,%eax
    8bc0:	01 d0                	add    %edx,%eax
    8bc2:	01 f0                	add    %esi,%eax
    8bc4:	83 c0 28             	add    $0x28,%eax
    8bc7:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    8bc9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8bcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8bcf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8bd2:	89 c2                	mov    %eax,%edx
    8bd4:	c1 e2 03             	shl    $0x3,%edx
    8bd7:	01 c2                	add    %eax,%edx
    8bd9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8be0:	89 c2                	mov    %eax,%edx
    8be2:	89 c8                	mov    %ecx,%eax
    8be4:	c1 e0 02             	shl    $0x2,%eax
    8be7:	01 c8                	add    %ecx,%eax
    8be9:	c1 e0 05             	shl    $0x5,%eax
    8bec:	01 d0                	add    %edx,%eax
    8bee:	01 d8                	add    %ebx,%eax
    8bf0:	83 c0 28             	add    $0x28,%eax
    8bf3:	8b 00                	mov    (%eax),%eax
    8bf5:	85 c0                	test   %eax,%eax
    8bf7:	0f 84 82 02 00 00    	je     8e7f <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    8bfd:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8c04:	00 
    8c05:	8b 45 08             	mov    0x8(%ebp),%eax
    8c08:	89 04 24             	mov    %eax,(%esp)
    8c0b:	e8 18 dd ff ff       	call   6928 <getbits>
    8c10:	89 c3                	mov    %eax,%ebx
    8c12:	8b 75 0c             	mov    0xc(%ebp),%esi
    8c15:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c18:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8c1b:	89 c2                	mov    %eax,%edx
    8c1d:	c1 e2 03             	shl    $0x3,%edx
    8c20:	01 c2                	add    %eax,%edx
    8c22:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c29:	89 c2                	mov    %eax,%edx
    8c2b:	89 c8                	mov    %ecx,%eax
    8c2d:	c1 e0 02             	shl    $0x2,%eax
    8c30:	01 c8                	add    %ecx,%eax
    8c32:	c1 e0 05             	shl    $0x5,%eax
    8c35:	01 d0                	add    %edx,%eax
    8c37:	01 f0                	add    %esi,%eax
    8c39:	83 c0 2c             	add    $0x2c,%eax
    8c3c:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    8c3e:	8b 45 08             	mov    0x8(%ebp),%eax
    8c41:	89 04 24             	mov    %eax,(%esp)
    8c44:	e8 cd db ff ff       	call   6816 <get1bit>
    8c49:	89 c3                	mov    %eax,%ebx
    8c4b:	8b 75 0c             	mov    0xc(%ebp),%esi
    8c4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c51:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8c54:	89 c2                	mov    %eax,%edx
    8c56:	c1 e2 03             	shl    $0x3,%edx
    8c59:	01 c2                	add    %eax,%edx
    8c5b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c62:	89 c2                	mov    %eax,%edx
    8c64:	89 c8                	mov    %ecx,%eax
    8c66:	c1 e0 02             	shl    $0x2,%eax
    8c69:	01 c8                	add    %ecx,%eax
    8c6b:	c1 e0 05             	shl    $0x5,%eax
    8c6e:	01 d0                	add    %edx,%eax
    8c70:	01 f0                	add    %esi,%eax
    8c72:	83 c0 30             	add    $0x30,%eax
    8c75:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    8c77:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8c7e:	eb 46                	jmp    8cc6 <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    8c80:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    8c87:	00 
    8c88:	8b 45 08             	mov    0x8(%ebp),%eax
    8c8b:	89 04 24             	mov    %eax,(%esp)
    8c8e:	e8 95 dc ff ff       	call   6928 <getbits>
    8c93:	89 c3                	mov    %eax,%ebx
    8c95:	8b 75 0c             	mov    0xc(%ebp),%esi
    8c98:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c9b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8c9e:	89 c2                	mov    %eax,%edx
    8ca0:	c1 e2 03             	shl    $0x3,%edx
    8ca3:	01 c2                	add    %eax,%edx
    8ca5:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8ca8:	89 c2                	mov    %eax,%edx
    8caa:	89 c8                	mov    %ecx,%eax
    8cac:	c1 e0 02             	shl    $0x2,%eax
    8caf:	01 c8                	add    %ecx,%eax
    8cb1:	c1 e0 03             	shl    $0x3,%eax
    8cb4:	01 c2                	add    %eax,%edx
    8cb6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8cb9:	01 d0                	add    %edx,%eax
    8cbb:	83 c0 08             	add    $0x8,%eax
    8cbe:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    8cc2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8cc6:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    8cca:	7e b4                	jle    8c80 <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    8ccc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8cd3:	eb 46                	jmp    8d1b <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    8cd5:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    8cdc:	00 
    8cdd:	8b 45 08             	mov    0x8(%ebp),%eax
    8ce0:	89 04 24             	mov    %eax,(%esp)
    8ce3:	e8 40 dc ff ff       	call   6928 <getbits>
    8ce8:	89 c3                	mov    %eax,%ebx
    8cea:	8b 75 0c             	mov    0xc(%ebp),%esi
    8ced:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8cf0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8cf3:	89 c2                	mov    %eax,%edx
    8cf5:	c1 e2 03             	shl    $0x3,%edx
    8cf8:	01 c2                	add    %eax,%edx
    8cfa:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8cfd:	89 c2                	mov    %eax,%edx
    8cff:	89 c8                	mov    %ecx,%eax
    8d01:	c1 e0 02             	shl    $0x2,%eax
    8d04:	01 c8                	add    %ecx,%eax
    8d06:	c1 e0 03             	shl    $0x3,%eax
    8d09:	01 c2                	add    %eax,%edx
    8d0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8d0e:	01 d0                	add    %edx,%eax
    8d10:	83 c0 0c             	add    $0xc,%eax
    8d13:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    8d17:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8d1b:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8d1f:	7e b4                	jle    8cd5 <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    8d21:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8d24:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8d27:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8d2a:	89 c2                	mov    %eax,%edx
    8d2c:	c1 e2 03             	shl    $0x3,%edx
    8d2f:	01 c2                	add    %eax,%edx
    8d31:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8d38:	89 c2                	mov    %eax,%edx
    8d3a:	89 c8                	mov    %ecx,%eax
    8d3c:	c1 e0 02             	shl    $0x2,%eax
    8d3f:	01 c8                	add    %ecx,%eax
    8d41:	c1 e0 05             	shl    $0x5,%eax
    8d44:	01 d0                	add    %edx,%eax
    8d46:	01 d8                	add    %ebx,%eax
    8d48:	83 c0 2c             	add    $0x2c,%eax
    8d4b:	8b 00                	mov    (%eax),%eax
    8d4d:	85 c0                	test   %eax,%eax
    8d4f:	75 05                	jne    8d56 <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    8d51:	e8 84 cb ff ff       	call   58da <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    8d56:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8d5c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8d5f:	89 c2                	mov    %eax,%edx
    8d61:	c1 e2 03             	shl    $0x3,%edx
    8d64:	01 c2                	add    %eax,%edx
    8d66:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8d6d:	89 c2                	mov    %eax,%edx
    8d6f:	89 c8                	mov    %ecx,%eax
    8d71:	c1 e0 02             	shl    $0x2,%eax
    8d74:	01 c8                	add    %ecx,%eax
    8d76:	c1 e0 05             	shl    $0x5,%eax
    8d79:	01 d0                	add    %edx,%eax
    8d7b:	01 d8                	add    %ebx,%eax
    8d7d:	83 c0 2c             	add    $0x2c,%eax
    8d80:	8b 00                	mov    (%eax),%eax
    8d82:	83 f8 02             	cmp    $0x2,%eax
    8d85:	75 62                	jne    8de9 <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    8d87:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8d8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8d8d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8d90:	89 c2                	mov    %eax,%edx
    8d92:	c1 e2 03             	shl    $0x3,%edx
    8d95:	01 c2                	add    %eax,%edx
    8d97:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8d9e:	89 c2                	mov    %eax,%edx
    8da0:	89 c8                	mov    %ecx,%eax
    8da2:	c1 e0 02             	shl    $0x2,%eax
    8da5:	01 c8                	add    %ecx,%eax
    8da7:	c1 e0 05             	shl    $0x5,%eax
    8daa:	01 d0                	add    %edx,%eax
    8dac:	01 d8                	add    %ebx,%eax
    8dae:	83 c0 30             	add    $0x30,%eax
    8db1:	8b 00                	mov    (%eax),%eax
    8db3:	85 c0                	test   %eax,%eax
    8db5:	75 32                	jne    8de9 <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    8db7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8dba:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8dbd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8dc0:	89 c2                	mov    %eax,%edx
    8dc2:	c1 e2 03             	shl    $0x3,%edx
    8dc5:	01 c2                	add    %eax,%edx
    8dc7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8dce:	89 c2                	mov    %eax,%edx
    8dd0:	89 c8                	mov    %ecx,%eax
    8dd2:	c1 e0 02             	shl    $0x2,%eax
    8dd5:	01 c8                	add    %ecx,%eax
    8dd7:	c1 e0 05             	shl    $0x5,%eax
    8dda:	01 d0                	add    %edx,%eax
    8ddc:	01 d8                	add    %ebx,%eax
    8dde:	83 c0 4c             	add    $0x4c,%eax
    8de1:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    8de7:	eb 30                	jmp    8e19 <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    8de9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8dec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8def:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8df2:	89 c2                	mov    %eax,%edx
    8df4:	c1 e2 03             	shl    $0x3,%edx
    8df7:	01 c2                	add    %eax,%edx
    8df9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8e00:	89 c2                	mov    %eax,%edx
    8e02:	89 c8                	mov    %ecx,%eax
    8e04:	c1 e0 02             	shl    $0x2,%eax
    8e07:	01 c8                	add    %ecx,%eax
    8e09:	c1 e0 05             	shl    $0x5,%eax
    8e0c:	01 d0                	add    %edx,%eax
    8e0e:	01 d8                	add    %ebx,%eax
    8e10:	83 c0 4c             	add    $0x4c,%eax
    8e13:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    8e19:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8e1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e1f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8e22:	89 c2                	mov    %eax,%edx
    8e24:	c1 e2 03             	shl    $0x3,%edx
    8e27:	01 c2                	add    %eax,%edx
    8e29:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8e30:	89 c2                	mov    %eax,%edx
    8e32:	89 c8                	mov    %ecx,%eax
    8e34:	c1 e0 02             	shl    $0x2,%eax
    8e37:	01 c8                	add    %ecx,%eax
    8e39:	c1 e0 05             	shl    $0x5,%eax
    8e3c:	01 d0                	add    %edx,%eax
    8e3e:	01 d8                	add    %ebx,%eax
    8e40:	83 c0 4c             	add    $0x4c,%eax
    8e43:	8b 00                	mov    (%eax),%eax
    8e45:	ba 14 00 00 00       	mov    $0x14,%edx
    8e4a:	89 d3                	mov    %edx,%ebx
    8e4c:	29 c3                	sub    %eax,%ebx
    8e4e:	8b 75 0c             	mov    0xc(%ebp),%esi
    8e51:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e54:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8e57:	89 c2                	mov    %eax,%edx
    8e59:	c1 e2 03             	shl    $0x3,%edx
    8e5c:	01 c2                	add    %eax,%edx
    8e5e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8e65:	89 c2                	mov    %eax,%edx
    8e67:	89 c8                	mov    %ecx,%eax
    8e69:	c1 e0 02             	shl    $0x2,%eax
    8e6c:	01 c8                	add    %ecx,%eax
    8e6e:	c1 e0 05             	shl    $0x5,%eax
    8e71:	01 d0                	add    %edx,%eax
    8e73:	01 f0                	add    %esi,%eax
    8e75:	83 c0 50             	add    $0x50,%eax
    8e78:	89 18                	mov    %ebx,(%eax)
    8e7a:	e9 07 01 00 00       	jmp    8f86 <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    8e7f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8e86:	eb 46                	jmp    8ece <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    8e88:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    8e8f:	00 
    8e90:	8b 45 08             	mov    0x8(%ebp),%eax
    8e93:	89 04 24             	mov    %eax,(%esp)
    8e96:	e8 8d da ff ff       	call   6928 <getbits>
    8e9b:	89 c3                	mov    %eax,%ebx
    8e9d:	8b 75 0c             	mov    0xc(%ebp),%esi
    8ea0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8ea3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8ea6:	89 c2                	mov    %eax,%edx
    8ea8:	c1 e2 03             	shl    $0x3,%edx
    8eab:	01 c2                	add    %eax,%edx
    8ead:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8eb0:	89 c2                	mov    %eax,%edx
    8eb2:	89 c8                	mov    %ecx,%eax
    8eb4:	c1 e0 02             	shl    $0x2,%eax
    8eb7:	01 c8                	add    %ecx,%eax
    8eb9:	c1 e0 03             	shl    $0x3,%eax
    8ebc:	01 c2                	add    %eax,%edx
    8ebe:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8ec1:	01 d0                	add    %edx,%eax
    8ec3:	83 c0 08             	add    $0x8,%eax
    8ec6:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    8eca:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8ece:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8ed2:	7e b4                	jle    8e88 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    8ed4:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    8edb:	00 
    8edc:	8b 45 08             	mov    0x8(%ebp),%eax
    8edf:	89 04 24             	mov    %eax,(%esp)
    8ee2:	e8 41 da ff ff       	call   6928 <getbits>
    8ee7:	89 c3                	mov    %eax,%ebx
    8ee9:	8b 75 0c             	mov    0xc(%ebp),%esi
    8eec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8eef:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8ef2:	89 c2                	mov    %eax,%edx
    8ef4:	c1 e2 03             	shl    $0x3,%edx
    8ef7:	01 c2                	add    %eax,%edx
    8ef9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8f00:	89 c2                	mov    %eax,%edx
    8f02:	89 c8                	mov    %ecx,%eax
    8f04:	c1 e0 02             	shl    $0x2,%eax
    8f07:	01 c8                	add    %ecx,%eax
    8f09:	c1 e0 05             	shl    $0x5,%eax
    8f0c:	01 d0                	add    %edx,%eax
    8f0e:	01 f0                	add    %esi,%eax
    8f10:	83 c0 4c             	add    $0x4c,%eax
    8f13:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    8f15:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    8f1c:	00 
    8f1d:	8b 45 08             	mov    0x8(%ebp),%eax
    8f20:	89 04 24             	mov    %eax,(%esp)
    8f23:	e8 00 da ff ff       	call   6928 <getbits>
    8f28:	89 c3                	mov    %eax,%ebx
    8f2a:	8b 75 0c             	mov    0xc(%ebp),%esi
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
    8f4f:	01 f0                	add    %esi,%eax
    8f51:	83 c0 50             	add    $0x50,%eax
    8f54:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    8f56:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8f59:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f5c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8f5f:	89 c2                	mov    %eax,%edx
    8f61:	c1 e2 03             	shl    $0x3,%edx
    8f64:	01 c2                	add    %eax,%edx
    8f66:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8f6d:	89 c2                	mov    %eax,%edx
    8f6f:	89 c8                	mov    %ecx,%eax
    8f71:	c1 e0 02             	shl    $0x2,%eax
    8f74:	01 c8                	add    %ecx,%eax
    8f76:	c1 e0 05             	shl    $0x5,%eax
    8f79:	01 d0                	add    %edx,%eax
    8f7b:	01 d8                	add    %ebx,%eax
    8f7d:	83 c0 2c             	add    $0x2c,%eax
    8f80:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    8f86:	8b 45 08             	mov    0x8(%ebp),%eax
    8f89:	89 04 24             	mov    %eax,(%esp)
    8f8c:	e8 85 d8 ff ff       	call   6816 <get1bit>
    8f91:	89 c3                	mov    %eax,%ebx
    8f93:	8b 75 0c             	mov    0xc(%ebp),%esi
    8f96:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f99:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8f9c:	89 c2                	mov    %eax,%edx
    8f9e:	c1 e2 03             	shl    $0x3,%edx
    8fa1:	01 c2                	add    %eax,%edx
    8fa3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8faa:	89 c2                	mov    %eax,%edx
    8fac:	89 c8                	mov    %ecx,%eax
    8fae:	c1 e0 02             	shl    $0x2,%eax
    8fb1:	01 c8                	add    %ecx,%eax
    8fb3:	c1 e0 05             	shl    $0x5,%eax
    8fb6:	01 d0                	add    %edx,%eax
    8fb8:	01 f0                	add    %esi,%eax
    8fba:	83 c0 54             	add    $0x54,%eax
    8fbd:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    8fbf:	8b 45 08             	mov    0x8(%ebp),%eax
    8fc2:	89 04 24             	mov    %eax,(%esp)
    8fc5:	e8 4c d8 ff ff       	call   6816 <get1bit>
    8fca:	89 c3                	mov    %eax,%ebx
    8fcc:	8b 75 0c             	mov    0xc(%ebp),%esi
    8fcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8fd2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8fd5:	89 c2                	mov    %eax,%edx
    8fd7:	c1 e2 03             	shl    $0x3,%edx
    8fda:	01 c2                	add    %eax,%edx
    8fdc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8fe3:	89 c2                	mov    %eax,%edx
    8fe5:	89 c8                	mov    %ecx,%eax
    8fe7:	c1 e0 02             	shl    $0x2,%eax
    8fea:	01 c8                	add    %ecx,%eax
    8fec:	c1 e0 05             	shl    $0x5,%eax
    8fef:	01 d0                	add    %edx,%eax
    8ff1:	01 f0                	add    %esi,%eax
    8ff3:	83 c0 58             	add    $0x58,%eax
    8ff6:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    8ff8:	8b 45 08             	mov    0x8(%ebp),%eax
    8ffb:	89 04 24             	mov    %eax,(%esp)
    8ffe:	e8 13 d8 ff ff       	call   6816 <get1bit>
    9003:	89 c3                	mov    %eax,%ebx
    9005:	8b 75 0c             	mov    0xc(%ebp),%esi
    9008:	8b 45 f0             	mov    -0x10(%ebp),%eax
    900b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    900e:	89 c2                	mov    %eax,%edx
    9010:	c1 e2 03             	shl    $0x3,%edx
    9013:	01 c2                	add    %eax,%edx
    9015:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    901c:	89 c2                	mov    %eax,%edx
    901e:	89 c8                	mov    %ecx,%eax
    9020:	c1 e0 02             	shl    $0x2,%eax
    9023:	01 c8                	add    %ecx,%eax
    9025:	c1 e0 05             	shl    $0x5,%eax
    9028:	01 d0                	add    %edx,%eax
    902a:	01 f0                	add    %esi,%eax
    902c:	83 c0 5c             	add    $0x5c,%eax
    902f:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    9031:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9035:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9038:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    903b:	0f 8c 4b fa ff ff    	jl     8a8c <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    9041:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9045:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9049:	0f 8e 31 fa ff ff    	jle    8a80 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    904f:	83 c4 20             	add    $0x20,%esp
    9052:	5b                   	pop    %ebx
    9053:	5e                   	pop    %esi
    9054:	5d                   	pop    %ebp
    9055:	c3                   	ret    

00009056 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    9056:	55                   	push   %ebp
    9057:	89 e5                	mov    %esp,%ebp
    9059:	56                   	push   %esi
    905a:	53                   	push   %ebx
    905b:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    905e:	8b 45 10             	mov    0x10(%ebp),%eax
    9061:	89 c2                	mov    %eax,%edx
    9063:	c1 e2 03             	shl    $0x3,%edx
    9066:	01 c2                	add    %eax,%edx
    9068:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    906f:	89 c2                	mov    %eax,%edx
    9071:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9074:	89 c8                	mov    %ecx,%eax
    9076:	c1 e0 02             	shl    $0x2,%eax
    9079:	01 c8                	add    %ecx,%eax
    907b:	c1 e0 05             	shl    $0x5,%eax
    907e:	01 d0                	add    %edx,%eax
    9080:	8d 50 10             	lea    0x10(%eax),%edx
    9083:	8b 45 0c             	mov    0xc(%ebp),%eax
    9086:	01 d0                	add    %edx,%eax
    9088:	83 c0 08             	add    $0x8,%eax
    908b:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    908e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9091:	8b 40 10             	mov    0x10(%eax),%eax
    9094:	85 c0                	test   %eax,%eax
    9096:	0f 84 7e 02 00 00    	je     931a <III_get_scale_factors+0x2c4>
    909c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    909f:	8b 40 14             	mov    0x14(%eax),%eax
    90a2:	83 f8 02             	cmp    $0x2,%eax
    90a5:	0f 85 6f 02 00 00    	jne    931a <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    90ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
    90ae:	8b 40 18             	mov    0x18(%eax),%eax
    90b1:	85 c0                	test   %eax,%eax
    90b3:	0f 84 6b 01 00 00    	je     9224 <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    90b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    90c0:	eb 32                	jmp    90f4 <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    90c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    90c5:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    90c8:	8b 04 85 c0 0b 01 00 	mov    0x10bc0(,%eax,4),%eax
    90cf:	89 04 24             	mov    %eax,(%esp)
    90d2:	e8 b9 db ff ff       	call   6c90 <hgetbits>
    90d7:	89 c3                	mov    %eax,%ebx
    90d9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    90dc:	8b 45 14             	mov    0x14(%ebp),%eax
    90df:	01 c0                	add    %eax,%eax
    90e1:	89 c2                	mov    %eax,%edx
    90e3:	c1 e2 05             	shl    $0x5,%edx
    90e6:	29 c2                	sub    %eax,%edx
    90e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    90eb:	01 d0                	add    %edx,%eax
    90ed:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    90f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    90f4:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    90f8:	7e c8                	jle    90c2 <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    90fa:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    9101:	eb 5c                	jmp    915f <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    9103:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    910a:	eb 49                	jmp    9155 <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    910c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    910f:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    9112:	8b 04 85 c0 0b 01 00 	mov    0x10bc0(,%eax,4),%eax
    9119:	89 04 24             	mov    %eax,(%esp)
    911c:	e8 6f db ff ff       	call   6c90 <hgetbits>
    9121:	89 c6                	mov    %eax,%esi
    9123:	8b 5d 08             	mov    0x8(%ebp),%ebx
    9126:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9129:	8b 4d 14             	mov    0x14(%ebp),%ecx
    912c:	89 d0                	mov    %edx,%eax
    912e:	01 c0                	add    %eax,%eax
    9130:	01 d0                	add    %edx,%eax
    9132:	c1 e0 02             	shl    $0x2,%eax
    9135:	01 d0                	add    %edx,%eax
    9137:	89 ca                	mov    %ecx,%edx
    9139:	01 d2                	add    %edx,%edx
    913b:	89 d1                	mov    %edx,%ecx
    913d:	c1 e1 05             	shl    $0x5,%ecx
    9140:	29 d1                	sub    %edx,%ecx
    9142:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    9145:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9148:	01 d0                	add    %edx,%eax
    914a:	83 c0 14             	add    $0x14,%eax
    914d:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    9151:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9155:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9159:	7e b1                	jle    910c <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    915b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    915f:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    9163:	7e 9e                	jle    9103 <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    9165:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    916c:	eb 5f                	jmp    91cd <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    916e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9175:	eb 4c                	jmp    91c3 <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    9177:	8b 45 e8             	mov    -0x18(%ebp),%eax
    917a:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    917d:	83 c0 10             	add    $0x10,%eax
    9180:	8b 04 85 c0 0b 01 00 	mov    0x10bc0(,%eax,4),%eax
    9187:	89 04 24             	mov    %eax,(%esp)
    918a:	e8 01 db ff ff       	call   6c90 <hgetbits>
    918f:	89 c6                	mov    %eax,%esi
    9191:	8b 5d 08             	mov    0x8(%ebp),%ebx
    9194:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9197:	8b 4d 14             	mov    0x14(%ebp),%ecx
    919a:	89 d0                	mov    %edx,%eax
    919c:	01 c0                	add    %eax,%eax
    919e:	01 d0                	add    %edx,%eax
    91a0:	c1 e0 02             	shl    $0x2,%eax
    91a3:	01 d0                	add    %edx,%eax
    91a5:	89 ca                	mov    %ecx,%edx
    91a7:	01 d2                	add    %edx,%edx
    91a9:	89 d1                	mov    %edx,%ecx
    91ab:	c1 e1 05             	shl    $0x5,%ecx
    91ae:	29 d1                	sub    %edx,%ecx
    91b0:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    91b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    91b6:	01 d0                	add    %edx,%eax
    91b8:	83 c0 14             	add    $0x14,%eax
    91bb:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    91bf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    91c3:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    91c7:	7e ae                	jle    9177 <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    91c9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    91cd:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    91d1:	7e 9b                	jle    916e <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    91d3:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    91da:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    91e1:	eb 36                	jmp    9219 <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    91e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
    91e6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    91e9:	8b 4d 14             	mov    0x14(%ebp),%ecx
    91ec:	89 d0                	mov    %edx,%eax
    91ee:	01 c0                	add    %eax,%eax
    91f0:	01 d0                	add    %edx,%eax
    91f2:	c1 e0 02             	shl    $0x2,%eax
    91f5:	01 d0                	add    %edx,%eax
    91f7:	89 ca                	mov    %ecx,%edx
    91f9:	01 d2                	add    %edx,%edx
    91fb:	89 d1                	mov    %edx,%ecx
    91fd:	c1 e1 05             	shl    $0x5,%ecx
    9200:	29 d1                	sub    %edx,%ecx
    9202:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    9205:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9208:	01 d0                	add    %edx,%eax
    920a:	83 c0 14             	add    $0x14,%eax
    920d:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    9214:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    9215:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9219:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    921d:	7e c4                	jle    91e3 <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    921f:	e9 b1 01 00 00       	jmp    93d5 <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    9224:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    922b:	e9 8f 00 00 00       	jmp    92bf <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    9230:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9233:	83 c0 04             	add    $0x4,%eax
    9236:	8b 04 85 a4 0b 01 00 	mov    0x10ba4(,%eax,4),%eax
    923d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9240:	eb 64                	jmp    92a6 <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    9242:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9249:	eb 51                	jmp    929c <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    924b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    924e:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    9251:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9254:	c1 e2 04             	shl    $0x4,%edx
    9257:	01 d0                	add    %edx,%eax
    9259:	8b 04 85 c0 0b 01 00 	mov    0x10bc0(,%eax,4),%eax
    9260:	89 04 24             	mov    %eax,(%esp)
    9263:	e8 28 da ff ff       	call   6c90 <hgetbits>
    9268:	89 c6                	mov    %eax,%esi
    926a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    926d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9270:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9273:	89 d0                	mov    %edx,%eax
    9275:	01 c0                	add    %eax,%eax
    9277:	01 d0                	add    %edx,%eax
    9279:	c1 e0 02             	shl    $0x2,%eax
    927c:	01 d0                	add    %edx,%eax
    927e:	89 ca                	mov    %ecx,%edx
    9280:	01 d2                	add    %edx,%edx
    9282:	89 d1                	mov    %edx,%ecx
    9284:	c1 e1 05             	shl    $0x5,%ecx
    9287:	29 d1                	sub    %edx,%ecx
    9289:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    928c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    928f:	01 d0                	add    %edx,%eax
    9291:	83 c0 14             	add    $0x14,%eax
    9294:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    9298:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    929c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    92a0:	7e a9                	jle    924b <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    92a2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    92a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    92a9:	83 c0 01             	add    $0x1,%eax
    92ac:	83 c0 04             	add    $0x4,%eax
    92af:	8b 04 85 a4 0b 01 00 	mov    0x10ba4(,%eax,4),%eax
    92b6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    92b9:	7f 87                	jg     9242 <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    92bb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    92bf:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    92c3:	0f 8e 67 ff ff ff    	jle    9230 <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    92c9:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    92d0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    92d7:	eb 36                	jmp    930f <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    92d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    92dc:	8b 55 ec             	mov    -0x14(%ebp),%edx
    92df:	8b 4d 14             	mov    0x14(%ebp),%ecx
    92e2:	89 d0                	mov    %edx,%eax
    92e4:	01 c0                	add    %eax,%eax
    92e6:	01 d0                	add    %edx,%eax
    92e8:	c1 e0 02             	shl    $0x2,%eax
    92eb:	01 d0                	add    %edx,%eax
    92ed:	89 ca                	mov    %ecx,%edx
    92ef:	01 d2                	add    %edx,%edx
    92f1:	89 d1                	mov    %edx,%ecx
    92f3:	c1 e1 05             	shl    $0x5,%ecx
    92f6:	29 d1                	sub    %edx,%ecx
    92f8:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    92fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92fe:	01 d0                	add    %edx,%eax
    9300:	83 c0 14             	add    $0x14,%eax
    9303:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    930a:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    930b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    930f:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9313:	7e c4                	jle    92d9 <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    9315:	e9 bb 00 00 00       	jmp    93d5 <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    931a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9321:	e9 89 00 00 00       	jmp    93af <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    9326:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9329:	8b 55 14             	mov    0x14(%ebp),%edx
    932c:	89 d0                	mov    %edx,%eax
    932e:	c1 e0 02             	shl    $0x2,%eax
    9331:	01 d0                	add    %edx,%eax
    9333:	c1 e0 03             	shl    $0x3,%eax
    9336:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9339:	01 d0                	add    %edx,%eax
    933b:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    933f:	85 c0                	test   %eax,%eax
    9341:	74 06                	je     9349 <III_get_scale_factors+0x2f3>
    9343:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    9347:	75 62                	jne    93ab <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    9349:	8b 45 f0             	mov    -0x10(%ebp),%eax
    934c:	8b 04 85 a0 0b 01 00 	mov    0x10ba0(,%eax,4),%eax
    9353:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9356:	eb 41                	jmp    9399 <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    9358:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    935c:	0f 9f c0             	setg   %al
    935f:	0f b6 d0             	movzbl %al,%edx
    9362:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9365:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    9368:	c1 e2 04             	shl    $0x4,%edx
    936b:	01 d0                	add    %edx,%eax
    936d:	8b 04 85 c0 0b 01 00 	mov    0x10bc0(,%eax,4),%eax
    9374:	89 04 24             	mov    %eax,(%esp)
    9377:	e8 14 d9 ff ff       	call   6c90 <hgetbits>
    937c:	89 c3                	mov    %eax,%ebx
    937e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9381:	8b 45 14             	mov    0x14(%ebp),%eax
    9384:	01 c0                	add    %eax,%eax
    9386:	89 c2                	mov    %eax,%edx
    9388:	c1 e2 05             	shl    $0x5,%edx
    938b:	29 c2                	sub    %eax,%edx
    938d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9390:	01 d0                	add    %edx,%eax
    9392:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    9395:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9399:	8b 45 f0             	mov    -0x10(%ebp),%eax
    939c:	83 c0 01             	add    $0x1,%eax
    939f:	8b 04 85 a0 0b 01 00 	mov    0x10ba0(,%eax,4),%eax
    93a6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    93a9:	7f ad                	jg     9358 <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    93ab:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    93af:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    93b3:	0f 8e 6d ff ff ff    	jle    9326 <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    93b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    93bc:	8b 45 14             	mov    0x14(%ebp),%eax
    93bf:	c1 e0 03             	shl    $0x3,%eax
    93c2:	89 c2                	mov    %eax,%edx
    93c4:	c1 e2 05             	shl    $0x5,%edx
    93c7:	29 c2                	sub    %eax,%edx
    93c9:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    93cc:	83 c0 58             	add    $0x58,%eax
    93cf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    93d5:	83 c4 20             	add    $0x20,%esp
    93d8:	5b                   	pop    %ebx
    93d9:	5e                   	pop    %esi
    93da:	5d                   	pop    %ebp
    93db:	c3                   	ret    

000093dc <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    93dc:	55                   	push   %ebp
    93dd:	89 e5                	mov    %esp,%ebp
    93df:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    93e2:	a1 00 0f 01 00       	mov    0x10f00,%eax
    93e7:	85 c0                	test   %eax,%eax
    93e9:	74 02                	je     93ed <initialize_huffman+0x11>
    93eb:	eb 0f                	jmp    93fc <initialize_huffman+0x20>
	read_decoder_table();
    93ed:	e8 03 d9 ff ff       	call   6cf5 <read_decoder_table>
	huffman_initialized = TRUE;
    93f2:	c7 05 00 0f 01 00 01 	movl   $0x1,0x10f00
    93f9:	00 00 00 
}
    93fc:	c9                   	leave  
    93fd:	c3                   	ret    

000093fe <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    93fe:	55                   	push   %ebp
    93ff:	89 e5                	mov    %esp,%ebp
    9401:	57                   	push   %edi
    9402:	56                   	push   %esi
    9403:	53                   	push   %ebx
    9404:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    9407:	e8 d0 ff ff ff       	call   93dc <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    940c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    940f:	8b 45 14             	mov    0x14(%ebp),%eax
    9412:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9415:	89 c2                	mov    %eax,%edx
    9417:	c1 e2 03             	shl    $0x3,%edx
    941a:	01 c2                	add    %eax,%edx
    941c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9423:	89 c2                	mov    %eax,%edx
    9425:	89 c8                	mov    %ecx,%eax
    9427:	c1 e0 02             	shl    $0x2,%eax
    942a:	01 c8                	add    %ecx,%eax
    942c:	c1 e0 05             	shl    $0x5,%eax
    942f:	01 d0                	add    %edx,%eax
    9431:	01 d8                	add    %ebx,%eax
    9433:	83 c0 28             	add    $0x28,%eax
    9436:	8b 00                	mov    (%eax),%eax
    9438:	85 c0                	test   %eax,%eax
    943a:	74 44                	je     9480 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    943c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    943f:	8b 45 14             	mov    0x14(%ebp),%eax
    9442:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9445:	89 c2                	mov    %eax,%edx
    9447:	c1 e2 03             	shl    $0x3,%edx
    944a:	01 c2                	add    %eax,%edx
    944c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9453:	89 c2                	mov    %eax,%edx
    9455:	89 c8                	mov    %ecx,%eax
    9457:	c1 e0 02             	shl    $0x2,%eax
    945a:	01 c8                	add    %ecx,%eax
    945c:	c1 e0 05             	shl    $0x5,%eax
    945f:	01 d0                	add    %edx,%eax
    9461:	01 d8                	add    %ebx,%eax
    9463:	83 c0 2c             	add    $0x2c,%eax
    9466:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    9468:	83 f8 02             	cmp    $0x2,%eax
    946b:	75 13                	jne    9480 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    946d:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    9474:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    947b:	e9 cc 00 00 00       	jmp    954c <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    9480:	8b 45 1c             	mov    0x1c(%ebp),%eax
    9483:	8b 00                	mov    (%eax),%eax
    9485:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    9488:	8b 75 0c             	mov    0xc(%ebp),%esi
    948b:	8b 45 14             	mov    0x14(%ebp),%eax
    948e:	8b 5d 10             	mov    0x10(%ebp),%ebx
    9491:	89 c2                	mov    %eax,%edx
    9493:	c1 e2 03             	shl    $0x3,%edx
    9496:	01 c2                	add    %eax,%edx
    9498:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    949f:	89 c2                	mov    %eax,%edx
    94a1:	89 d8                	mov    %ebx,%eax
    94a3:	c1 e0 02             	shl    $0x2,%eax
    94a6:	01 d8                	add    %ebx,%eax
    94a8:	c1 e0 05             	shl    $0x5,%eax
    94ab:	01 d0                	add    %edx,%eax
    94ad:	01 f0                	add    %esi,%eax
    94af:	83 c0 4c             	add    $0x4c,%eax
    94b2:	8b 00                	mov    (%eax),%eax
    94b4:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    94b7:	89 c8                	mov    %ecx,%eax
    94b9:	c1 e0 03             	shl    $0x3,%eax
    94bc:	01 c8                	add    %ecx,%eax
    94be:	c1 e0 02             	shl    $0x2,%eax
    94c1:	01 c8                	add    %ecx,%eax
    94c3:	01 d0                	add    %edx,%eax
    94c5:	8b 04 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%eax
    94cc:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    94cf:	8b 45 1c             	mov    0x1c(%ebp),%eax
    94d2:	8b 00                	mov    (%eax),%eax
    94d4:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    94d7:	8b 75 0c             	mov    0xc(%ebp),%esi
    94da:	8b 45 14             	mov    0x14(%ebp),%eax
    94dd:	8b 5d 10             	mov    0x10(%ebp),%ebx
    94e0:	89 c2                	mov    %eax,%edx
    94e2:	c1 e2 03             	shl    $0x3,%edx
    94e5:	01 c2                	add    %eax,%edx
    94e7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    94ee:	89 c2                	mov    %eax,%edx
    94f0:	89 d8                	mov    %ebx,%eax
    94f2:	c1 e0 02             	shl    $0x2,%eax
    94f5:	01 d8                	add    %ebx,%eax
    94f7:	c1 e0 05             	shl    $0x5,%eax
    94fa:	01 d0                	add    %edx,%eax
    94fc:	01 f0                	add    %esi,%eax
    94fe:	83 c0 4c             	add    $0x4c,%eax
    9501:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    9503:	8b 7d 0c             	mov    0xc(%ebp),%edi
    9506:	8b 45 14             	mov    0x14(%ebp),%eax
    9509:	8b 5d 10             	mov    0x10(%ebp),%ebx
    950c:	89 c2                	mov    %eax,%edx
    950e:	c1 e2 03             	shl    $0x3,%edx
    9511:	01 c2                	add    %eax,%edx
    9513:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    951a:	89 c2                	mov    %eax,%edx
    951c:	89 d8                	mov    %ebx,%eax
    951e:	c1 e0 02             	shl    $0x2,%eax
    9521:	01 d8                	add    %ebx,%eax
    9523:	c1 e0 05             	shl    $0x5,%eax
    9526:	01 d0                	add    %edx,%eax
    9528:	01 f8                	add    %edi,%eax
    952a:	83 c0 50             	add    $0x50,%eax
    952d:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    952f:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    9531:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    9534:	89 c8                	mov    %ecx,%eax
    9536:	c1 e0 03             	shl    $0x3,%eax
    9539:	01 c8                	add    %ecx,%eax
    953b:	c1 e0 02             	shl    $0x2,%eax
    953e:	01 c8                	add    %ecx,%eax
    9540:	01 d0                	add    %edx,%eax
    9542:	8b 04 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%eax
    9549:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    954c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9553:	e9 ac 01 00 00       	jmp    9704 <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    9558:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    955b:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    955e:	7d 43                	jge    95a3 <III_hufman_decode+0x1a5>
    9560:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9563:	8b 45 14             	mov    0x14(%ebp),%eax
    9566:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9569:	89 c2                	mov    %eax,%edx
    956b:	c1 e2 03             	shl    $0x3,%edx
    956e:	01 c2                	add    %eax,%edx
    9570:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9577:	89 c2                	mov    %eax,%edx
    9579:	89 c8                	mov    %ecx,%eax
    957b:	c1 e0 02             	shl    $0x2,%eax
    957e:	01 c8                	add    %ecx,%eax
    9580:	c1 e0 05             	shl    $0x5,%eax
    9583:	01 d0                	add    %edx,%eax
    9585:	01 d8                	add    %ebx,%eax
    9587:	83 c0 34             	add    $0x34,%eax
    958a:	8b 10                	mov    (%eax),%edx
    958c:	89 d0                	mov    %edx,%eax
    958e:	c1 e0 02             	shl    $0x2,%eax
    9591:	01 d0                	add    %edx,%eax
    9593:	c1 e0 03             	shl    $0x3,%eax
    9596:	05 80 49 01 00       	add    $0x14980,%eax
    959b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    959e:	e9 86 00 00 00       	jmp    9629 <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    95a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    95a6:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    95a9:	7d 40                	jge    95eb <III_hufman_decode+0x1ed>
    95ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    95ae:	8b 45 14             	mov    0x14(%ebp),%eax
    95b1:	8b 4d 10             	mov    0x10(%ebp),%ecx
    95b4:	89 c2                	mov    %eax,%edx
    95b6:	c1 e2 03             	shl    $0x3,%edx
    95b9:	01 c2                	add    %eax,%edx
    95bb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    95c2:	89 c2                	mov    %eax,%edx
    95c4:	89 c8                	mov    %ecx,%eax
    95c6:	c1 e0 02             	shl    $0x2,%eax
    95c9:	01 c8                	add    %ecx,%eax
    95cb:	c1 e0 05             	shl    $0x5,%eax
    95ce:	01 d0                	add    %edx,%eax
    95d0:	01 d8                	add    %ebx,%eax
    95d2:	83 c0 38             	add    $0x38,%eax
    95d5:	8b 10                	mov    (%eax),%edx
    95d7:	89 d0                	mov    %edx,%eax
    95d9:	c1 e0 02             	shl    $0x2,%eax
    95dc:	01 d0                	add    %edx,%eax
    95de:	c1 e0 03             	shl    $0x3,%eax
    95e1:	05 80 49 01 00       	add    $0x14980,%eax
    95e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
    95e9:	eb 3e                	jmp    9629 <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    95eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    95ee:	8b 45 14             	mov    0x14(%ebp),%eax
    95f1:	8b 4d 10             	mov    0x10(%ebp),%ecx
    95f4:	89 c2                	mov    %eax,%edx
    95f6:	c1 e2 03             	shl    $0x3,%edx
    95f9:	01 c2                	add    %eax,%edx
    95fb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9602:	89 c2                	mov    %eax,%edx
    9604:	89 c8                	mov    %ecx,%eax
    9606:	c1 e0 02             	shl    $0x2,%eax
    9609:	01 c8                	add    %ecx,%eax
    960b:	c1 e0 05             	shl    $0x5,%eax
    960e:	01 d0                	add    %edx,%eax
    9610:	01 d8                	add    %ebx,%eax
    9612:	83 c0 3c             	add    $0x3c,%eax
    9615:	8b 10                	mov    (%eax),%edx
    9617:	89 d0                	mov    %edx,%eax
    9619:	c1 e0 02             	shl    $0x2,%eax
    961c:	01 d0                	add    %edx,%eax
    961e:	c1 e0 03             	shl    $0x3,%eax
    9621:	05 80 49 01 00       	add    $0x14980,%eax
    9626:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    9629:	8d 45 c8             	lea    -0x38(%ebp),%eax
    962c:	89 44 24 10          	mov    %eax,0x10(%esp)
    9630:	8d 45 cc             	lea    -0x34(%ebp),%eax
    9633:	89 44 24 0c          	mov    %eax,0xc(%esp)
    9637:	8d 45 d0             	lea    -0x30(%ebp),%eax
    963a:	89 44 24 08          	mov    %eax,0x8(%esp)
    963e:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    9641:	89 44 24 04          	mov    %eax,0x4(%esp)
    9645:	8b 45 e0             	mov    -0x20(%ebp),%eax
    9648:	89 04 24             	mov    %eax,(%esp)
    964b:	e8 fd ee ff ff       	call   854d <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    9650:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9653:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9658:	89 c8                	mov    %ecx,%eax
    965a:	f7 ea                	imul   %edx
    965c:	c1 fa 02             	sar    $0x2,%edx
    965f:	89 c8                	mov    %ecx,%eax
    9661:	c1 f8 1f             	sar    $0x1f,%eax
    9664:	29 c2                	sub    %eax,%edx
    9666:	89 d0                	mov    %edx,%eax
    9668:	89 c2                	mov    %eax,%edx
    966a:	89 d0                	mov    %edx,%eax
    966c:	c1 e0 03             	shl    $0x3,%eax
    966f:	01 d0                	add    %edx,%eax
    9671:	c1 e0 03             	shl    $0x3,%eax
    9674:	89 c2                	mov    %eax,%edx
    9676:	8b 45 08             	mov    0x8(%ebp),%eax
    9679:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    967c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    967f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9684:	89 c8                	mov    %ecx,%eax
    9686:	f7 ea                	imul   %edx
    9688:	c1 fa 02             	sar    $0x2,%edx
    968b:	89 c8                	mov    %ecx,%eax
    968d:	c1 f8 1f             	sar    $0x1f,%eax
    9690:	29 c2                	sub    %eax,%edx
    9692:	89 d0                	mov    %edx,%eax
    9694:	c1 e0 03             	shl    $0x3,%eax
    9697:	01 d0                	add    %edx,%eax
    9699:	01 c0                	add    %eax,%eax
    969b:	29 c1                	sub    %eax,%ecx
    969d:	89 ca                	mov    %ecx,%edx
    969f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    96a2:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    96a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    96a8:	8d 48 01             	lea    0x1(%eax),%ecx
    96ab:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    96b0:	89 c8                	mov    %ecx,%eax
    96b2:	f7 ea                	imul   %edx
    96b4:	c1 fa 02             	sar    $0x2,%edx
    96b7:	89 c8                	mov    %ecx,%eax
    96b9:	c1 f8 1f             	sar    $0x1f,%eax
    96bc:	29 c2                	sub    %eax,%edx
    96be:	89 d0                	mov    %edx,%eax
    96c0:	89 c2                	mov    %eax,%edx
    96c2:	89 d0                	mov    %edx,%eax
    96c4:	c1 e0 03             	shl    $0x3,%eax
    96c7:	01 d0                	add    %edx,%eax
    96c9:	c1 e0 03             	shl    $0x3,%eax
    96cc:	89 c2                	mov    %eax,%edx
    96ce:	8b 45 08             	mov    0x8(%ebp),%eax
    96d1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    96d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    96d7:	8d 48 01             	lea    0x1(%eax),%ecx
    96da:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    96df:	89 c8                	mov    %ecx,%eax
    96e1:	f7 ea                	imul   %edx
    96e3:	c1 fa 02             	sar    $0x2,%edx
    96e6:	89 c8                	mov    %ecx,%eax
    96e8:	c1 f8 1f             	sar    $0x1f,%eax
    96eb:	29 c2                	sub    %eax,%edx
    96ed:	89 d0                	mov    %edx,%eax
    96ef:	c1 e0 03             	shl    $0x3,%eax
    96f2:	01 d0                	add    %edx,%eax
    96f4:	01 c0                	add    %eax,%eax
    96f6:	29 c1                	sub    %eax,%ecx
    96f8:	89 ca                	mov    %ecx,%edx
    96fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
    96fd:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    9700:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    9704:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    9707:	8b 75 0c             	mov    0xc(%ebp),%esi
    970a:	8b 45 14             	mov    0x14(%ebp),%eax
    970d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9710:	89 c2                	mov    %eax,%edx
    9712:	c1 e2 03             	shl    $0x3,%edx
    9715:	01 c2                	add    %eax,%edx
    9717:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    971e:	89 c2                	mov    %eax,%edx
    9720:	89 c8                	mov    %ecx,%eax
    9722:	c1 e0 02             	shl    $0x2,%eax
    9725:	01 c8                	add    %ecx,%eax
    9727:	c1 e0 05             	shl    $0x5,%eax
    972a:	01 d0                	add    %edx,%eax
    972c:	01 f0                	add    %esi,%eax
    972e:	83 c0 1c             	add    $0x1c,%eax
    9731:	8b 00                	mov    (%eax),%eax
    9733:	01 c0                	add    %eax,%eax
    9735:	39 c3                	cmp    %eax,%ebx
    9737:	0f 82 1b fe ff ff    	jb     9558 <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    973d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9740:	8b 45 14             	mov    0x14(%ebp),%eax
    9743:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9746:	89 c2                	mov    %eax,%edx
    9748:	c1 e2 03             	shl    $0x3,%edx
    974b:	01 c2                	add    %eax,%edx
    974d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9754:	89 c2                	mov    %eax,%edx
    9756:	89 c8                	mov    %ecx,%eax
    9758:	c1 e0 02             	shl    $0x2,%eax
    975b:	01 c8                	add    %ecx,%eax
    975d:	c1 e0 05             	shl    $0x5,%eax
    9760:	01 d0                	add    %edx,%eax
    9762:	01 d8                	add    %ebx,%eax
    9764:	83 c0 5c             	add    $0x5c,%eax
    9767:	8b 00                	mov    (%eax),%eax
    9769:	8d 50 20             	lea    0x20(%eax),%edx
    976c:	89 d0                	mov    %edx,%eax
    976e:	c1 e0 02             	shl    $0x2,%eax
    9771:	01 d0                	add    %edx,%eax
    9773:	c1 e0 03             	shl    $0x3,%eax
    9776:	05 80 49 01 00       	add    $0x14980,%eax
    977b:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    977e:	e9 91 01 00 00       	jmp    9914 <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    9783:	8d 45 c8             	lea    -0x38(%ebp),%eax
    9786:	89 44 24 10          	mov    %eax,0x10(%esp)
    978a:	8d 45 cc             	lea    -0x34(%ebp),%eax
    978d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    9791:	8d 45 d0             	lea    -0x30(%ebp),%eax
    9794:	89 44 24 08          	mov    %eax,0x8(%esp)
    9798:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    979b:	89 44 24 04          	mov    %eax,0x4(%esp)
    979f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    97a2:	89 04 24             	mov    %eax,(%esp)
    97a5:	e8 a3 ed ff ff       	call   854d <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    97aa:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    97ad:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    97b2:	89 c8                	mov    %ecx,%eax
    97b4:	f7 ea                	imul   %edx
    97b6:	c1 fa 02             	sar    $0x2,%edx
    97b9:	89 c8                	mov    %ecx,%eax
    97bb:	c1 f8 1f             	sar    $0x1f,%eax
    97be:	29 c2                	sub    %eax,%edx
    97c0:	89 d0                	mov    %edx,%eax
    97c2:	89 c2                	mov    %eax,%edx
    97c4:	89 d0                	mov    %edx,%eax
    97c6:	c1 e0 03             	shl    $0x3,%eax
    97c9:	01 d0                	add    %edx,%eax
    97cb:	c1 e0 03             	shl    $0x3,%eax
    97ce:	89 c2                	mov    %eax,%edx
    97d0:	8b 45 08             	mov    0x8(%ebp),%eax
    97d3:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    97d6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    97d9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    97de:	89 c8                	mov    %ecx,%eax
    97e0:	f7 ea                	imul   %edx
    97e2:	c1 fa 02             	sar    $0x2,%edx
    97e5:	89 c8                	mov    %ecx,%eax
    97e7:	c1 f8 1f             	sar    $0x1f,%eax
    97ea:	29 c2                	sub    %eax,%edx
    97ec:	89 d0                	mov    %edx,%eax
    97ee:	c1 e0 03             	shl    $0x3,%eax
    97f1:	01 d0                	add    %edx,%eax
    97f3:	01 c0                	add    %eax,%eax
    97f5:	29 c1                	sub    %eax,%ecx
    97f7:	89 ca                	mov    %ecx,%edx
    97f9:	8b 45 cc             	mov    -0x34(%ebp),%eax
    97fc:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    97ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9802:	8d 48 01             	lea    0x1(%eax),%ecx
    9805:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    980a:	89 c8                	mov    %ecx,%eax
    980c:	f7 ea                	imul   %edx
    980e:	c1 fa 02             	sar    $0x2,%edx
    9811:	89 c8                	mov    %ecx,%eax
    9813:	c1 f8 1f             	sar    $0x1f,%eax
    9816:	29 c2                	sub    %eax,%edx
    9818:	89 d0                	mov    %edx,%eax
    981a:	89 c2                	mov    %eax,%edx
    981c:	89 d0                	mov    %edx,%eax
    981e:	c1 e0 03             	shl    $0x3,%eax
    9821:	01 d0                	add    %edx,%eax
    9823:	c1 e0 03             	shl    $0x3,%eax
    9826:	89 c2                	mov    %eax,%edx
    9828:	8b 45 08             	mov    0x8(%ebp),%eax
    982b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    982e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9831:	8d 48 01             	lea    0x1(%eax),%ecx
    9834:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9839:	89 c8                	mov    %ecx,%eax
    983b:	f7 ea                	imul   %edx
    983d:	c1 fa 02             	sar    $0x2,%edx
    9840:	89 c8                	mov    %ecx,%eax
    9842:	c1 f8 1f             	sar    $0x1f,%eax
    9845:	29 c2                	sub    %eax,%edx
    9847:	89 d0                	mov    %edx,%eax
    9849:	c1 e0 03             	shl    $0x3,%eax
    984c:	01 d0                	add    %edx,%eax
    984e:	01 c0                	add    %eax,%eax
    9850:	29 c1                	sub    %eax,%ecx
    9852:	89 ca                	mov    %ecx,%edx
    9854:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9857:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    985a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    985d:	8d 48 02             	lea    0x2(%eax),%ecx
    9860:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9865:	89 c8                	mov    %ecx,%eax
    9867:	f7 ea                	imul   %edx
    9869:	c1 fa 02             	sar    $0x2,%edx
    986c:	89 c8                	mov    %ecx,%eax
    986e:	c1 f8 1f             	sar    $0x1f,%eax
    9871:	29 c2                	sub    %eax,%edx
    9873:	89 d0                	mov    %edx,%eax
    9875:	89 c2                	mov    %eax,%edx
    9877:	89 d0                	mov    %edx,%eax
    9879:	c1 e0 03             	shl    $0x3,%eax
    987c:	01 d0                	add    %edx,%eax
    987e:	c1 e0 03             	shl    $0x3,%eax
    9881:	89 c2                	mov    %eax,%edx
    9883:	8b 45 08             	mov    0x8(%ebp),%eax
    9886:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9889:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    988c:	8d 48 02             	lea    0x2(%eax),%ecx
    988f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9894:	89 c8                	mov    %ecx,%eax
    9896:	f7 ea                	imul   %edx
    9898:	c1 fa 02             	sar    $0x2,%edx
    989b:	89 c8                	mov    %ecx,%eax
    989d:	c1 f8 1f             	sar    $0x1f,%eax
    98a0:	29 c2                	sub    %eax,%edx
    98a2:	89 d0                	mov    %edx,%eax
    98a4:	c1 e0 03             	shl    $0x3,%eax
    98a7:	01 d0                	add    %edx,%eax
    98a9:	01 c0                	add    %eax,%eax
    98ab:	29 c1                	sub    %eax,%ecx
    98ad:	89 ca                	mov    %ecx,%edx
    98af:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    98b2:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    98b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    98b8:	8d 48 03             	lea    0x3(%eax),%ecx
    98bb:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    98c0:	89 c8                	mov    %ecx,%eax
    98c2:	f7 ea                	imul   %edx
    98c4:	c1 fa 02             	sar    $0x2,%edx
    98c7:	89 c8                	mov    %ecx,%eax
    98c9:	c1 f8 1f             	sar    $0x1f,%eax
    98cc:	29 c2                	sub    %eax,%edx
    98ce:	89 d0                	mov    %edx,%eax
    98d0:	89 c2                	mov    %eax,%edx
    98d2:	89 d0                	mov    %edx,%eax
    98d4:	c1 e0 03             	shl    $0x3,%eax
    98d7:	01 d0                	add    %edx,%eax
    98d9:	c1 e0 03             	shl    $0x3,%eax
    98dc:	89 c2                	mov    %eax,%edx
    98de:	8b 45 08             	mov    0x8(%ebp),%eax
    98e1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    98e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    98e7:	8d 48 03             	lea    0x3(%eax),%ecx
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
    990a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    990d:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    9910:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    9914:	e8 5b d3 ff ff       	call   6c74 <hsstell>
    9919:	89 c3                	mov    %eax,%ebx
    991b:	8b 75 0c             	mov    0xc(%ebp),%esi
    991e:	8b 45 14             	mov    0x14(%ebp),%eax
    9921:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9924:	89 c2                	mov    %eax,%edx
    9926:	c1 e2 03             	shl    $0x3,%edx
    9929:	01 c2                	add    %eax,%edx
    992b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9932:	89 c2                	mov    %eax,%edx
    9934:	89 c8                	mov    %ecx,%eax
    9936:	c1 e0 02             	shl    $0x2,%eax
    9939:	01 c8                	add    %ecx,%eax
    993b:	c1 e0 05             	shl    $0x5,%eax
    993e:	01 d0                	add    %edx,%eax
    9940:	01 f0                	add    %esi,%eax
    9942:	83 c0 18             	add    $0x18,%eax
    9945:	8b 10                	mov    (%eax),%edx
    9947:	8b 45 18             	mov    0x18(%ebp),%eax
    994a:	01 d0                	add    %edx,%eax
    994c:	39 c3                	cmp    %eax,%ebx
    994e:	73 0d                	jae    995d <III_hufman_decode+0x55f>
    9950:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    9957:	0f 8e 26 fe ff ff    	jle    9783 <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    995d:	e8 12 d3 ff ff       	call   6c74 <hsstell>
    9962:	89 c3                	mov    %eax,%ebx
    9964:	8b 75 0c             	mov    0xc(%ebp),%esi
    9967:	8b 45 14             	mov    0x14(%ebp),%eax
    996a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    996d:	89 c2                	mov    %eax,%edx
    996f:	c1 e2 03             	shl    $0x3,%edx
    9972:	01 c2                	add    %eax,%edx
    9974:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    997b:	89 c2                	mov    %eax,%edx
    997d:	89 c8                	mov    %ecx,%eax
    997f:	c1 e0 02             	shl    $0x2,%eax
    9982:	01 c8                	add    %ecx,%eax
    9984:	c1 e0 05             	shl    $0x5,%eax
    9987:	01 d0                	add    %edx,%eax
    9989:	01 f0                	add    %esi,%eax
    998b:	83 c0 18             	add    $0x18,%eax
    998e:	8b 10                	mov    (%eax),%edx
    9990:	8b 45 18             	mov    0x18(%ebp),%eax
    9993:	01 d0                	add    %edx,%eax
    9995:	39 c3                	cmp    %eax,%ebx
    9997:	76 48                	jbe    99e1 <III_hufman_decode+0x5e3>
   {  i -=4;
    9999:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    999d:	e8 d2 d2 ff ff       	call   6c74 <hsstell>
    99a2:	8b 55 18             	mov    0x18(%ebp),%edx
    99a5:	29 d0                	sub    %edx,%eax
    99a7:	89 c6                	mov    %eax,%esi
    99a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    99ac:	8b 45 14             	mov    0x14(%ebp),%eax
    99af:	8b 4d 10             	mov    0x10(%ebp),%ecx
    99b2:	89 c2                	mov    %eax,%edx
    99b4:	c1 e2 03             	shl    $0x3,%edx
    99b7:	01 c2                	add    %eax,%edx
    99b9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    99c0:	89 c2                	mov    %eax,%edx
    99c2:	89 c8                	mov    %ecx,%eax
    99c4:	c1 e0 02             	shl    $0x2,%eax
    99c7:	01 c8                	add    %ecx,%eax
    99c9:	c1 e0 05             	shl    $0x5,%eax
    99cc:	01 d0                	add    %edx,%eax
    99ce:	01 d8                	add    %ebx,%eax
    99d0:	83 c0 18             	add    $0x18,%eax
    99d3:	8b 00                	mov    (%eax),%eax
    99d5:	29 c6                	sub    %eax,%esi
    99d7:	89 f0                	mov    %esi,%eax
    99d9:	89 04 24             	mov    %eax,(%esp)
    99dc:	e8 de d2 ff ff       	call   6cbf <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    99e1:	e8 8e d2 ff ff       	call   6c74 <hsstell>
    99e6:	89 c3                	mov    %eax,%ebx
    99e8:	8b 75 0c             	mov    0xc(%ebp),%esi
    99eb:	8b 45 14             	mov    0x14(%ebp),%eax
    99ee:	8b 4d 10             	mov    0x10(%ebp),%ecx
    99f1:	89 c2                	mov    %eax,%edx
    99f3:	c1 e2 03             	shl    $0x3,%edx
    99f6:	01 c2                	add    %eax,%edx
    99f8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    99ff:	89 c2                	mov    %eax,%edx
    9a01:	89 c8                	mov    %ecx,%eax
    9a03:	c1 e0 02             	shl    $0x2,%eax
    9a06:	01 c8                	add    %ecx,%eax
    9a08:	c1 e0 05             	shl    $0x5,%eax
    9a0b:	01 d0                	add    %edx,%eax
    9a0d:	01 f0                	add    %esi,%eax
    9a0f:	83 c0 18             	add    $0x18,%eax
    9a12:	8b 10                	mov    (%eax),%edx
    9a14:	8b 45 18             	mov    0x18(%ebp),%eax
    9a17:	01 d0                	add    %edx,%eax
    9a19:	39 c3                	cmp    %eax,%ebx
    9a1b:	73 45                	jae    9a62 <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    9a1d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9a20:	8b 45 14             	mov    0x14(%ebp),%eax
    9a23:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9a26:	89 c2                	mov    %eax,%edx
    9a28:	c1 e2 03             	shl    $0x3,%edx
    9a2b:	01 c2                	add    %eax,%edx
    9a2d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9a34:	89 c2                	mov    %eax,%edx
    9a36:	89 c8                	mov    %ecx,%eax
    9a38:	c1 e0 02             	shl    $0x2,%eax
    9a3b:	01 c8                	add    %ecx,%eax
    9a3d:	c1 e0 05             	shl    $0x5,%eax
    9a40:	01 d0                	add    %edx,%eax
    9a42:	01 d8                	add    %ebx,%eax
    9a44:	83 c0 18             	add    $0x18,%eax
    9a47:	8b 10                	mov    (%eax),%edx
    9a49:	8b 45 18             	mov    0x18(%ebp),%eax
    9a4c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9a4f:	e8 20 d2 ff ff       	call   6c74 <hsstell>
    9a54:	29 c3                	sub    %eax,%ebx
    9a56:	89 d8                	mov    %ebx,%eax
    9a58:	89 04 24             	mov    %eax,(%esp)
    9a5b:	e8 30 d2 ff ff       	call   6c90 <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    9a60:	eb 5c                	jmp    9abe <III_hufman_decode+0x6c0>
    9a62:	eb 5a                	jmp    9abe <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    9a64:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9a67:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a6c:	89 c8                	mov    %ecx,%eax
    9a6e:	f7 ea                	imul   %edx
    9a70:	c1 fa 02             	sar    $0x2,%edx
    9a73:	89 c8                	mov    %ecx,%eax
    9a75:	c1 f8 1f             	sar    $0x1f,%eax
    9a78:	29 c2                	sub    %eax,%edx
    9a7a:	89 d0                	mov    %edx,%eax
    9a7c:	89 c2                	mov    %eax,%edx
    9a7e:	89 d0                	mov    %edx,%eax
    9a80:	c1 e0 03             	shl    $0x3,%eax
    9a83:	01 d0                	add    %edx,%eax
    9a85:	c1 e0 03             	shl    $0x3,%eax
    9a88:	89 c2                	mov    %eax,%edx
    9a8a:	8b 45 08             	mov    0x8(%ebp),%eax
    9a8d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9a90:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9a93:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a98:	89 c8                	mov    %ecx,%eax
    9a9a:	f7 ea                	imul   %edx
    9a9c:	c1 fa 02             	sar    $0x2,%edx
    9a9f:	89 c8                	mov    %ecx,%eax
    9aa1:	c1 f8 1f             	sar    $0x1f,%eax
    9aa4:	29 c2                	sub    %eax,%edx
    9aa6:	89 d0                	mov    %edx,%eax
    9aa8:	c1 e0 03             	shl    $0x3,%eax
    9aab:	01 d0                	add    %edx,%eax
    9aad:	01 c0                	add    %eax,%eax
    9aaf:	29 c1                	sub    %eax,%ecx
    9ab1:	89 ca                	mov    %ecx,%edx
    9ab3:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    9aba:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9abe:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    9ac5:	7e 9d                	jle    9a64 <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    9ac7:	83 c4 4c             	add    $0x4c,%esp
    9aca:	5b                   	pop    %ebx
    9acb:	5e                   	pop    %esi
    9acc:	5f                   	pop    %edi
    9acd:	5d                   	pop    %ebp
    9ace:	c3                   	ret    

00009acf <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    9acf:	55                   	push   %ebp
    9ad0:	89 e5                	mov    %esp,%ebp
    9ad2:	56                   	push   %esi
    9ad3:	53                   	push   %ebx
    9ad4:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    9ad7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9ade:	8b 45 1c             	mov    0x1c(%ebp),%eax
    9ae1:	8b 00                	mov    (%eax),%eax
    9ae3:	8b 40 10             	mov    0x10(%eax),%eax
    9ae6:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    9ae9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    9af0:	8b 45 14             	mov    0x14(%ebp),%eax
    9af3:	8b 40 10             	mov    0x10(%eax),%eax
    9af6:	85 c0                	test   %eax,%eax
    9af8:	74 61                	je     9b5b <III_dequantize_sample+0x8c>
    9afa:	8b 45 14             	mov    0x14(%ebp),%eax
    9afd:	8b 40 14             	mov    0x14(%eax),%eax
    9b00:	83 f8 02             	cmp    $0x2,%eax
    9b03:	75 56                	jne    9b5b <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    9b05:	8b 45 14             	mov    0x14(%ebp),%eax
    9b08:	8b 40 18             	mov    0x18(%eax),%eax
    9b0b:	85 c0                	test   %eax,%eax
    9b0d:	74 15                	je     9b24 <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    9b0f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9b12:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9b18:	05 44 0c 01 00       	add    $0x10c44,%eax
    9b1d:	8b 00                	mov    (%eax),%eax
    9b1f:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    9b22:	eb 4a                	jmp    9b6e <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    9b24:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9b27:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9b2d:	05 94 0c 01 00       	add    $0x10c94,%eax
    9b32:	8b 50 0c             	mov    0xc(%eax),%edx
    9b35:	89 d0                	mov    %edx,%eax
    9b37:	01 c0                	add    %eax,%eax
    9b39:	01 d0                	add    %edx,%eax
    9b3b:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    9b3e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9b41:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9b47:	05 94 0c 01 00       	add    $0x10c94,%eax
    9b4c:	8b 40 0c             	mov    0xc(%eax),%eax
    9b4f:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    9b52:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    9b59:	eb 13                	jmp    9b6e <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    9b5b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9b5e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9b64:	05 44 0c 01 00       	add    $0x10c44,%eax
    9b69:	8b 00                	mov    (%eax),%eax
    9b6b:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    9b6e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9b75:	e9 3d 06 00 00       	jmp    a1b7 <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    9b7a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9b81:	e9 23 06 00 00       	jmp    a1a9 <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    9b86:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9b89:	89 d0                	mov    %edx,%eax
    9b8b:	c1 e0 03             	shl    $0x3,%eax
    9b8e:	01 d0                	add    %edx,%eax
    9b90:	01 c0                	add    %eax,%eax
    9b92:	89 c2                	mov    %eax,%edx
    9b94:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b97:	01 d0                	add    %edx,%eax
    9b99:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9b9c:	0f 85 9e 02 00 00    	jne    9e40 <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    9ba2:	8b 45 14             	mov    0x14(%ebp),%eax
    9ba5:	8b 40 10             	mov    0x10(%eax),%eax
    9ba8:	85 c0                	test   %eax,%eax
    9baa:	0f 84 6b 02 00 00    	je     9e1b <III_dequantize_sample+0x34c>
    9bb0:	8b 45 14             	mov    0x14(%ebp),%eax
    9bb3:	8b 40 14             	mov    0x14(%eax),%eax
    9bb6:	83 f8 02             	cmp    $0x2,%eax
    9bb9:	0f 85 5c 02 00 00    	jne    9e1b <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    9bbf:	8b 45 14             	mov    0x14(%ebp),%eax
    9bc2:	8b 40 18             	mov    0x18(%eax),%eax
    9bc5:	85 c0                	test   %eax,%eax
    9bc7:	0f 84 af 01 00 00    	je     9d7c <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    9bcd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9bd0:	89 d0                	mov    %edx,%eax
    9bd2:	c1 e0 03             	shl    $0x3,%eax
    9bd5:	01 d0                	add    %edx,%eax
    9bd7:	01 c0                	add    %eax,%eax
    9bd9:	89 c2                	mov    %eax,%edx
    9bdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9bde:	01 c2                	add    %eax,%edx
    9be0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9be3:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9be9:	05 60 0c 01 00       	add    $0x10c60,%eax
    9bee:	8b 00                	mov    (%eax),%eax
    9bf0:	39 c2                	cmp    %eax,%edx
    9bf2:	0f 85 93 00 00 00    	jne    9c8b <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    9bf8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9bfb:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9c01:	05 a0 0c 01 00       	add    $0x10ca0,%eax
    9c06:	8b 50 0c             	mov    0xc(%eax),%edx
    9c09:	89 d0                	mov    %edx,%eax
    9c0b:	01 c0                	add    %eax,%eax
    9c0d:	01 d0                	add    %edx,%eax
    9c0f:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    9c12:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    9c19:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9c1c:	8d 48 01             	lea    0x1(%eax),%ecx
    9c1f:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9c22:	89 d0                	mov    %edx,%eax
    9c24:	c1 e0 03             	shl    $0x3,%eax
    9c27:	01 d0                	add    %edx,%eax
    9c29:	c1 e0 02             	shl    $0x2,%eax
    9c2c:	01 d0                	add    %edx,%eax
    9c2e:	01 c8                	add    %ecx,%eax
    9c30:	83 c0 14             	add    $0x14,%eax
    9c33:	8b 0c 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    9c3a:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9c3d:	89 d0                	mov    %edx,%eax
    9c3f:	c1 e0 03             	shl    $0x3,%eax
    9c42:	01 d0                	add    %edx,%eax
    9c44:	c1 e0 02             	shl    $0x2,%eax
    9c47:	01 d0                	add    %edx,%eax
    9c49:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9c4c:	01 d0                	add    %edx,%eax
    9c4e:	83 c0 14             	add    $0x14,%eax
    9c51:	8b 04 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    9c58:	29 c1                	sub    %eax,%ecx
    9c5a:	89 c8                	mov    %ecx,%eax
    9c5c:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9c5f:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9c62:	89 d0                	mov    %edx,%eax
    9c64:	c1 e0 03             	shl    $0x3,%eax
    9c67:	01 d0                	add    %edx,%eax
    9c69:	c1 e0 02             	shl    $0x2,%eax
    9c6c:	01 d0                	add    %edx,%eax
    9c6e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9c71:	01 d0                	add    %edx,%eax
    9c73:	83 c0 14             	add    $0x14,%eax
    9c76:	8b 14 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%edx
    9c7d:	89 d0                	mov    %edx,%eax
    9c7f:	01 c0                	add    %eax,%eax
    9c81:	01 d0                	add    %edx,%eax
    9c83:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    9c86:	e9 8e 01 00 00       	jmp    9e19 <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    9c8b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9c8e:	89 d0                	mov    %edx,%eax
    9c90:	c1 e0 03             	shl    $0x3,%eax
    9c93:	01 d0                	add    %edx,%eax
    9c95:	01 c0                	add    %eax,%eax
    9c97:	89 c2                	mov    %eax,%edx
    9c99:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c9c:	01 c2                	add    %eax,%edx
    9c9e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9ca1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9ca7:	05 60 0c 01 00       	add    $0x10c60,%eax
    9cac:	8b 00                	mov    (%eax),%eax
    9cae:	39 c2                	cmp    %eax,%edx
    9cb0:	7d 2a                	jge    9cdc <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    9cb2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9cb6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9cb9:	8d 48 01             	lea    0x1(%eax),%ecx
    9cbc:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9cbf:	89 d0                	mov    %edx,%eax
    9cc1:	c1 e0 03             	shl    $0x3,%eax
    9cc4:	01 d0                	add    %edx,%eax
    9cc6:	c1 e0 02             	shl    $0x2,%eax
    9cc9:	01 d0                	add    %edx,%eax
    9ccb:	01 c8                	add    %ecx,%eax
    9ccd:	8b 04 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%eax
    9cd4:	89 45 e8             	mov    %eax,-0x18(%ebp)
    9cd7:	e9 3d 01 00 00       	jmp    9e19 <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    9cdc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9ce0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9ce3:	8d 48 01             	lea    0x1(%eax),%ecx
    9ce6:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9ce9:	89 d0                	mov    %edx,%eax
    9ceb:	c1 e0 03             	shl    $0x3,%eax
    9cee:	01 d0                	add    %edx,%eax
    9cf0:	c1 e0 02             	shl    $0x2,%eax
    9cf3:	01 d0                	add    %edx,%eax
    9cf5:	01 c8                	add    %ecx,%eax
    9cf7:	83 c0 14             	add    $0x14,%eax
    9cfa:	8b 14 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%edx
    9d01:	89 d0                	mov    %edx,%eax
    9d03:	01 c0                	add    %eax,%eax
    9d05:	01 d0                	add    %edx,%eax
    9d07:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    9d0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d0d:	8d 48 01             	lea    0x1(%eax),%ecx
    9d10:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9d13:	89 d0                	mov    %edx,%eax
    9d15:	c1 e0 03             	shl    $0x3,%eax
    9d18:	01 d0                	add    %edx,%eax
    9d1a:	c1 e0 02             	shl    $0x2,%eax
    9d1d:	01 d0                	add    %edx,%eax
    9d1f:	01 c8                	add    %ecx,%eax
    9d21:	83 c0 14             	add    $0x14,%eax
    9d24:	8b 0c 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    9d2b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9d2e:	89 d0                	mov    %edx,%eax
    9d30:	c1 e0 03             	shl    $0x3,%eax
    9d33:	01 d0                	add    %edx,%eax
    9d35:	c1 e0 02             	shl    $0x2,%eax
    9d38:	01 d0                	add    %edx,%eax
    9d3a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9d3d:	01 d0                	add    %edx,%eax
    9d3f:	83 c0 14             	add    $0x14,%eax
    9d42:	8b 04 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    9d49:	29 c1                	sub    %eax,%ecx
    9d4b:	89 c8                	mov    %ecx,%eax
    9d4d:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9d50:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9d53:	89 d0                	mov    %edx,%eax
    9d55:	c1 e0 03             	shl    $0x3,%eax
    9d58:	01 d0                	add    %edx,%eax
    9d5a:	c1 e0 02             	shl    $0x2,%eax
    9d5d:	01 d0                	add    %edx,%eax
    9d5f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9d62:	01 d0                	add    %edx,%eax
    9d64:	83 c0 14             	add    $0x14,%eax
    9d67:	8b 14 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%edx
    9d6e:	89 d0                	mov    %edx,%eax
    9d70:	01 c0                	add    %eax,%eax
    9d72:	01 d0                	add    %edx,%eax
    9d74:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    9d77:	e9 c4 00 00 00       	jmp    9e40 <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    9d7c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9d80:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d83:	8d 48 01             	lea    0x1(%eax),%ecx
    9d86:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9d89:	89 d0                	mov    %edx,%eax
    9d8b:	c1 e0 03             	shl    $0x3,%eax
    9d8e:	01 d0                	add    %edx,%eax
    9d90:	c1 e0 02             	shl    $0x2,%eax
    9d93:	01 d0                	add    %edx,%eax
    9d95:	01 c8                	add    %ecx,%eax
    9d97:	83 c0 14             	add    $0x14,%eax
    9d9a:	8b 14 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%edx
    9da1:	89 d0                	mov    %edx,%eax
    9da3:	01 c0                	add    %eax,%eax
    9da5:	01 d0                	add    %edx,%eax
    9da7:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    9daa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9dad:	8d 48 01             	lea    0x1(%eax),%ecx
    9db0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9db3:	89 d0                	mov    %edx,%eax
    9db5:	c1 e0 03             	shl    $0x3,%eax
    9db8:	01 d0                	add    %edx,%eax
    9dba:	c1 e0 02             	shl    $0x2,%eax
    9dbd:	01 d0                	add    %edx,%eax
    9dbf:	01 c8                	add    %ecx,%eax
    9dc1:	83 c0 14             	add    $0x14,%eax
    9dc4:	8b 0c 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    9dcb:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9dce:	89 d0                	mov    %edx,%eax
    9dd0:	c1 e0 03             	shl    $0x3,%eax
    9dd3:	01 d0                	add    %edx,%eax
    9dd5:	c1 e0 02             	shl    $0x2,%eax
    9dd8:	01 d0                	add    %edx,%eax
    9dda:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9ddd:	01 d0                	add    %edx,%eax
    9ddf:	83 c0 14             	add    $0x14,%eax
    9de2:	8b 04 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    9de9:	29 c1                	sub    %eax,%ecx
    9deb:	89 c8                	mov    %ecx,%eax
    9ded:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9df0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9df3:	89 d0                	mov    %edx,%eax
    9df5:	c1 e0 03             	shl    $0x3,%eax
    9df8:	01 d0                	add    %edx,%eax
    9dfa:	c1 e0 02             	shl    $0x2,%eax
    9dfd:	01 d0                	add    %edx,%eax
    9dff:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9e02:	01 d0                	add    %edx,%eax
    9e04:	83 c0 14             	add    $0x14,%eax
    9e07:	8b 14 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%edx
    9e0e:	89 d0                	mov    %edx,%eax
    9e10:	01 c0                	add    %eax,%eax
    9e12:	01 d0                	add    %edx,%eax
    9e14:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    9e17:	eb 27                	jmp    9e40 <III_dequantize_sample+0x371>
    9e19:	eb 25                	jmp    9e40 <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    9e1b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9e1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e22:	8d 48 01             	lea    0x1(%eax),%ecx
    9e25:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9e28:	89 d0                	mov    %edx,%eax
    9e2a:	c1 e0 03             	shl    $0x3,%eax
    9e2d:	01 d0                	add    %edx,%eax
    9e2f:	c1 e0 02             	shl    $0x2,%eax
    9e32:	01 d0                	add    %edx,%eax
    9e34:	01 c8                	add    %ecx,%eax
    9e36:	8b 04 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%eax
    9e3d:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    9e40:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9e43:	89 d0                	mov    %edx,%eax
    9e45:	c1 e0 03             	shl    $0x3,%eax
    9e48:	01 d0                	add    %edx,%eax
    9e4a:	c1 e0 04             	shl    $0x4,%eax
    9e4d:	89 c2                	mov    %eax,%edx
    9e4f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9e52:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9e55:	8b 45 14             	mov    0x14(%ebp),%eax
    9e58:	8b 40 08             	mov    0x8(%eax),%eax
    9e5b:	ba 00 00 00 00       	mov    $0x0,%edx
    9e60:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9e63:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9e66:	df 6d c8             	fildll -0x38(%ebp)
    9e69:	dd 05 b0 ef 00 00    	fldl   0xefb0
    9e6f:	de e9                	fsubrp %st,%st(1)
    9e71:	dd 05 b8 ef 00 00    	fldl   0xefb8
    9e77:	de c9                	fmulp  %st,%st(1)
    9e79:	dd 5c 24 08          	fstpl  0x8(%esp)
    9e7d:	dd 05 c0 ef 00 00    	fldl   0xefc0
    9e83:	dd 1c 24             	fstpl  (%esp)
    9e86:	e8 0c c1 ff ff       	call   5f97 <pow>
    9e8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e8e:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    9e91:	8b 45 14             	mov    0x14(%ebp),%eax
    9e94:	8b 40 10             	mov    0x10(%eax),%eax
    9e97:	85 c0                	test   %eax,%eax
    9e99:	0f 84 86 01 00 00    	je     a025 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9e9f:	8b 45 14             	mov    0x14(%ebp),%eax
    9ea2:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    9ea5:	83 f8 02             	cmp    $0x2,%eax
    9ea8:	75 0a                	jne    9eb4 <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9eaa:	8b 45 14             	mov    0x14(%ebp),%eax
    9ead:	8b 40 18             	mov    0x18(%eax),%eax
    9eb0:	85 c0                	test   %eax,%eax
    9eb2:	74 27                	je     9edb <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    9eb4:	8b 45 14             	mov    0x14(%ebp),%eax
    9eb7:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9eba:	83 f8 02             	cmp    $0x2,%eax
    9ebd:	0f 85 62 01 00 00    	jne    a025 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    9ec3:	8b 45 14             	mov    0x14(%ebp),%eax
    9ec6:	8b 40 18             	mov    0x18(%eax),%eax
    9ec9:	85 c0                	test   %eax,%eax
    9ecb:	0f 84 54 01 00 00    	je     a025 <III_dequantize_sample+0x556>
    9ed1:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9ed5:	0f 8e 4a 01 00 00    	jle    a025 <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    9edb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9ede:	89 d0                	mov    %edx,%eax
    9ee0:	c1 e0 03             	shl    $0x3,%eax
    9ee3:	01 d0                	add    %edx,%eax
    9ee5:	c1 e0 04             	shl    $0x4,%eax
    9ee8:	89 c2                	mov    %eax,%edx
    9eea:	8b 45 0c             	mov    0xc(%ebp),%eax
    9eed:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9ef0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9ef3:	89 d0                	mov    %edx,%eax
    9ef5:	c1 e0 03             	shl    $0x3,%eax
    9ef8:	01 d0                	add    %edx,%eax
    9efa:	c1 e0 04             	shl    $0x4,%eax
    9efd:	89 c2                	mov    %eax,%edx
    9eff:	8b 45 0c             	mov    0xc(%ebp),%eax
    9f02:	01 c2                	add    %eax,%edx
    9f04:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f07:	dd 04 c2             	fldl   (%edx,%eax,8)
    9f0a:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    9f0d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9f10:	89 d0                	mov    %edx,%eax
    9f12:	c1 e0 03             	shl    $0x3,%eax
    9f15:	01 d0                	add    %edx,%eax
    9f17:	01 c0                	add    %eax,%eax
    9f19:	89 c2                	mov    %eax,%edx
    9f1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f1e:	01 d0                	add    %edx,%eax
    9f20:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    9f23:	99                   	cltd   
    9f24:	f7 7d e0             	idivl  -0x20(%ebp)
    9f27:	89 c2                	mov    %eax,%edx
    9f29:	8b 45 14             	mov    0x14(%ebp),%eax
    9f2c:	83 c2 08             	add    $0x8,%edx
    9f2f:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    9f33:	ba 00 00 00 00       	mov    $0x0,%edx
    9f38:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9f3b:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9f3e:	df 6d c8             	fildll -0x38(%ebp)
    9f41:	dd 05 c8 ef 00 00    	fldl   0xefc8
    9f47:	de c9                	fmulp  %st,%st(1)
    9f49:	dd 5c 24 08          	fstpl  0x8(%esp)
    9f4d:	dd 05 c0 ef 00 00    	fldl   0xefc0
    9f53:	dd 1c 24             	fstpl  (%esp)
    9f56:	e8 3c c0 ff ff       	call   5f97 <pow>
    9f5b:	dc 4d c0             	fmull  -0x40(%ebp)
    9f5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f61:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    9f64:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9f67:	89 d0                	mov    %edx,%eax
    9f69:	c1 e0 03             	shl    $0x3,%eax
    9f6c:	01 d0                	add    %edx,%eax
    9f6e:	c1 e0 04             	shl    $0x4,%eax
    9f71:	89 c2                	mov    %eax,%edx
    9f73:	8b 45 0c             	mov    0xc(%ebp),%eax
    9f76:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9f79:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9f7c:	89 d0                	mov    %edx,%eax
    9f7e:	c1 e0 03             	shl    $0x3,%eax
    9f81:	01 d0                	add    %edx,%eax
    9f83:	c1 e0 04             	shl    $0x4,%eax
    9f86:	89 c2                	mov    %eax,%edx
    9f88:	8b 45 0c             	mov    0xc(%ebp),%eax
    9f8b:	01 c2                	add    %eax,%edx
    9f8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f90:	dd 04 c2             	fldl   (%edx,%eax,8)
    9f93:	dd 5d c0             	fstpl  -0x40(%ebp)
    9f96:	8b 45 14             	mov    0x14(%ebp),%eax
    9f99:	8b 40 40             	mov    0x40(%eax),%eax
    9f9c:	ba 00 00 00 00       	mov    $0x0,%edx
    9fa1:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9fa4:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9fa7:	df 6d c8             	fildll -0x38(%ebp)
    9faa:	d9 e8                	fld1   
    9fac:	de c1                	faddp  %st,%st(1)
    9fae:	dd 05 d0 ef 00 00    	fldl   0xefd0
    9fb4:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    9fb6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9fb9:	89 d0                	mov    %edx,%eax
    9fbb:	c1 e0 03             	shl    $0x3,%eax
    9fbe:	01 d0                	add    %edx,%eax
    9fc0:	01 c0                	add    %eax,%eax
    9fc2:	89 c2                	mov    %eax,%edx
    9fc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fc7:	01 d0                	add    %edx,%eax
    9fc9:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    9fcc:	99                   	cltd   
    9fcd:	f7 7d e0             	idivl  -0x20(%ebp)
    9fd0:	89 c2                	mov    %eax,%edx
    9fd2:	8b 5d 10             	mov    0x10(%ebp),%ebx
    9fd5:	8b 4d 18             	mov    0x18(%ebp),%ecx
    9fd8:	89 d0                	mov    %edx,%eax
    9fda:	01 c0                	add    %eax,%eax
    9fdc:	01 d0                	add    %edx,%eax
    9fde:	c1 e0 02             	shl    $0x2,%eax
    9fe1:	01 d0                	add    %edx,%eax
    9fe3:	89 ca                	mov    %ecx,%edx
    9fe5:	01 d2                	add    %edx,%edx
    9fe7:	89 d1                	mov    %edx,%ecx
    9fe9:	c1 e1 05             	shl    $0x5,%ecx
    9fec:	29 d1                	sub    %edx,%ecx
    9fee:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    9ff1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9ff4:	01 d0                	add    %edx,%eax
    9ff6:	83 c0 14             	add    $0x14,%eax
    9ff9:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    9ffd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    a000:	db 45 d4             	fildl  -0x2c(%ebp)
    a003:	de c9                	fmulp  %st,%st(1)
    a005:	dd 5c 24 08          	fstpl  0x8(%esp)
    a009:	dd 05 c0 ef 00 00    	fldl   0xefc0
    a00f:	dd 1c 24             	fstpl  (%esp)
    a012:	e8 80 bf ff ff       	call   5f97 <pow>
    a017:	dc 4d c0             	fmull  -0x40(%ebp)
    a01a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a01d:	dd 1c c6             	fstpl  (%esi,%eax,8)
    a020:	e9 ab 00 00 00       	jmp    a0d0 <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    a025:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a028:	89 d0                	mov    %edx,%eax
    a02a:	c1 e0 03             	shl    $0x3,%eax
    a02d:	01 d0                	add    %edx,%eax
    a02f:	c1 e0 04             	shl    $0x4,%eax
    a032:	89 c2                	mov    %eax,%edx
    a034:	8b 45 0c             	mov    0xc(%ebp),%eax
    a037:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a03a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a03d:	89 d0                	mov    %edx,%eax
    a03f:	c1 e0 03             	shl    $0x3,%eax
    a042:	01 d0                	add    %edx,%eax
    a044:	c1 e0 04             	shl    $0x4,%eax
    a047:	89 c2                	mov    %eax,%edx
    a049:	8b 45 0c             	mov    0xc(%ebp),%eax
    a04c:	01 c2                	add    %eax,%edx
    a04e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a051:	dd 04 c2             	fldl   (%edx,%eax,8)
    a054:	dd 5d c0             	fstpl  -0x40(%ebp)
    a057:	8b 45 14             	mov    0x14(%ebp),%eax
    a05a:	8b 40 40             	mov    0x40(%eax),%eax
    a05d:	ba 00 00 00 00       	mov    $0x0,%edx
    a062:	89 45 c8             	mov    %eax,-0x38(%ebp)
    a065:	89 55 cc             	mov    %edx,-0x34(%ebp)
    a068:	df 6d c8             	fildll -0x38(%ebp)
    a06b:	d9 e8                	fld1   
    a06d:	de c1                	faddp  %st,%st(1)
    a06f:	dd 05 d0 ef 00 00    	fldl   0xefd0
    a075:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    a077:	8b 4d 10             	mov    0x10(%ebp),%ecx
    a07a:	8b 45 18             	mov    0x18(%ebp),%eax
    a07d:	01 c0                	add    %eax,%eax
    a07f:	89 c2                	mov    %eax,%edx
    a081:	c1 e2 05             	shl    $0x5,%edx
    a084:	29 c2                	sub    %eax,%edx
    a086:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a089:	01 d0                	add    %edx,%eax
    a08b:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    a08e:	89 c2                	mov    %eax,%edx
    a090:	8b 45 14             	mov    0x14(%ebp),%eax
    a093:	8b 48 3c             	mov    0x3c(%eax),%ecx
    a096:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a099:	8b 04 85 00 0e 01 00 	mov    0x10e00(,%eax,4),%eax
    a0a0:	0f af c1             	imul   %ecx,%eax
    a0a3:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    a0a5:	ba 00 00 00 00       	mov    $0x0,%edx
    a0aa:	89 45 c8             	mov    %eax,-0x38(%ebp)
    a0ad:	89 55 cc             	mov    %edx,-0x34(%ebp)
    a0b0:	df 6d c8             	fildll -0x38(%ebp)
    a0b3:	de c9                	fmulp  %st,%st(1)
    a0b5:	dd 5c 24 08          	fstpl  0x8(%esp)
    a0b9:	dd 05 c0 ef 00 00    	fldl   0xefc0
    a0bf:	dd 1c 24             	fstpl  (%esp)
    a0c2:	e8 d0 be ff ff       	call   5f97 <pow>
    a0c7:	dc 4d c0             	fmull  -0x40(%ebp)
    a0ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0cd:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    a0d0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a0d3:	89 d0                	mov    %edx,%eax
    a0d5:	c1 e0 03             	shl    $0x3,%eax
    a0d8:	01 d0                	add    %edx,%eax
    a0da:	c1 e0 03             	shl    $0x3,%eax
    a0dd:	89 c2                	mov    %eax,%edx
    a0df:	8b 45 08             	mov    0x8(%ebp),%eax
    a0e2:	01 c2                	add    %eax,%edx
    a0e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0e7:	8b 04 82             	mov    (%edx,%eax,4),%eax
    a0ea:	c1 e8 1f             	shr    $0x1f,%eax
    a0ed:	0f b6 c0             	movzbl %al,%eax
    a0f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    a0f3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a0f6:	89 d0                	mov    %edx,%eax
    a0f8:	c1 e0 03             	shl    $0x3,%eax
    a0fb:	01 d0                	add    %edx,%eax
    a0fd:	c1 e0 04             	shl    $0x4,%eax
    a100:	89 c2                	mov    %eax,%edx
    a102:	8b 45 0c             	mov    0xc(%ebp),%eax
    a105:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a108:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a10b:	89 d0                	mov    %edx,%eax
    a10d:	c1 e0 03             	shl    $0x3,%eax
    a110:	01 d0                	add    %edx,%eax
    a112:	c1 e0 04             	shl    $0x4,%eax
    a115:	89 c2                	mov    %eax,%edx
    a117:	8b 45 0c             	mov    0xc(%ebp),%eax
    a11a:	01 c2                	add    %eax,%edx
    a11c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a11f:	dd 04 c2             	fldl   (%edx,%eax,8)
    a122:	dd 5d c0             	fstpl  -0x40(%ebp)
    a125:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a128:	89 d0                	mov    %edx,%eax
    a12a:	c1 e0 03             	shl    $0x3,%eax
    a12d:	01 d0                	add    %edx,%eax
    a12f:	c1 e0 03             	shl    $0x3,%eax
    a132:	89 c2                	mov    %eax,%edx
    a134:	8b 45 08             	mov    0x8(%ebp),%eax
    a137:	01 c2                	add    %eax,%edx
    a139:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a13c:	8b 04 82             	mov    (%edx,%eax,4),%eax
    a13f:	89 04 24             	mov    %eax,(%esp)
    a142:	e8 47 bd ff ff       	call   5e8e <abs>
    a147:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    a14a:	db 45 d4             	fildl  -0x2c(%ebp)
    a14d:	dd 05 d8 ef 00 00    	fldl   0xefd8
    a153:	dd 5c 24 08          	fstpl  0x8(%esp)
    a157:	dd 1c 24             	fstpl  (%esp)
    a15a:	e8 38 be ff ff       	call   5f97 <pow>
    a15f:	dc 4d c0             	fmull  -0x40(%ebp)
    a162:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a165:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    a168:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    a16c:	74 37                	je     a1a5 <III_dequantize_sample+0x6d6>
    a16e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a171:	89 d0                	mov    %edx,%eax
    a173:	c1 e0 03             	shl    $0x3,%eax
    a176:	01 d0                	add    %edx,%eax
    a178:	c1 e0 04             	shl    $0x4,%eax
    a17b:	89 c2                	mov    %eax,%edx
    a17d:	8b 45 0c             	mov    0xc(%ebp),%eax
    a180:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a183:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a186:	89 d0                	mov    %edx,%eax
    a188:	c1 e0 03             	shl    $0x3,%eax
    a18b:	01 d0                	add    %edx,%eax
    a18d:	c1 e0 04             	shl    $0x4,%eax
    a190:	89 c2                	mov    %eax,%edx
    a192:	8b 45 0c             	mov    0xc(%ebp),%eax
    a195:	01 c2                	add    %eax,%edx
    a197:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a19a:	dd 04 c2             	fldl   (%edx,%eax,8)
    a19d:	d9 e0                	fchs   
    a19f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a1a2:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    a1a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a1a9:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a1ad:	0f 8e d3 f9 ff ff    	jle    9b86 <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    a1b3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a1b7:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    a1bb:	0f 8e b9 f9 ff ff    	jle    9b7a <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    a1c1:	83 c4 50             	add    $0x50,%esp
    a1c4:	5b                   	pop    %ebx
    a1c5:	5e                   	pop    %esi
    a1c6:	5d                   	pop    %ebp
    a1c7:	c3                   	ret    

0000a1c8 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    a1c8:	55                   	push   %ebp
    a1c9:	89 e5                	mov    %esp,%ebp
    a1cb:	57                   	push   %edi
    a1cc:	56                   	push   %esi
    a1cd:	53                   	push   %ebx
    a1ce:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    a1d1:	8b 45 14             	mov    0x14(%ebp),%eax
    a1d4:	8b 00                	mov    (%eax),%eax
    a1d6:	8b 40 10             	mov    0x10(%eax),%eax
    a1d9:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    a1dc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a1e3:	eb 33                	jmp    a218 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    a1e5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    a1ec:	eb 20                	jmp    a20e <III_reorder+0x46>
         ro[sb][ss] = 0;
    a1ee:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a1f1:	89 d0                	mov    %edx,%eax
    a1f3:	c1 e0 03             	shl    $0x3,%eax
    a1f6:	01 d0                	add    %edx,%eax
    a1f8:	c1 e0 04             	shl    $0x4,%eax
    a1fb:	89 c2                	mov    %eax,%edx
    a1fd:	8b 45 0c             	mov    0xc(%ebp),%eax
    a200:	01 c2                	add    %eax,%edx
    a202:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a205:	d9 ee                	fldz   
    a207:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    a20a:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    a20e:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    a212:	7e da                	jle    a1ee <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    a214:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a218:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    a21c:	7e c7                	jle    a1e5 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    a21e:	8b 45 10             	mov    0x10(%ebp),%eax
    a221:	8b 40 10             	mov    0x10(%eax),%eax
    a224:	85 c0                	test   %eax,%eax
    a226:	0f 84 af 03 00 00    	je     a5db <III_reorder+0x413>
    a22c:	8b 45 10             	mov    0x10(%ebp),%eax
    a22f:	8b 40 14             	mov    0x14(%eax),%eax
    a232:	83 f8 02             	cmp    $0x2,%eax
    a235:	0f 85 a0 03 00 00    	jne    a5db <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    a23b:	8b 45 10             	mov    0x10(%ebp),%eax
    a23e:	8b 40 18             	mov    0x18(%eax),%eax
    a241:	85 c0                	test   %eax,%eax
    a243:	0f 84 00 02 00 00    	je     a449 <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    a249:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a250:	eb 4c                	jmp    a29e <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    a252:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    a259:	eb 39                	jmp    a294 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    a25b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a25e:	89 d0                	mov    %edx,%eax
    a260:	c1 e0 03             	shl    $0x3,%eax
    a263:	01 d0                	add    %edx,%eax
    a265:	c1 e0 04             	shl    $0x4,%eax
    a268:	89 c2                	mov    %eax,%edx
    a26a:	8b 45 0c             	mov    0xc(%ebp),%eax
    a26d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a270:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a273:	89 d0                	mov    %edx,%eax
    a275:	c1 e0 03             	shl    $0x3,%eax
    a278:	01 d0                	add    %edx,%eax
    a27a:	c1 e0 04             	shl    $0x4,%eax
    a27d:	89 c2                	mov    %eax,%edx
    a27f:	8b 45 08             	mov    0x8(%ebp),%eax
    a282:	01 c2                	add    %eax,%edx
    a284:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a287:	dd 04 c2             	fldl   (%edx,%eax,8)
    a28a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a28d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    a290:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    a294:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    a298:	7e c1                	jle    a25b <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    a29a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a29e:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    a2a2:	7e ae                	jle    a252 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    a2a4:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    a2ab:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a2ae:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a2b4:	05 9c 0c 01 00       	add    $0x10c9c,%eax
    a2b9:	8b 40 0c             	mov    0xc(%eax),%eax
    a2bc:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    a2bf:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a2c2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a2c8:	05 a0 0c 01 00       	add    $0x10ca0,%eax
    a2cd:	8b 40 0c             	mov    0xc(%eax),%eax
    a2d0:	2b 45 e8             	sub    -0x18(%ebp),%eax
    a2d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    a2d6:	e9 5f 01 00 00       	jmp    a43a <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a2db:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    a2e2:	e9 fd 00 00 00       	jmp    a3e4 <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    a2e7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    a2ee:	e9 e1 00 00 00       	jmp    a3d4 <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    a2f3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a2f6:	89 d0                	mov    %edx,%eax
    a2f8:	01 c0                	add    %eax,%eax
    a2fa:	01 c2                	add    %eax,%edx
    a2fc:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a2ff:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    a303:	01 c2                	add    %eax,%edx
    a305:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a308:	01 d0                	add    %edx,%eax
    a30a:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    a30d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a310:	89 d0                	mov    %edx,%eax
    a312:	01 c0                	add    %eax,%eax
    a314:	01 c2                	add    %eax,%edx
    a316:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a319:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a31c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    a31f:	89 d0                	mov    %edx,%eax
    a321:	01 c0                	add    %eax,%eax
    a323:	01 d0                	add    %edx,%eax
    a325:	01 c8                	add    %ecx,%eax
    a327:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a32a:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    a32d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a332:	89 c8                	mov    %ecx,%eax
    a334:	f7 ea                	imul   %edx
    a336:	c1 fa 02             	sar    $0x2,%edx
    a339:	89 c8                	mov    %ecx,%eax
    a33b:	c1 f8 1f             	sar    $0x1f,%eax
    a33e:	29 c2                	sub    %eax,%edx
    a340:	89 d0                	mov    %edx,%eax
    a342:	89 c2                	mov    %eax,%edx
    a344:	89 d0                	mov    %edx,%eax
    a346:	c1 e0 03             	shl    $0x3,%eax
    a349:	01 d0                	add    %edx,%eax
    a34b:	c1 e0 04             	shl    $0x4,%eax
    a34e:	89 c2                	mov    %eax,%edx
    a350:	8b 45 0c             	mov    0xc(%ebp),%eax
    a353:	8d 34 02             	lea    (%edx,%eax,1),%esi
    a356:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    a359:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a35e:	89 d8                	mov    %ebx,%eax
    a360:	f7 ea                	imul   %edx
    a362:	c1 fa 02             	sar    $0x2,%edx
    a365:	89 d8                	mov    %ebx,%eax
    a367:	c1 f8 1f             	sar    $0x1f,%eax
    a36a:	89 d1                	mov    %edx,%ecx
    a36c:	29 c1                	sub    %eax,%ecx
    a36e:	89 c8                	mov    %ecx,%eax
    a370:	c1 e0 03             	shl    $0x3,%eax
    a373:	01 c8                	add    %ecx,%eax
    a375:	01 c0                	add    %eax,%eax
    a377:	29 c3                	sub    %eax,%ebx
    a379:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    a37b:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a37e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a383:	89 d8                	mov    %ebx,%eax
    a385:	f7 ea                	imul   %edx
    a387:	c1 fa 02             	sar    $0x2,%edx
    a38a:	89 d8                	mov    %ebx,%eax
    a38c:	c1 f8 1f             	sar    $0x1f,%eax
    a38f:	29 c2                	sub    %eax,%edx
    a391:	89 d0                	mov    %edx,%eax
    a393:	89 c2                	mov    %eax,%edx
    a395:	89 d0                	mov    %edx,%eax
    a397:	c1 e0 03             	shl    $0x3,%eax
    a39a:	01 d0                	add    %edx,%eax
    a39c:	c1 e0 04             	shl    $0x4,%eax
    a39f:	89 c2                	mov    %eax,%edx
    a3a1:	8b 45 08             	mov    0x8(%ebp),%eax
    a3a4:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a3a7:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a3aa:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a3af:	89 d8                	mov    %ebx,%eax
    a3b1:	f7 ea                	imul   %edx
    a3b3:	c1 fa 02             	sar    $0x2,%edx
    a3b6:	89 d8                	mov    %ebx,%eax
    a3b8:	c1 f8 1f             	sar    $0x1f,%eax
    a3bb:	29 c2                	sub    %eax,%edx
    a3bd:	89 d0                	mov    %edx,%eax
    a3bf:	c1 e0 03             	shl    $0x3,%eax
    a3c2:	01 d0                	add    %edx,%eax
    a3c4:	01 c0                	add    %eax,%eax
    a3c6:	29 c3                	sub    %eax,%ebx
    a3c8:	89 da                	mov    %ebx,%edx
    a3ca:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a3cd:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    a3d0:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    a3d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a3d7:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    a3da:	0f 8c 13 ff ff ff    	jl     a2f3 <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a3e0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    a3e4:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    a3e8:	0f 8e f9 fe ff ff    	jle    a2e7 <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    a3ee:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a3f2:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a3f5:	89 d0                	mov    %edx,%eax
    a3f7:	c1 e0 03             	shl    $0x3,%eax
    a3fa:	01 d0                	add    %edx,%eax
    a3fc:	c1 e0 02             	shl    $0x2,%eax
    a3ff:	01 d0                	add    %edx,%eax
    a401:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a404:	01 d0                	add    %edx,%eax
    a406:	83 c0 14             	add    $0x14,%eax
    a409:	8b 04 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%eax
    a410:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    a413:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a416:	8d 48 01             	lea    0x1(%eax),%ecx
    a419:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a41c:	89 d0                	mov    %edx,%eax
    a41e:	c1 e0 03             	shl    $0x3,%eax
    a421:	01 d0                	add    %edx,%eax
    a423:	c1 e0 02             	shl    $0x2,%eax
    a426:	01 d0                	add    %edx,%eax
    a428:	01 c8                	add    %ecx,%eax
    a42a:	83 c0 14             	add    $0x14,%eax
    a42d:	8b 04 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%eax
    a434:	2b 45 e8             	sub    -0x18(%ebp),%eax
    a437:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    a43a:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    a43e:	0f 8e 97 fe ff ff    	jle    a2db <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    a444:	e9 ed 01 00 00       	jmp    a636 <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    a449:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a450:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a457:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a45a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a460:	05 94 0c 01 00       	add    $0x10c94,%eax
    a465:	8b 40 0c             	mov    0xc(%eax),%eax
    a468:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a46b:	e9 5f 01 00 00       	jmp    a5cf <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a470:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    a477:	e9 fd 00 00 00       	jmp    a579 <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    a47c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    a483:	e9 e1 00 00 00       	jmp    a569 <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    a488:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a48b:	89 d0                	mov    %edx,%eax
    a48d:	01 c0                	add    %eax,%eax
    a48f:	01 c2                	add    %eax,%edx
    a491:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a494:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    a498:	01 c2                	add    %eax,%edx
    a49a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a49d:	01 d0                	add    %edx,%eax
    a49f:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    a4a2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a4a5:	89 d0                	mov    %edx,%eax
    a4a7:	01 c0                	add    %eax,%eax
    a4a9:	01 c2                	add    %eax,%edx
    a4ab:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a4ae:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a4b1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    a4b4:	89 d0                	mov    %edx,%eax
    a4b6:	01 c0                	add    %eax,%eax
    a4b8:	01 d0                	add    %edx,%eax
    a4ba:	01 c8                	add    %ecx,%eax
    a4bc:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a4bf:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    a4c2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a4c7:	89 c8                	mov    %ecx,%eax
    a4c9:	f7 ea                	imul   %edx
    a4cb:	c1 fa 02             	sar    $0x2,%edx
    a4ce:	89 c8                	mov    %ecx,%eax
    a4d0:	c1 f8 1f             	sar    $0x1f,%eax
    a4d3:	29 c2                	sub    %eax,%edx
    a4d5:	89 d0                	mov    %edx,%eax
    a4d7:	89 c2                	mov    %eax,%edx
    a4d9:	89 d0                	mov    %edx,%eax
    a4db:	c1 e0 03             	shl    $0x3,%eax
    a4de:	01 d0                	add    %edx,%eax
    a4e0:	c1 e0 04             	shl    $0x4,%eax
    a4e3:	89 c2                	mov    %eax,%edx
    a4e5:	8b 45 0c             	mov    0xc(%ebp),%eax
    a4e8:	8d 34 02             	lea    (%edx,%eax,1),%esi
    a4eb:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    a4ee:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a4f3:	89 d8                	mov    %ebx,%eax
    a4f5:	f7 ea                	imul   %edx
    a4f7:	c1 fa 02             	sar    $0x2,%edx
    a4fa:	89 d8                	mov    %ebx,%eax
    a4fc:	c1 f8 1f             	sar    $0x1f,%eax
    a4ff:	89 d1                	mov    %edx,%ecx
    a501:	29 c1                	sub    %eax,%ecx
    a503:	89 c8                	mov    %ecx,%eax
    a505:	c1 e0 03             	shl    $0x3,%eax
    a508:	01 c8                	add    %ecx,%eax
    a50a:	01 c0                	add    %eax,%eax
    a50c:	29 c3                	sub    %eax,%ebx
    a50e:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    a510:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a513:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a518:	89 d8                	mov    %ebx,%eax
    a51a:	f7 ea                	imul   %edx
    a51c:	c1 fa 02             	sar    $0x2,%edx
    a51f:	89 d8                	mov    %ebx,%eax
    a521:	c1 f8 1f             	sar    $0x1f,%eax
    a524:	29 c2                	sub    %eax,%edx
    a526:	89 d0                	mov    %edx,%eax
    a528:	89 c2                	mov    %eax,%edx
    a52a:	89 d0                	mov    %edx,%eax
    a52c:	c1 e0 03             	shl    $0x3,%eax
    a52f:	01 d0                	add    %edx,%eax
    a531:	c1 e0 04             	shl    $0x4,%eax
    a534:	89 c2                	mov    %eax,%edx
    a536:	8b 45 08             	mov    0x8(%ebp),%eax
    a539:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a53c:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a53f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a544:	89 d8                	mov    %ebx,%eax
    a546:	f7 ea                	imul   %edx
    a548:	c1 fa 02             	sar    $0x2,%edx
    a54b:	89 d8                	mov    %ebx,%eax
    a54d:	c1 f8 1f             	sar    $0x1f,%eax
    a550:	29 c2                	sub    %eax,%edx
    a552:	89 d0                	mov    %edx,%eax
    a554:	c1 e0 03             	shl    $0x3,%eax
    a557:	01 d0                	add    %edx,%eax
    a559:	01 c0                	add    %eax,%eax
    a55b:	29 c3                	sub    %eax,%ebx
    a55d:	89 da                	mov    %ebx,%edx
    a55f:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a562:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    a565:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    a569:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a56c:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    a56f:	0f 8c 13 ff ff ff    	jl     a488 <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a575:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    a579:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    a57d:	0f 8e f9 fe ff ff    	jle    a47c <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    a583:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a587:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a58a:	89 d0                	mov    %edx,%eax
    a58c:	c1 e0 03             	shl    $0x3,%eax
    a58f:	01 d0                	add    %edx,%eax
    a591:	c1 e0 02             	shl    $0x2,%eax
    a594:	01 d0                	add    %edx,%eax
    a596:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a599:	01 d0                	add    %edx,%eax
    a59b:	83 c0 14             	add    $0x14,%eax
    a59e:	8b 04 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%eax
    a5a5:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    a5a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a5ab:	8d 48 01             	lea    0x1(%eax),%ecx
    a5ae:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a5b1:	89 d0                	mov    %edx,%eax
    a5b3:	c1 e0 03             	shl    $0x3,%eax
    a5b6:	01 d0                	add    %edx,%eax
    a5b8:	c1 e0 02             	shl    $0x2,%eax
    a5bb:	01 d0                	add    %edx,%eax
    a5bd:	01 c8                	add    %ecx,%eax
    a5bf:	83 c0 14             	add    $0x14,%eax
    a5c2:	8b 04 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%eax
    a5c9:	2b 45 e8             	sub    -0x18(%ebp),%eax
    a5cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    a5cf:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    a5d3:	0f 8e 97 fe ff ff    	jle    a470 <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    a5d9:	eb 5b                	jmp    a636 <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    a5db:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a5e2:	eb 4c                	jmp    a630 <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    a5e4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    a5eb:	eb 39                	jmp    a626 <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    a5ed:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a5f0:	89 d0                	mov    %edx,%eax
    a5f2:	c1 e0 03             	shl    $0x3,%eax
    a5f5:	01 d0                	add    %edx,%eax
    a5f7:	c1 e0 04             	shl    $0x4,%eax
    a5fa:	89 c2                	mov    %eax,%edx
    a5fc:	8b 45 0c             	mov    0xc(%ebp),%eax
    a5ff:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a602:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a605:	89 d0                	mov    %edx,%eax
    a607:	c1 e0 03             	shl    $0x3,%eax
    a60a:	01 d0                	add    %edx,%eax
    a60c:	c1 e0 04             	shl    $0x4,%eax
    a60f:	89 c2                	mov    %eax,%edx
    a611:	8b 45 08             	mov    0x8(%ebp),%eax
    a614:	01 c2                	add    %eax,%edx
    a616:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a619:	dd 04 c2             	fldl   (%edx,%eax,8)
    a61c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a61f:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    a622:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    a626:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    a62a:	7e c1                	jle    a5ed <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    a62c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a630:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    a634:	7e ae                	jle    a5e4 <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    a636:	83 c4 34             	add    $0x34,%esp
    a639:	5b                   	pop    %ebx
    a63a:	5e                   	pop    %esi
    a63b:	5f                   	pop    %edi
    a63c:	5d                   	pop    %ebp
    a63d:	c3                   	ret    

0000a63e <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    a63e:	55                   	push   %ebp
    a63f:	89 e5                	mov    %esp,%ebp
    a641:	56                   	push   %esi
    a642:	53                   	push   %ebx
    a643:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    a649:	8b 45 18             	mov    0x18(%ebp),%eax
    a64c:	8b 00                	mov    (%eax),%eax
    a64e:	8b 40 10             	mov    0x10(%eax),%eax
    a651:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    a654:	8b 45 18             	mov    0x18(%ebp),%eax
    a657:	8b 40 08             	mov    0x8(%eax),%eax
    a65a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    a65d:	8b 45 18             	mov    0x18(%ebp),%eax
    a660:	8b 00                	mov    (%eax),%eax
    a662:	8b 40 1c             	mov    0x1c(%eax),%eax
    a665:	83 f8 01             	cmp    $0x1,%eax
    a668:	75 16                	jne    a680 <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    a66a:	8b 45 18             	mov    0x18(%ebp),%eax
    a66d:	8b 00                	mov    (%eax),%eax
    a66f:	8b 40 20             	mov    0x20(%eax),%eax
    a672:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    a675:	85 c0                	test   %eax,%eax
    a677:	74 07                	je     a680 <III_stereo+0x42>
    a679:	b8 01 00 00 00       	mov    $0x1,%eax
    a67e:	eb 05                	jmp    a685 <III_stereo+0x47>
    a680:	b8 00 00 00 00       	mov    $0x0,%eax
    a685:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    a688:	8b 45 18             	mov    0x18(%ebp),%eax
    a68b:	8b 00                	mov    (%eax),%eax
    a68d:	8b 40 1c             	mov    0x1c(%eax),%eax
    a690:	83 f8 01             	cmp    $0x1,%eax
    a693:	75 16                	jne    a6ab <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    a695:	8b 45 18             	mov    0x18(%ebp),%eax
    a698:	8b 00                	mov    (%eax),%eax
    a69a:	8b 40 20             	mov    0x20(%eax),%eax
    a69d:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    a6a0:	85 c0                	test   %eax,%eax
    a6a2:	74 07                	je     a6ab <III_stereo+0x6d>
    a6a4:	b8 01 00 00 00       	mov    $0x1,%eax
    a6a9:	eb 05                	jmp    a6b0 <III_stereo+0x72>
    a6ab:	b8 00 00 00 00       	mov    $0x0,%eax
    a6b0:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    a6b3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a6ba:	eb 12                	jmp    a6ce <III_stereo+0x90>
      is_pos[i] = 7;
    a6bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a6bf:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    a6c6:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    a6ca:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a6ce:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    a6d5:	7e e5                	jle    a6bc <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    a6d7:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    a6db:	0f 85 18 0a 00 00    	jne    b0f9 <III_stereo+0xabb>
    a6e1:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    a6e5:	0f 84 0e 0a 00 00    	je     b0f9 <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    a6eb:	8b 45 14             	mov    0x14(%ebp),%eax
    a6ee:	8b 40 10             	mov    0x10(%eax),%eax
    a6f1:	85 c0                	test   %eax,%eax
    a6f3:	0f 84 10 08 00 00    	je     af09 <III_stereo+0x8cb>
    a6f9:	8b 45 14             	mov    0x14(%ebp),%eax
    a6fc:	8b 40 14             	mov    0x14(%eax),%eax
    a6ff:	83 f8 02             	cmp    $0x2,%eax
    a702:	0f 85 01 08 00 00    	jne    af09 <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    a708:	8b 45 14             	mov    0x14(%ebp),%eax
    a70b:	8b 40 18             	mov    0x18(%eax),%eax
    a70e:	85 c0                	test   %eax,%eax
    a710:	0f 84 d0 04 00 00    	je     abe6 <III_stereo+0x5a8>
         {  int max_sfb = 0;
    a716:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    a71d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a724:	e9 1b 03 00 00       	jmp    aa44 <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    a729:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    a730:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a737:	e9 0f 01 00 00       	jmp    a84b <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a73c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a73f:	8d 48 01             	lea    0x1(%eax),%ecx
    a742:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a745:	89 d0                	mov    %edx,%eax
    a747:	c1 e0 03             	shl    $0x3,%eax
    a74a:	01 d0                	add    %edx,%eax
    a74c:	c1 e0 02             	shl    $0x2,%eax
    a74f:	01 d0                	add    %edx,%eax
    a751:	01 c8                	add    %ecx,%eax
    a753:	83 c0 14             	add    $0x14,%eax
    a756:	8b 0c 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%ecx
    a75d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a760:	89 d0                	mov    %edx,%eax
    a762:	c1 e0 03             	shl    $0x3,%eax
    a765:	01 d0                	add    %edx,%eax
    a767:	c1 e0 02             	shl    $0x2,%eax
    a76a:	01 d0                	add    %edx,%eax
    a76c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a76f:	01 d0                	add    %edx,%eax
    a771:	83 c0 14             	add    $0x14,%eax
    a774:	8b 04 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%eax
    a77b:	29 c1                	sub    %eax,%ecx
    a77d:	89 c8                	mov    %ecx,%eax
    a77f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    a782:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a785:	89 d0                	mov    %edx,%eax
    a787:	c1 e0 03             	shl    $0x3,%eax
    a78a:	01 d0                	add    %edx,%eax
    a78c:	c1 e0 02             	shl    $0x2,%eax
    a78f:	01 d0                	add    %edx,%eax
    a791:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a794:	01 d0                	add    %edx,%eax
    a796:	83 c0 14             	add    $0x14,%eax
    a799:	8b 14 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%edx
    a7a0:	89 d0                	mov    %edx,%eax
    a7a2:	01 c0                	add    %eax,%eax
    a7a4:	01 c2                	add    %eax,%edx
    a7a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a7a9:	83 c0 01             	add    $0x1,%eax
    a7ac:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    a7b0:	01 d0                	add    %edx,%eax
    a7b2:	83 e8 01             	sub    $0x1,%eax
    a7b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    a7b8:	e9 80 00 00 00       	jmp    a83d <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    a7bd:	8b 45 08             	mov    0x8(%ebp),%eax
    a7c0:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    a7c6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a7c9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a7ce:	89 c8                	mov    %ecx,%eax
    a7d0:	f7 ea                	imul   %edx
    a7d2:	c1 fa 02             	sar    $0x2,%edx
    a7d5:	89 c8                	mov    %ecx,%eax
    a7d7:	c1 f8 1f             	sar    $0x1f,%eax
    a7da:	89 d3                	mov    %edx,%ebx
    a7dc:	29 c3                	sub    %eax,%ebx
    a7de:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a7e1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a7e6:	89 c8                	mov    %ecx,%eax
    a7e8:	f7 ea                	imul   %edx
    a7ea:	c1 fa 02             	sar    $0x2,%edx
    a7ed:	89 c8                	mov    %ecx,%eax
    a7ef:	c1 f8 1f             	sar    $0x1f,%eax
    a7f2:	29 c2                	sub    %eax,%edx
    a7f4:	89 d0                	mov    %edx,%eax
    a7f6:	c1 e0 03             	shl    $0x3,%eax
    a7f9:	01 d0                	add    %edx,%eax
    a7fb:	01 c0                	add    %eax,%eax
    a7fd:	29 c1                	sub    %eax,%ecx
    a7ff:	89 ca                	mov    %ecx,%edx
    a801:	89 d8                	mov    %ebx,%eax
    a803:	c1 e0 03             	shl    $0x3,%eax
    a806:	01 d8                	add    %ebx,%eax
    a808:	01 c0                	add    %eax,%eax
    a80a:	01 d0                	add    %edx,%eax
    a80c:	dd 04 c6             	fldl   (%esi,%eax,8)
    a80f:	d9 ee                	fldz   
    a811:	df e9                	fucomip %st(1),%st
    a813:	7a 0a                	jp     a81f <III_stereo+0x1e1>
    a815:	d9 ee                	fldz   
    a817:	df e9                	fucomip %st(1),%st
    a819:	dd d8                	fstp   %st(0)
    a81b:	74 18                	je     a835 <III_stereo+0x1f7>
    a81d:	eb 02                	jmp    a821 <III_stereo+0x1e3>
    a81f:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    a821:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a824:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    a827:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    a82e:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    a835:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    a839:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    a83d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    a841:	0f 8f 76 ff ff ff    	jg     a7bd <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    a847:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    a84b:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    a84f:	0f 8f e7 fe ff ff    	jg     a73c <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    a855:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a858:	83 c0 01             	add    $0x1,%eax
    a85b:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    a85e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a861:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a864:	7e 0b                	jle    a871 <III_stereo+0x233>
                  max_sfb = sfb;
    a866:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a869:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    a86c:	e9 f5 00 00 00       	jmp    a966 <III_stereo+0x328>
    a871:	e9 f0 00 00 00       	jmp    a966 <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a876:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a879:	8d 48 01             	lea    0x1(%eax),%ecx
    a87c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a87f:	89 d0                	mov    %edx,%eax
    a881:	c1 e0 03             	shl    $0x3,%eax
    a884:	01 d0                	add    %edx,%eax
    a886:	c1 e0 02             	shl    $0x2,%eax
    a889:	01 d0                	add    %edx,%eax
    a88b:	01 c8                	add    %ecx,%eax
    a88d:	83 c0 14             	add    $0x14,%eax
    a890:	8b 0c 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%ecx
    a897:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a89a:	89 d0                	mov    %edx,%eax
    a89c:	c1 e0 03             	shl    $0x3,%eax
    a89f:	01 d0                	add    %edx,%eax
    a8a1:	c1 e0 02             	shl    $0x2,%eax
    a8a4:	01 d0                	add    %edx,%eax
    a8a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a8a9:	01 d0                	add    %edx,%eax
    a8ab:	83 c0 14             	add    $0x14,%eax
    a8ae:	8b 04 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%eax
    a8b5:	29 c1                	sub    %eax,%ecx
    a8b7:	89 c8                	mov    %ecx,%eax
    a8b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    a8bc:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a8bf:	89 d0                	mov    %edx,%eax
    a8c1:	c1 e0 03             	shl    $0x3,%eax
    a8c4:	01 d0                	add    %edx,%eax
    a8c6:	c1 e0 02             	shl    $0x2,%eax
    a8c9:	01 d0                	add    %edx,%eax
    a8cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a8ce:	01 d0                	add    %edx,%eax
    a8d0:	83 c0 14             	add    $0x14,%eax
    a8d3:	8b 14 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%edx
    a8da:	89 d0                	mov    %edx,%eax
    a8dc:	01 c0                	add    %eax,%eax
    a8de:	01 c2                	add    %eax,%edx
    a8e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a8e3:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a8e7:	01 d0                	add    %edx,%eax
    a8e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    a8ec:	eb 6e                	jmp    a95c <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    a8ee:	8b 4d 10             	mov    0x10(%ebp),%ecx
    a8f1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a8f4:	89 d0                	mov    %edx,%eax
    a8f6:	01 c0                	add    %eax,%eax
    a8f8:	01 d0                	add    %edx,%eax
    a8fa:	c1 e0 02             	shl    $0x2,%eax
    a8fd:	01 d0                	add    %edx,%eax
    a8ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a902:	01 d0                	add    %edx,%eax
    a904:	83 c0 52             	add    $0x52,%eax
    a907:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    a90b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a90e:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    a915:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a918:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a91f:	83 f8 07             	cmp    $0x7,%eax
    a922:	74 30                	je     a954 <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a924:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a927:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a92e:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a934:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a93a:	dd 05 e0 ef 00 00    	fldl   0xefe0
    a940:	de c9                	fmulp  %st,%st(1)
    a942:	dd 1c 24             	fstpl  (%esp)
    a945:	e8 1d b6 ff ff       	call   5f67 <tan>
    a94a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a94d:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    a954:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    a958:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a95c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a960:	7f 8c                	jg     a8ee <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    a962:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    a966:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a96a:	0f 8e 06 ff ff ff    	jle    a876 <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    a970:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a973:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a979:	05 bc 0c 01 00       	add    $0x10cbc,%eax
    a97e:	8b 50 0c             	mov    0xc(%eax),%edx
    a981:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a984:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a98a:	05 b8 0c 01 00       	add    $0x10cb8,%eax
    a98f:	8b 40 0c             	mov    0xc(%eax),%eax
    a992:	29 c2                	sub    %eax,%edx
    a994:	89 d0                	mov    %edx,%eax
    a996:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    a999:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a99c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a9a2:	05 b8 0c 01 00       	add    $0x10cb8,%eax
    a9a7:	8b 50 0c             	mov    0xc(%eax),%edx
    a9aa:	89 d0                	mov    %edx,%eax
    a9ac:	01 c0                	add    %eax,%eax
    a9ae:	01 c2                	add    %eax,%edx
    a9b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a9b3:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a9b7:	01 d0                	add    %edx,%eax
    a9b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    a9bc:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a9bf:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a9c5:	05 c0 0c 01 00       	add    $0x10cc0,%eax
    a9ca:	8b 50 0c             	mov    0xc(%eax),%edx
    a9cd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a9d0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a9d6:	05 bc 0c 01 00       	add    $0x10cbc,%eax
    a9db:	8b 40 0c             	mov    0xc(%eax),%eax
    a9de:	29 c2                	sub    %eax,%edx
    a9e0:	89 d0                	mov    %edx,%eax
    a9e2:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    a9e5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a9e8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a9ee:	05 bc 0c 01 00       	add    $0x10cbc,%eax
    a9f3:	8b 50 0c             	mov    0xc(%eax),%edx
    a9f6:	89 d0                	mov    %edx,%eax
    a9f8:	01 c0                	add    %eax,%eax
    a9fa:	01 c2                	add    %eax,%edx
    a9fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a9ff:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    aa03:	01 d0                	add    %edx,%eax
    aa05:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    aa08:	eb 30                	jmp    aa3a <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    aa0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aa0d:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    aa14:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa17:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    aa1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aa21:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    aa28:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa2b:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    aa32:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    aa36:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    aa3a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    aa3e:	7f ca                	jg     aa0a <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    aa40:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    aa44:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    aa48:	0f 8e db fc ff ff    	jle    a729 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    aa4e:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    aa52:	0f 8f 89 01 00 00    	jg     abe1 <III_stereo+0x5a3>
             {  i = 2;
    aa58:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    aa5f:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    aa66:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    aa6d:	eb 63                	jmp    aad2 <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    aa6f:	8b 45 08             	mov    0x8(%ebp),%eax
    aa72:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    aa78:	8b 55 f0             	mov    -0x10(%ebp),%edx
    aa7b:	89 d0                	mov    %edx,%eax
    aa7d:	c1 e0 03             	shl    $0x3,%eax
    aa80:	01 d0                	add    %edx,%eax
    aa82:	01 c0                	add    %eax,%eax
    aa84:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aa87:	01 d0                	add    %edx,%eax
    aa89:	dd 04 c1             	fldl   (%ecx,%eax,8)
    aa8c:	d9 ee                	fldz   
    aa8e:	df e9                	fucomip %st(1),%st
    aa90:	7a 0a                	jp     aa9c <III_stereo+0x45e>
    aa92:	d9 ee                	fldz   
    aa94:	df e9                	fucomip %st(1),%st
    aa96:	dd d8                	fstp   %st(0)
    aa98:	74 23                	je     aabd <III_stereo+0x47f>
    aa9a:	eb 02                	jmp    aa9e <III_stereo+0x460>
    aa9c:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    aa9e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    aaa1:	89 d0                	mov    %edx,%eax
    aaa3:	c1 e0 03             	shl    $0x3,%eax
    aaa6:	01 d0                	add    %edx,%eax
    aaa8:	01 c0                	add    %eax,%eax
    aaaa:	89 c2                	mov    %eax,%edx
    aaac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    aaaf:	01 d0                	add    %edx,%eax
    aab1:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    aab4:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    aabb:	eb 15                	jmp    aad2 <III_stereo+0x494>
                   } else
                   {  ss--;
    aabd:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    aac1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    aac5:	79 0b                	jns    aad2 <III_stereo+0x494>
                      {  i--;
    aac7:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    aacb:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    aad2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    aad6:	79 97                	jns    aa6f <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    aad8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    aadf:	eb 04                	jmp    aae5 <III_stereo+0x4a7>
                   i++;
    aae1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    aae5:	8b 55 c8             	mov    -0x38(%ebp),%edx
    aae8:	89 d0                	mov    %edx,%eax
    aaea:	c1 e0 03             	shl    $0x3,%eax
    aaed:	01 d0                	add    %edx,%eax
    aaef:	c1 e0 02             	shl    $0x2,%eax
    aaf2:	01 d0                	add    %edx,%eax
    aaf4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    aaf7:	01 d0                	add    %edx,%eax
    aaf9:	8b 04 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%eax
    ab00:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    ab03:	7e dc                	jle    aae1 <III_stereo+0x4a3>
                   i++;
                sfb = i;
    ab05:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ab08:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    ab0b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ab0e:	89 d0                	mov    %edx,%eax
    ab10:	c1 e0 03             	shl    $0x3,%eax
    ab13:	01 d0                	add    %edx,%eax
    ab15:	c1 e0 02             	shl    $0x2,%eax
    ab18:	01 d0                	add    %edx,%eax
    ab1a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ab1d:	01 d0                	add    %edx,%eax
    ab1f:	8b 04 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%eax
    ab26:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    ab29:	e9 a9 00 00 00       	jmp    abd7 <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    ab2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab31:	8d 48 01             	lea    0x1(%eax),%ecx
    ab34:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ab37:	89 d0                	mov    %edx,%eax
    ab39:	c1 e0 03             	shl    $0x3,%eax
    ab3c:	01 d0                	add    %edx,%eax
    ab3e:	c1 e0 02             	shl    $0x2,%eax
    ab41:	01 d0                	add    %edx,%eax
    ab43:	01 c8                	add    %ecx,%eax
    ab45:	8b 0c 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%ecx
    ab4c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ab4f:	89 d0                	mov    %edx,%eax
    ab51:	c1 e0 03             	shl    $0x3,%eax
    ab54:	01 d0                	add    %edx,%eax
    ab56:	c1 e0 02             	shl    $0x2,%eax
    ab59:	01 d0                	add    %edx,%eax
    ab5b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ab5e:	01 d0                	add    %edx,%eax
    ab60:	8b 04 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%eax
    ab67:	29 c1                	sub    %eax,%ecx
    ab69:	89 c8                	mov    %ecx,%eax
    ab6b:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    ab6e:	eb 5d                	jmp    abcd <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    ab70:	8b 45 10             	mov    0x10(%ebp),%eax
    ab73:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ab76:	83 c2 3e             	add    $0x3e,%edx
    ab79:	8b 14 90             	mov    (%eax,%edx,4),%edx
    ab7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ab7f:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    ab86:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ab89:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    ab90:	83 f8 07             	cmp    $0x7,%eax
    ab93:	74 30                	je     abc5 <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    ab95:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ab98:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    ab9f:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    aba5:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    abab:	dd 05 e0 ef 00 00    	fldl   0xefe0
    abb1:	de c9                	fmulp  %st,%st(1)
    abb3:	dd 1c 24             	fstpl  (%esp)
    abb6:	e8 ac b3 ff ff       	call   5f67 <tan>
    abbb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    abbe:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    abc5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    abc9:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    abcd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    abd1:	7f 9d                	jg     ab70 <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    abd3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    abd7:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    abdb:	0f 8e 4d ff ff ff    	jle    ab2e <III_stereo+0x4f0>
    abe1:	e9 1e 03 00 00       	jmp    af04 <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    abe6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    abed:	e9 08 03 00 00       	jmp    aefa <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    abf2:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    abf9:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    ac00:	e9 0f 01 00 00       	jmp    ad14 <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    ac05:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac08:	8d 48 01             	lea    0x1(%eax),%ecx
    ac0b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ac0e:	89 d0                	mov    %edx,%eax
    ac10:	c1 e0 03             	shl    $0x3,%eax
    ac13:	01 d0                	add    %edx,%eax
    ac15:	c1 e0 02             	shl    $0x2,%eax
    ac18:	01 d0                	add    %edx,%eax
    ac1a:	01 c8                	add    %ecx,%eax
    ac1c:	83 c0 14             	add    $0x14,%eax
    ac1f:	8b 0c 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%ecx
    ac26:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ac29:	89 d0                	mov    %edx,%eax
    ac2b:	c1 e0 03             	shl    $0x3,%eax
    ac2e:	01 d0                	add    %edx,%eax
    ac30:	c1 e0 02             	shl    $0x2,%eax
    ac33:	01 d0                	add    %edx,%eax
    ac35:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ac38:	01 d0                	add    %edx,%eax
    ac3a:	83 c0 14             	add    $0x14,%eax
    ac3d:	8b 04 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%eax
    ac44:	29 c1                	sub    %eax,%ecx
    ac46:	89 c8                	mov    %ecx,%eax
    ac48:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    ac4b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ac4e:	89 d0                	mov    %edx,%eax
    ac50:	c1 e0 03             	shl    $0x3,%eax
    ac53:	01 d0                	add    %edx,%eax
    ac55:	c1 e0 02             	shl    $0x2,%eax
    ac58:	01 d0                	add    %edx,%eax
    ac5a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ac5d:	01 d0                	add    %edx,%eax
    ac5f:	83 c0 14             	add    $0x14,%eax
    ac62:	8b 14 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%edx
    ac69:	89 d0                	mov    %edx,%eax
    ac6b:	01 c0                	add    %eax,%eax
    ac6d:	01 c2                	add    %eax,%edx
    ac6f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ac72:	83 c0 01             	add    $0x1,%eax
    ac75:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    ac79:	01 d0                	add    %edx,%eax
    ac7b:	83 e8 01             	sub    $0x1,%eax
    ac7e:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    ac81:	e9 80 00 00 00       	jmp    ad06 <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    ac86:	8b 45 08             	mov    0x8(%ebp),%eax
    ac89:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    ac8f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    ac92:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    ac97:	89 c8                	mov    %ecx,%eax
    ac99:	f7 ea                	imul   %edx
    ac9b:	c1 fa 02             	sar    $0x2,%edx
    ac9e:	89 c8                	mov    %ecx,%eax
    aca0:	c1 f8 1f             	sar    $0x1f,%eax
    aca3:	89 d3                	mov    %edx,%ebx
    aca5:	29 c3                	sub    %eax,%ebx
    aca7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    acaa:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    acaf:	89 c8                	mov    %ecx,%eax
    acb1:	f7 ea                	imul   %edx
    acb3:	c1 fa 02             	sar    $0x2,%edx
    acb6:	89 c8                	mov    %ecx,%eax
    acb8:	c1 f8 1f             	sar    $0x1f,%eax
    acbb:	29 c2                	sub    %eax,%edx
    acbd:	89 d0                	mov    %edx,%eax
    acbf:	c1 e0 03             	shl    $0x3,%eax
    acc2:	01 d0                	add    %edx,%eax
    acc4:	01 c0                	add    %eax,%eax
    acc6:	29 c1                	sub    %eax,%ecx
    acc8:	89 ca                	mov    %ecx,%edx
    acca:	89 d8                	mov    %ebx,%eax
    accc:	c1 e0 03             	shl    $0x3,%eax
    accf:	01 d8                	add    %ebx,%eax
    acd1:	01 c0                	add    %eax,%eax
    acd3:	01 d0                	add    %edx,%eax
    acd5:	dd 04 c6             	fldl   (%esi,%eax,8)
    acd8:	d9 ee                	fldz   
    acda:	df e9                	fucomip %st(1),%st
    acdc:	7a 0a                	jp     ace8 <III_stereo+0x6aa>
    acde:	d9 ee                	fldz   
    ace0:	df e9                	fucomip %st(1),%st
    ace2:	dd d8                	fstp   %st(0)
    ace4:	74 18                	je     acfe <III_stereo+0x6c0>
    ace6:	eb 02                	jmp    acea <III_stereo+0x6ac>
    ace8:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    acea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aced:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    acf0:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    acf7:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    acfe:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    ad02:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    ad06:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    ad0a:	0f 8f 76 ff ff ff    	jg     ac86 <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    ad10:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    ad14:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    ad18:	0f 89 e7 fe ff ff    	jns    ac05 <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    ad1e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    ad21:	83 c0 01             	add    $0x1,%eax
    ad24:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    ad27:	e9 f0 00 00 00       	jmp    ae1c <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    ad2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad2f:	8d 48 01             	lea    0x1(%eax),%ecx
    ad32:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ad35:	89 d0                	mov    %edx,%eax
    ad37:	c1 e0 03             	shl    $0x3,%eax
    ad3a:	01 d0                	add    %edx,%eax
    ad3c:	c1 e0 02             	shl    $0x2,%eax
    ad3f:	01 d0                	add    %edx,%eax
    ad41:	01 c8                	add    %ecx,%eax
    ad43:	83 c0 14             	add    $0x14,%eax
    ad46:	8b 0c 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%ecx
    ad4d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ad50:	89 d0                	mov    %edx,%eax
    ad52:	c1 e0 03             	shl    $0x3,%eax
    ad55:	01 d0                	add    %edx,%eax
    ad57:	c1 e0 02             	shl    $0x2,%eax
    ad5a:	01 d0                	add    %edx,%eax
    ad5c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ad5f:	01 d0                	add    %edx,%eax
    ad61:	83 c0 14             	add    $0x14,%eax
    ad64:	8b 04 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%eax
    ad6b:	29 c1                	sub    %eax,%ecx
    ad6d:	89 c8                	mov    %ecx,%eax
    ad6f:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    ad72:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ad75:	89 d0                	mov    %edx,%eax
    ad77:	c1 e0 03             	shl    $0x3,%eax
    ad7a:	01 d0                	add    %edx,%eax
    ad7c:	c1 e0 02             	shl    $0x2,%eax
    ad7f:	01 d0                	add    %edx,%eax
    ad81:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ad84:	01 d0                	add    %edx,%eax
    ad86:	83 c0 14             	add    $0x14,%eax
    ad89:	8b 14 85 4c 0c 01 00 	mov    0x10c4c(,%eax,4),%edx
    ad90:	89 d0                	mov    %edx,%eax
    ad92:	01 c0                	add    %eax,%eax
    ad94:	01 c2                	add    %eax,%edx
    ad96:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ad99:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    ad9d:	01 d0                	add    %edx,%eax
    ad9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    ada2:	eb 6e                	jmp    ae12 <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    ada4:	8b 4d 10             	mov    0x10(%ebp),%ecx
    ada7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    adaa:	89 d0                	mov    %edx,%eax
    adac:	01 c0                	add    %eax,%eax
    adae:	01 d0                	add    %edx,%eax
    adb0:	c1 e0 02             	shl    $0x2,%eax
    adb3:	01 d0                	add    %edx,%eax
    adb5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    adb8:	01 d0                	add    %edx,%eax
    adba:	83 c0 52             	add    $0x52,%eax
    adbd:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    adc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    adc4:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    adcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    adce:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    add5:	83 f8 07             	cmp    $0x7,%eax
    add8:	74 30                	je     ae0a <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    adda:	8b 45 f0             	mov    -0x10(%ebp),%eax
    addd:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    ade4:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    adea:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    adf0:	dd 05 e0 ef 00 00    	fldl   0xefe0
    adf6:	de c9                	fmulp  %st,%st(1)
    adf8:	dd 1c 24             	fstpl  (%esp)
    adfb:	e8 67 b1 ff ff       	call   5f67 <tan>
    ae00:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ae03:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    ae0a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    ae0e:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    ae12:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    ae16:	7f 8c                	jg     ada4 <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    ae18:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    ae1c:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    ae20:	0f 8e 06 ff ff ff    	jle    ad2c <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    ae26:	8b 45 c8             	mov    -0x38(%ebp),%eax
    ae29:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    ae2f:	05 bc 0c 01 00       	add    $0x10cbc,%eax
    ae34:	8b 50 0c             	mov    0xc(%eax),%edx
    ae37:	8b 45 c8             	mov    -0x38(%ebp),%eax
    ae3a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    ae40:	05 b8 0c 01 00       	add    $0x10cb8,%eax
    ae45:	8b 40 0c             	mov    0xc(%eax),%eax
    ae48:	29 c2                	sub    %eax,%edx
    ae4a:	89 d0                	mov    %edx,%eax
    ae4c:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    ae4f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    ae52:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    ae58:	05 b8 0c 01 00       	add    $0x10cb8,%eax
    ae5d:	8b 50 0c             	mov    0xc(%eax),%edx
    ae60:	89 d0                	mov    %edx,%eax
    ae62:	01 c0                	add    %eax,%eax
    ae64:	01 c2                	add    %eax,%edx
    ae66:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ae69:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    ae6d:	01 d0                	add    %edx,%eax
    ae6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    ae72:	8b 45 c8             	mov    -0x38(%ebp),%eax
    ae75:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    ae7b:	05 c0 0c 01 00       	add    $0x10cc0,%eax
    ae80:	8b 50 0c             	mov    0xc(%eax),%edx
    ae83:	8b 45 c8             	mov    -0x38(%ebp),%eax
    ae86:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    ae8c:	05 bc 0c 01 00       	add    $0x10cbc,%eax
    ae91:	8b 40 0c             	mov    0xc(%eax),%eax
    ae94:	29 c2                	sub    %eax,%edx
    ae96:	89 d0                	mov    %edx,%eax
    ae98:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    ae9b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    ae9e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    aea4:	05 bc 0c 01 00       	add    $0x10cbc,%eax
    aea9:	8b 50 0c             	mov    0xc(%eax),%edx
    aeac:	89 d0                	mov    %edx,%eax
    aeae:	01 c0                	add    %eax,%eax
    aeb0:	01 c2                	add    %eax,%edx
    aeb2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    aeb5:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    aeb9:	01 d0                	add    %edx,%eax
    aebb:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    aebe:	eb 30                	jmp    aef0 <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    aec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aec3:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    aeca:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aecd:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    aed4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aed7:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    aede:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aee1:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    aee8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    aeec:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    aef0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    aef4:	7f ca                	jg     aec0 <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    aef6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    aefa:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    aefe:	0f 8e ee fc ff ff    	jle    abf2 <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    af04:	e9 f0 01 00 00       	jmp    b0f9 <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    af09:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    af10:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    af17:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    af1e:	eb 63                	jmp    af83 <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    af20:	8b 45 08             	mov    0x8(%ebp),%eax
    af23:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    af29:	8b 55 f0             	mov    -0x10(%ebp),%edx
    af2c:	89 d0                	mov    %edx,%eax
    af2e:	c1 e0 03             	shl    $0x3,%eax
    af31:	01 d0                	add    %edx,%eax
    af33:	01 c0                	add    %eax,%eax
    af35:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    af38:	01 d0                	add    %edx,%eax
    af3a:	dd 04 c1             	fldl   (%ecx,%eax,8)
    af3d:	d9 ee                	fldz   
    af3f:	df e9                	fucomip %st(1),%st
    af41:	7a 0a                	jp     af4d <III_stereo+0x90f>
    af43:	d9 ee                	fldz   
    af45:	df e9                	fucomip %st(1),%st
    af47:	dd d8                	fstp   %st(0)
    af49:	74 23                	je     af6e <III_stereo+0x930>
    af4b:	eb 02                	jmp    af4f <III_stereo+0x911>
    af4d:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    af4f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    af52:	89 d0                	mov    %edx,%eax
    af54:	c1 e0 03             	shl    $0x3,%eax
    af57:	01 d0                	add    %edx,%eax
    af59:	01 c0                	add    %eax,%eax
    af5b:	89 c2                	mov    %eax,%edx
    af5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    af60:	01 d0                	add    %edx,%eax
    af62:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    af65:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    af6c:	eb 15                	jmp    af83 <III_stereo+0x945>
            } else
            {  ss--;
    af6e:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    af72:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    af76:	79 0b                	jns    af83 <III_stereo+0x945>
               {  i--;
    af78:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    af7c:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    af83:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    af87:	79 97                	jns    af20 <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    af89:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    af90:	eb 04                	jmp    af96 <III_stereo+0x958>
            i++;
    af92:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    af96:	8b 55 c8             	mov    -0x38(%ebp),%edx
    af99:	89 d0                	mov    %edx,%eax
    af9b:	c1 e0 03             	shl    $0x3,%eax
    af9e:	01 d0                	add    %edx,%eax
    afa0:	c1 e0 02             	shl    $0x2,%eax
    afa3:	01 d0                	add    %edx,%eax
    afa5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    afa8:	01 d0                	add    %edx,%eax
    afaa:	8b 04 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%eax
    afb1:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    afb4:	7e dc                	jle    af92 <III_stereo+0x954>
            i++;
         sfb = i;
    afb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    afb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    afbc:	8b 55 c8             	mov    -0x38(%ebp),%edx
    afbf:	89 d0                	mov    %edx,%eax
    afc1:	c1 e0 03             	shl    $0x3,%eax
    afc4:	01 d0                	add    %edx,%eax
    afc6:	c1 e0 02             	shl    $0x2,%eax
    afc9:	01 d0                	add    %edx,%eax
    afcb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    afce:	01 d0                	add    %edx,%eax
    afd0:	8b 04 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%eax
    afd7:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    afda:	e9 a9 00 00 00       	jmp    b088 <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    afdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    afe2:	8d 48 01             	lea    0x1(%eax),%ecx
    afe5:	8b 55 c8             	mov    -0x38(%ebp),%edx
    afe8:	89 d0                	mov    %edx,%eax
    afea:	c1 e0 03             	shl    $0x3,%eax
    afed:	01 d0                	add    %edx,%eax
    afef:	c1 e0 02             	shl    $0x2,%eax
    aff2:	01 d0                	add    %edx,%eax
    aff4:	01 c8                	add    %ecx,%eax
    aff6:	8b 0c 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%ecx
    affd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b000:	89 d0                	mov    %edx,%eax
    b002:	c1 e0 03             	shl    $0x3,%eax
    b005:	01 d0                	add    %edx,%eax
    b007:	c1 e0 02             	shl    $0x2,%eax
    b00a:	01 d0                	add    %edx,%eax
    b00c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b00f:	01 d0                	add    %edx,%eax
    b011:	8b 04 85 40 0c 01 00 	mov    0x10c40(,%eax,4),%eax
    b018:	29 c1                	sub    %eax,%ecx
    b01a:	89 c8                	mov    %ecx,%eax
    b01c:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    b01f:	eb 5d                	jmp    b07e <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    b021:	8b 45 10             	mov    0x10(%ebp),%eax
    b024:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b027:	83 c2 3e             	add    $0x3e,%edx
    b02a:	8b 14 90             	mov    (%eax,%edx,4),%edx
    b02d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b030:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    b037:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b03a:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    b041:	83 f8 07             	cmp    $0x7,%eax
    b044:	74 30                	je     b076 <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    b046:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b049:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    b050:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    b056:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    b05c:	dd 05 e0 ef 00 00    	fldl   0xefe0
    b062:	de c9                	fmulp  %st,%st(1)
    b064:	dd 1c 24             	fstpl  (%esp)
    b067:	e8 fb ae ff ff       	call   5f67 <tan>
    b06c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b06f:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    b076:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    b07a:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    b07e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    b082:	7f 9d                	jg     b021 <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    b084:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b088:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    b08c:	0f 8e 4d ff ff ff    	jle    afdf <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    b092:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b095:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b09b:	05 90 0c 01 00       	add    $0x10c90,%eax
    b0a0:	8b 00                	mov    (%eax),%eax
    b0a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    b0a5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b0a8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b0ae:	05 94 0c 01 00       	add    $0x10c94,%eax
    b0b3:	8b 00                	mov    (%eax),%eax
    b0b5:	ba 40 02 00 00       	mov    $0x240,%edx
    b0ba:	29 c2                	sub    %eax,%edx
    b0bc:	89 d0                	mov    %edx,%eax
    b0be:	89 45 e8             	mov    %eax,-0x18(%ebp)
    b0c1:	eb 30                	jmp    b0f3 <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    b0c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b0c6:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    b0cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b0d0:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    b0d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b0da:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b0e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b0e4:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    b0eb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    b0ef:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    b0f3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    b0f7:	7f ca                	jg     b0c3 <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    b0f9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    b100:	eb 55                	jmp    b157 <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    b102:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b109:	eb 42                	jmp    b14d <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    b10b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    b112:	eb 2f                	jmp    b143 <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    b114:	8b 55 e0             	mov    -0x20(%ebp),%edx
    b117:	89 d0                	mov    %edx,%eax
    b119:	c1 e0 03             	shl    $0x3,%eax
    b11c:	01 d0                	add    %edx,%eax
    b11e:	c1 e0 09             	shl    $0x9,%eax
    b121:	89 c2                	mov    %eax,%edx
    b123:	8b 45 0c             	mov    0xc(%ebp),%eax
    b126:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b129:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b12c:	89 d0                	mov    %edx,%eax
    b12e:	c1 e0 03             	shl    $0x3,%eax
    b131:	01 d0                	add    %edx,%eax
    b133:	01 c0                	add    %eax,%eax
    b135:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b138:	01 d0                	add    %edx,%eax
    b13a:	d9 ee                	fldz   
    b13c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    b13f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b143:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    b147:	7e cb                	jle    b114 <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    b149:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b14d:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    b151:	7e b8                	jle    b10b <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    b153:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    b157:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    b15b:	7e a5                	jle    b102 <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    b15d:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    b161:	0f 85 3d 02 00 00    	jne    b3a4 <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    b167:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b16e:	e9 25 02 00 00       	jmp    b398 <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    b173:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    b17a:	e9 0b 02 00 00       	jmp    b38a <III_stereo+0xd4c>
            i = (sb*18)+ss;
    b17f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b182:	89 d0                	mov    %edx,%eax
    b184:	c1 e0 03             	shl    $0x3,%eax
    b187:	01 d0                	add    %edx,%eax
    b189:	01 c0                	add    %eax,%eax
    b18b:	89 c2                	mov    %eax,%edx
    b18d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    b190:	01 d0                	add    %edx,%eax
    b192:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    b195:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b198:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    b19f:	83 f8 07             	cmp    $0x7,%eax
    b1a2:	0f 85 2c 01 00 00    	jne    b2d4 <III_stereo+0xc96>
               if ( ms_stereo ) {
    b1a8:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    b1ac:	0f 84 b5 00 00 00    	je     b267 <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    b1b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b1b5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b1b8:	89 d0                	mov    %edx,%eax
    b1ba:	c1 e0 03             	shl    $0x3,%eax
    b1bd:	01 d0                	add    %edx,%eax
    b1bf:	01 c0                	add    %eax,%eax
    b1c1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b1c4:	01 d0                	add    %edx,%eax
    b1c6:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b1c9:	8b 45 08             	mov    0x8(%ebp),%eax
    b1cc:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    b1d2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b1d5:	89 d0                	mov    %edx,%eax
    b1d7:	c1 e0 03             	shl    $0x3,%eax
    b1da:	01 d0                	add    %edx,%eax
    b1dc:	01 c0                	add    %eax,%eax
    b1de:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b1e1:	01 d0                	add    %edx,%eax
    b1e3:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b1e6:	de c1                	faddp  %st,%st(1)
    b1e8:	dd 05 e8 ef 00 00    	fldl   0xefe8
    b1ee:	de f9                	fdivrp %st,%st(1)
    b1f0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b1f3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b1f6:	89 d0                	mov    %edx,%eax
    b1f8:	c1 e0 03             	shl    $0x3,%eax
    b1fb:	01 d0                	add    %edx,%eax
    b1fd:	01 c0                	add    %eax,%eax
    b1ff:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b202:	01 d0                	add    %edx,%eax
    b204:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    b207:	8b 45 0c             	mov    0xc(%ebp),%eax
    b20a:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    b210:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b213:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b216:	89 d0                	mov    %edx,%eax
    b218:	c1 e0 03             	shl    $0x3,%eax
    b21b:	01 d0                	add    %edx,%eax
    b21d:	01 c0                	add    %eax,%eax
    b21f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b222:	01 d0                	add    %edx,%eax
    b224:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b227:	8b 45 08             	mov    0x8(%ebp),%eax
    b22a:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    b230:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b233:	89 d0                	mov    %edx,%eax
    b235:	c1 e0 03             	shl    $0x3,%eax
    b238:	01 d0                	add    %edx,%eax
    b23a:	01 c0                	add    %eax,%eax
    b23c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b23f:	01 d0                	add    %edx,%eax
    b241:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b244:	de e9                	fsubrp %st,%st(1)
    b246:	dd 05 e8 ef 00 00    	fldl   0xefe8
    b24c:	de f9                	fdivrp %st,%st(1)
    b24e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b251:	89 d0                	mov    %edx,%eax
    b253:	c1 e0 03             	shl    $0x3,%eax
    b256:	01 d0                	add    %edx,%eax
    b258:	01 c0                	add    %eax,%eax
    b25a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b25d:	01 d0                	add    %edx,%eax
    b25f:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    b262:	e9 1f 01 00 00       	jmp    b386 <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    b267:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b26a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b26d:	89 d0                	mov    %edx,%eax
    b26f:	c1 e0 03             	shl    $0x3,%eax
    b272:	01 d0                	add    %edx,%eax
    b274:	01 c0                	add    %eax,%eax
    b276:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b279:	01 d0                	add    %edx,%eax
    b27b:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b27e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b281:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b284:	89 d0                	mov    %edx,%eax
    b286:	c1 e0 03             	shl    $0x3,%eax
    b289:	01 d0                	add    %edx,%eax
    b28b:	01 c0                	add    %eax,%eax
    b28d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b290:	01 d0                	add    %edx,%eax
    b292:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    b295:	8b 45 0c             	mov    0xc(%ebp),%eax
    b298:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    b29e:	8b 45 08             	mov    0x8(%ebp),%eax
    b2a1:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    b2a7:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b2aa:	89 d0                	mov    %edx,%eax
    b2ac:	c1 e0 03             	shl    $0x3,%eax
    b2af:	01 d0                	add    %edx,%eax
    b2b1:	01 c0                	add    %eax,%eax
    b2b3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b2b6:	01 d0                	add    %edx,%eax
    b2b8:	dd 04 c3             	fldl   (%ebx,%eax,8)
    b2bb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b2be:	89 d0                	mov    %edx,%eax
    b2c0:	c1 e0 03             	shl    $0x3,%eax
    b2c3:	01 d0                	add    %edx,%eax
    b2c5:	01 c0                	add    %eax,%eax
    b2c7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b2ca:	01 d0                	add    %edx,%eax
    b2cc:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    b2cf:	e9 b2 00 00 00       	jmp    b386 <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    b2d4:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    b2d8:	0f 84 94 00 00 00    	je     b372 <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    b2de:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b2e1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b2e4:	89 d0                	mov    %edx,%eax
    b2e6:	c1 e0 03             	shl    $0x3,%eax
    b2e9:	01 d0                	add    %edx,%eax
    b2eb:	01 c0                	add    %eax,%eax
    b2ed:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b2f0:	01 d0                	add    %edx,%eax
    b2f2:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b2f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b2f8:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b2ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b302:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b309:	d9 e8                	fld1   
    b30b:	de c1                	faddp  %st,%st(1)
    b30d:	de f9                	fdivrp %st,%st(1)
    b30f:	de c9                	fmulp  %st,%st(1)
    b311:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b314:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b317:	89 d0                	mov    %edx,%eax
    b319:	c1 e0 03             	shl    $0x3,%eax
    b31c:	01 d0                	add    %edx,%eax
    b31e:	01 c0                	add    %eax,%eax
    b320:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b323:	01 d0                	add    %edx,%eax
    b325:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    b328:	8b 45 0c             	mov    0xc(%ebp),%eax
    b32b:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    b331:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b334:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b337:	89 d0                	mov    %edx,%eax
    b339:	c1 e0 03             	shl    $0x3,%eax
    b33c:	01 d0                	add    %edx,%eax
    b33e:	01 c0                	add    %eax,%eax
    b340:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b343:	01 d0                	add    %edx,%eax
    b345:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b348:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b34b:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b352:	d9 e8                	fld1   
    b354:	de c1                	faddp  %st,%st(1)
    b356:	d9 e8                	fld1   
    b358:	de f1                	fdivp  %st,%st(1)
    b35a:	de c9                	fmulp  %st,%st(1)
    b35c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b35f:	89 d0                	mov    %edx,%eax
    b361:	c1 e0 03             	shl    $0x3,%eax
    b364:	01 d0                	add    %edx,%eax
    b366:	01 c0                	add    %eax,%eax
    b368:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b36b:	01 d0                	add    %edx,%eax
    b36d:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    b370:	eb 14                	jmp    b386 <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    b372:	c7 44 24 04 80 df 00 	movl   $0xdf80,0x4(%esp)
    b379:	00 
    b37a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    b381:	e8 3c a7 ff ff       	call   5ac2 <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    b386:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b38a:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    b38e:	0f 8e eb fd ff ff    	jle    b17f <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    b394:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b398:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    b39c:	0f 8e d1 fd ff ff    	jle    b173 <III_stereo+0xb35>
    b3a2:	eb 54                	jmp    b3f8 <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    b3a4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b3ab:	eb 45                	jmp    b3f2 <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    b3ad:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    b3b4:	eb 32                	jmp    b3e8 <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    b3b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b3b9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b3bc:	89 d0                	mov    %edx,%eax
    b3be:	c1 e0 03             	shl    $0x3,%eax
    b3c1:	01 d0                	add    %edx,%eax
    b3c3:	01 c0                	add    %eax,%eax
    b3c5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b3c8:	01 d0                	add    %edx,%eax
    b3ca:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b3cd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b3d0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b3d3:	89 d0                	mov    %edx,%eax
    b3d5:	c1 e0 03             	shl    $0x3,%eax
    b3d8:	01 d0                	add    %edx,%eax
    b3da:	01 c0                	add    %eax,%eax
    b3dc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b3df:	01 d0                	add    %edx,%eax
    b3e1:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    b3e4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b3e8:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    b3ec:	7e c8                	jle    b3b6 <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    b3ee:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b3f2:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    b3f6:	7e b5                	jle    b3ad <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    b3f8:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    b3fe:	5b                   	pop    %ebx
    b3ff:	5e                   	pop    %esi
    b400:	5d                   	pop    %ebp
    b401:	c3                   	ret    

0000b402 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    b402:	55                   	push   %ebp
    b403:	89 e5                	mov    %esp,%ebp
    b405:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    b408:	a1 a0 0e 01 00       	mov    0x10ea0,%eax
    b40d:	85 c0                	test   %eax,%eax
    b40f:	74 68                	je     b479 <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    b411:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b418:	eb 4f                	jmp    b469 <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    b41a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b41d:	dd 04 c5 60 0e 01 00 	fldl   0x10e60(,%eax,8)
    b424:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b427:	dd 04 c5 60 0e 01 00 	fldl   0x10e60(,%eax,8)
    b42e:	de c9                	fmulp  %st,%st(1)
    b430:	d9 e8                	fld1   
    b432:	de c1                	faddp  %st,%st(1)
    b434:	dd 1c 24             	fstpl  (%esp)
    b437:	e8 de ac ff ff       	call   611a <sqrt>
    b43c:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    b43f:	d9 e8                	fld1   
    b441:	dc 75 e0             	fdivl  -0x20(%ebp)
    b444:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b447:	dd 1c c5 20 0f 01 00 	fstpl  0x10f20(,%eax,8)
         ca[i] = Ci[i]/sq;
    b44e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b451:	dd 04 c5 60 0e 01 00 	fldl   0x10e60(,%eax,8)
    b458:	dc 75 e0             	fdivl  -0x20(%ebp)
    b45b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b45e:	dd 1c c5 60 0f 01 00 	fstpl  0x10f60(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    b465:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b469:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    b46d:	7e ab                	jle    b41a <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    b46f:	c7 05 a0 0e 01 00 00 	movl   $0x0,0x10ea0
    b476:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    b479:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b480:	eb 4c                	jmp    b4ce <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    b482:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b489:	eb 39                	jmp    b4c4 <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    b48b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b48e:	89 d0                	mov    %edx,%eax
    b490:	c1 e0 03             	shl    $0x3,%eax
    b493:	01 d0                	add    %edx,%eax
    b495:	c1 e0 04             	shl    $0x4,%eax
    b498:	89 c2                	mov    %eax,%edx
    b49a:	8b 45 0c             	mov    0xc(%ebp),%eax
    b49d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b4a0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b4a3:	89 d0                	mov    %edx,%eax
    b4a5:	c1 e0 03             	shl    $0x3,%eax
    b4a8:	01 d0                	add    %edx,%eax
    b4aa:	c1 e0 04             	shl    $0x4,%eax
    b4ad:	89 c2                	mov    %eax,%edx
    b4af:	8b 45 08             	mov    0x8(%ebp),%eax
    b4b2:	01 c2                	add    %eax,%edx
    b4b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b4b7:	dd 04 c2             	fldl   (%edx,%eax,8)
    b4ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b4bd:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    b4c0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b4c4:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b4c8:	7e c1                	jle    b48b <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    b4ca:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b4ce:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    b4d2:	7e ae                	jle    b482 <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    b4d4:	8b 45 10             	mov    0x10(%ebp),%eax
    b4d7:	8b 40 10             	mov    0x10(%eax),%eax
    b4da:	85 c0                	test   %eax,%eax
    b4dc:	74 1a                	je     b4f8 <III_antialias+0xf6>
    b4de:	8b 45 10             	mov    0x10(%ebp),%eax
    b4e1:	8b 40 14             	mov    0x14(%eax),%eax
    b4e4:	83 f8 02             	cmp    $0x2,%eax
    b4e7:	75 0f                	jne    b4f8 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    b4e9:	8b 45 10             	mov    0x10(%ebp),%eax
    b4ec:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    b4ef:	85 c0                	test   %eax,%eax
    b4f1:	75 05                	jne    b4f8 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    b4f3:	e9 1c 01 00 00       	jmp    b614 <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b4f8:	8b 45 10             	mov    0x10(%ebp),%eax
    b4fb:	8b 40 10             	mov    0x10(%eax),%eax
    b4fe:	85 c0                	test   %eax,%eax
    b500:	74 1e                	je     b520 <III_antialias+0x11e>
    b502:	8b 45 10             	mov    0x10(%ebp),%eax
    b505:	8b 40 18             	mov    0x18(%eax),%eax
    b508:	85 c0                	test   %eax,%eax
    b50a:	74 14                	je     b520 <III_antialias+0x11e>
     (gr_info->block_type == 2))
    b50c:	8b 45 10             	mov    0x10(%ebp),%eax
    b50f:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b512:	83 f8 02             	cmp    $0x2,%eax
    b515:	75 09                	jne    b520 <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    b517:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    b51e:	eb 07                	jmp    b527 <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    b520:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    b527:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b52e:	e9 d5 00 00 00       	jmp    b608 <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    b533:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b53a:	e9 bb 00 00 00       	jmp    b5fa <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    b53f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b542:	89 d0                	mov    %edx,%eax
    b544:	c1 e0 03             	shl    $0x3,%eax
    b547:	01 d0                	add    %edx,%eax
    b549:	c1 e0 04             	shl    $0x4,%eax
    b54c:	89 c2                	mov    %eax,%edx
    b54e:	8b 45 08             	mov    0x8(%ebp),%eax
    b551:	01 c2                	add    %eax,%edx
    b553:	b8 11 00 00 00       	mov    $0x11,%eax
    b558:	2b 45 f4             	sub    -0xc(%ebp),%eax
    b55b:	dd 04 c2             	fldl   (%edx,%eax,8)
    b55e:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    b561:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b564:	8d 50 01             	lea    0x1(%eax),%edx
    b567:	89 d0                	mov    %edx,%eax
    b569:	c1 e0 03             	shl    $0x3,%eax
    b56c:	01 d0                	add    %edx,%eax
    b56e:	c1 e0 04             	shl    $0x4,%eax
    b571:	89 c2                	mov    %eax,%edx
    b573:	8b 45 08             	mov    0x8(%ebp),%eax
    b576:	01 c2                	add    %eax,%edx
    b578:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b57b:	dd 04 c2             	fldl   (%edx,%eax,8)
    b57e:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    b581:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b584:	89 d0                	mov    %edx,%eax
    b586:	c1 e0 03             	shl    $0x3,%eax
    b589:	01 d0                	add    %edx,%eax
    b58b:	c1 e0 04             	shl    $0x4,%eax
    b58e:	89 c2                	mov    %eax,%edx
    b590:	8b 45 0c             	mov    0xc(%ebp),%eax
    b593:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b596:	b8 11 00 00 00       	mov    $0x11,%eax
    b59b:	2b 45 f4             	sub    -0xc(%ebp),%eax
    b59e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b5a1:	dd 04 d5 20 0f 01 00 	fldl   0x10f20(,%edx,8)
    b5a8:	dc 4d d8             	fmull  -0x28(%ebp)
    b5ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b5ae:	dd 04 d5 60 0f 01 00 	fldl   0x10f60(,%edx,8)
    b5b5:	dc 4d d0             	fmull  -0x30(%ebp)
    b5b8:	de e9                	fsubrp %st,%st(1)
    b5ba:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    b5bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b5c0:	8d 50 01             	lea    0x1(%eax),%edx
    b5c3:	89 d0                	mov    %edx,%eax
    b5c5:	c1 e0 03             	shl    $0x3,%eax
    b5c8:	01 d0                	add    %edx,%eax
    b5ca:	c1 e0 04             	shl    $0x4,%eax
    b5cd:	89 c2                	mov    %eax,%edx
    b5cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    b5d2:	01 c2                	add    %eax,%edx
    b5d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b5d7:	dd 04 c5 20 0f 01 00 	fldl   0x10f20(,%eax,8)
    b5de:	dc 4d d0             	fmull  -0x30(%ebp)
    b5e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b5e4:	dd 04 c5 60 0f 01 00 	fldl   0x10f60(,%eax,8)
    b5eb:	dc 4d d8             	fmull  -0x28(%ebp)
    b5ee:	de c1                	faddp  %st,%st(1)
    b5f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b5f3:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    b5f6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b5fa:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    b5fe:	0f 8e 3b ff ff ff    	jle    b53f <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    b604:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b608:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b60b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    b60e:	0f 8c 1f ff ff ff    	jl     b533 <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    b614:	c9                   	leave  
    b615:	c3                   	ret    

0000b616 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    b616:	55                   	push   %ebp
    b617:	89 e5                	mov    %esp,%ebp
    b619:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    b61f:	a1 a0 0f 01 00       	mov    0x10fa0,%eax
    b624:	85 c0                	test   %eax,%eax
    b626:	0f 85 59 02 00 00    	jne    b885 <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    b62c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b633:	eb 29                	jmp    b65e <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    b635:	db 45 f4             	fildl  -0xc(%ebp)
    b638:	dd 05 f0 ef 00 00    	fldl   0xeff0
    b63e:	de c1                	faddp  %st,%st(1)
    b640:	dd 05 f8 ef 00 00    	fldl   0xeff8
    b646:	de c9                	fmulp  %st,%st(1)
    b648:	dd 1c 24             	fstpl  (%esp)
    b64b:	e8 53 a8 ff ff       	call   5ea3 <sin>
    b650:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b653:	dd 1c c5 c0 0f 01 00 	fstpl  0x10fc0(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    b65a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b65e:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b662:	7e d1                	jle    b635 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    b664:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b66b:	eb 2c                	jmp    b699 <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    b66d:	db 45 f4             	fildl  -0xc(%ebp)
    b670:	dd 05 f0 ef 00 00    	fldl   0xeff0
    b676:	de c1                	faddp  %st,%st(1)
    b678:	dd 05 f8 ef 00 00    	fldl   0xeff8
    b67e:	de c9                	fmulp  %st,%st(1)
    b680:	dd 1c 24             	fstpl  (%esp)
    b683:	e8 1b a8 ff ff       	call   5ea3 <sin>
    b688:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b68b:	83 c0 24             	add    $0x24,%eax
    b68e:	dd 1c c5 c0 0f 01 00 	fstpl  0x10fc0(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    b695:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b699:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b69d:	7e ce                	jle    b66d <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    b69f:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    b6a6:	eb 13                	jmp    b6bb <inv_mdct+0xa5>
         win[1][i] = 1.0;
    b6a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b6ab:	83 c0 24             	add    $0x24,%eax
    b6ae:	d9 e8                	fld1   
    b6b0:	dd 1c c5 c0 0f 01 00 	fstpl  0x10fc0(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    b6b7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b6bb:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    b6bf:	7e e7                	jle    b6a8 <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    b6c1:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    b6c8:	eb 34                	jmp    b6fe <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    b6ca:	db 45 f4             	fildl  -0xc(%ebp)
    b6cd:	dd 05 f0 ef 00 00    	fldl   0xeff0
    b6d3:	de c1                	faddp  %st,%st(1)
    b6d5:	dd 05 00 f0 00 00    	fldl   0xf000
    b6db:	de e9                	fsubrp %st,%st(1)
    b6dd:	dd 05 e0 ef 00 00    	fldl   0xefe0
    b6e3:	de c9                	fmulp  %st,%st(1)
    b6e5:	dd 1c 24             	fstpl  (%esp)
    b6e8:	e8 b6 a7 ff ff       	call   5ea3 <sin>
    b6ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b6f0:	83 c0 24             	add    $0x24,%eax
    b6f3:	dd 1c c5 c0 0f 01 00 	fstpl  0x10fc0(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    b6fa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b6fe:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    b702:	7e c6                	jle    b6ca <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    b704:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    b70b:	eb 13                	jmp    b720 <inv_mdct+0x10a>
         win[1][i] = 0.0;
    b70d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b710:	83 c0 24             	add    $0x24,%eax
    b713:	d9 ee                	fldz   
    b715:	dd 1c c5 c0 0f 01 00 	fstpl  0x10fc0(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    b71c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b720:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b724:	7e e7                	jle    b70d <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    b726:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b72d:	eb 13                	jmp    b742 <inv_mdct+0x12c>
         win[3][i] = 0.0;
    b72f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b732:	83 c0 6c             	add    $0x6c,%eax
    b735:	d9 ee                	fldz   
    b737:	dd 1c c5 c0 0f 01 00 	fstpl  0x10fc0(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    b73e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b742:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    b746:	7e e7                	jle    b72f <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    b748:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    b74f:	eb 34                	jmp    b785 <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    b751:	db 45 f4             	fildl  -0xc(%ebp)
    b754:	dd 05 f0 ef 00 00    	fldl   0xeff0
    b75a:	de c1                	faddp  %st,%st(1)
    b75c:	dd 05 08 f0 00 00    	fldl   0xf008
    b762:	de e9                	fsubrp %st,%st(1)
    b764:	dd 05 e0 ef 00 00    	fldl   0xefe0
    b76a:	de c9                	fmulp  %st,%st(1)
    b76c:	dd 1c 24             	fstpl  (%esp)
    b76f:	e8 2f a7 ff ff       	call   5ea3 <sin>
    b774:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b777:	83 c0 6c             	add    $0x6c,%eax
    b77a:	dd 1c c5 c0 0f 01 00 	fstpl  0x10fc0(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    b781:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b785:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    b789:	7e c6                	jle    b751 <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    b78b:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    b792:	eb 13                	jmp    b7a7 <inv_mdct+0x191>
         win[3][i] =1.0;
    b794:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b797:	83 c0 6c             	add    $0x6c,%eax
    b79a:	d9 e8                	fld1   
    b79c:	dd 1c c5 c0 0f 01 00 	fstpl  0x10fc0(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    b7a3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b7a7:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b7ab:	7e e7                	jle    b794 <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    b7ad:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    b7b4:	eb 2c                	jmp    b7e2 <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    b7b6:	db 45 f4             	fildl  -0xc(%ebp)
    b7b9:	dd 05 f0 ef 00 00    	fldl   0xeff0
    b7bf:	de c1                	faddp  %st,%st(1)
    b7c1:	dd 05 f8 ef 00 00    	fldl   0xeff8
    b7c7:	de c9                	fmulp  %st,%st(1)
    b7c9:	dd 1c 24             	fstpl  (%esp)
    b7cc:	e8 d2 a6 ff ff       	call   5ea3 <sin>
    b7d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b7d4:	83 c0 6c             	add    $0x6c,%eax
    b7d7:	dd 1c c5 c0 0f 01 00 	fstpl  0x10fc0(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    b7de:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b7e2:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b7e6:	7e ce                	jle    b7b6 <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    b7e8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b7ef:	eb 2c                	jmp    b81d <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    b7f1:	db 45 f4             	fildl  -0xc(%ebp)
    b7f4:	dd 05 f0 ef 00 00    	fldl   0xeff0
    b7fa:	de c1                	faddp  %st,%st(1)
    b7fc:	dd 05 e0 ef 00 00    	fldl   0xefe0
    b802:	de c9                	fmulp  %st,%st(1)
    b804:	dd 1c 24             	fstpl  (%esp)
    b807:	e8 97 a6 ff ff       	call   5ea3 <sin>
    b80c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b80f:	83 c0 48             	add    $0x48,%eax
    b812:	dd 1c c5 c0 0f 01 00 	fstpl  0x10fc0(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    b819:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b81d:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    b821:	7e ce                	jle    b7f1 <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    b823:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    b82a:	eb 13                	jmp    b83f <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    b82c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b82f:	83 c0 48             	add    $0x48,%eax
    b832:	d9 ee                	fldz   
    b834:	dd 1c c5 c0 0f 01 00 	fstpl  0x10fc0(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    b83b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b83f:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b843:	7e e7                	jle    b82c <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    b845:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b84c:	eb 21                	jmp    b86f <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    b84e:	db 45 f4             	fildl  -0xc(%ebp)
    b851:	dd 05 10 f0 00 00    	fldl   0xf010
    b857:	de c9                	fmulp  %st,%st(1)
    b859:	dd 1c 24             	fstpl  (%esp)
    b85c:	e8 e1 a6 ff ff       	call   5f42 <cos>
    b861:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b864:	dd 1c c5 40 14 01 00 	fstpl  0x11440(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    b86b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b86f:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    b876:	7e d6                	jle    b84e <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    b878:	a1 a0 0f 01 00       	mov    0x10fa0,%eax
    b87d:	83 c0 01             	add    $0x1,%eax
    b880:	a3 a0 0f 01 00       	mov    %eax,0x10fa0
    }

    for(i=0;i<36;i++)
    b885:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b88c:	eb 17                	jmp    b8a5 <inv_mdct+0x28f>
       out[i]=0;
    b88e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b891:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b898:	8b 45 0c             	mov    0xc(%ebp),%eax
    b89b:	01 d0                	add    %edx,%eax
    b89d:	d9 ee                	fldz   
    b89f:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    b8a1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b8a5:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b8a9:	7e e3                	jle    b88e <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    b8ab:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    b8af:	0f 85 85 01 00 00    	jne    ba3a <inv_mdct+0x424>
       N=12;
    b8b5:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    b8bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b8c3:	e9 63 01 00 00       	jmp    ba2b <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    b8c8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b8cf:	e9 df 00 00 00       	jmp    b9b3 <inv_mdct+0x39d>
             sum = 0.0;
    b8d4:	d9 ee                	fldz   
    b8d6:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    b8d9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b8e0:	e9 8f 00 00 00       	jmp    b974 <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    b8e5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b8e8:	89 d0                	mov    %edx,%eax
    b8ea:	01 c0                	add    %eax,%eax
    b8ec:	01 c2                	add    %eax,%edx
    b8ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b8f1:	01 d0                	add    %edx,%eax
    b8f3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b8fa:	8b 45 08             	mov    0x8(%ebp),%eax
    b8fd:	01 d0                	add    %edx,%eax
    b8ff:	dd 00                	fldl   (%eax)
    b901:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    b907:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b90a:	01 c0                	add    %eax,%eax
    b90c:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    b912:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    b918:	dd 05 18 f0 00 00    	fldl   0xf018
    b91e:	de f1                	fdivp  %st,%st(1)
    b920:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b923:	01 c0                	add    %eax,%eax
    b925:	8d 50 01             	lea    0x1(%eax),%edx
    b928:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b92b:	89 c1                	mov    %eax,%ecx
    b92d:	c1 e9 1f             	shr    $0x1f,%ecx
    b930:	01 c8                	add    %ecx,%eax
    b932:	d1 f8                	sar    %eax
    b934:	01 d0                	add    %edx,%eax
    b936:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    b93c:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    b942:	de c9                	fmulp  %st,%st(1)
    b944:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b947:	01 c0                	add    %eax,%eax
    b949:	83 c0 01             	add    $0x1,%eax
    b94c:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    b952:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    b958:	de c9                	fmulp  %st,%st(1)
    b95a:	dd 1c 24             	fstpl  (%esp)
    b95d:	e8 e0 a5 ff ff       	call   5f42 <cos>
    b962:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    b968:	dd 45 e0             	fldl   -0x20(%ebp)
    b96b:	de c1                	faddp  %st,%st(1)
    b96d:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    b970:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b974:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b977:	89 c2                	mov    %eax,%edx
    b979:	c1 ea 1f             	shr    $0x1f,%edx
    b97c:	01 d0                	add    %edx,%eax
    b97e:	d1 f8                	sar    %eax
    b980:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b983:	0f 8f 5c ff ff ff    	jg     b8e5 <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    b989:	8b 55 10             	mov    0x10(%ebp),%edx
    b98c:	89 d0                	mov    %edx,%eax
    b98e:	c1 e0 03             	shl    $0x3,%eax
    b991:	01 d0                	add    %edx,%eax
    b993:	c1 e0 02             	shl    $0x2,%eax
    b996:	8b 55 ec             	mov    -0x14(%ebp),%edx
    b999:	01 d0                	add    %edx,%eax
    b99b:	dd 04 c5 c0 0f 01 00 	fldl   0x10fc0(,%eax,8)
    b9a2:	dc 4d e0             	fmull  -0x20(%ebp)
    b9a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b9a8:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    b9af:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b9b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b9b6:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    b9b9:	0f 8c 15 ff ff ff    	jl     b8d4 <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    b9bf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b9c6:	eb 57                	jmp    ba1f <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    b9c8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b9cb:	89 d0                	mov    %edx,%eax
    b9cd:	01 c0                	add    %eax,%eax
    b9cf:	01 d0                	add    %edx,%eax
    b9d1:	01 c0                	add    %eax,%eax
    b9d3:	89 c2                	mov    %eax,%edx
    b9d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b9d8:	01 d0                	add    %edx,%eax
    b9da:	83 c0 06             	add    $0x6,%eax
    b9dd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b9e4:	8b 45 0c             	mov    0xc(%ebp),%eax
    b9e7:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b9ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b9ed:	89 d0                	mov    %edx,%eax
    b9ef:	01 c0                	add    %eax,%eax
    b9f1:	01 d0                	add    %edx,%eax
    b9f3:	01 c0                	add    %eax,%eax
    b9f5:	89 c2                	mov    %eax,%edx
    b9f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b9fa:	01 d0                	add    %edx,%eax
    b9fc:	83 c0 06             	add    $0x6,%eax
    b9ff:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ba06:	8b 45 0c             	mov    0xc(%ebp),%eax
    ba09:	01 d0                	add    %edx,%eax
    ba0b:	dd 00                	fldl   (%eax)
    ba0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ba10:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    ba17:	de c1                	faddp  %st,%st(1)
    ba19:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    ba1b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    ba1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ba22:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    ba25:	7c a1                	jl     b9c8 <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    ba27:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ba2b:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    ba2f:	0f 8e 93 fe ff ff    	jle    b8c8 <inv_mdct+0x2b2>
    ba35:	e9 da 00 00 00       	jmp    bb14 <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    ba3a:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    ba41:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    ba48:	e9 bb 00 00 00       	jmp    bb08 <inv_mdct+0x4f2>
         sum = 0.0;
    ba4d:	d9 ee                	fldz   
    ba4f:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    ba52:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    ba59:	eb 6a                	jmp    bac5 <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    ba5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ba5e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ba65:	8b 45 08             	mov    0x8(%ebp),%eax
    ba68:	01 d0                	add    %edx,%eax
    ba6a:	dd 00                	fldl   (%eax)
    ba6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ba6f:	01 c0                	add    %eax,%eax
    ba71:	8d 50 01             	lea    0x1(%eax),%edx
    ba74:	8b 45 dc             	mov    -0x24(%ebp),%eax
    ba77:	89 c1                	mov    %eax,%ecx
    ba79:	c1 e9 1f             	shr    $0x1f,%ecx
    ba7c:	01 c8                	add    %ecx,%eax
    ba7e:	d1 f8                	sar    %eax
    ba80:	01 c2                	add    %eax,%edx
    ba82:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ba85:	01 c0                	add    %eax,%eax
    ba87:	83 c0 01             	add    $0x1,%eax
    ba8a:	89 d1                	mov    %edx,%ecx
    ba8c:	0f af c8             	imul   %eax,%ecx
    ba8f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    ba94:	89 c8                	mov    %ecx,%eax
    ba96:	f7 ea                	imul   %edx
    ba98:	c1 fa 05             	sar    $0x5,%edx
    ba9b:	89 c8                	mov    %ecx,%eax
    ba9d:	c1 f8 1f             	sar    $0x1f,%eax
    baa0:	29 c2                	sub    %eax,%edx
    baa2:	89 d0                	mov    %edx,%eax
    baa4:	c1 e0 03             	shl    $0x3,%eax
    baa7:	01 d0                	add    %edx,%eax
    baa9:	c1 e0 04             	shl    $0x4,%eax
    baac:	29 c1                	sub    %eax,%ecx
    baae:	89 ca                	mov    %ecx,%edx
    bab0:	dd 04 d5 40 14 01 00 	fldl   0x11440(,%edx,8)
    bab7:	de c9                	fmulp  %st,%st(1)
    bab9:	dd 45 e0             	fldl   -0x20(%ebp)
    babc:	de c1                	faddp  %st,%st(1)
    babe:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    bac1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    bac5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    bac8:	89 c2                	mov    %eax,%edx
    baca:	c1 ea 1f             	shr    $0x1f,%edx
    bacd:	01 d0                	add    %edx,%eax
    bacf:	d1 f8                	sar    %eax
    bad1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    bad4:	7f 85                	jg     ba5b <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    bad6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bad9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bae0:	8b 45 0c             	mov    0xc(%ebp),%eax
    bae3:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    bae6:	8b 55 10             	mov    0x10(%ebp),%edx
    bae9:	89 d0                	mov    %edx,%eax
    baeb:	c1 e0 03             	shl    $0x3,%eax
    baee:	01 d0                	add    %edx,%eax
    baf0:	c1 e0 02             	shl    $0x2,%eax
    baf3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    baf6:	01 d0                	add    %edx,%eax
    baf8:	dd 04 c5 c0 0f 01 00 	fldl   0x10fc0(,%eax,8)
    baff:	dc 4d e0             	fmull  -0x20(%ebp)
    bb02:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    bb04:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    bb08:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bb0b:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    bb0e:	0f 8c 39 ff ff ff    	jl     ba4d <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    bb14:	c9                   	leave  
    bb15:	c3                   	ret    

0000bb16 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    bb16:	55                   	push   %ebp
    bb17:	89 e5                	mov    %esp,%ebp
    bb19:	53                   	push   %ebx
    bb1a:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    bb20:	a1 a4 0e 01 00       	mov    0x10ea4,%eax
    bb25:	85 c0                	test   %eax,%eax
    bb27:	74 6f                	je     bb98 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    bb29:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    bb30:	eb 56                	jmp    bb88 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    bb32:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    bb39:	eb 43                	jmp    bb7e <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    bb3b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    bb42:	eb 30                	jmp    bb74 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    bb44:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bb47:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    bb4a:	89 c2                	mov    %eax,%edx
    bb4c:	c1 e2 03             	shl    $0x3,%edx
    bb4f:	01 c2                	add    %eax,%edx
    bb51:	8d 04 12             	lea    (%edx,%edx,1),%eax
    bb54:	89 c2                	mov    %eax,%edx
    bb56:	89 c8                	mov    %ecx,%eax
    bb58:	c1 e0 03             	shl    $0x3,%eax
    bb5b:	01 c8                	add    %ecx,%eax
    bb5d:	c1 e0 06             	shl    $0x6,%eax
    bb60:	01 c2                	add    %eax,%edx
    bb62:	8b 45 e8             	mov    -0x18(%ebp),%eax
    bb65:	01 d0                	add    %edx,%eax
    bb67:	d9 ee                	fldz   
    bb69:	dd 1c c5 c0 18 01 00 	fstpl  0x118c0(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    bb70:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    bb74:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    bb78:	7e ca                	jle    bb44 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    bb7a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    bb7e:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    bb82:	7e b7                	jle    bb3b <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    bb84:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    bb88:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    bb8c:	7e a4                	jle    bb32 <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    bb8e:	c7 05 a4 0e 01 00 00 	movl   $0x0,0x10ea4
    bb95:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    bb98:	8b 45 18             	mov    0x18(%ebp),%eax
    bb9b:	8b 40 10             	mov    0x10(%eax),%eax
    bb9e:	85 c0                	test   %eax,%eax
    bba0:	74 10                	je     bbb2 <III_hybrid+0x9c>
    bba2:	8b 45 18             	mov    0x18(%ebp),%eax
    bba5:	8b 40 18             	mov    0x18(%eax),%eax
    bba8:	85 c0                	test   %eax,%eax
    bbaa:	74 06                	je     bbb2 <III_hybrid+0x9c>
    bbac:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    bbb0:	7e 08                	jle    bbba <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    bbb2:	8b 45 18             	mov    0x18(%ebp),%eax
    bbb5:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    bbb8:	eb 05                	jmp    bbbf <III_hybrid+0xa9>
    bbba:	b8 00 00 00 00       	mov    $0x0,%eax
    bbbf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    bbc2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    bbc5:	89 44 24 08          	mov    %eax,0x8(%esp)
    bbc9:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    bbcf:	89 44 24 04          	mov    %eax,0x4(%esp)
    bbd3:	8b 45 08             	mov    0x8(%ebp),%eax
    bbd6:	89 04 24             	mov    %eax,(%esp)
    bbd9:	e8 38 fa ff ff       	call   b616 <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    bbde:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    bbe5:	e9 83 00 00 00       	jmp    bc6d <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    bbea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bbed:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bbf4:	8b 45 0c             	mov    0xc(%ebp),%eax
    bbf7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    bbfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bbfd:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    bc04:	8b 45 10             	mov    0x10(%ebp),%eax
    bc07:	8b 4d 14             	mov    0x14(%ebp),%ecx
    bc0a:	89 c2                	mov    %eax,%edx
    bc0c:	c1 e2 03             	shl    $0x3,%edx
    bc0f:	01 c2                	add    %eax,%edx
    bc11:	8d 04 12             	lea    (%edx,%edx,1),%eax
    bc14:	89 c2                	mov    %eax,%edx
    bc16:	89 c8                	mov    %ecx,%eax
    bc18:	c1 e0 03             	shl    $0x3,%eax
    bc1b:	01 c8                	add    %ecx,%eax
    bc1d:	c1 e0 06             	shl    $0x6,%eax
    bc20:	01 c2                	add    %eax,%edx
    bc22:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bc25:	01 d0                	add    %edx,%eax
    bc27:	dd 04 c5 c0 18 01 00 	fldl   0x118c0(,%eax,8)
    bc2e:	de c1                	faddp  %st,%st(1)
    bc30:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    bc32:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bc35:	83 c0 12             	add    $0x12,%eax
    bc38:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    bc3f:	8b 45 10             	mov    0x10(%ebp),%eax
    bc42:	8b 4d 14             	mov    0x14(%ebp),%ecx
    bc45:	89 c2                	mov    %eax,%edx
    bc47:	c1 e2 03             	shl    $0x3,%edx
    bc4a:	01 c2                	add    %eax,%edx
    bc4c:	8d 04 12             	lea    (%edx,%edx,1),%eax
    bc4f:	89 c2                	mov    %eax,%edx
    bc51:	89 c8                	mov    %ecx,%eax
    bc53:	c1 e0 03             	shl    $0x3,%eax
    bc56:	01 c8                	add    %ecx,%eax
    bc58:	c1 e0 06             	shl    $0x6,%eax
    bc5b:	01 c2                	add    %eax,%edx
    bc5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bc60:	01 d0                	add    %edx,%eax
    bc62:	dd 1c c5 c0 18 01 00 	fstpl  0x118c0(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    bc69:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bc6d:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    bc71:	0f 8e 73 ff ff ff    	jle    bbea <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    bc77:	81 c4 54 01 00 00    	add    $0x154,%esp
    bc7d:	5b                   	pop    %ebx
    bc7e:	5d                   	pop    %ebp
    bc7f:	c3                   	ret    

0000bc80 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    bc80:	55                   	push   %ebp
    bc81:	89 e5                	mov    %esp,%ebp
    bc83:	57                   	push   %edi
    bc84:	56                   	push   %esi
    bc85:	53                   	push   %ebx
    bc86:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    bc89:	be 00 00 00 00       	mov    $0x0,%esi
    bc8e:	e9 1c 01 00 00       	jmp    bdaf <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    bc93:	bb 00 00 00 00       	mov    $0x0,%ebx
    bc98:	e9 06 01 00 00       	jmp    bda3 <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    bc9d:	89 f0                	mov    %esi,%eax
    bc9f:	c1 e0 08             	shl    $0x8,%eax
    bca2:	89 c2                	mov    %eax,%edx
    bca4:	8b 45 08             	mov    0x8(%ebp),%eax
    bca7:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    bcaa:	89 75 e0             	mov    %esi,-0x20(%ebp)
    bcad:	db 45 e0             	fildl  -0x20(%ebp)
    bcb0:	dd 05 20 f0 00 00    	fldl   0xf020
    bcb6:	de c9                	fmulp  %st,%st(1)
    bcb8:	dd 05 28 f0 00 00    	fldl   0xf028
    bcbe:	de c1                	faddp  %st,%st(1)
    bcc0:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    bcc3:	83 c0 01             	add    $0x1,%eax
    bcc6:	89 45 e0             	mov    %eax,-0x20(%ebp)
    bcc9:	db 45 e0             	fildl  -0x20(%ebp)
    bccc:	de c9                	fmulp  %st,%st(1)
    bcce:	dd 1c 24             	fstpl  (%esp)
    bcd1:	e8 6c a2 ff ff       	call   5f42 <cos>
    bcd6:	dd 05 30 f0 00 00    	fldl   0xf030
    bcdc:	de c9                	fmulp  %st,%st(1)
    bcde:	dd 1c df             	fstpl  (%edi,%ebx,8)
    bce1:	dd 04 df             	fldl   (%edi,%ebx,8)
    bce4:	d9 ee                	fldz   
    bce6:	d9 c9                	fxch   %st(1)
    bce8:	df e9                	fucomip %st(1),%st
    bcea:	dd d8                	fstp   %st(0)
    bcec:	72 47                	jb     bd35 <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    bcee:	89 f0                	mov    %esi,%eax
    bcf0:	c1 e0 08             	shl    $0x8,%eax
    bcf3:	89 c2                	mov    %eax,%edx
    bcf5:	8b 45 08             	mov    0x8(%ebp),%eax
    bcf8:	01 c2                	add    %eax,%edx
    bcfa:	89 f0                	mov    %esi,%eax
    bcfc:	c1 e0 08             	shl    $0x8,%eax
    bcff:	89 c1                	mov    %eax,%ecx
    bd01:	8b 45 08             	mov    0x8(%ebp),%eax
    bd04:	01 c8                	add    %ecx,%eax
    bd06:	dd 04 d8             	fldl   (%eax,%ebx,8)
    bd09:	dd 05 f0 ef 00 00    	fldl   0xeff0
    bd0f:	de c1                	faddp  %st,%st(1)
    bd11:	d9 7d e6             	fnstcw -0x1a(%ebp)
    bd14:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    bd18:	b4 0c                	mov    $0xc,%ah
    bd1a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    bd1e:	d9 6d e4             	fldcw  -0x1c(%ebp)
    bd21:	db 5d e0             	fistpl -0x20(%ebp)
    bd24:	d9 6d e6             	fldcw  -0x1a(%ebp)
    bd27:	8b 45 e0             	mov    -0x20(%ebp),%eax
    bd2a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    bd2d:	db 45 e0             	fildl  -0x20(%ebp)
    bd30:	dd 1c da             	fstpl  (%edx,%ebx,8)
    bd33:	eb 45                	jmp    bd7a <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    bd35:	89 f0                	mov    %esi,%eax
    bd37:	c1 e0 08             	shl    $0x8,%eax
    bd3a:	89 c2                	mov    %eax,%edx
    bd3c:	8b 45 08             	mov    0x8(%ebp),%eax
    bd3f:	01 c2                	add    %eax,%edx
    bd41:	89 f0                	mov    %esi,%eax
    bd43:	c1 e0 08             	shl    $0x8,%eax
    bd46:	89 c1                	mov    %eax,%ecx
    bd48:	8b 45 08             	mov    0x8(%ebp),%eax
    bd4b:	01 c8                	add    %ecx,%eax
    bd4d:	dd 04 d8             	fldl   (%eax,%ebx,8)
    bd50:	dd 05 f0 ef 00 00    	fldl   0xeff0
    bd56:	de e9                	fsubrp %st,%st(1)
    bd58:	d9 7d e6             	fnstcw -0x1a(%ebp)
    bd5b:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    bd5f:	b4 0c                	mov    $0xc,%ah
    bd61:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    bd65:	d9 6d e4             	fldcw  -0x1c(%ebp)
    bd68:	db 5d e0             	fistpl -0x20(%ebp)
    bd6b:	d9 6d e6             	fldcw  -0x1a(%ebp)
    bd6e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    bd71:	89 45 e0             	mov    %eax,-0x20(%ebp)
    bd74:	db 45 e0             	fildl  -0x20(%ebp)
    bd77:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    bd7a:	89 f0                	mov    %esi,%eax
    bd7c:	c1 e0 08             	shl    $0x8,%eax
    bd7f:	89 c2                	mov    %eax,%edx
    bd81:	8b 45 08             	mov    0x8(%ebp),%eax
    bd84:	01 d0                	add    %edx,%eax
    bd86:	89 f2                	mov    %esi,%edx
    bd88:	89 d1                	mov    %edx,%ecx
    bd8a:	c1 e1 08             	shl    $0x8,%ecx
    bd8d:	8b 55 08             	mov    0x8(%ebp),%edx
    bd90:	01 ca                	add    %ecx,%edx
    bd92:	dd 04 da             	fldl   (%edx,%ebx,8)
    bd95:	dd 05 38 f0 00 00    	fldl   0xf038
    bd9b:	de c9                	fmulp  %st,%st(1)
    bd9d:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    bda0:	83 c3 01             	add    $0x1,%ebx
    bda3:	83 fb 1f             	cmp    $0x1f,%ebx
    bda6:	0f 8e f1 fe ff ff    	jle    bc9d <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    bdac:	83 c6 01             	add    $0x1,%esi
    bdaf:	83 fe 3f             	cmp    $0x3f,%esi
    bdb2:	0f 8e db fe ff ff    	jle    bc93 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    bdb8:	83 c4 1c             	add    $0x1c,%esp
    bdbb:	5b                   	pop    %ebx
    bdbc:	5e                   	pop    %esi
    bdbd:	5f                   	pop    %edi
    bdbe:	5d                   	pop    %ebp
    bdbf:	c3                   	ret    

0000bdc0 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    bdc0:	55                   	push   %ebp
    bdc1:	89 e5                	mov    %esp,%ebp
    bdc3:	57                   	push   %edi
    bdc4:	56                   	push   %esi
    bdc5:	53                   	push   %ebx
    bdc6:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    bdcc:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    bdd2:	bb a0 df 00 00       	mov    $0xdfa0,%ebx
    bdd7:	b8 00 04 00 00       	mov    $0x400,%eax
    bddc:	89 d7                	mov    %edx,%edi
    bdde:	89 de                	mov    %ebx,%esi
    bde0:	89 c1                	mov    %eax,%ecx
    bde2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    bde4:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    bdea:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    bded:	81 c4 14 10 00 00    	add    $0x1014,%esp
    bdf3:	5b                   	pop    %ebx
    bdf4:	5e                   	pop    %esi
    bdf5:	5f                   	pop    %edi
    bdf6:	5d                   	pop    %ebp
    bdf7:	c3                   	ret    

0000bdf8 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    bdf8:	55                   	push   %ebp
    bdf9:	89 e5                	mov    %esp,%ebp
    bdfb:	57                   	push   %edi
    bdfc:	56                   	push   %esi
    bdfd:	53                   	push   %ebx
    bdfe:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    be01:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    be08:	a1 a8 0e 01 00       	mov    0x10ea8,%eax
    be0d:	85 c0                	test   %eax,%eax
    be0f:	74 6f                	je     be80 <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    be11:	c7 44 24 04 a0 ef 00 	movl   $0xefa0,0x4(%esp)
    be18:	00 
    be19:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    be20:	e8 15 a8 ff ff       	call   663a <mem_alloc>
    be25:	a3 c0 3c 01 00       	mov    %eax,0x13cc0
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    be2a:	c7 44 24 04 a3 ef 00 	movl   $0xefa3,0x4(%esp)
    be31:	00 
    be32:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    be39:	e8 fc a7 ff ff       	call   663a <mem_alloc>
    be3e:	a3 c4 3c 01 00       	mov    %eax,0x13cc4
		create_syn_filter(*filter);
    be43:	a1 c4 3c 01 00       	mov    0x13cc4,%eax
    be48:	89 04 24             	mov    %eax,(%esp)
    be4b:	e8 30 fe ff ff       	call   bc80 <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    be50:	c7 44 24 04 a6 ef 00 	movl   $0xefa6,0x4(%esp)
    be57:	00 
    be58:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    be5f:	e8 d6 a7 ff ff       	call   663a <mem_alloc>
    be64:	a3 c8 3c 01 00       	mov    %eax,0x13cc8
		read_syn_window(window);
    be69:	a1 c8 3c 01 00       	mov    0x13cc8,%eax
    be6e:	89 04 24             	mov    %eax,(%esp)
    be71:	e8 4a ff ff ff       	call   bdc0 <read_syn_window>
		init = 0;
    be76:	c7 05 a8 0e 01 00 00 	movl   $0x0,0x10ea8
    be7d:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    be80:	8b 45 0c             	mov    0xc(%ebp),%eax
    be83:	8b 04 85 ac 0e 01 00 	mov    0x10eac(,%eax,4),%eax
    be8a:	83 e8 40             	sub    $0x40,%eax
    be8d:	25 ff 03 00 00       	and    $0x3ff,%eax
    be92:	89 c2                	mov    %eax,%edx
    be94:	8b 45 0c             	mov    0xc(%ebp),%eax
    be97:	89 14 85 ac 0e 01 00 	mov    %edx,0x10eac(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    be9e:	8b 15 c0 3c 01 00    	mov    0x13cc0,%edx
    bea4:	8b 45 0c             	mov    0xc(%ebp),%eax
    bea7:	8b 04 85 ac 0e 01 00 	mov    0x10eac(,%eax,4),%eax
    beae:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    beb1:	c1 e1 0a             	shl    $0xa,%ecx
    beb4:	01 c8                	add    %ecx,%eax
    beb6:	c1 e0 03             	shl    $0x3,%eax
    beb9:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    bebc:	bb 00 00 00 00       	mov    $0x0,%ebx
    bec1:	eb 40                	jmp    bf03 <SubBandSynthesis+0x10b>
		sum = 0;
    bec3:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    bec5:	be 00 00 00 00       	mov    $0x0,%esi
    beca:	eb 26                	jmp    bef2 <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    becc:	89 f0                	mov    %esi,%eax
    bece:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bed5:	8b 45 08             	mov    0x8(%ebp),%eax
    bed8:	01 d0                	add    %edx,%eax
    beda:	dd 00                	fldl   (%eax)
    bedc:	a1 c4 3c 01 00       	mov    0x13cc4,%eax
    bee1:	89 da                	mov    %ebx,%edx
    bee3:	c1 e2 05             	shl    $0x5,%edx
    bee6:	01 f2                	add    %esi,%edx
    bee8:	dd 04 d0             	fldl   (%eax,%edx,8)
    beeb:	de c9                	fmulp  %st,%st(1)
    beed:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    beef:	83 c6 01             	add    $0x1,%esi
    bef2:	83 fe 1f             	cmp    $0x1f,%esi
    bef5:	7e d5                	jle    becc <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    bef7:	89 d8                	mov    %ebx,%eax
    bef9:	c1 e0 03             	shl    $0x3,%eax
    befc:	01 f8                	add    %edi,%eax
    befe:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    bf00:	83 c3 01             	add    $0x1,%ebx
    bf03:	83 fb 3f             	cmp    $0x3f,%ebx
    bf06:	7e bb                	jle    bec3 <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    bf08:	bf 00 00 00 00       	mov    $0x0,%edi
    bf0d:	e9 c7 00 00 00       	jmp    bfd9 <SubBandSynthesis+0x1e1>
		sum = 0;
    bf12:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    bf14:	bb 00 00 00 00       	mov    $0x0,%ebx
    bf19:	eb 4c                	jmp    bf67 <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    bf1b:	89 d8                	mov    %ebx,%eax
    bf1d:	c1 e0 05             	shl    $0x5,%eax
    bf20:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    bf23:	a1 c8 3c 01 00       	mov    0x13cc8,%eax
    bf28:	89 f2                	mov    %esi,%edx
    bf2a:	c1 e2 03             	shl    $0x3,%edx
    bf2d:	01 d0                	add    %edx,%eax
    bf2f:	dd 00                	fldl   (%eax)
    bf31:	a1 c0 3c 01 00       	mov    0x13cc0,%eax
    bf36:	8d 53 01             	lea    0x1(%ebx),%edx
    bf39:	d1 fa                	sar    %edx
    bf3b:	c1 e2 06             	shl    $0x6,%edx
    bf3e:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    bf41:	8b 55 0c             	mov    0xc(%ebp),%edx
    bf44:	8b 14 95 ac 0e 01 00 	mov    0x10eac(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    bf4b:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    bf4d:	89 d1                	mov    %edx,%ecx
    bf4f:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    bf55:	8b 55 0c             	mov    0xc(%ebp),%edx
    bf58:	c1 e2 0a             	shl    $0xa,%edx
    bf5b:	01 ca                	add    %ecx,%edx
    bf5d:	dd 04 d0             	fldl   (%eax,%edx,8)
    bf60:	de c9                	fmulp  %st,%st(1)
    bf62:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    bf64:	83 c3 01             	add    $0x1,%ebx
    bf67:	83 fb 0f             	cmp    $0xf,%ebx
    bf6a:	7e af                	jle    bf1b <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    bf6c:	dd 05 40 f0 00 00    	fldl   0xf040
    bf72:	de c9                	fmulp  %st,%st(1)
    bf74:	d9 7d d6             	fnstcw -0x2a(%ebp)
    bf77:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    bf7b:	b4 0c                	mov    $0xc,%ah
    bf7d:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    bf81:	d9 6d d4             	fldcw  -0x2c(%ebp)
    bf84:	db 5d e0             	fistpl -0x20(%ebp)
    bf87:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    bf8a:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    bf91:	7e 15                	jle    bfa8 <SubBandSynthesis+0x1b0>
    bf93:	89 f8                	mov    %edi,%eax
    bf95:	8d 14 00             	lea    (%eax,%eax,1),%edx
    bf98:	8b 45 10             	mov    0x10(%ebp),%eax
    bf9b:	01 d0                	add    %edx,%eax
    bf9d:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    bfa2:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    bfa6:	eb 2e                	jmp    bfd6 <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    bfa8:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    bfaf:	7d 15                	jge    bfc6 <SubBandSynthesis+0x1ce>
    bfb1:	89 f8                	mov    %edi,%eax
    bfb3:	8d 14 00             	lea    (%eax,%eax,1),%edx
    bfb6:	8b 45 10             	mov    0x10(%ebp),%eax
    bfb9:	01 d0                	add    %edx,%eax
    bfbb:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    bfc0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    bfc4:	eb 10                	jmp    bfd6 <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    bfc6:	89 f8                	mov    %edi,%eax
    bfc8:	8d 14 00             	lea    (%eax,%eax,1),%edx
    bfcb:	8b 45 10             	mov    0x10(%ebp),%eax
    bfce:	01 c2                	add    %eax,%edx
    bfd0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    bfd3:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    bfd6:	83 c7 01             	add    $0x1,%edi
    bfd9:	83 ff 1f             	cmp    $0x1f,%edi
    bfdc:	0f 8e 30 ff ff ff    	jle    bf12 <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    bfe2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    bfe5:	83 c4 2c             	add    $0x2c,%esp
    bfe8:	5b                   	pop    %ebx
    bfe9:	5e                   	pop    %esi
    bfea:	5f                   	pop    %edi
    bfeb:	5d                   	pop    %ebp
    bfec:	c3                   	ret    

0000bfed <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    bfed:	55                   	push   %ebp
    bfee:	89 e5                	mov    %esp,%ebp
    bff0:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    bff3:	8b 45 10             	mov    0x10(%ebp),%eax
    bff6:	8b 40 08             	mov    0x8(%eax),%eax
    bff9:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    bffc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    c003:	eb 75                	jmp    c07a <out_fifo+0x8d>
    c005:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    c00c:	eb 62                	jmp    c070 <out_fifo+0x83>
            (*psampFrames)++;
    c00e:	8b 45 14             	mov    0x14(%ebp),%eax
    c011:	8b 00                	mov    (%eax),%eax
    c013:	8d 50 01             	lea    0x1(%eax),%edx
    c016:	8b 45 14             	mov    0x14(%ebp),%eax
    c019:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    c01b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    c022:	eb 40                	jmp    c064 <out_fifo+0x77>
                if (!(k%1600) && k) {
    c024:	8b 0d cc 3c 01 00    	mov    0x13ccc,%ecx
    c02a:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    c02f:	89 c8                	mov    %ecx,%eax
    c031:	f7 ea                	imul   %edx
    c033:	c1 fa 09             	sar    $0x9,%edx
    c036:	89 c8                	mov    %ecx,%eax
    c038:	c1 f8 1f             	sar    $0x1f,%eax
    c03b:	29 c2                	sub    %eax,%edx
    c03d:	89 d0                	mov    %edx,%eax
    c03f:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    c045:	29 c1                	sub    %eax,%ecx
    c047:	89 c8                	mov    %ecx,%eax
    c049:	85 c0                	test   %eax,%eax
    c04b:	75 13                	jne    c060 <out_fifo+0x73>
    c04d:	a1 cc 3c 01 00       	mov    0x13ccc,%eax
    c052:	85 c0                	test   %eax,%eax
    c054:	74 0a                	je     c060 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    c056:	c7 05 cc 3c 01 00 00 	movl   $0x0,0x13ccc
    c05d:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    c060:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    c064:	8b 45 f4             	mov    -0xc(%ebp),%eax
    c067:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    c06a:	7c b8                	jl     c024 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    c06c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    c070:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    c074:	7e 98                	jle    c00e <out_fifo+0x21>
    c076:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    c07a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    c07d:	3b 45 0c             	cmp    0xc(%ebp),%eax
    c080:	7c 83                	jl     c005 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    c082:	c9                   	leave  
    c083:	c3                   	ret    

0000c084 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    c084:	55                   	push   %ebp
    c085:	89 e5                	mov    %esp,%ebp
    c087:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    c08a:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    c091:	00 
    c092:	8b 45 08             	mov    0x8(%ebp),%eax
    c095:	89 04 24             	mov    %eax,(%esp)
    c098:	e8 8b a8 ff ff       	call   6928 <getbits>
    c09d:	8b 55 0c             	mov    0xc(%ebp),%edx
    c0a0:	89 02                	mov    %eax,(%edx)
}
    c0a2:	c9                   	leave  
    c0a3:	c3                   	ret    

0000c0a4 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    c0a4:	55                   	push   %ebp
    c0a5:	89 e5                	mov    %esp,%ebp
    c0a7:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    c0aa:	8b 45 08             	mov    0x8(%ebp),%eax
    c0ad:	8b 40 0c             	mov    0xc(%eax),%eax
    c0b0:	83 c0 1e             	add    $0x1e,%eax
    c0b3:	8b 14 85 00 0a 01 00 	mov    0x10a00(,%eax,4),%edx
    c0ba:	89 d0                	mov    %edx,%eax
    c0bc:	c1 e0 03             	shl    $0x3,%eax
    c0bf:	01 d0                	add    %edx,%eax
    c0c1:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    c0c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    c0c7:	db 45 ec             	fildl  -0x14(%ebp)
    c0ca:	8b 45 08             	mov    0x8(%ebp),%eax
    c0cd:	8b 40 10             	mov    0x10(%eax),%eax
    c0d0:	dd 04 c5 c0 0a 01 00 	fldl   0x10ac0(,%eax,8)
    c0d7:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    c0d9:	d9 7d ea             	fnstcw -0x16(%ebp)
    c0dc:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    c0e0:	b4 0c                	mov    $0xc,%ah
    c0e2:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    c0e6:	d9 6d e8             	fldcw  -0x18(%ebp)
    c0e9:	db 5d fc             	fistpl -0x4(%ebp)
    c0ec:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    c0ef:	8b 45 08             	mov    0x8(%ebp),%eax
    c0f2:	8b 40 14             	mov    0x14(%eax),%eax
    c0f5:	85 c0                	test   %eax,%eax
    c0f7:	74 04                	je     c0fd <main_data_slots+0x59>
    c0f9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    c0fd:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    c101:	8b 45 08             	mov    0x8(%ebp),%eax
    c104:	8b 40 08             	mov    0x8(%eax),%eax
    c107:	85 c0                	test   %eax,%eax
    c109:	74 04                	je     c10f <main_data_slots+0x6b>
		nSlots -= 2;
    c10b:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    c10f:	8b 45 10             	mov    0x10(%ebp),%eax
    c112:	83 f8 01             	cmp    $0x1,%eax
    c115:	75 06                	jne    c11d <main_data_slots+0x79>
		nSlots -= 17;
    c117:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    c11b:	eb 04                	jmp    c121 <main_data_slots+0x7d>
	else
		nSlots -=32;
    c11d:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    c121:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    c124:	c9                   	leave  
    c125:	c3                   	ret    
