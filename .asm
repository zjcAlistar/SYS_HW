
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
      7c:	05 0c 3f 01 00       	add    $0x13f0c,%eax
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
      8e:	c7 05 20 3f 01 00 00 	movl   $0x0,0x13f20
      95:	00 00 00 
}
      98:	c9                   	leave  
      99:	c3                   	ret    

0000009a <draw_searchbox>:

void draw_searchbox() {
      9a:	55                   	push   %ebp
      9b:	89 e5                	mov    %esp,%ebp
      9d:	83 ec 18             	sub    $0x18,%esp
	createClickable(&cm, initRect(10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
      a0:	8d 45 e8             	lea    -0x18(%ebp),%eax
      a3:	83 ec 0c             	sub    $0xc,%esp
      a6:	6a 20                	push   $0x20
      a8:	6a 64                	push   $0x64
      aa:	6a 23                	push   $0x23
      ac:	68 a4 01 00 00       	push   $0x1a4
      b1:	50                   	push   %eax
      b2:	e8 1c 47 00 00       	call   47d3 <initRect>
      b7:	83 c4 1c             	add    $0x1c,%esp
      ba:	83 ec 04             	sub    $0x4,%esp
      bd:	68 97 13 00 00       	push   $0x1397
      c2:	6a 02                	push   $0x2
      c4:	ff 75 f4             	pushl  -0xc(%ebp)
      c7:	ff 75 f0             	pushl  -0x10(%ebp)
      ca:	ff 75 ec             	pushl  -0x14(%ebp)
      cd:	ff 75 e8             	pushl  -0x18(%ebp)
      d0:	68 40 40 01 00       	push   $0x14040
      d5:	e8 db 47 00 00       	call   48b5 <createClickable>
      da:	83 c4 20             	add    $0x20,%esp
				- (BUTTON_HEIGHT + 3), 100, BUTTON_HEIGHT), MSG_LPRESS, h_searchbox);
	if (isSearching == 0) {
      dd:	a1 c0 35 01 00       	mov    0x135c0,%eax
      e2:	85 c0                	test   %eax,%eax
      e4:	75 2c                	jne    112 <draw_searchbox+0x78>
		fill_rect(context, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
      e6:	68 ff ff 00 00       	push   $0xffff
      eb:	6a 20                	push   $0x20
      ed:	6a 64                	push   $0x64
      ef:	6a 23                	push   $0x23
      f1:	68 a4 01 00 00       	push   $0x1a4
      f6:	ff 35 08 3f 01 00    	pushl  0x13f08
      fc:	ff 35 04 3f 01 00    	pushl  0x13f04
     102:	ff 35 00 3f 01 00    	pushl  0x13f00
     108:	e8 7b 35 00 00       	call   3688 <fill_rect>
     10d:	83 c4 20             	add    $0x20,%esp
     110:	eb 2a                	jmp    13c <draw_searchbox+0xa2>
				- (BUTTON_HEIGHT + 3), 100, BUTTON_HEIGHT, 0xFFFF);
	}
	else {
		fill_rect(context, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     112:	68 cc cc 00 00       	push   $0xcccc
     117:	6a 20                	push   $0x20
     119:	6a 64                	push   $0x64
     11b:	6a 23                	push   $0x23
     11d:	68 a4 01 00 00       	push   $0x1a4
     122:	ff 35 08 3f 01 00    	pushl  0x13f08
     128:	ff 35 04 3f 01 00    	pushl  0x13f04
     12e:	ff 35 00 3f 01 00    	pushl  0x13f00
     134:	e8 4f 35 00 00       	call   3688 <fill_rect>
     139:	83 c4 20             	add    $0x20,%esp
				- (BUTTON_HEIGHT + 3), 100, BUTTON_HEIGHT, 0xCCCC);
	}
}
     13c:	c9                   	leave  
     13d:	c3                   	ret    

0000013e <fileSortByName>:

void fileSortByName() {
     13e:	55                   	push   %ebp
     13f:	89 e5                	mov    %esp,%ebp
     141:	53                   	push   %ebx
     142:	83 ec 34             	sub    $0x34,%esp
	updateFileList(context);
     145:	83 ec 04             	sub    $0x4,%esp
     148:	ff 35 08 3f 01 00    	pushl  0x13f08
     14e:	ff 35 04 3f 01 00    	pushl  0x13f04
     154:	ff 35 00 3f 01 00    	pushl  0x13f00
     15a:	e8 90 0a 00 00       	call   bef <updateFileList>
     15f:	83 c4 10             	add    $0x10,%esp
	struct fileItem *head;
	head = fileItemList;
     162:	a1 50 07 01 00       	mov    0x10750,%eax
     167:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int tempItemCounter = 0;
     16a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    struct fileItem *first; 
    struct fileItem *t;  
    struct fileItem *p; 
    struct fileItem *q; 
  
    first = head->next; 
     171:	8b 45 f4             	mov    -0xc(%ebp),%eax
     174:	8b 40 2c             	mov    0x2c(%eax),%eax
     177:	89 45 ec             	mov    %eax,-0x14(%ebp)
    head->next = 0; 
     17a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     17d:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  
    while (first != 0) 
     184:	e9 ba 00 00 00       	jmp    243 <fileSortByName+0x105>
    {
    	tempItemCounter++; 
     189:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
        if (flag_fileSort == 0) {
     18d:	a1 48 07 01 00       	mov    0x10748,%eax
     192:	85 c0                	test   %eax,%eax
     194:	75 42                	jne    1d8 <fileSortByName+0x9a>
	        for (t = first, q = head; ((q != 0) && (strcmp(q->name, t->name) < 0)); p = q, q = q->next)
     196:	8b 45 ec             	mov    -0x14(%ebp),%eax
     199:	89 45 e8             	mov    %eax,-0x18(%ebp)
     19c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     19f:	89 45 e0             	mov    %eax,-0x20(%ebp)
     1a2:	eb 0f                	jmp    1b3 <fileSortByName+0x75>
     1a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1a7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     1aa:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1ad:	8b 40 2c             	mov    0x2c(%eax),%eax
     1b0:	89 45 e0             	mov    %eax,-0x20(%ebp)
     1b3:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     1b7:	74 5f                	je     218 <fileSortByName+0xda>
     1b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     1bc:	8b 50 14             	mov    0x14(%eax),%edx
     1bf:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1c2:	8b 40 14             	mov    0x14(%eax),%eax
     1c5:	83 ec 08             	sub    $0x8,%esp
     1c8:	52                   	push   %edx
     1c9:	50                   	push   %eax
     1ca:	e8 ed 4b 00 00       	call   4dbc <strcmp>
     1cf:	83 c4 10             	add    $0x10,%esp
     1d2:	85 c0                	test   %eax,%eax
     1d4:	78 ce                	js     1a4 <fileSortByName+0x66>
     1d6:	eb 40                	jmp    218 <fileSortByName+0xda>
	        {

	        } 
        }
        else{
	        for (t = first, q = head; ((q != 0) && (strcmp(q->name, t->name) > 0)); p = q, q = q->next)
     1d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
     1db:	89 45 e8             	mov    %eax,-0x18(%ebp)
     1de:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1e1:	89 45 e0             	mov    %eax,-0x20(%ebp)
     1e4:	eb 0f                	jmp    1f5 <fileSortByName+0xb7>
     1e6:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     1ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1ef:	8b 40 2c             	mov    0x2c(%eax),%eax
     1f2:	89 45 e0             	mov    %eax,-0x20(%ebp)
     1f5:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     1f9:	74 1d                	je     218 <fileSortByName+0xda>
     1fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
     1fe:	8b 50 14             	mov    0x14(%eax),%edx
     201:	8b 45 e0             	mov    -0x20(%ebp),%eax
     204:	8b 40 14             	mov    0x14(%eax),%eax
     207:	83 ec 08             	sub    $0x8,%esp
     20a:	52                   	push   %edx
     20b:	50                   	push   %eax
     20c:	e8 ab 4b 00 00       	call   4dbc <strcmp>
     211:	83 c4 10             	add    $0x10,%esp
     214:	85 c0                	test   %eax,%eax
     216:	7f ce                	jg     1e6 <fileSortByName+0xa8>
	        {

	        }
        }
       
        first = first->next;  
     218:	8b 45 ec             	mov    -0x14(%ebp),%eax
     21b:	8b 40 2c             	mov    0x2c(%eax),%eax
     21e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    
        if (q == head)   
     221:	8b 45 e0             	mov    -0x20(%ebp),%eax
     224:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     227:	75 08                	jne    231 <fileSortByName+0xf3>
        {  
            head = t;  
     229:	8b 45 e8             	mov    -0x18(%ebp),%eax
     22c:	89 45 f4             	mov    %eax,-0xc(%ebp)
     22f:	eb 09                	jmp    23a <fileSortByName+0xfc>
        }  
        else   
        {  
            p->next = t;  
     231:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     234:	8b 55 e8             	mov    -0x18(%ebp),%edx
     237:	89 50 2c             	mov    %edx,0x2c(%eax)
        }  
        t->next = q; 
     23a:	8b 45 e8             	mov    -0x18(%ebp),%eax
     23d:	8b 55 e0             	mov    -0x20(%ebp),%edx
     240:	89 50 2c             	mov    %edx,0x2c(%eax)
    struct fileItem *q; 
  
    first = head->next; 
    head->next = 0; 
  
    while (first != 0) 
     243:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     247:	0f 85 3c ff ff ff    	jne    189 <fileSortByName+0x4b>
            p->next = t;  
        }  
        t->next = q; 
    }  

    if (flag_fileSort)
     24d:	a1 48 07 01 00       	mov    0x10748,%eax
     252:	85 c0                	test   %eax,%eax
     254:	74 0c                	je     262 <fileSortByName+0x124>
    	flag_fileSort = 0;
     256:	c7 05 48 07 01 00 00 	movl   $0x0,0x10748
     25d:	00 00 00 
     260:	eb 0a                	jmp    26c <fileSortByName+0x12e>
    else
    	flag_fileSort = 1;
     262:	c7 05 48 07 01 00 01 	movl   $0x1,0x10748
     269:	00 00 00 
    p = head;
     26c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     26f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	while(p != 0) {
     272:	eb 4f                	jmp    2c3 <fileSortByName+0x185>
		p->pos = getPos(context, tempItemCounter--);
     274:	8b 45 f0             	mov    -0x10(%ebp),%eax
     277:	8d 50 ff             	lea    -0x1(%eax),%edx
     27a:	89 55 f0             	mov    %edx,-0x10(%ebp)
     27d:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
     280:	8d 55 c8             	lea    -0x38(%ebp),%edx
     283:	83 ec 0c             	sub    $0xc,%esp
     286:	50                   	push   %eax
     287:	ff 35 08 3f 01 00    	pushl  0x13f08
     28d:	ff 35 04 3f 01 00    	pushl  0x13f04
     293:	ff 35 00 3f 01 00    	pushl  0x13f00
     299:	52                   	push   %edx
     29a:	e8 4b 0d 00 00       	call   fea <getPos>
     29f:	83 c4 1c             	add    $0x1c,%esp
     2a2:	8b 45 c8             	mov    -0x38(%ebp),%eax
     2a5:	89 43 18             	mov    %eax,0x18(%ebx)
     2a8:	8b 45 cc             	mov    -0x34(%ebp),%eax
     2ab:	89 43 1c             	mov    %eax,0x1c(%ebx)
     2ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
     2b1:	89 43 20             	mov    %eax,0x20(%ebx)
     2b4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     2b7:	89 43 24             	mov    %eax,0x24(%ebx)
		p = p->next;
     2ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     2bd:	8b 40 2c             	mov    0x2c(%eax),%eax
     2c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if (flag_fileSort)
    	flag_fileSort = 0;
    else
    	flag_fileSort = 1;
    p = head;
	while(p != 0) {
     2c3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     2c7:	75 ab                	jne    274 <fileSortByName+0x136>
		p->pos = getPos(context, tempItemCounter--);
		p = p->next;
	}

    fileItemList = head;
     2c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     2cc:	a3 50 07 01 00       	mov    %eax,0x10750
}
     2d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2d4:	c9                   	leave  
     2d5:	c3                   	ret    

000002d6 <addFileItem>:

// 文件项列表相关操作
void addFileItem(struct stat st, char *name, Rect pos) {
     2d6:	55                   	push   %ebp
     2d7:	89 e5                	mov    %esp,%ebp
     2d9:	53                   	push   %ebx
     2da:	83 ec 24             	sub    $0x24,%esp
	//int i;
	struct fileItem *temp = (struct fileItem *) malloc(sizeof(struct fileItem));
     2dd:	83 ec 0c             	sub    $0xc,%esp
     2e0:	6a 30                	push   $0x30
     2e2:	e8 83 51 00 00       	call   546a <malloc>
     2e7:	83 c4 10             	add    $0x10,%esp
     2ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
     2ed:	83 ec 0c             	sub    $0xc,%esp
     2f0:	6a 20                	push   $0x20
     2f2:	e8 73 51 00 00       	call   546a <malloc>
     2f7:	83 c4 10             	add    $0x10,%esp
     2fa:	89 c2                	mov    %eax,%edx
     2fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     2ff:	89 50 14             	mov    %edx,0x14(%eax)
	strcpy(temp->name, name);
     302:	8b 45 f4             	mov    -0xc(%ebp),%eax
     305:	8b 40 14             	mov    0x14(%eax),%eax
     308:	83 ec 08             	sub    $0x8,%esp
     30b:	ff 75 1c             	pushl  0x1c(%ebp)
     30e:	50                   	push   %eax
     30f:	e8 78 4a 00 00       	call   4d8c <strcpy>
     314:	83 c4 10             	add    $0x10,%esp
//    for (i = 0; name[i] != 0; i++)
//    	{
//    		printf(0, "%d : %c\n", i, name[i]);
//    	}
	//printf(0, "copying name\n");
	temp->st = st;
     317:	8b 45 f4             	mov    -0xc(%ebp),%eax
     31a:	8b 55 08             	mov    0x8(%ebp),%edx
     31d:	89 10                	mov    %edx,(%eax)
     31f:	8b 55 0c             	mov    0xc(%ebp),%edx
     322:	89 50 04             	mov    %edx,0x4(%eax)
     325:	8b 55 10             	mov    0x10(%ebp),%edx
     328:	89 50 08             	mov    %edx,0x8(%eax)
     32b:	8b 55 14             	mov    0x14(%ebp),%edx
     32e:	89 50 0c             	mov    %edx,0xc(%eax)
     331:	8b 55 18             	mov    0x18(%ebp),%edx
     334:	89 50 10             	mov    %edx,0x10(%eax)
	temp->pos = getPos(context, itemCounter);
     337:	8b 15 54 07 01 00    	mov    0x10754,%edx
     33d:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     340:	8d 45 d8             	lea    -0x28(%ebp),%eax
     343:	83 ec 0c             	sub    $0xc,%esp
     346:	52                   	push   %edx
     347:	ff 35 08 3f 01 00    	pushl  0x13f08
     34d:	ff 35 04 3f 01 00    	pushl  0x13f04
     353:	ff 35 00 3f 01 00    	pushl  0x13f00
     359:	50                   	push   %eax
     35a:	e8 8b 0c 00 00       	call   fea <getPos>
     35f:	83 c4 1c             	add    $0x1c,%esp
     362:	8b 45 d8             	mov    -0x28(%ebp),%eax
     365:	89 43 18             	mov    %eax,0x18(%ebx)
     368:	8b 45 dc             	mov    -0x24(%ebp),%eax
     36b:	89 43 1c             	mov    %eax,0x1c(%ebx)
     36e:	8b 45 e0             	mov    -0x20(%ebp),%eax
     371:	89 43 20             	mov    %eax,0x20(%ebx)
     374:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     377:	89 43 24             	mov    %eax,0x24(%ebx)
	temp->next = fileItemList;
     37a:	8b 15 50 07 01 00    	mov    0x10750,%edx
     380:	8b 45 f4             	mov    -0xc(%ebp),%eax
     383:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
     386:	8b 45 f4             	mov    -0xc(%ebp),%eax
     389:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
     390:	8b 45 f4             	mov    -0xc(%ebp),%eax
     393:	a3 50 07 01 00       	mov    %eax,0x10750
}
     398:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     39b:	c9                   	leave  
     39c:	c3                   	ret    

0000039d <freeFileItemList>:

void freeFileItemList() {
     39d:	55                   	push   %ebp
     39e:	89 e5                	mov    %esp,%ebp
     3a0:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
     3a3:	a1 50 07 01 00       	mov    0x10750,%eax
     3a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     3ab:	eb 2f                	jmp    3dc <freeFileItemList+0x3f>
		temp = p;
     3ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
     3b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3b6:	8b 40 2c             	mov    0x2c(%eax),%eax
     3b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
		free(temp->name);
     3bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
     3bf:	8b 40 14             	mov    0x14(%eax),%eax
     3c2:	83 ec 0c             	sub    $0xc,%esp
     3c5:	50                   	push   %eax
     3c6:	e8 5e 4f 00 00       	call   5329 <free>
     3cb:	83 c4 10             	add    $0x10,%esp
		free(temp);
     3ce:	83 ec 0c             	sub    $0xc,%esp
     3d1:	ff 75 f0             	pushl  -0x10(%ebp)
     3d4:	e8 50 4f 00 00       	call   5329 <free>
     3d9:	83 c4 10             	add    $0x10,%esp
}

void freeFileItemList() {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     3dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     3e0:	75 cb                	jne    3ad <freeFileItemList+0x10>
		temp = p;
		p = p->next;
		free(temp->name);
		free(temp);
	}
	fileItemList = 0;
     3e2:	c7 05 50 07 01 00 00 	movl   $0x0,0x10750
     3e9:	00 00 00 
}
     3ec:	c9                   	leave  
     3ed:	c3                   	ret    

000003ee <fmtname>:

// 文件信息相关操作
char* fmtname(char *path) {
     3ee:	55                   	push   %ebp
     3ef:	89 e5                	mov    %esp,%ebp
     3f1:	83 ec 18             	sub    $0x18,%esp
	//static char buf[DIRSIZ+1];
	char *p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
     3f4:	83 ec 0c             	sub    $0xc,%esp
     3f7:	ff 75 08             	pushl  0x8(%ebp)
     3fa:	e8 fc 49 00 00       	call   4dfb <strlen>
     3ff:	83 c4 10             	add    $0x10,%esp
     402:	89 c2                	mov    %eax,%edx
     404:	8b 45 08             	mov    0x8(%ebp),%eax
     407:	01 d0                	add    %edx,%eax
     409:	89 45 f4             	mov    %eax,-0xc(%ebp)
     40c:	eb 04                	jmp    412 <fmtname+0x24>
     40e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     412:	8b 45 f4             	mov    -0xc(%ebp),%eax
     415:	3b 45 08             	cmp    0x8(%ebp),%eax
     418:	72 0a                	jb     424 <fmtname+0x36>
     41a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     41d:	0f b6 00             	movzbl (%eax),%eax
     420:	3c 2f                	cmp    $0x2f,%al
     422:	75 ea                	jne    40e <fmtname+0x20>
		;
	p++;
     424:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

	return p;
     428:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     42b:	c9                   	leave  
     42c:	c3                   	ret    

0000042d <isListable>:

int isListable(char *name, short type) {
     42d:	55                   	push   %ebp
     42e:	89 e5                	mov    %esp,%ebp
     430:	83 ec 14             	sub    $0x14,%esp
     433:	8b 45 0c             	mov    0xc(%ebp),%eax
     436:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	char *p = name;
     43a:	8b 45 08             	mov    0x8(%ebp),%eax
     43d:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (*p == '.') return 0;
     440:	8b 45 fc             	mov    -0x4(%ebp),%eax
     443:	0f b6 00             	movzbl (%eax),%eax
     446:	3c 2e                	cmp    $0x2e,%al
     448:	75 07                	jne    451 <isListable+0x24>
     44a:	b8 00 00 00 00       	mov    $0x0,%eax
     44f:	eb 34                	jmp    485 <isListable+0x58>
	if (type == T_DIR) return 1;
     451:	66 83 7d ec 01       	cmpw   $0x1,-0x14(%ebp)
     456:	75 07                	jne    45f <isListable+0x32>
     458:	b8 01 00 00 00       	mov    $0x1,%eax
     45d:	eb 26                	jmp    485 <isListable+0x58>
	while (*p != 0) {
     45f:	eb 15                	jmp    476 <isListable+0x49>
		if (*p == '.')
     461:	8b 45 fc             	mov    -0x4(%ebp),%eax
     464:	0f b6 00             	movzbl (%eax),%eax
     467:	3c 2e                	cmp    $0x2e,%al
     469:	75 07                	jne    472 <isListable+0x45>
			return 1;
     46b:	b8 01 00 00 00       	mov    $0x1,%eax
     470:	eb 13                	jmp    485 <isListable+0x58>
		p++;
     472:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)

int isListable(char *name, short type) {
	char *p = name;
	if (*p == '.') return 0;
	if (type == T_DIR) return 1;
	while (*p != 0) {
     476:	8b 45 fc             	mov    -0x4(%ebp),%eax
     479:	0f b6 00             	movzbl (%eax),%eax
     47c:	84 c0                	test   %al,%al
     47e:	75 e1                	jne    461 <isListable+0x34>
		if (*p == '.')
			return 1;
		p++;
	}
	return 0;
     480:	b8 00 00 00 00       	mov    $0x0,%eax
}
     485:	c9                   	leave  
     486:	c3                   	ret    

00000487 <list>:

void list(char *path) {
     487:	55                   	push   %ebp
     488:	89 e5                	mov    %esp,%ebp
     48a:	57                   	push   %edi
     48b:	56                   	push   %esi
     48c:	53                   	push   %ebx
     48d:	81 ec 4c 02 00 00    	sub    $0x24c,%esp
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;

	itemCounter = 0;
     493:	c7 05 54 07 01 00 00 	movl   $0x0,0x10754
     49a:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     49d:	83 ec 08             	sub    $0x8,%esp
     4a0:	6a 00                	push   $0x0
     4a2:	ff 75 08             	pushl  0x8(%ebp)
     4a5:	e8 52 4b 00 00       	call   4ffc <open>
     4aa:	83 c4 10             	add    $0x10,%esp
     4ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     4b0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     4b4:	79 1a                	jns    4d0 <list+0x49>
		printf(2, "ls: cannot open %s\n", path);
     4b6:	83 ec 04             	sub    $0x4,%esp
     4b9:	ff 75 08             	pushl  0x8(%ebp)
     4bc:	68 80 b8 00 00       	push   $0xb880
     4c1:	6a 02                	push   $0x2
     4c3:	e8 d1 4c 00 00       	call   5199 <printf>
     4c8:	83 c4 10             	add    $0x10,%esp
		return;
     4cb:	e9 52 02 00 00       	jmp    722 <list+0x29b>
	}

	if (fstat(fd, &st) < 0) {
     4d0:	83 ec 08             	sub    $0x8,%esp
     4d3:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     4d9:	50                   	push   %eax
     4da:	ff 75 e4             	pushl  -0x1c(%ebp)
     4dd:	e8 32 4b 00 00       	call   5014 <fstat>
     4e2:	83 c4 10             	add    $0x10,%esp
     4e5:	85 c0                	test   %eax,%eax
     4e7:	79 28                	jns    511 <list+0x8a>
		printf(2, "ls: cannot stat %s\n", path);
     4e9:	83 ec 04             	sub    $0x4,%esp
     4ec:	ff 75 08             	pushl  0x8(%ebp)
     4ef:	68 94 b8 00 00       	push   $0xb894
     4f4:	6a 02                	push   $0x2
     4f6:	e8 9e 4c 00 00       	call   5199 <printf>
     4fb:	83 c4 10             	add    $0x10,%esp
		close(fd);
     4fe:	83 ec 0c             	sub    $0xc,%esp
     501:	ff 75 e4             	pushl  -0x1c(%ebp)
     504:	e8 db 4a 00 00       	call   4fe4 <close>
     509:	83 c4 10             	add    $0x10,%esp
		return;
     50c:	e9 11 02 00 00       	jmp    722 <list+0x29b>
	}

	switch (st.type) {
     511:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     518:	98                   	cwtl   
     519:	83 f8 01             	cmp    $0x1,%eax
     51c:	74 48                	je     566 <list+0xdf>
     51e:	83 f8 02             	cmp    $0x2,%eax
     521:	0f 85 ed 01 00 00    	jne    714 <list+0x28d>
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     527:	8b bd bc fd ff ff    	mov    -0x244(%ebp),%edi
     52d:	8b b5 b4 fd ff ff    	mov    -0x24c(%ebp),%esi
     533:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     53a:	0f bf d8             	movswl %ax,%ebx
     53d:	83 ec 0c             	sub    $0xc,%esp
     540:	ff 75 08             	pushl  0x8(%ebp)
     543:	e8 a6 fe ff ff       	call   3ee <fmtname>
     548:	83 c4 10             	add    $0x10,%esp
     54b:	83 ec 08             	sub    $0x8,%esp
     54e:	57                   	push   %edi
     54f:	56                   	push   %esi
     550:	53                   	push   %ebx
     551:	50                   	push   %eax
     552:	68 a8 b8 00 00       	push   $0xb8a8
     557:	6a 01                	push   $0x1
     559:	e8 3b 4c 00 00       	call   5199 <printf>
     55e:	83 c4 20             	add    $0x20,%esp
		break;
     561:	e9 ae 01 00 00       	jmp    714 <list+0x28d>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     566:	83 ec 0c             	sub    $0xc,%esp
     569:	ff 75 08             	pushl  0x8(%ebp)
     56c:	e8 8a 48 00 00       	call   4dfb <strlen>
     571:	83 c4 10             	add    $0x10,%esp
     574:	83 c0 10             	add    $0x10,%eax
     577:	3d 00 02 00 00       	cmp    $0x200,%eax
     57c:	76 17                	jbe    595 <list+0x10e>
			printf(1, "ls: path too long\n");
     57e:	83 ec 08             	sub    $0x8,%esp
     581:	68 b5 b8 00 00       	push   $0xb8b5
     586:	6a 01                	push   $0x1
     588:	e8 0c 4c 00 00       	call   5199 <printf>
     58d:	83 c4 10             	add    $0x10,%esp
			break;
     590:	e9 7f 01 00 00       	jmp    714 <list+0x28d>
		}
		strcpy(buf, path);
     595:	83 ec 08             	sub    $0x8,%esp
     598:	ff 75 08             	pushl  0x8(%ebp)
     59b:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     5a1:	50                   	push   %eax
     5a2:	e8 e5 47 00 00       	call   4d8c <strcpy>
     5a7:	83 c4 10             	add    $0x10,%esp
		p = buf + strlen(buf);
     5aa:	83 ec 0c             	sub    $0xc,%esp
     5ad:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     5b3:	50                   	push   %eax
     5b4:	e8 42 48 00 00       	call   4dfb <strlen>
     5b9:	83 c4 10             	add    $0x10,%esp
     5bc:	89 c2                	mov    %eax,%edx
     5be:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     5c4:	01 d0                	add    %edx,%eax
     5c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
		*p++ = '/';
     5c9:	8b 45 e0             	mov    -0x20(%ebp),%eax
     5cc:	8d 50 01             	lea    0x1(%eax),%edx
     5cf:	89 55 e0             	mov    %edx,-0x20(%ebp)
     5d2:	c6 00 2f             	movb   $0x2f,(%eax)
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     5d5:	e9 19 01 00 00       	jmp    6f3 <list+0x26c>
			if (de.inum == 0)
     5da:	0f b7 85 c0 fd ff ff 	movzwl -0x240(%ebp),%eax
     5e1:	66 85 c0             	test   %ax,%ax
     5e4:	75 05                	jne    5eb <list+0x164>
				continue;
     5e6:	e9 08 01 00 00       	jmp    6f3 <list+0x26c>
			memmove(p, de.name, DIRSIZ);
     5eb:	83 ec 04             	sub    $0x4,%esp
     5ee:	6a 0e                	push   $0xe
     5f0:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     5f6:	83 c0 02             	add    $0x2,%eax
     5f9:	50                   	push   %eax
     5fa:	ff 75 e0             	pushl  -0x20(%ebp)
     5fd:	e8 75 49 00 00       	call   4f77 <memmove>
     602:	83 c4 10             	add    $0x10,%esp
			p[DIRSIZ] = 0;
     605:	8b 45 e0             	mov    -0x20(%ebp),%eax
     608:	83 c0 0e             	add    $0xe,%eax
     60b:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     60e:	83 ec 08             	sub    $0x8,%esp
     611:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     617:	50                   	push   %eax
     618:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     61e:	50                   	push   %eax
     61f:	e8 b9 48 00 00       	call   4edd <stat>
     624:	83 c4 10             	add    $0x10,%esp
     627:	85 c0                	test   %eax,%eax
     629:	79 1e                	jns    649 <list+0x1c2>
				printf(1, "ls: cannot stat %s\n", buf);
     62b:	83 ec 04             	sub    $0x4,%esp
     62e:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     634:	50                   	push   %eax
     635:	68 94 b8 00 00       	push   $0xb894
     63a:	6a 01                	push   $0x1
     63c:	e8 58 4b 00 00       	call   5199 <printf>
     641:	83 c4 10             	add    $0x10,%esp
				continue;
     644:	e9 aa 00 00 00       	jmp    6f3 <list+0x26c>
			}
			if (isListable(fmtname(buf), st.type)) {
     649:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     650:	0f bf d8             	movswl %ax,%ebx
     653:	83 ec 0c             	sub    $0xc,%esp
     656:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     65c:	50                   	push   %eax
     65d:	e8 8c fd ff ff       	call   3ee <fmtname>
     662:	83 c4 10             	add    $0x10,%esp
     665:	83 ec 08             	sub    $0x8,%esp
     668:	53                   	push   %ebx
     669:	50                   	push   %eax
     66a:	e8 be fd ff ff       	call   42d <isListable>
     66f:	83 c4 10             	add    $0x10,%esp
     672:	85 c0                	test   %eax,%eax
     674:	74 7d                	je     6f3 <list+0x26c>
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
     676:	8b 15 54 07 01 00    	mov    0x10754,%edx
     67c:	8d 45 d0             	lea    -0x30(%ebp),%eax
     67f:	83 ec 0c             	sub    $0xc,%esp
     682:	52                   	push   %edx
     683:	ff 35 08 3f 01 00    	pushl  0x13f08
     689:	ff 35 04 3f 01 00    	pushl  0x13f04
     68f:	ff 35 00 3f 01 00    	pushl  0x13f00
     695:	50                   	push   %eax
     696:	e8 4f 09 00 00       	call   fea <getPos>
     69b:	83 c4 1c             	add    $0x1c,%esp
     69e:	83 ec 0c             	sub    $0xc,%esp
     6a1:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     6a7:	50                   	push   %eax
     6a8:	e8 41 fd ff ff       	call   3ee <fmtname>
     6ad:	83 c4 10             	add    $0x10,%esp
     6b0:	83 ec 08             	sub    $0x8,%esp
     6b3:	ff 75 dc             	pushl  -0x24(%ebp)
     6b6:	ff 75 d8             	pushl  -0x28(%ebp)
     6b9:	ff 75 d4             	pushl  -0x2c(%ebp)
     6bc:	ff 75 d0             	pushl  -0x30(%ebp)
     6bf:	50                   	push   %eax
     6c0:	ff b5 bc fd ff ff    	pushl  -0x244(%ebp)
     6c6:	ff b5 b8 fd ff ff    	pushl  -0x248(%ebp)
     6cc:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
     6d2:	ff b5 b0 fd ff ff    	pushl  -0x250(%ebp)
     6d8:	ff b5 ac fd ff ff    	pushl  -0x254(%ebp)
     6de:	e8 f3 fb ff ff       	call   2d6 <addFileItem>
     6e3:	83 c4 30             	add    $0x30,%esp
				itemCounter++;
     6e6:	a1 54 07 01 00       	mov    0x10754,%eax
     6eb:	83 c0 01             	add    $0x1,%eax
     6ee:	a3 54 07 01 00       	mov    %eax,0x10754
			break;
		}
		strcpy(buf, path);
		p = buf + strlen(buf);
		*p++ = '/';
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     6f3:	83 ec 04             	sub    $0x4,%esp
     6f6:	6a 10                	push   $0x10
     6f8:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     6fe:	50                   	push   %eax
     6ff:	ff 75 e4             	pushl  -0x1c(%ebp)
     702:	e8 cd 48 00 00       	call   4fd4 <read>
     707:	83 c4 10             	add    $0x10,%esp
     70a:	83 f8 10             	cmp    $0x10,%eax
     70d:	0f 84 c7 fe ff ff    	je     5da <list+0x153>
			if (isListable(fmtname(buf), st.type)) {
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
				itemCounter++;
			}
		}
		break;
     713:	90                   	nop
	}
	close(fd);
     714:	83 ec 0c             	sub    $0xc,%esp
     717:	ff 75 e4             	pushl  -0x1c(%ebp)
     71a:	e8 c5 48 00 00       	call   4fe4 <close>
     71f:	83 c4 10             	add    $0x10,%esp
}
     722:	8d 65 f4             	lea    -0xc(%ebp),%esp
     725:	5b                   	pop    %ebx
     726:	5e                   	pop    %esi
     727:	5f                   	pop    %edi
     728:	5d                   	pop    %ebp
     729:	c3                   	ret    

0000072a <drawItem>:
#define FILE_ICON_BIG 0
#define FILE_ICON_SMALL 1
#define FOLDER_ICON_BIG 2
#define FOLDER_ICON_SMALL 3

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
     72a:	55                   	push   %ebp
     72b:	89 e5                	mov    %esp,%ebp
     72d:	53                   	push   %ebx
     72e:	83 ec 14             	sub    $0x14,%esp
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0) 
     731:	83 7d 3c 00          	cmpl   $0x0,0x3c(%ebp)
     735:	75 08                	jne    73f <drawItem+0x15>
		nameColor = 0x0;
     737:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     73d:	eb 69                	jmp    7a8 <drawItem+0x7e>
	else if (chosen == 1)
     73f:	83 7d 3c 01          	cmpl   $0x1,0x3c(%ebp)
     743:	75 34                	jne    779 <drawItem+0x4f>
	{
		nameColor = 0xFFFF;
     745:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     74b:	8b 45 38             	mov    0x38(%ebp),%eax
     74e:	89 c3                	mov    %eax,%ebx
     750:	8b 45 34             	mov    0x34(%ebp),%eax
     753:	89 c1                	mov    %eax,%ecx
     755:	8b 45 30             	mov    0x30(%ebp),%eax
     758:	89 c2                	mov    %eax,%edx
     75a:	8b 45 2c             	mov    0x2c(%ebp),%eax
     75d:	68 10 21 00 00       	push   $0x2110
     762:	53                   	push   %ebx
     763:	51                   	push   %ecx
     764:	52                   	push   %edx
     765:	50                   	push   %eax
     766:	ff 75 10             	pushl  0x10(%ebp)
     769:	ff 75 0c             	pushl  0xc(%ebp)
     76c:	ff 75 08             	pushl  0x8(%ebp)
     76f:	e8 14 2f 00 00       	call   3688 <fill_rect>
     774:	83 c4 20             	add    $0x20,%esp
     777:	eb 2f                	jmp    7a8 <drawItem+0x7e>
	} else
	{
		nameColor = 0xFFFF;
     779:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
     77f:	8b 45 38             	mov    0x38(%ebp),%eax
     782:	89 c3                	mov    %eax,%ebx
     784:	8b 45 34             	mov    0x34(%ebp),%eax
     787:	89 c1                	mov    %eax,%ecx
     789:	8b 45 30             	mov    0x30(%ebp),%eax
     78c:	89 c2                	mov    %eax,%edx
     78e:	8b 45 2c             	mov    0x2c(%ebp),%eax
     791:	6a 00                	push   $0x0
     793:	53                   	push   %ebx
     794:	51                   	push   %ecx
     795:	52                   	push   %edx
     796:	50                   	push   %eax
     797:	ff 75 10             	pushl  0x10(%ebp)
     79a:	ff 75 0c             	pushl  0xc(%ebp)
     79d:	ff 75 08             	pushl  0x8(%ebp)
     7a0:	e8 e3 2e 00 00       	call   3688 <fill_rect>
     7a5:	83 c4 20             	add    $0x20,%esp
	}
	if (style == ICON_STYLE) {
     7a8:	a1 04 fd 00 00       	mov    0xfd04,%eax
     7ad:	83 f8 01             	cmp    $0x1,%eax
     7b0:	0f 85 d2 00 00 00    	jne    888 <drawItem+0x15e>
		switch (st.type) {
     7b6:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     7ba:	98                   	cwtl   
     7bb:	83 f8 01             	cmp    $0x1,%eax
     7be:	74 38                	je     7f8 <drawItem+0xce>
     7c0:	83 f8 02             	cmp    $0x2,%eax
     7c3:	75 65                	jne    82a <drawItem+0x100>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     7c5:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     7c8:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     7cb:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     7ce:	83 c0 19             	add    $0x19,%eax
     7d1:	52                   	push   %edx
     7d2:	50                   	push   %eax
     7d3:	ff 35 70 fd 00 00    	pushl  0xfd70
     7d9:	ff 35 6c fd 00 00    	pushl  0xfd6c
     7df:	ff 35 68 fd 00 00    	pushl  0xfd68
     7e5:	ff 75 10             	pushl  0x10(%ebp)
     7e8:	ff 75 0c             	pushl  0xc(%ebp)
     7eb:	ff 75 08             	pushl  0x8(%ebp)
     7ee:	e8 9f 34 00 00       	call   3c92 <draw_picture>
     7f3:	83 c4 20             	add    $0x20,%esp
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     7f6:	eb 32                	jmp    82a <drawItem+0x100>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     7f8:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     7fb:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     7fe:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     801:	83 c0 19             	add    $0x19,%eax
     804:	52                   	push   %edx
     805:	50                   	push   %eax
     806:	ff 35 d8 fd 00 00    	pushl  0xfdd8
     80c:	ff 35 d4 fd 00 00    	pushl  0xfdd4
     812:	ff 35 d0 fd 00 00    	pushl  0xfdd0
     818:	ff 75 10             	pushl  0x10(%ebp)
     81b:	ff 75 0c             	pushl  0xc(%ebp)
     81e:	ff 75 08             	pushl  0x8(%ebp)
     821:	e8 6c 34 00 00       	call   3c92 <draw_picture>
     826:	83 c4 20             	add    $0x20,%esp
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     829:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     82a:	83 ec 0c             	sub    $0xc,%esp
     82d:	ff 75 14             	pushl  0x14(%ebp)
     830:	e8 c6 45 00 00       	call   4dfb <strlen>
     835:	83 c4 10             	add    $0x10,%esp
     838:	89 c2                	mov    %eax,%edx
     83a:	b8 00 00 00 00       	mov    $0x0,%eax
     83f:	29 d0                	sub    %edx,%eax
     841:	c1 e0 02             	shl    $0x2,%eax
     844:	83 c0 30             	add    $0x30,%eax
     847:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     84a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     84e:	79 07                	jns    857 <drawItem+0x12d>
			indent = 0;
     850:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     857:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     85a:	8d 48 46             	lea    0x46(%eax),%ecx
     85d:	8b 55 2c             	mov    0x2c(%ebp),%edx
     860:	8b 45 f0             	mov    -0x10(%ebp),%eax
     863:	01 c2                	add    %eax,%edx
     865:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     869:	83 ec 04             	sub    $0x4,%esp
     86c:	51                   	push   %ecx
     86d:	52                   	push   %edx
     86e:	50                   	push   %eax
     86f:	ff 75 14             	pushl  0x14(%ebp)
     872:	ff 75 10             	pushl  0x10(%ebp)
     875:	ff 75 0c             	pushl  0xc(%ebp)
     878:	ff 75 08             	pushl  0x8(%ebp)
     87b:	e8 63 33 00 00       	call   3be3 <puts_str>
     880:	83 c4 20             	add    $0x20,%esp
     883:	e9 e1 00 00 00       	jmp    969 <drawItem+0x23f>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     888:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     88c:	98                   	cwtl   
     88d:	83 f8 01             	cmp    $0x1,%eax
     890:	74 7b                	je     90d <drawItem+0x1e3>
     892:	83 f8 02             	cmp    $0x2,%eax
     895:	0f 85 a4 00 00 00    	jne    93f <drawItem+0x215>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     89b:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     89e:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     8a1:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     8a4:	83 c0 08             	add    $0x8,%eax
     8a7:	52                   	push   %edx
     8a8:	50                   	push   %eax
     8a9:	ff 35 a4 fd 00 00    	pushl  0xfda4
     8af:	ff 35 a0 fd 00 00    	pushl  0xfda0
     8b5:	ff 35 9c fd 00 00    	pushl  0xfd9c
     8bb:	ff 75 10             	pushl  0x10(%ebp)
     8be:	ff 75 0c             	pushl  0xc(%ebp)
     8c1:	ff 75 08             	pushl  0x8(%ebp)
     8c4:	e8 c9 33 00 00       	call   3c92 <draw_picture>
     8c9:	83 c4 20             	add    $0x20,%esp
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     8cc:	8b 45 28             	mov    0x28(%ebp),%eax
     8cf:	83 ec 0c             	sub    $0xc,%esp
     8d2:	50                   	push   %eax
     8d3:	e8 96 00 00 00       	call   96e <sizeFormat>
     8d8:	83 c4 10             	add    $0x10,%esp
     8db:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     8de:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     8e1:	8d 48 03             	lea    0x3(%eax),%ecx
     8e4:	8b 45 2c             	mov    0x2c(%ebp),%eax
     8e7:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     8ed:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     8f1:	83 ec 04             	sub    $0x4,%esp
     8f4:	51                   	push   %ecx
     8f5:	52                   	push   %edx
     8f6:	50                   	push   %eax
     8f7:	ff 75 ec             	pushl  -0x14(%ebp)
     8fa:	ff 75 10             	pushl  0x10(%ebp)
     8fd:	ff 75 0c             	pushl  0xc(%ebp)
     900:	ff 75 08             	pushl  0x8(%ebp)
     903:	e8 db 32 00 00       	call   3be3 <puts_str>
     908:	83 c4 20             	add    $0x20,%esp
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     90b:	eb 32                	jmp    93f <drawItem+0x215>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     90d:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     910:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     913:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     916:	83 c0 08             	add    $0x8,%eax
     919:	52                   	push   %edx
     91a:	50                   	push   %eax
     91b:	ff 35 0c fe 00 00    	pushl  0xfe0c
     921:	ff 35 08 fe 00 00    	pushl  0xfe08
     927:	ff 35 04 fe 00 00    	pushl  0xfe04
     92d:	ff 75 10             	pushl  0x10(%ebp)
     930:	ff 75 0c             	pushl  0xc(%ebp)
     933:	ff 75 08             	pushl  0x8(%ebp)
     936:	e8 57 33 00 00       	call   3c92 <draw_picture>
     93b:	83 c4 20             	add    $0x20,%esp
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     93e:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     93f:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     942:	8d 48 03             	lea    0x3(%eax),%ecx
     945:	8b 45 2c             	mov    0x2c(%ebp),%eax
     948:	8d 50 28             	lea    0x28(%eax),%edx
     94b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     94f:	83 ec 04             	sub    $0x4,%esp
     952:	51                   	push   %ecx
     953:	52                   	push   %edx
     954:	50                   	push   %eax
     955:	ff 75 14             	pushl  0x14(%ebp)
     958:	ff 75 10             	pushl  0x10(%ebp)
     95b:	ff 75 0c             	pushl  0xc(%ebp)
     95e:	ff 75 08             	pushl  0x8(%ebp)
     961:	e8 7d 32 00 00       	call   3be3 <puts_str>
     966:	83 c4 20             	add    $0x20,%esp
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     969:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     96c:	c9                   	leave  
     96d:	c3                   	ret    

0000096e <sizeFormat>:

char *sizeFormat(uint size){
     96e:	55                   	push   %ebp
     96f:	89 e5                	mov    %esp,%ebp
     971:	53                   	push   %ebx
     972:	83 ec 14             	sub    $0x14,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     975:	83 ec 0c             	sub    $0xc,%esp
     978:	6a 0c                	push   $0xc
     97a:	e8 eb 4a 00 00       	call   546a <malloc>
     97f:	83 c4 10             	add    $0x10,%esp
     982:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     985:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400) 
     98c:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     993:	0f 86 8b 00 00 00    	jbe    a24 <sizeFormat+0xb6>
	{
		size = size / (0x400);
     999:	8b 45 08             	mov    0x8(%ebp),%eax
     99c:	c1 e8 0a             	shr    $0xa,%eax
     99f:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     9a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9a5:	8d 50 01             	lea    0x1(%eax),%edx
     9a8:	89 55 f4             	mov    %edx,-0xc(%ebp)
     9ab:	89 c2                	mov    %eax,%edx
     9ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9b0:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     9b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
     9b6:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     9bb:	89 c8                	mov    %ecx,%eax
     9bd:	f7 e2                	mul    %edx
     9bf:	c1 ea 03             	shr    $0x3,%edx
     9c2:	89 d0                	mov    %edx,%eax
     9c4:	c1 e0 02             	shl    $0x2,%eax
     9c7:	01 d0                	add    %edx,%eax
     9c9:	01 c0                	add    %eax,%eax
     9cb:	29 c1                	sub    %eax,%ecx
     9cd:	89 ca                	mov    %ecx,%edx
     9cf:	89 d0                	mov    %edx,%eax
     9d1:	83 c0 30             	add    $0x30,%eax
     9d4:	88 03                	mov    %al,(%ebx)
			size /= 10;
     9d6:	8b 45 08             	mov    0x8(%ebp),%eax
     9d9:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     9de:	f7 e2                	mul    %edx
     9e0:	89 d0                	mov    %edx,%eax
     9e2:	c1 e8 03             	shr    $0x3,%eax
     9e5:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     9e8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     9ec:	75 b4                	jne    9a2 <sizeFormat+0x34>
		result[n++] = 'K';
     9ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9f1:	8d 50 01             	lea    0x1(%eax),%edx
     9f4:	89 55 f4             	mov    %edx,-0xc(%ebp)
     9f7:	89 c2                	mov    %eax,%edx
     9f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9fc:	01 d0                	add    %edx,%eax
     9fe:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     a01:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a04:	8d 50 01             	lea    0x1(%eax),%edx
     a07:	89 55 f4             	mov    %edx,-0xc(%ebp)
     a0a:	89 c2                	mov    %eax,%edx
     a0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a0f:	01 d0                	add    %edx,%eax
     a11:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     a14:	8b 55 f4             	mov    -0xc(%ebp),%edx
     a17:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a1a:	01 d0                	add    %edx,%eax
     a1c:	c6 00 00             	movb   $0x0,(%eax)
     a1f:	e9 a3 00 00 00       	jmp    ac7 <sizeFormat+0x159>
	}
	else 
	{
		do{
			result[n++] = (size % 10) + '0';
     a24:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a27:	8d 50 01             	lea    0x1(%eax),%edx
     a2a:	89 55 f4             	mov    %edx,-0xc(%ebp)
     a2d:	89 c2                	mov    %eax,%edx
     a2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a32:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     a35:	8b 4d 08             	mov    0x8(%ebp),%ecx
     a38:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     a3d:	89 c8                	mov    %ecx,%eax
     a3f:	f7 e2                	mul    %edx
     a41:	c1 ea 03             	shr    $0x3,%edx
     a44:	89 d0                	mov    %edx,%eax
     a46:	c1 e0 02             	shl    $0x2,%eax
     a49:	01 d0                	add    %edx,%eax
     a4b:	01 c0                	add    %eax,%eax
     a4d:	29 c1                	sub    %eax,%ecx
     a4f:	89 ca                	mov    %ecx,%edx
     a51:	89 d0                	mov    %edx,%eax
     a53:	83 c0 30             	add    $0x30,%eax
     a56:	88 03                	mov    %al,(%ebx)
			size /= 10;
     a58:	8b 45 08             	mov    0x8(%ebp),%eax
     a5b:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     a60:	f7 e2                	mul    %edx
     a62:	89 d0                	mov    %edx,%eax
     a64:	c1 e8 03             	shr    $0x3,%eax
     a67:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     a6a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     a6e:	75 b4                	jne    a24 <sizeFormat+0xb6>
		result[n++] = 'b';
     a70:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a73:	8d 50 01             	lea    0x1(%eax),%edx
     a76:	89 55 f4             	mov    %edx,-0xc(%ebp)
     a79:	89 c2                	mov    %eax,%edx
     a7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a7e:	01 d0                	add    %edx,%eax
     a80:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a86:	8d 50 01             	lea    0x1(%eax),%edx
     a89:	89 55 f4             	mov    %edx,-0xc(%ebp)
     a8c:	89 c2                	mov    %eax,%edx
     a8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a91:	01 d0                	add    %edx,%eax
     a93:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     a96:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a99:	8d 50 01             	lea    0x1(%eax),%edx
     a9c:	89 55 f4             	mov    %edx,-0xc(%ebp)
     a9f:	89 c2                	mov    %eax,%edx
     aa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     aa4:	01 d0                	add    %edx,%eax
     aa6:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     aa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aac:	8d 50 01             	lea    0x1(%eax),%edx
     aaf:	89 55 f4             	mov    %edx,-0xc(%ebp)
     ab2:	89 c2                	mov    %eax,%edx
     ab4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ab7:	01 d0                	add    %edx,%eax
     ab9:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     abc:	8b 55 f4             	mov    -0xc(%ebp),%edx
     abf:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ac2:	01 d0                	add    %edx,%eax
     ac4:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     ac7:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     aca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     acd:	c9                   	leave  
     ace:	c3                   	ret    

00000acf <drawFinderWnd>:
		10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "rename.bmp",
		2 * BUTTON_WIDTH + 7, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }  };

void drawFinderWnd(Context context) {
     acf:	55                   	push   %ebp
     ad0:	89 e5                	mov    %esp,%ebp
     ad2:	83 ec 08             	sub    $0x8,%esp
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     ad5:	8b 45 0c             	mov    0xc(%ebp),%eax
     ad8:	83 e8 01             	sub    $0x1,%eax
     adb:	6a 00                	push   $0x0
     add:	6a 00                	push   $0x0
     adf:	50                   	push   %eax
     ae0:	6a 00                	push   $0x0
     ae2:	6a 00                	push   $0x0
     ae4:	ff 75 10             	pushl  0x10(%ebp)
     ae7:	ff 75 0c             	pushl  0xc(%ebp)
     aea:	ff 75 08             	pushl  0x8(%ebp)
     aed:	e8 5c 32 00 00       	call   3d4e <draw_line>
     af2:	83 c4 20             	add    $0x20,%esp
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     af5:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     af8:	8d 48 ff             	lea    -0x1(%eax),%ecx
     afb:	8b 45 0c             	mov    0xc(%ebp),%eax
     afe:	8d 50 ff             	lea    -0x1(%eax),%edx
     b01:	8b 45 0c             	mov    0xc(%ebp),%eax
     b04:	83 e8 01             	sub    $0x1,%eax
     b07:	6a 00                	push   $0x0
     b09:	51                   	push   %ecx
     b0a:	52                   	push   %edx
     b0b:	6a 00                	push   $0x0
     b0d:	50                   	push   %eax
     b0e:	ff 75 10             	pushl  0x10(%ebp)
     b11:	ff 75 0c             	pushl  0xc(%ebp)
     b14:	ff 75 08             	pushl  0x8(%ebp)
     b17:	e8 32 32 00 00       	call   3d4e <draw_line>
     b1c:	83 c4 20             	add    $0x20,%esp
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     b1f:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     b22:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     b25:	8b 45 0c             	mov    0xc(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     b28:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     b2b:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     b2e:	83 e8 01             	sub    $0x1,%eax
     b31:	6a 00                	push   $0x0
     b33:	51                   	push   %ecx
     b34:	52                   	push   %edx
     b35:	50                   	push   %eax
     b36:	6a 00                	push   $0x0
     b38:	ff 75 10             	pushl  0x10(%ebp)
     b3b:	ff 75 0c             	pushl  0xc(%ebp)
     b3e:	ff 75 08             	pushl  0x8(%ebp)
     b41:	e8 08 32 00 00       	call   3d4e <draw_line>
     b46:	83 c4 20             	add    $0x20,%esp
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     b49:	8b 45 10             	mov    0x10(%ebp),%eax
     b4c:	83 e8 01             	sub    $0x1,%eax
     b4f:	6a 00                	push   $0x0
     b51:	6a 00                	push   $0x0
     b53:	6a 00                	push   $0x0
     b55:	50                   	push   %eax
     b56:	6a 00                	push   $0x0
     b58:	ff 75 10             	pushl  0x10(%ebp)
     b5b:	ff 75 0c             	pushl  0xc(%ebp)
     b5e:	ff 75 08             	pushl  0x8(%ebp)
     b61:	e8 e8 31 00 00       	call   3d4e <draw_line>
     b66:	83 c4 20             	add    $0x20,%esp
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     b69:	8b 45 0c             	mov    0xc(%ebp),%eax
     b6c:	83 e8 02             	sub    $0x2,%eax
     b6f:	68 18 c6 00 00       	push   $0xc618
     b74:	6a 46                	push   $0x46
     b76:	50                   	push   %eax
     b77:	6a 01                	push   $0x1
     b79:	6a 01                	push   $0x1
     b7b:	ff 75 10             	pushl  0x10(%ebp)
     b7e:	ff 75 0c             	pushl  0xc(%ebp)
     b81:	ff 75 08             	pushl  0x8(%ebp)
     b84:	e8 ff 2a 00 00       	call   3688 <fill_rect>
     b89:	83 c4 20             	add    $0x20,%esp
			TOOLSBAR_COLOR);
	puts_str(context, currentPath, 0, 42, 3);
     b8c:	83 ec 04             	sub    $0x4,%esp
     b8f:	6a 03                	push   $0x3
     b91:	6a 2a                	push   $0x2a
     b93:	6a 00                	push   $0x0
     b95:	68 40 3f 01 00       	push   $0x13f40
     b9a:	ff 75 10             	pushl  0x10(%ebp)
     b9d:	ff 75 0c             	pushl  0xc(%ebp)
     ba0:	ff 75 08             	pushl  0x8(%ebp)
     ba3:	e8 3b 30 00 00       	call   3be3 <puts_str>
     ba8:	83 c4 20             	add    $0x20,%esp
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     bab:	83 ec 0c             	sub    $0xc,%esp
     bae:	6a 0f                	push   $0xf
     bb0:	68 40 fe 00 00       	push   $0xfe40
     bb5:	ff 75 10             	pushl  0x10(%ebp)
     bb8:	ff 75 0c             	pushl  0xc(%ebp)
     bbb:	ff 75 08             	pushl  0x8(%ebp)
     bbe:	e8 50 34 00 00       	call   4013 <draw_iconlist>
     bc3:	83 c4 20             	add    $0x20,%esp
	draw_searchbox();
     bc6:	e8 cf f4 ff ff       	call   9a <draw_searchbox>
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     bcb:	83 ec 04             	sub    $0x4,%esp
     bce:	6a 28                	push   $0x28
     bd0:	68 a4 01 00 00       	push   $0x1a4
     bd5:	6a 00                	push   $0x0
     bd7:	68 0c 3f 01 00       	push   $0x13f0c
     bdc:	ff 75 10             	pushl  0x10(%ebp)
     bdf:	ff 75 0c             	pushl  0xc(%ebp)
     be2:	ff 75 08             	pushl  0x8(%ebp)
     be5:	e8 f9 2f 00 00       	call   3be3 <puts_str>
     bea:	83 c4 20             	add    $0x20,%esp
				- (BUTTON_HEIGHT + 3) + 5);


}
     bed:	c9                   	leave  
     bee:	c3                   	ret    

00000bef <updateFileList>:

void updateFileList(Context context) {
     bef:	55                   	push   %ebp
     bf0:	89 e5                	mov    %esp,%ebp
     bf2:	53                   	push   %ebx
     bf3:	83 ec 24             	sub    $0x24,%esp
	struct fileItem *p, *q;
	int tempItemCounter = 0;
     bf6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	freeFileItemList();
     bfd:	e8 9b f7 ff ff       	call   39d <freeFileItemList>
	list(".");
     c02:	83 ec 0c             	sub    $0xc,%esp
     c05:	68 c8 b8 00 00       	push   $0xb8c8
     c0a:	e8 78 f8 ff ff       	call   487 <list>
     c0f:	83 c4 10             	add    $0x10,%esp
	if (keyContent.length <= 0)
     c12:	a1 20 3f 01 00       	mov    0x13f20,%eax
     c17:	85 c0                	test   %eax,%eax
     c19:	7f 05                	jg     c20 <updateFileList+0x31>
		return;
     c1b:	e9 1d 01 00 00       	jmp    d3d <updateFileList+0x14e>
	p = fileItemList;
     c20:	a1 50 07 01 00       	mov    0x10750,%eax
     c25:	89 45 f4             	mov    %eax,-0xc(%ebp)
	q = 0;
     c28:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	while(p != 0) {
     c2f:	e9 ac 00 00 00       	jmp    ce0 <updateFileList+0xf1>
		if(!strstr(p->name, keyContent.content)) {
     c34:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c37:	8b 40 14             	mov    0x14(%eax),%eax
     c3a:	83 ec 08             	sub    $0x8,%esp
     c3d:	68 0c 3f 01 00       	push   $0x13f0c
     c42:	50                   	push   %eax
     c43:	e8 b8 f3 ff ff       	call   0 <strstr>
     c48:	83 c4 10             	add    $0x10,%esp
     c4b:	85 c0                	test   %eax,%eax
     c4d:	75 7e                	jne    ccd <updateFileList+0xde>
			if(q == 0) {
     c4f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     c53:	75 37                	jne    c8c <updateFileList+0x9d>
				fileItemList = fileItemList->next;
     c55:	a1 50 07 01 00       	mov    0x10750,%eax
     c5a:	8b 40 2c             	mov    0x2c(%eax),%eax
     c5d:	a3 50 07 01 00       	mov    %eax,0x10750
				free(p->name);
     c62:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c65:	8b 40 14             	mov    0x14(%eax),%eax
     c68:	83 ec 0c             	sub    $0xc,%esp
     c6b:	50                   	push   %eax
     c6c:	e8 b8 46 00 00       	call   5329 <free>
     c71:	83 c4 10             	add    $0x10,%esp
				free(p);
     c74:	83 ec 0c             	sub    $0xc,%esp
     c77:	ff 75 f4             	pushl  -0xc(%ebp)
     c7a:	e8 aa 46 00 00       	call   5329 <free>
     c7f:	83 c4 10             	add    $0x10,%esp
				p = fileItemList;
     c82:	a1 50 07 01 00       	mov    0x10750,%eax
     c87:	89 45 f4             	mov    %eax,-0xc(%ebp)
     c8a:	eb 54                	jmp    ce0 <updateFileList+0xf1>
			}
			else {
				q->next = p->next;
     c8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c8f:	8b 50 2c             	mov    0x2c(%eax),%edx
     c92:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c95:	89 50 2c             	mov    %edx,0x2c(%eax)
				p->next = 0;
     c98:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c9b:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
				free(p->name);
     ca2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ca5:	8b 40 14             	mov    0x14(%eax),%eax
     ca8:	83 ec 0c             	sub    $0xc,%esp
     cab:	50                   	push   %eax
     cac:	e8 78 46 00 00       	call   5329 <free>
     cb1:	83 c4 10             	add    $0x10,%esp
				free(p);
     cb4:	83 ec 0c             	sub    $0xc,%esp
     cb7:	ff 75 f4             	pushl  -0xc(%ebp)
     cba:	e8 6a 46 00 00       	call   5329 <free>
     cbf:	83 c4 10             	add    $0x10,%esp
				p = q->next;
     cc2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cc5:	8b 40 2c             	mov    0x2c(%eax),%eax
     cc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
     ccb:	eb 13                	jmp    ce0 <updateFileList+0xf1>
			}
		}
		else {
			tempItemCounter++;
     ccd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
			q = p;
     cd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cd4:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p = p->next;
     cd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cda:	8b 40 2c             	mov    0x2c(%eax),%eax
     cdd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list(".");
	if (keyContent.length <= 0)
		return;
	p = fileItemList;
	q = 0;
	while(p != 0) {
     ce0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ce4:	0f 85 4a ff ff ff    	jne    c34 <updateFileList+0x45>
			tempItemCounter++;
			q = p;
			p = p->next;
		}
	}
	p = fileItemList;
     cea:	a1 50 07 01 00       	mov    0x10750,%eax
     cef:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0) {
     cf2:	eb 43                	jmp    d37 <updateFileList+0x148>
		p->pos = getPos(context, --tempItemCounter);
     cf4:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
     cf8:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     cfb:	8d 45 d8             	lea    -0x28(%ebp),%eax
     cfe:	83 ec 0c             	sub    $0xc,%esp
     d01:	ff 75 ec             	pushl  -0x14(%ebp)
     d04:	ff 75 10             	pushl  0x10(%ebp)
     d07:	ff 75 0c             	pushl  0xc(%ebp)
     d0a:	ff 75 08             	pushl  0x8(%ebp)
     d0d:	50                   	push   %eax
     d0e:	e8 d7 02 00 00       	call   fea <getPos>
     d13:	83 c4 1c             	add    $0x1c,%esp
     d16:	8b 45 d8             	mov    -0x28(%ebp),%eax
     d19:	89 43 18             	mov    %eax,0x18(%ebx)
     d1c:	8b 45 dc             	mov    -0x24(%ebp),%eax
     d1f:	89 43 1c             	mov    %eax,0x1c(%ebx)
     d22:	8b 45 e0             	mov    -0x20(%ebp),%eax
     d25:	89 43 20             	mov    %eax,0x20(%ebx)
     d28:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d2b:	89 43 24             	mov    %eax,0x24(%ebx)
		p = p->next;
     d2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d31:	8b 40 2c             	mov    0x2c(%eax),%eax
     d34:	89 45 f4             	mov    %eax,-0xc(%ebp)
			q = p;
			p = p->next;
		}
	}
	p = fileItemList;
	while(p != 0) {
     d37:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d3b:	75 b7                	jne    cf4 <updateFileList+0x105>
		p->pos = getPos(context, --tempItemCounter);
		p = p->next;
	}
}
     d3d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d40:	c9                   	leave  
     d41:	c3                   	ret    

00000d42 <drawFinderContent>:

void drawFinderContent(Context context) {
     d42:	55                   	push   %ebp
     d43:	89 e5                	mov    %esp,%ebp
     d45:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p;
	//int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     d48:	c7 45 f0 46 00 00 00 	movl   $0x46,-0x10(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     d4f:	a1 04 fd 00 00       	mov    0xfd04,%eax
     d54:	83 f8 02             	cmp    $0x2,%eax
     d57:	75 04                	jne    d5d <drawFinderContent+0x1b>
     d59:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     d5d:	8b 45 10             	mov    0x10(%ebp),%eax
     d60:	83 e8 48             	sub    $0x48,%eax
	//int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     d63:	89 c1                	mov    %eax,%ecx
     d65:	8b 45 0c             	mov    0xc(%ebp),%eax
     d68:	83 e8 02             	sub    $0x2,%eax
     d6b:	89 c2                	mov    %eax,%edx
     d6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d70:	68 ff ff 00 00       	push   $0xffff
     d75:	51                   	push   %ecx
     d76:	52                   	push   %edx
     d77:	50                   	push   %eax
     d78:	6a 01                	push   $0x1
     d7a:	ff 75 10             	pushl  0x10(%ebp)
     d7d:	ff 75 0c             	pushl  0xc(%ebp)
     d80:	ff 75 08             	pushl  0x8(%ebp)
     d83:	e8 00 29 00 00       	call   3688 <fill_rect>
     d88:	83 c4 20             	add    $0x20,%esp
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     d8b:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     d8e:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     d91:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     d94:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     d97:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     d9a:	83 e8 01             	sub    $0x1,%eax
     d9d:	6a 00                	push   $0x0
     d9f:	51                   	push   %ecx
     da0:	52                   	push   %edx
     da1:	50                   	push   %eax
     da2:	6a 00                	push   $0x0
     da4:	ff 75 10             	pushl  0x10(%ebp)
     da7:	ff 75 0c             	pushl  0xc(%ebp)
     daa:	ff 75 08             	pushl  0x8(%ebp)
     dad:	e8 9c 2f 00 00       	call   3d4e <draw_line>
     db2:	83 c4 20             	add    $0x20,%esp
//	q = 0;
	// if (keyContent.length == 0) {
	// 	printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
     db5:	a1 50 07 01 00       	mov    0x10750,%eax
     dba:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while (p != 0) {
     dbd:	eb 4b                	jmp    e0a <drawFinderContent+0xc8>
			//printf(0, "draw item\n");
			drawItem(context, p->name, p->st, p->pos, p->chosen);
     dbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dc2:	8b 40 28             	mov    0x28(%eax),%eax
     dc5:	8b 55 f4             	mov    -0xc(%ebp),%edx
     dc8:	8b 52 14             	mov    0x14(%edx),%edx
     dcb:	83 ec 08             	sub    $0x8,%esp
     dce:	50                   	push   %eax
     dcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dd2:	ff 70 24             	pushl  0x24(%eax)
     dd5:	ff 70 20             	pushl  0x20(%eax)
     dd8:	ff 70 1c             	pushl  0x1c(%eax)
     ddb:	ff 70 18             	pushl  0x18(%eax)
     dde:	8b 45 f4             	mov    -0xc(%ebp),%eax
     de1:	ff 70 10             	pushl  0x10(%eax)
     de4:	ff 70 0c             	pushl  0xc(%eax)
     de7:	ff 70 08             	pushl  0x8(%eax)
     dea:	ff 70 04             	pushl  0x4(%eax)
     ded:	ff 30                	pushl  (%eax)
     def:	52                   	push   %edx
     df0:	ff 75 10             	pushl  0x10(%ebp)
     df3:	ff 75 0c             	pushl  0xc(%ebp)
     df6:	ff 75 08             	pushl  0x8(%ebp)
     df9:	e8 2c f9 ff ff       	call   72a <drawItem>
     dfe:	83 c4 40             	add    $0x40,%esp
			p = p->next;
     e01:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e04:	8b 40 2c             	mov    0x2c(%eax),%eax
     e07:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// if (keyContent.length == 0) {
	// 	printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
		while (p != 0) {
     e0a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e0e:	75 af                	jne    dbf <drawFinderContent+0x7d>
	// 		p = p->next;
			
	// 	}
	// }

	if (style == LIST_STYLE)
     e10:	a1 04 fd 00 00       	mov    0xfd04,%eax
     e15:	83 f8 02             	cmp    $0x2,%eax
     e18:	0f 85 a8 00 00 00    	jne    ec6 <drawFinderContent+0x184>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
     e1e:	68 14 a5 00 00       	push   $0xa514
     e23:	6a 1c                	push   $0x1c
     e25:	6a 26                	push   $0x26
     e27:	6a 47                	push   $0x47
     e29:	6a 01                	push   $0x1
     e2b:	ff 75 10             	pushl  0x10(%ebp)
     e2e:	ff 75 0c             	pushl  0xc(%ebp)
     e31:	ff 75 08             	pushl  0x8(%ebp)
     e34:	e8 4f 28 00 00       	call   3688 <fill_rect>
     e39:	83 c4 20             	add    $0x20,%esp
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     e3c:	68 14 a5 00 00       	push   $0xa514
     e41:	6a 1c                	push   $0x1c
     e43:	68 9f 00 00 00       	push   $0x9f
     e48:	6a 47                	push   $0x47
     e4a:	6a 28                	push   $0x28
     e4c:	ff 75 10             	pushl  0x10(%ebp)
     e4f:	ff 75 0c             	pushl  0xc(%ebp)
     e52:	ff 75 08             	pushl  0x8(%ebp)
     e55:	e8 2e 28 00 00       	call   3688 <fill_rect>
     e5a:	83 c4 20             	add    $0x20,%esp
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     e5d:	8b 45 0c             	mov    0xc(%ebp),%eax
     e60:	2d c9 00 00 00       	sub    $0xc9,%eax
     e65:	68 14 a5 00 00       	push   $0xa514
     e6a:	6a 1c                	push   $0x1c
     e6c:	50                   	push   %eax
     e6d:	6a 47                	push   $0x47
     e6f:	68 c8 00 00 00       	push   $0xc8
     e74:	ff 75 10             	pushl  0x10(%ebp)
     e77:	ff 75 0c             	pushl  0xc(%ebp)
     e7a:	ff 75 08             	pushl  0x8(%ebp)
     e7d:	e8 06 28 00 00       	call   3688 <fill_rect>
     e82:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     e85:	83 ec 04             	sub    $0x4,%esp
     e88:	6a 50                	push   $0x50
     e8a:	6a 2b                	push   $0x2b
     e8c:	6a 00                	push   $0x0
     e8e:	68 ca b8 00 00       	push   $0xb8ca
     e93:	ff 75 10             	pushl  0x10(%ebp)
     e96:	ff 75 0c             	pushl  0xc(%ebp)
     e99:	ff 75 08             	pushl  0x8(%ebp)
     e9c:	e8 42 2d 00 00       	call   3be3 <puts_str>
     ea1:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     ea4:	83 ec 04             	sub    $0x4,%esp
     ea7:	6a 50                	push   $0x50
     ea9:	68 cb 00 00 00       	push   $0xcb
     eae:	6a 00                	push   $0x0
     eb0:	68 cf b8 00 00       	push   $0xb8cf
     eb5:	ff 75 10             	pushl  0x10(%ebp)
     eb8:	ff 75 0c             	pushl  0xc(%ebp)
     ebb:	ff 75 08             	pushl  0x8(%ebp)
     ebe:	e8 20 2d 00 00       	call   3be3 <puts_str>
     ec3:	83 c4 20             	add    $0x20,%esp
		}
}
     ec6:	c9                   	leave  
     ec7:	c3                   	ret    

00000ec8 <int2str>:

char * int2str(int i)
{
     ec8:	55                   	push   %ebp
     ec9:	89 e5                	mov    %esp,%ebp
     ecb:	53                   	push   %ebx
     ecc:	83 ec 14             	sub    $0x14,%esp
	int j;
	int n = 0;
     ecf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
     ed6:	83 ec 0c             	sub    $0xc,%esp
     ed9:	6a 04                	push   $0x4
     edb:	e8 8a 45 00 00       	call   546a <malloc>
     ee0:	83 c4 10             	add    $0x10,%esp
     ee3:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     ee6:	83 ec 0c             	sub    $0xc,%esp
     ee9:	6a 04                	push   $0x4
     eeb:	e8 7a 45 00 00       	call   546a <malloc>
     ef0:	83 c4 10             	add    $0x10,%esp
     ef3:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
     ef6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ef9:	8d 50 01             	lea    0x1(%eax),%edx
     efc:	89 55 f0             	mov    %edx,-0x10(%ebp)
     eff:	89 c2                	mov    %eax,%edx
     f01:	8b 45 ec             	mov    -0x14(%ebp),%eax
     f04:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     f07:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f0a:	ba 67 66 66 66       	mov    $0x66666667,%edx
     f0f:	89 c8                	mov    %ecx,%eax
     f11:	f7 ea                	imul   %edx
     f13:	c1 fa 02             	sar    $0x2,%edx
     f16:	89 c8                	mov    %ecx,%eax
     f18:	c1 f8 1f             	sar    $0x1f,%eax
     f1b:	29 c2                	sub    %eax,%edx
     f1d:	89 d0                	mov    %edx,%eax
     f1f:	c1 e0 02             	shl    $0x2,%eax
     f22:	01 d0                	add    %edx,%eax
     f24:	01 c0                	add    %eax,%eax
     f26:	29 c1                	sub    %eax,%ecx
     f28:	89 ca                	mov    %ecx,%edx
     f2a:	89 d0                	mov    %edx,%eax
     f2c:	83 c0 30             	add    $0x30,%eax
     f2f:	88 03                	mov    %al,(%ebx)
		i /= 10;
     f31:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f34:	ba 67 66 66 66       	mov    $0x66666667,%edx
     f39:	89 c8                	mov    %ecx,%eax
     f3b:	f7 ea                	imul   %edx
     f3d:	c1 fa 02             	sar    $0x2,%edx
     f40:	89 c8                	mov    %ecx,%eax
     f42:	c1 f8 1f             	sar    $0x1f,%eax
     f45:	29 c2                	sub    %eax,%edx
     f47:	89 d0                	mov    %edx,%eax
     f49:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
     f4c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     f50:	75 a4                	jne    ef6 <int2str+0x2e>
	result[n] = 0;
     f52:	8b 55 f0             	mov    -0x10(%ebp),%edx
     f55:	8b 45 ec             	mov    -0x14(%ebp),%eax
     f58:	01 d0                	add    %edx,%eax
     f5a:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
     f5d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     f64:	eb 21                	jmp    f87 <int2str+0xbf>
	{
		temp[j] = result[n-1-j];
     f66:	8b 55 f4             	mov    -0xc(%ebp),%edx
     f69:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f6c:	01 c2                	add    %eax,%edx
     f6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f71:	83 e8 01             	sub    $0x1,%eax
     f74:	2b 45 f4             	sub    -0xc(%ebp),%eax
     f77:	89 c1                	mov    %eax,%ecx
     f79:	8b 45 ec             	mov    -0x14(%ebp),%eax
     f7c:	01 c8                	add    %ecx,%eax
     f7e:	0f b6 00             	movzbl (%eax),%eax
     f81:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
     f83:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f87:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f8a:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     f8d:	7c d7                	jl     f66 <int2str+0x9e>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
     f8f:	8b 55 f0             	mov    -0x10(%ebp),%edx
     f92:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f95:	01 d0                	add    %edx,%eax
     f97:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
     f9a:	83 ec 0c             	sub    $0xc,%esp
     f9d:	ff 75 ec             	pushl  -0x14(%ebp)
     fa0:	e8 84 43 00 00       	call   5329 <free>
     fa5:	83 c4 10             	add    $0x10,%esp
	return temp;
     fa8:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
     fab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     fae:	c9                   	leave  
     faf:	c3                   	ret    

00000fb0 <printItemList>:

void printItemList() {
     fb0:	55                   	push   %ebp
     fb1:	89 e5                	mov    %esp,%ebp
     fb3:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p;
	p = fileItemList;
     fb6:	a1 50 07 01 00       	mov    0x10750,%eax
     fbb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     fbe:	eb 22                	jmp    fe2 <printItemList+0x32>
		printf(0, "%s\n", p->name);
     fc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fc3:	8b 40 14             	mov    0x14(%eax),%eax
     fc6:	83 ec 04             	sub    $0x4,%esp
     fc9:	50                   	push   %eax
     fca:	68 d4 b8 00 00       	push   $0xb8d4
     fcf:	6a 00                	push   $0x0
     fd1:	e8 c3 41 00 00       	call   5199 <printf>
     fd6:	83 c4 10             	add    $0x10,%esp
		p = p->next;
     fd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fdc:	8b 40 2c             	mov    0x2c(%eax),%eax
     fdf:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
     fe2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     fe6:	75 d8                	jne    fc0 <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
     fe8:	c9                   	leave  
     fe9:	c3                   	ret    

00000fea <getPos>:

Rect getPos(Context context, int n) {
     fea:	55                   	push   %ebp
     feb:	89 e5                	mov    %esp,%ebp
     fed:	83 ec 28             	sub    $0x28,%esp
	if (style == ICON_STYLE) {
     ff0:	a1 04 fd 00 00       	mov    0xfd04,%eax
     ff5:	83 f8 01             	cmp    $0x1,%eax
     ff8:	75 6e                	jne    1068 <getPos+0x7e>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     ffa:	8b 4d 10             	mov    0x10(%ebp),%ecx
     ffd:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
    1002:	89 c8                	mov    %ecx,%eax
    1004:	f7 ea                	imul   %edx
    1006:	c1 fa 06             	sar    $0x6,%edx
    1009:	89 c8                	mov    %ecx,%eax
    100b:	c1 f8 1f             	sar    $0x1f,%eax
    100e:	29 c2                	sub    %eax,%edx
    1010:	89 d0                	mov    %edx,%eax
    1012:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
    1015:	8b 45 18             	mov    0x18(%ebp),%eax
    1018:	99                   	cltd   
    1019:	f7 7d f4             	idivl  -0xc(%ebp)
    101c:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
    101f:	8b 45 18             	mov    0x18(%ebp),%eax
    1022:	99                   	cltd   
    1023:	f7 7d f4             	idivl  -0xc(%ebp)
    1026:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
    1029:	8b 45 f0             	mov    -0x10(%ebp),%eax
    102c:	6b c0 73             	imul   $0x73,%eax,%eax
    102f:	83 c0 5a             	add    $0x5a,%eax
    1032:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
    1035:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1038:	01 c0                	add    %eax,%eax
    103a:	89 c2                	mov    %eax,%edx
    103c:	c1 e2 06             	shl    $0x6,%edx
    103f:	01 d0                	add    %edx,%eax
    1041:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top + scrollOffset, ICON_ITEM_WIDTH,
    1044:	8b 15 40 07 01 00    	mov    0x10740,%edx
    104a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    104d:	01 c2                	add    %eax,%edx
    104f:	8b 45 08             	mov    0x8(%ebp),%eax
    1052:	83 ec 0c             	sub    $0xc,%esp
    1055:	6a 5f                	push   $0x5f
    1057:	6a 64                	push   $0x64
    1059:	52                   	push   %edx
    105a:	ff 75 e4             	pushl  -0x1c(%ebp)
    105d:	50                   	push   %eax
    105e:	e8 70 37 00 00       	call   47d3 <initRect>
    1063:	83 c4 1c             	add    $0x1c,%esp
    1066:	eb 2c                	jmp    1094 <getPos+0xaa>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP) + scrollOffset, context.width,
    1068:	8b 4d 10             	mov    0x10(%ebp),%ecx
    106b:	8b 55 18             	mov    0x18(%ebp),%edx
    106e:	89 d0                	mov    %edx,%eax
    1070:	c1 e0 05             	shl    $0x5,%eax
    1073:	29 d0                	sub    %edx,%eax
    1075:	8d 50 62             	lea    0x62(%eax),%edx
    1078:	a1 40 07 01 00       	mov    0x10740,%eax
    107d:	01 c2                	add    %eax,%edx
    107f:	8b 45 08             	mov    0x8(%ebp),%eax
    1082:	83 ec 0c             	sub    $0xc,%esp
    1085:	6a 1e                	push   $0x1e
    1087:	51                   	push   %ecx
    1088:	52                   	push   %edx
    1089:	6a 00                	push   $0x0
    108b:	50                   	push   %eax
    108c:	e8 42 37 00 00       	call   47d3 <initRect>
    1091:	83 c4 1c             	add    $0x1c,%esp
				LIST_ITEM_HEIGHT);
	}
}
    1094:	8b 45 08             	mov    0x8(%ebp),%eax
    1097:	c9                   	leave  
    1098:	c2 04 00             	ret    $0x4

0000109b <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
    109b:	55                   	push   %ebp
    109c:	89 e5                	mov    %esp,%ebp
    109e:	83 ec 08             	sub    $0x8,%esp
	if (style == ICON_STYLE) {
    10a1:	a1 04 fd 00 00       	mov    0xfd04,%eax
    10a6:	83 f8 01             	cmp    $0x1,%eax
    10a9:	75 0d                	jne    10b8 <addItemEvent+0x1d>
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
    10ab:	8b 45 28             	mov    0x28(%ebp),%eax
    10ae:	83 f8 45             	cmp    $0x45,%eax
    10b1:	7f 12                	jg     10c5 <addItemEvent+0x2a>
			return;
    10b3:	e9 95 00 00 00       	jmp    114d <addItemEvent+0xb2>
	} else {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
    10b8:	8b 45 28             	mov    0x28(%ebp),%eax
    10bb:	83 f8 61             	cmp    $0x61,%eax
    10be:	7f 05                	jg     10c5 <addItemEvent+0x2a>
			return;
    10c0:	e9 88 00 00 00       	jmp    114d <addItemEvent+0xb2>
	}
	switch (item.st.type) {
    10c5:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    10c9:	98                   	cwtl   
    10ca:	83 f8 01             	cmp    $0x1,%eax
    10cd:	74 28                	je     10f7 <addItemEvent+0x5c>
    10cf:	83 f8 02             	cmp    $0x2,%eax
    10d2:	75 67                	jne    113b <addItemEvent+0xa0>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    10d4:	83 ec 04             	sub    $0x4,%esp
    10d7:	68 a5 2a 00 00       	push   $0x2aa5
    10dc:	6a 02                	push   $0x2
    10de:	ff 75 30             	pushl  0x30(%ebp)
    10e1:	ff 75 2c             	pushl  0x2c(%ebp)
    10e4:	ff 75 28             	pushl  0x28(%ebp)
    10e7:	ff 75 24             	pushl  0x24(%ebp)
    10ea:	ff 75 08             	pushl  0x8(%ebp)
    10ed:	e8 c3 37 00 00       	call   48b5 <createClickable>
    10f2:	83 c4 20             	add    $0x20,%esp
		break;
    10f5:	eb 56                	jmp    114d <addItemEvent+0xb2>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    10f7:	83 ec 04             	sub    $0x4,%esp
    10fa:	68 a5 2a 00 00       	push   $0x2aa5
    10ff:	6a 02                	push   $0x2
    1101:	ff 75 30             	pushl  0x30(%ebp)
    1104:	ff 75 2c             	pushl  0x2c(%ebp)
    1107:	ff 75 28             	pushl  0x28(%ebp)
    110a:	ff 75 24             	pushl  0x24(%ebp)
    110d:	ff 75 08             	pushl  0x8(%ebp)
    1110:	e8 a0 37 00 00       	call   48b5 <createClickable>
    1115:	83 c4 20             	add    $0x20,%esp
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
    1118:	83 ec 04             	sub    $0x4,%esp
    111b:	68 7d 18 00 00       	push   $0x187d
    1120:	6a 04                	push   $0x4
    1122:	ff 75 30             	pushl  0x30(%ebp)
    1125:	ff 75 2c             	pushl  0x2c(%ebp)
    1128:	ff 75 28             	pushl  0x28(%ebp)
    112b:	ff 75 24             	pushl  0x24(%ebp)
    112e:	ff 75 08             	pushl  0x8(%ebp)
    1131:	e8 7f 37 00 00       	call   48b5 <createClickable>
    1136:	83 c4 20             	add    $0x20,%esp
		break;
    1139:	eb 12                	jmp    114d <addItemEvent+0xb2>
	default:
		printf(0, "unknown file type!");
    113b:	83 ec 08             	sub    $0x8,%esp
    113e:	68 d8 b8 00 00       	push   $0xb8d8
    1143:	6a 00                	push   $0x0
    1145:	e8 4f 40 00 00       	call   5199 <printf>
    114a:	83 c4 10             	add    $0x10,%esp
	}
}
    114d:	c9                   	leave  
    114e:	c3                   	ret    

0000114f <addListEvent>:

void addListEvent(ClickableManager *cm) {
    114f:	55                   	push   %ebp
    1150:	89 e5                	mov    %esp,%ebp
    1152:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
    1155:	a1 50 07 01 00       	mov    0x10750,%eax
    115a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    115d:	eb 43                	jmp    11a2 <addListEvent+0x53>
		temp = p;
    115f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1162:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
    1165:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1168:	8b 40 2c             	mov    0x2c(%eax),%eax
    116b:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
    116e:	83 ec 0c             	sub    $0xc,%esp
    1171:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1174:	ff 70 2c             	pushl  0x2c(%eax)
    1177:	ff 70 28             	pushl  0x28(%eax)
    117a:	ff 70 24             	pushl  0x24(%eax)
    117d:	ff 70 20             	pushl  0x20(%eax)
    1180:	ff 70 1c             	pushl  0x1c(%eax)
    1183:	ff 70 18             	pushl  0x18(%eax)
    1186:	ff 70 14             	pushl  0x14(%eax)
    1189:	ff 70 10             	pushl  0x10(%eax)
    118c:	ff 70 0c             	pushl  0xc(%eax)
    118f:	ff 70 08             	pushl  0x8(%eax)
    1192:	ff 70 04             	pushl  0x4(%eax)
    1195:	ff 30                	pushl  (%eax)
    1197:	ff 75 08             	pushl  0x8(%ebp)
    119a:	e8 fc fe ff ff       	call   109b <addItemEvent>
    119f:	83 c4 40             	add    $0x40,%esp
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
    11a2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11a6:	75 b7                	jne    115f <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
    11a8:	c9                   	leave  
    11a9:	c3                   	ret    

000011aa <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox, h_rename};

void addWndEvent(ClickableManager *cm) {
    11aa:	55                   	push   %ebp
    11ab:	89 e5                	mov    %esp,%ebp
    11ad:	57                   	push   %edi
    11ae:	56                   	push   %esi
    11af:	53                   	push   %ebx
    11b0:	83 ec 3c             	sub    $0x3c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
    11b3:	c7 45 e0 0f 00 00 00 	movl   $0xf,-0x20(%ebp)
	for (i = 0; i < n; i++) {
    11ba:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    11c1:	e9 81 00 00 00       	jmp    1247 <addWndEvent+0x9d>
		createClickable(cm,
    11c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11c9:	8b 1c 85 60 01 01 00 	mov    0x10160(,%eax,4),%ebx
    11d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11d3:	6b c0 34             	imul   $0x34,%eax,%eax
    11d6:	83 c0 20             	add    $0x20,%eax
    11d9:	05 40 fe 00 00       	add    $0xfe40,%eax
    11de:	8b 78 10             	mov    0x10(%eax),%edi
    11e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11e4:	6b c0 34             	imul   $0x34,%eax,%eax
    11e7:	83 c0 20             	add    $0x20,%eax
    11ea:	05 40 fe 00 00       	add    $0xfe40,%eax
    11ef:	8b 70 0c             	mov    0xc(%eax),%esi
    11f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11f5:	6b c0 34             	imul   $0x34,%eax,%eax
    11f8:	83 c0 20             	add    $0x20,%eax
    11fb:	05 40 fe 00 00       	add    $0xfe40,%eax
    1200:	8b 48 04             	mov    0x4(%eax),%ecx
    1203:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1206:	6b c0 34             	imul   $0x34,%eax,%eax
    1209:	83 c0 20             	add    $0x20,%eax
    120c:	05 40 fe 00 00       	add    $0xfe40,%eax
    1211:	8b 10                	mov    (%eax),%edx
    1213:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1216:	83 ec 0c             	sub    $0xc,%esp
    1219:	57                   	push   %edi
    121a:	56                   	push   %esi
    121b:	51                   	push   %ecx
    121c:	52                   	push   %edx
    121d:	50                   	push   %eax
    121e:	e8 b0 35 00 00       	call   47d3 <initRect>
    1223:	83 c4 1c             	add    $0x1c,%esp
    1226:	83 ec 04             	sub    $0x4,%esp
    1229:	53                   	push   %ebx
    122a:	6a 02                	push   $0x2
    122c:	ff 75 cc             	pushl  -0x34(%ebp)
    122f:	ff 75 c8             	pushl  -0x38(%ebp)
    1232:	ff 75 c4             	pushl  -0x3c(%ebp)
    1235:	ff 75 c0             	pushl  -0x40(%ebp)
    1238:	ff 75 08             	pushl  0x8(%ebp)
    123b:	e8 75 36 00 00       	call   48b5 <createClickable>
    1240:	83 c4 20             	add    $0x20,%esp
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox, h_rename};

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
    1243:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1247:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    124a:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    124d:	0f 8c 73 ff ff ff    	jl     11c6 <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
	createClickable(cm, initRect(LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT), MSG_LPRESS, h_fileSortByName);
    1253:	8d 45 d0             	lea    -0x30(%ebp),%eax
    1256:	83 ec 0c             	sub    $0xc,%esp
    1259:	6a 1c                	push   $0x1c
    125b:	68 9f 00 00 00       	push   $0x9f
    1260:	6a 47                	push   $0x47
    1262:	6a 28                	push   $0x28
    1264:	50                   	push   %eax
    1265:	e8 69 35 00 00       	call   47d3 <initRect>
    126a:	83 c4 1c             	add    $0x1c,%esp
    126d:	83 ec 04             	sub    $0x4,%esp
    1270:	68 e5 12 00 00       	push   $0x12e5
    1275:	6a 02                	push   $0x2
    1277:	ff 75 dc             	pushl  -0x24(%ebp)
    127a:	ff 75 d8             	pushl  -0x28(%ebp)
    127d:	ff 75 d4             	pushl  -0x2c(%ebp)
    1280:	ff 75 d0             	pushl  -0x30(%ebp)
    1283:	ff 75 08             	pushl  0x8(%ebp)
    1286:	e8 2a 36 00 00       	call   48b5 <createClickable>
    128b:	83 c4 20             	add    $0x20,%esp
}
    128e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1291:	5b                   	pop    %ebx
    1292:	5e                   	pop    %esi
    1293:	5f                   	pop    %edi
    1294:	5d                   	pop    %ebp
    1295:	c3                   	ret    

00001296 <getFileItem>:

struct fileItem * getFileItem(Point point) {
    1296:	55                   	push   %ebp
    1297:	89 e5                	mov    %esp,%ebp
    1299:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p = fileItemList;
    129c:	a1 50 07 01 00       	mov    0x10750,%eax
    12a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    12a4:	eb 32                	jmp    12d8 <getFileItem+0x42>
		if (isIn(point, p->pos)) {
    12a6:	83 ec 08             	sub    $0x8,%esp
    12a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12ac:	ff 70 24             	pushl  0x24(%eax)
    12af:	ff 70 20             	pushl  0x20(%eax)
    12b2:	ff 70 1c             	pushl  0x1c(%eax)
    12b5:	ff 70 18             	pushl  0x18(%eax)
    12b8:	ff 75 0c             	pushl  0xc(%ebp)
    12bb:	ff 75 08             	pushl  0x8(%ebp)
    12be:	e8 61 35 00 00       	call   4824 <isIn>
    12c3:	83 c4 20             	add    $0x20,%esp
    12c6:	85 c0                	test   %eax,%eax
    12c8:	74 05                	je     12cf <getFileItem+0x39>
			return p;
    12ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12cd:	eb 14                	jmp    12e3 <getFileItem+0x4d>
		}
		p = p->next;
    12cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12d2:	8b 40 2c             	mov    0x2c(%eax),%eax
    12d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	createClickable(cm, initRect(LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT), MSG_LPRESS, h_fileSortByName);
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
    12d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12dc:	75 c8                	jne    12a6 <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
    12de:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12e3:	c9                   	leave  
    12e4:	c3                   	ret    

000012e5 <h_fileSortByName>:

void h_fileSortByName(Point p) {
    12e5:	55                   	push   %ebp
    12e6:	89 e5                	mov    %esp,%ebp
    12e8:	83 ec 18             	sub    $0x18,%esp
	printf(0, "askjhdas\n");
    12eb:	83 ec 08             	sub    $0x8,%esp
    12ee:	68 eb b8 00 00       	push   $0xb8eb
    12f3:	6a 00                	push   $0x0
    12f5:	e8 9f 3e 00 00       	call   5199 <printf>
    12fa:	83 c4 10             	add    $0x10,%esp
	fileSortByName();
    12fd:	e8 3c ee ff ff       	call   13e <fileSortByName>
	drawFinderContent(context);
    1302:	83 ec 04             	sub    $0x4,%esp
    1305:	ff 35 08 3f 01 00    	pushl  0x13f08
    130b:	ff 35 04 3f 01 00    	pushl  0x13f04
    1311:	ff 35 00 3f 01 00    	pushl  0x13f00
    1317:	e8 26 fa ff ff       	call   d42 <drawFinderContent>
    131c:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    131f:	83 ec 04             	sub    $0x4,%esp
    1322:	ff 35 08 3f 01 00    	pushl  0x13f08
    1328:	ff 35 04 3f 01 00    	pushl  0x13f04
    132e:	ff 35 00 3f 01 00    	pushl  0x13f00
    1334:	e8 96 f7 ff ff       	call   acf <drawFinderWnd>
    1339:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    133c:	8d 45 e8             	lea    -0x18(%ebp),%eax
    133f:	83 ec 0c             	sub    $0xc,%esp
    1342:	68 58 02 00 00       	push   $0x258
    1347:	68 20 03 00 00       	push   $0x320
    134c:	6a 00                	push   $0x0
    134e:	6a 00                	push   $0x0
    1350:	50                   	push   %eax
    1351:	e8 7d 34 00 00       	call   47d3 <initRect>
    1356:	83 c4 1c             	add    $0x1c,%esp
    1359:	83 ec 0c             	sub    $0xc,%esp
    135c:	ff 75 f4             	pushl  -0xc(%ebp)
    135f:	ff 75 f0             	pushl  -0x10(%ebp)
    1362:	ff 75 ec             	pushl  -0x14(%ebp)
    1365:	ff 75 e8             	pushl  -0x18(%ebp)
    1368:	68 40 40 01 00       	push   $0x14040
    136d:	e8 26 36 00 00       	call   4998 <deleteClickable>
    1372:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1375:	83 ec 0c             	sub    $0xc,%esp
    1378:	68 40 40 01 00       	push   $0x14040
    137d:	e8 28 fe ff ff       	call   11aa <addWndEvent>
    1382:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1385:	83 ec 0c             	sub    $0xc,%esp
    1388:	68 40 40 01 00       	push   $0x14040
    138d:	e8 bd fd ff ff       	call   114f <addListEvent>
    1392:	83 c4 10             	add    $0x10,%esp
}
    1395:	c9                   	leave  
    1396:	c3                   	ret    

00001397 <h_searchbox>:

void h_searchbox(Point p) {
    1397:	55                   	push   %ebp
    1398:	89 e5                	mov    %esp,%ebp
	isSearching = 1;
    139a:	c7 05 c0 35 01 00 01 	movl   $0x1,0x135c0
    13a1:	00 00 00 
}
    13a4:	5d                   	pop    %ebp
    13a5:	c3                   	ret    

000013a6 <scrollList>:

void scrollList(int offset) {
    13a6:	55                   	push   %ebp
    13a7:	89 e5                	mov    %esp,%ebp
    13a9:	83 ec 10             	sub    $0x10,%esp
	struct fileItem *q = fileItemList;
    13ac:	a1 50 07 01 00       	mov    0x10750,%eax
    13b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
	while (q != 0){
    13b4:	eb 1a                	jmp    13d0 <scrollList+0x2a>
		q->pos.start.y += offset;
    13b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13b9:	8b 50 1c             	mov    0x1c(%eax),%edx
    13bc:	8b 45 08             	mov    0x8(%ebp),%eax
    13bf:	01 c2                	add    %eax,%edx
    13c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13c4:	89 50 1c             	mov    %edx,0x1c(%eax)
		q = q->next;
    13c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13ca:	8b 40 2c             	mov    0x2c(%eax),%eax
    13cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
	isSearching = 1;
}

void scrollList(int offset) {
	struct fileItem *q = fileItemList;
	while (q != 0){
    13d0:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
    13d4:	75 e0                	jne    13b6 <scrollList+0x10>
		q->pos.start.y += offset;
		q = q->next;
	}
	scrollOffset += offset;
    13d6:	8b 15 40 07 01 00    	mov    0x10740,%edx
    13dc:	8b 45 08             	mov    0x8(%ebp),%eax
    13df:	01 d0                	add    %edx,%eax
    13e1:	a3 40 07 01 00       	mov    %eax,0x10740
}
    13e6:	c9                   	leave  
    13e7:	c3                   	ret    

000013e8 <scrollDown>:

void scrollDown() {
    13e8:	55                   	push   %ebp
    13e9:	89 e5                	mov    %esp,%ebp
    13eb:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *q = fileItemList;
    13ee:	a1 50 07 01 00       	mov    0x10750,%eax
    13f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	printf(0, "have you ever had sex?%d\n%d", fileItemList->pos.start.y, (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    13f6:	a1 50 07 01 00       	mov    0x10750,%eax
    13fb:	8b 40 1c             	mov    0x1c(%eax),%eax
    13fe:	68 a4 01 00 00       	push   $0x1a4
    1403:	50                   	push   %eax
    1404:	68 f5 b8 00 00       	push   $0xb8f5
    1409:	6a 00                	push   $0x0
    140b:	e8 89 3d 00 00       	call   5199 <printf>
    1410:	83 c4 10             	add    $0x10,%esp
	if (style == ICON_STYLE){
    1413:	a1 04 fd 00 00       	mov    0xfd04,%eax
    1418:	83 f8 01             	cmp    $0x1,%eax
    141b:	75 46                	jne    1463 <scrollDown+0x7b>
		if(q->pos.start.y > (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)){
    141d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1420:	8b 40 1c             	mov    0x1c(%eax),%eax
    1423:	3d 63 01 00 00       	cmp    $0x163,%eax
    1428:	7e 7d                	jle    14a7 <scrollDown+0xbf>
			if(q->pos.start.y > WINDOW_HEIGHT){
    142a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    142d:	8b 40 1c             	mov    0x1c(%eax),%eax
    1430:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1435:	7e 0f                	jle    1446 <scrollDown+0x5e>
				scrollList(-SCROLL_UNIT);
    1437:	83 ec 0c             	sub    $0xc,%esp
    143a:	6a e2                	push   $0xffffffe2
    143c:	e8 65 ff ff ff       	call   13a6 <scrollList>
    1441:	83 c4 10             	add    $0x10,%esp
    1444:	eb 61                	jmp    14a7 <scrollDown+0xbf>
			}
			else{
				scrollList(-(q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)));
    1446:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1449:	8b 40 1c             	mov    0x1c(%eax),%eax
    144c:	ba 63 01 00 00       	mov    $0x163,%edx
    1451:	29 c2                	sub    %eax,%edx
    1453:	89 d0                	mov    %edx,%eax
    1455:	83 ec 0c             	sub    $0xc,%esp
    1458:	50                   	push   %eax
    1459:	e8 48 ff ff ff       	call   13a6 <scrollList>
    145e:	83 c4 10             	add    $0x10,%esp
    1461:	eb 44                	jmp    14a7 <scrollDown+0xbf>
			}
		}
	}
	else{
		if(q->pos.start.y > (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)){
    1463:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1466:	8b 40 1c             	mov    0x1c(%eax),%eax
    1469:	3d a4 01 00 00       	cmp    $0x1a4,%eax
    146e:	7e 37                	jle    14a7 <scrollDown+0xbf>
			if(q->pos.start.y > WINDOW_HEIGHT){
    1470:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1473:	8b 40 1c             	mov    0x1c(%eax),%eax
    1476:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    147b:	7e 0f                	jle    148c <scrollDown+0xa4>
				scrollList(-SCROLL_UNIT);
    147d:	83 ec 0c             	sub    $0xc,%esp
    1480:	6a e2                	push   $0xffffffe2
    1482:	e8 1f ff ff ff       	call   13a6 <scrollList>
    1487:	83 c4 10             	add    $0x10,%esp
    148a:	eb 1b                	jmp    14a7 <scrollDown+0xbf>
			}
			else{
				scrollList(-(q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)));
    148c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    148f:	8b 40 1c             	mov    0x1c(%eax),%eax
    1492:	ba a4 01 00 00       	mov    $0x1a4,%edx
    1497:	29 c2                	sub    %eax,%edx
    1499:	89 d0                	mov    %edx,%eax
    149b:	83 ec 0c             	sub    $0xc,%esp
    149e:	50                   	push   %eax
    149f:	e8 02 ff ff ff       	call   13a6 <scrollList>
    14a4:	83 c4 10             	add    $0x10,%esp
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    14a7:	a1 40 07 01 00       	mov    0x10740,%eax
    14ac:	83 ec 04             	sub    $0x4,%esp
    14af:	50                   	push   %eax
    14b0:	68 14 b9 00 00       	push   $0xb914
    14b5:	6a 00                	push   $0x0
    14b7:	e8 dd 3c 00 00       	call   5199 <printf>
    14bc:	83 c4 10             	add    $0x10,%esp
}
    14bf:	c9                   	leave  
    14c0:	c3                   	ret    

000014c1 <h_scrollDown>:

void h_scrollDown(Point p) {
    14c1:	55                   	push   %ebp
    14c2:	89 e5                	mov    %esp,%ebp
    14c4:	83 ec 18             	sub    $0x18,%esp
	scrollDown();
    14c7:	e8 1c ff ff ff       	call   13e8 <scrollDown>
//	updateFileList(context);
//	fileSortByName();
	drawFinderContent(context);
    14cc:	83 ec 04             	sub    $0x4,%esp
    14cf:	ff 35 08 3f 01 00    	pushl  0x13f08
    14d5:	ff 35 04 3f 01 00    	pushl  0x13f04
    14db:	ff 35 00 3f 01 00    	pushl  0x13f00
    14e1:	e8 5c f8 ff ff       	call   d42 <drawFinderContent>
    14e6:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    14e9:	83 ec 04             	sub    $0x4,%esp
    14ec:	ff 35 08 3f 01 00    	pushl  0x13f08
    14f2:	ff 35 04 3f 01 00    	pushl  0x13f04
    14f8:	ff 35 00 3f 01 00    	pushl  0x13f00
    14fe:	e8 cc f5 ff ff       	call   acf <drawFinderWnd>
    1503:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1506:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1509:	83 ec 0c             	sub    $0xc,%esp
    150c:	68 58 02 00 00       	push   $0x258
    1511:	68 20 03 00 00       	push   $0x320
    1516:	6a 00                	push   $0x0
    1518:	6a 00                	push   $0x0
    151a:	50                   	push   %eax
    151b:	e8 b3 32 00 00       	call   47d3 <initRect>
    1520:	83 c4 1c             	add    $0x1c,%esp
    1523:	83 ec 0c             	sub    $0xc,%esp
    1526:	ff 75 f4             	pushl  -0xc(%ebp)
    1529:	ff 75 f0             	pushl  -0x10(%ebp)
    152c:	ff 75 ec             	pushl  -0x14(%ebp)
    152f:	ff 75 e8             	pushl  -0x18(%ebp)
    1532:	68 40 40 01 00       	push   $0x14040
    1537:	e8 5c 34 00 00       	call   4998 <deleteClickable>
    153c:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    153f:	83 ec 0c             	sub    $0xc,%esp
    1542:	68 40 40 01 00       	push   $0x14040
    1547:	e8 5e fc ff ff       	call   11aa <addWndEvent>
    154c:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    154f:	83 ec 0c             	sub    $0xc,%esp
    1552:	68 40 40 01 00       	push   $0x14040
    1557:	e8 f3 fb ff ff       	call   114f <addListEvent>
    155c:	83 c4 10             	add    $0x10,%esp
}
    155f:	c9                   	leave  
    1560:	c3                   	ret    

00001561 <scrollUp>:

void scrollUp() {
    1561:	55                   	push   %ebp
    1562:	89 e5                	mov    %esp,%ebp
    1564:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *q = fileItemList;
    1567:	a1 50 07 01 00       	mov    0x10750,%eax
    156c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p;
	while (q != 0)
    156f:	eb 0f                	jmp    1580 <scrollUp+0x1f>
	{
		p = q;
    1571:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1574:	89 45 f0             	mov    %eax,-0x10(%ebp)
		q = q->next;
    1577:	8b 45 f4             	mov    -0xc(%ebp),%eax
    157a:	8b 40 2c             	mov    0x2c(%eax),%eax
    157d:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void scrollUp() {
	struct fileItem *q = fileItemList;
	struct fileItem *p;
	while (q != 0)
    1580:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1584:	75 eb                	jne    1571 <scrollUp+0x10>
	{
		p = q;
		q = q->next;
	}
	printf(0, "the first file's y is tmd:%d\n", p->pos.start.y);
    1586:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1589:	8b 40 1c             	mov    0x1c(%eax),%eax
    158c:	83 ec 04             	sub    $0x4,%esp
    158f:	50                   	push   %eax
    1590:	68 33 b9 00 00       	push   $0xb933
    1595:	6a 00                	push   $0x0
    1597:	e8 fd 3b 00 00       	call   5199 <printf>
    159c:	83 c4 10             	add    $0x10,%esp
	printf(0, "have you ever had sex?%d\n", fileItemList->pos.start.y);
    159f:	a1 50 07 01 00       	mov    0x10750,%eax
    15a4:	8b 40 1c             	mov    0x1c(%eax),%eax
    15a7:	83 ec 04             	sub    $0x4,%esp
    15aa:	50                   	push   %eax
    15ab:	68 51 b9 00 00       	push   $0xb951
    15b0:	6a 00                	push   $0x0
    15b2:	e8 e2 3b 00 00       	call   5199 <printf>
    15b7:	83 c4 10             	add    $0x10,%esp
	if (style == ICON_STYLE){
    15ba:	a1 04 fd 00 00       	mov    0xfd04,%eax
    15bf:	83 f8 01             	cmp    $0x1,%eax
    15c2:	75 42                	jne    1606 <scrollUp+0xa5>
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)){
    15c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15c7:	8b 40 1c             	mov    0x1c(%eax),%eax
    15ca:	83 f8 45             	cmp    $0x45,%eax
    15cd:	7f 77                	jg     1646 <scrollUp+0xe5>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - ICON_ITEM_HEIGHT)){
    15cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15d2:	8b 40 1c             	mov    0x1c(%eax),%eax
    15d5:	83 f8 e7             	cmp    $0xffffffe7,%eax
    15d8:	7d 0f                	jge    15e9 <scrollUp+0x88>
				scrollList(SCROLL_UNIT);
    15da:	83 ec 0c             	sub    $0xc,%esp
    15dd:	6a 1e                	push   $0x1e
    15df:	e8 c2 fd ff ff       	call   13a6 <scrollList>
    15e4:	83 c4 10             	add    $0x10,%esp
    15e7:	eb 5d                	jmp    1646 <scrollUp+0xe5>
			}
			else{
				scrollList((TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - p->pos.start.y);
    15e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15ec:	8b 40 1c             	mov    0x1c(%eax),%eax
    15ef:	ba 46 00 00 00       	mov    $0x46,%edx
    15f4:	29 c2                	sub    %eax,%edx
    15f6:	89 d0                	mov    %edx,%eax
    15f8:	83 ec 0c             	sub    $0xc,%esp
    15fb:	50                   	push   %eax
    15fc:	e8 a5 fd ff ff       	call   13a6 <scrollList>
    1601:	83 c4 10             	add    $0x10,%esp
    1604:	eb 40                	jmp    1646 <scrollUp+0xe5>
			}
		}
	}
	else{
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)){
    1606:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1609:	8b 40 1c             	mov    0x1c(%eax),%eax
    160c:	83 f8 61             	cmp    $0x61,%eax
    160f:	7f 35                	jg     1646 <scrollUp+0xe5>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - LIST_ITEM_HEIGHT)){
    1611:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1614:	8b 40 1c             	mov    0x1c(%eax),%eax
    1617:	83 f8 43             	cmp    $0x43,%eax
    161a:	7f 0f                	jg     162b <scrollUp+0xca>
				scrollList(SCROLL_UNIT);
    161c:	83 ec 0c             	sub    $0xc,%esp
    161f:	6a 1e                	push   $0x1e
    1621:	e8 80 fd ff ff       	call   13a6 <scrollList>
    1626:	83 c4 10             	add    $0x10,%esp
    1629:	eb 1b                	jmp    1646 <scrollUp+0xe5>
			}
			else{
				scrollList((TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT) - p->pos.start.y);
    162b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    162e:	8b 40 1c             	mov    0x1c(%eax),%eax
    1631:	ba 62 00 00 00       	mov    $0x62,%edx
    1636:	29 c2                	sub    %eax,%edx
    1638:	89 d0                	mov    %edx,%eax
    163a:	83 ec 0c             	sub    $0xc,%esp
    163d:	50                   	push   %eax
    163e:	e8 63 fd ff ff       	call   13a6 <scrollList>
    1643:	83 c4 10             	add    $0x10,%esp
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    1646:	a1 40 07 01 00       	mov    0x10740,%eax
    164b:	83 ec 04             	sub    $0x4,%esp
    164e:	50                   	push   %eax
    164f:	68 6b b9 00 00       	push   $0xb96b
    1654:	6a 00                	push   $0x0
    1656:	e8 3e 3b 00 00       	call   5199 <printf>
    165b:	83 c4 10             	add    $0x10,%esp
}
    165e:	c9                   	leave  
    165f:	c3                   	ret    

00001660 <h_scrollUp>:

void h_scrollUp(Point p) {
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	83 ec 18             	sub    $0x18,%esp
	scrollUp();
    1666:	e8 f6 fe ff ff       	call   1561 <scrollUp>
//	updateFileList(context);
//	fileSortByName();
	drawFinderContent(context);
    166b:	83 ec 04             	sub    $0x4,%esp
    166e:	ff 35 08 3f 01 00    	pushl  0x13f08
    1674:	ff 35 04 3f 01 00    	pushl  0x13f04
    167a:	ff 35 00 3f 01 00    	pushl  0x13f00
    1680:	e8 bd f6 ff ff       	call   d42 <drawFinderContent>
    1685:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1688:	83 ec 04             	sub    $0x4,%esp
    168b:	ff 35 08 3f 01 00    	pushl  0x13f08
    1691:	ff 35 04 3f 01 00    	pushl  0x13f04
    1697:	ff 35 00 3f 01 00    	pushl  0x13f00
    169d:	e8 2d f4 ff ff       	call   acf <drawFinderWnd>
    16a2:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    16a5:	8d 45 e8             	lea    -0x18(%ebp),%eax
    16a8:	83 ec 0c             	sub    $0xc,%esp
    16ab:	68 58 02 00 00       	push   $0x258
    16b0:	68 20 03 00 00       	push   $0x320
    16b5:	6a 00                	push   $0x0
    16b7:	6a 00                	push   $0x0
    16b9:	50                   	push   %eax
    16ba:	e8 14 31 00 00       	call   47d3 <initRect>
    16bf:	83 c4 1c             	add    $0x1c,%esp
    16c2:	83 ec 0c             	sub    $0xc,%esp
    16c5:	ff 75 f4             	pushl  -0xc(%ebp)
    16c8:	ff 75 f0             	pushl  -0x10(%ebp)
    16cb:	ff 75 ec             	pushl  -0x14(%ebp)
    16ce:	ff 75 e8             	pushl  -0x18(%ebp)
    16d1:	68 40 40 01 00       	push   $0x14040
    16d6:	e8 bd 32 00 00       	call   4998 <deleteClickable>
    16db:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    16de:	83 ec 0c             	sub    $0xc,%esp
    16e1:	68 40 40 01 00       	push   $0x14040
    16e6:	e8 bf fa ff ff       	call   11aa <addWndEvent>
    16eb:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    16ee:	83 ec 0c             	sub    $0xc,%esp
    16f1:	68 40 40 01 00       	push   $0x14040
    16f6:	e8 54 fa ff ff       	call   114f <addListEvent>
    16fb:	83 c4 10             	add    $0x10,%esp
}
    16fe:	c9                   	leave  
    16ff:	c3                   	ret    

00001700 <updatePath>:

void updatePath(char *name) {
    1700:	55                   	push   %ebp
    1701:	89 e5                	mov    %esp,%ebp
    1703:	83 ec 18             	sub    $0x18,%esp
	//printf(2, "cd success\r\n");
	int n = strlen(name);
    1706:	83 ec 0c             	sub    $0xc,%esp
    1709:	ff 75 08             	pushl  0x8(%ebp)
    170c:	e8 ea 36 00 00       	call   4dfb <strlen>
    1711:	83 c4 10             	add    $0x10,%esp
    1714:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int i;
	if (n == 2 && name[0] == '.' && name[1] == '.')
    1717:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    171b:	0f 85 90 00 00 00    	jne    17b1 <updatePath+0xb1>
    1721:	8b 45 08             	mov    0x8(%ebp),%eax
    1724:	0f b6 00             	movzbl (%eax),%eax
    1727:	3c 2e                	cmp    $0x2e,%al
    1729:	0f 85 82 00 00 00    	jne    17b1 <updatePath+0xb1>
    172f:	8b 45 08             	mov    0x8(%ebp),%eax
    1732:	83 c0 01             	add    $0x1,%eax
    1735:	0f b6 00             	movzbl (%eax),%eax
    1738:	3c 2e                	cmp    $0x2e,%al
    173a:	75 75                	jne    17b1 <updatePath+0xb1>
	{
		if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    173c:	83 ec 0c             	sub    $0xc,%esp
    173f:	68 40 3f 01 00       	push   $0x13f40
    1744:	e8 b2 36 00 00       	call   4dfb <strlen>
    1749:	83 c4 10             	add    $0x10,%esp
    174c:	83 f8 01             	cmp    $0x1,%eax
    174f:	75 0b                	jne    175c <updatePath+0x5c>
    1751:	0f b6 05 40 3f 01 00 	movzbl 0x13f40,%eax
    1758:	3c 2f                	cmp    $0x2f,%al
    175a:	74 53                	je     17af <updatePath+0xaf>
		{
			int tmpn = strlen(currentPath);
    175c:	83 ec 0c             	sub    $0xc,%esp
    175f:	68 40 3f 01 00       	push   $0x13f40
    1764:	e8 92 36 00 00       	call   4dfb <strlen>
    1769:	83 c4 10             	add    $0x10,%esp
    176c:	89 45 ec             	mov    %eax,-0x14(%ebp)
			currentPath[tmpn - 1] = '\0';
    176f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1772:	83 e8 01             	sub    $0x1,%eax
    1775:	c6 80 40 3f 01 00 00 	movb   $0x0,0x13f40(%eax)
			for (i = tmpn - 2; i > 0; i--)
    177c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    177f:	83 e8 02             	sub    $0x2,%eax
    1782:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1785:	eb 22                	jmp    17a9 <updatePath+0xa9>
			{
				if (currentPath[i] != '/')
    1787:	8b 45 f4             	mov    -0xc(%ebp),%eax
    178a:	05 40 3f 01 00       	add    $0x13f40,%eax
    178f:	0f b6 00             	movzbl (%eax),%eax
    1792:	3c 2f                	cmp    $0x2f,%al
    1794:	74 0d                	je     17a3 <updatePath+0xa3>
					currentPath[i] = '\0';
    1796:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1799:	05 40 3f 01 00       	add    $0x13f40,%eax
    179e:	c6 00 00             	movb   $0x0,(%eax)
    17a1:	eb 02                	jmp    17a5 <updatePath+0xa5>
				else
					break;
    17a3:	eb 0a                	jmp    17af <updatePath+0xaf>
	{
		if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
		{
			int tmpn = strlen(currentPath);
			currentPath[tmpn - 1] = '\0';
			for (i = tmpn - 2; i > 0; i--)
    17a5:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    17a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    17ad:	7f d8                	jg     1787 <updatePath+0x87>
	//printf(2, "cd success\r\n");
	int n = strlen(name);
	int i;
	if (n == 2 && name[0] == '.' && name[1] == '.')
	{
		if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    17af:	eb 55                	jmp    1806 <updatePath+0x106>
			}
		}
	}
	else
	{
		int tmpn = strlen(currentPath);
    17b1:	83 ec 0c             	sub    $0xc,%esp
    17b4:	68 40 3f 01 00       	push   $0x13f40
    17b9:	e8 3d 36 00 00       	call   4dfb <strlen>
    17be:	83 c4 10             	add    $0x10,%esp
    17c1:	89 45 e8             	mov    %eax,-0x18(%ebp)
		strcpy(currentPath + tmpn, name);
    17c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17c7:	05 40 3f 01 00       	add    $0x13f40,%eax
    17cc:	83 ec 08             	sub    $0x8,%esp
    17cf:	ff 75 08             	pushl  0x8(%ebp)
    17d2:	50                   	push   %eax
    17d3:	e8 b4 35 00 00       	call   4d8c <strcpy>
    17d8:	83 c4 10             	add    $0x10,%esp
		tmpn = strlen(currentPath);
    17db:	83 ec 0c             	sub    $0xc,%esp
    17de:	68 40 3f 01 00       	push   $0x13f40
    17e3:	e8 13 36 00 00       	call   4dfb <strlen>
    17e8:	83 c4 10             	add    $0x10,%esp
    17eb:	89 45 e8             	mov    %eax,-0x18(%ebp)
		currentPath[tmpn] = '/';
    17ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17f1:	05 40 3f 01 00       	add    $0x13f40,%eax
    17f6:	c6 00 2f             	movb   $0x2f,(%eax)
		currentPath[tmpn + 1] = '\0';
    17f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17fc:	83 c0 01             	add    $0x1,%eax
    17ff:	c6 80 40 3f 01 00 00 	movb   $0x0,0x13f40(%eax)
	}
}
    1806:	c9                   	leave  
    1807:	c3                   	ret    

00001808 <enterDir>:

// Handlers
void enterDir(char *name) {
    1808:	55                   	push   %ebp
    1809:	89 e5                	mov    %esp,%ebp
    180b:	83 ec 08             	sub    $0x8,%esp
	scrollOffset = 0;
    180e:	c7 05 40 07 01 00 00 	movl   $0x0,0x10740
    1815:	00 00 00 
	printf(0, "entering : %s\n", name);
    1818:	83 ec 04             	sub    $0x4,%esp
    181b:	ff 75 08             	pushl  0x8(%ebp)
    181e:	68 88 b9 00 00       	push   $0xb988
    1823:	6a 00                	push   $0x0
    1825:	e8 6f 39 00 00       	call   5199 <printf>
    182a:	83 c4 10             	add    $0x10,%esp
	if (chdir(name) < 0)
    182d:	83 ec 0c             	sub    $0xc,%esp
    1830:	ff 75 08             	pushl  0x8(%ebp)
    1833:	e8 f4 37 00 00       	call   502c <chdir>
    1838:	83 c4 10             	add    $0x10,%esp
    183b:	85 c0                	test   %eax,%eax
    183d:	79 17                	jns    1856 <enterDir+0x4e>
		printf(2, "cannot cd %s\n", name);
    183f:	83 ec 04             	sub    $0x4,%esp
    1842:	ff 75 08             	pushl  0x8(%ebp)
    1845:	68 97 b9 00 00       	push   $0xb997
    184a:	6a 02                	push   $0x2
    184c:	e8 48 39 00 00       	call   5199 <printf>
    1851:	83 c4 10             	add    $0x10,%esp
    1854:	eb 0e                	jmp    1864 <enterDir+0x5c>
	else
		updatePath(name);
    1856:	83 ec 0c             	sub    $0xc,%esp
    1859:	ff 75 08             	pushl  0x8(%ebp)
    185c:	e8 9f fe ff ff       	call   1700 <updatePath>
    1861:	83 c4 10             	add    $0x10,%esp
	printf(0, "currentPath: %s\n", currentPath);
    1864:	83 ec 04             	sub    $0x4,%esp
    1867:	68 40 3f 01 00       	push   $0x13f40
    186c:	68 a5 b9 00 00       	push   $0xb9a5
    1871:	6a 00                	push   $0x0
    1873:	e8 21 39 00 00       	call   5199 <printf>
    1878:	83 c4 10             	add    $0x10,%esp
}
    187b:	c9                   	leave  
    187c:	c3                   	ret    

0000187d <h_enterDir>:

void h_enterDir(Point p) {
    187d:	55                   	push   %ebp
    187e:	89 e5                	mov    %esp,%ebp
    1880:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    1883:	83 ec 08             	sub    $0x8,%esp
    1886:	ff 75 0c             	pushl  0xc(%ebp)
    1889:	ff 75 08             	pushl  0x8(%ebp)
    188c:	e8 05 fa ff ff       	call   1296 <getFileItem>
    1891:	83 c4 10             	add    $0x10,%esp
    1894:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    1897:	8b 45 f4             	mov    -0xc(%ebp),%eax
    189a:	8b 40 14             	mov    0x14(%eax),%eax
    189d:	83 ec 0c             	sub    $0xc,%esp
    18a0:	50                   	push   %eax
    18a1:	e8 62 ff ff ff       	call   1808 <enterDir>
    18a6:	83 c4 10             	add    $0x10,%esp
	updateFileList(context);
    18a9:	83 ec 04             	sub    $0x4,%esp
    18ac:	ff 35 08 3f 01 00    	pushl  0x13f08
    18b2:	ff 35 04 3f 01 00    	pushl  0x13f04
    18b8:	ff 35 00 3f 01 00    	pushl  0x13f00
    18be:	e8 2c f3 ff ff       	call   bef <updateFileList>
    18c3:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    18c6:	83 ec 04             	sub    $0x4,%esp
    18c9:	ff 35 08 3f 01 00    	pushl  0x13f08
    18cf:	ff 35 04 3f 01 00    	pushl  0x13f04
    18d5:	ff 35 00 3f 01 00    	pushl  0x13f00
    18db:	e8 62 f4 ff ff       	call   d42 <drawFinderContent>
    18e0:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    18e3:	83 ec 04             	sub    $0x4,%esp
    18e6:	ff 35 08 3f 01 00    	pushl  0x13f08
    18ec:	ff 35 04 3f 01 00    	pushl  0x13f04
    18f2:	ff 35 00 3f 01 00    	pushl  0x13f00
    18f8:	e8 d2 f1 ff ff       	call   acf <drawFinderWnd>
    18fd:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1900:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1903:	83 ec 0c             	sub    $0xc,%esp
    1906:	68 58 02 00 00       	push   $0x258
    190b:	68 20 03 00 00       	push   $0x320
    1910:	6a 00                	push   $0x0
    1912:	6a 00                	push   $0x0
    1914:	50                   	push   %eax
    1915:	e8 b9 2e 00 00       	call   47d3 <initRect>
    191a:	83 c4 1c             	add    $0x1c,%esp
    191d:	83 ec 0c             	sub    $0xc,%esp
    1920:	ff 75 f0             	pushl  -0x10(%ebp)
    1923:	ff 75 ec             	pushl  -0x14(%ebp)
    1926:	ff 75 e8             	pushl  -0x18(%ebp)
    1929:	ff 75 e4             	pushl  -0x1c(%ebp)
    192c:	68 40 40 01 00       	push   $0x14040
    1931:	e8 62 30 00 00       	call   4998 <deleteClickable>
    1936:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1939:	83 ec 0c             	sub    $0xc,%esp
    193c:	68 40 40 01 00       	push   $0x14040
    1941:	e8 64 f8 ff ff       	call   11aa <addWndEvent>
    1946:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1949:	83 ec 0c             	sub    $0xc,%esp
    194c:	68 40 40 01 00       	push   $0x14040
    1951:	e8 f9 f7 ff ff       	call   114f <addListEvent>
    1956:	83 c4 10             	add    $0x10,%esp
}
    1959:	c9                   	leave  
    195a:	c3                   	ret    

0000195b <newFile>:

void newFile(char *name) {
    195b:	55                   	push   %ebp
    195c:	89 e5                	mov    %esp,%ebp
    195e:	83 ec 18             	sub    $0x18,%esp
	int fd;
	int n = strlen(name);
    1961:	83 ec 0c             	sub    $0xc,%esp
    1964:	ff 75 08             	pushl  0x8(%ebp)
    1967:	e8 8f 34 00 00       	call   4dfb <strlen>
    196c:	83 c4 10             	add    $0x10,%esp
    196f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    1972:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    1979:	eb 70                	jmp    19eb <newFile+0x90>
	{
		n = strlen(name);
    197b:	83 ec 0c             	sub    $0xc,%esp
    197e:	ff 75 08             	pushl  0x8(%ebp)
    1981:	e8 75 34 00 00       	call   4dfb <strlen>
    1986:	83 c4 10             	add    $0x10,%esp
    1989:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    198c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    198f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1992:	75 09                	jne    199d <newFile+0x42>
		{
			counter = 1;
    1994:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    199b:	eb 1b                	jmp    19b8 <newFile+0x5d>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    199d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    19a0:	8b 45 08             	mov    0x8(%ebp),%eax
    19a3:	01 d0                	add    %edx,%eax
    19a5:	83 ec 0c             	sub    $0xc,%esp
    19a8:	50                   	push   %eax
    19a9:	e8 7c 35 00 00       	call   4f2a <atoi>
    19ae:	83 c4 10             	add    $0x10,%esp
    19b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    19b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    19b8:	83 ec 0c             	sub    $0xc,%esp
    19bb:	ff 75 f4             	pushl  -0xc(%ebp)
    19be:	e8 05 f5 ff ff       	call   ec8 <int2str>
    19c3:	83 c4 10             	add    $0x10,%esp
    19c6:	89 c1                	mov    %eax,%ecx
    19c8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    19cb:	8b 45 08             	mov    0x8(%ebp),%eax
    19ce:	01 d0                	add    %edx,%eax
    19d0:	83 ec 08             	sub    $0x8,%esp
    19d3:	51                   	push   %ecx
    19d4:	50                   	push   %eax
    19d5:	e8 b2 33 00 00       	call   4d8c <strcpy>
    19da:	83 c4 10             	add    $0x10,%esp
		close(fd);
    19dd:	83 ec 0c             	sub    $0xc,%esp
    19e0:	ff 75 e8             	pushl  -0x18(%ebp)
    19e3:	e8 fc 35 00 00       	call   4fe4 <close>
    19e8:	83 c4 10             	add    $0x10,%esp
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    19eb:	83 ec 08             	sub    $0x8,%esp
    19ee:	6a 00                	push   $0x0
    19f0:	ff 75 08             	pushl  0x8(%ebp)
    19f3:	e8 04 36 00 00       	call   4ffc <open>
    19f8:	83 c4 10             	add    $0x10,%esp
    19fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
    19fe:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1a02:	0f 8f 73 ff ff ff    	jg     197b <newFile+0x20>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    1a08:	83 ec 08             	sub    $0x8,%esp
    1a0b:	68 00 02 00 00       	push   $0x200
    1a10:	ff 75 08             	pushl  0x8(%ebp)
    1a13:	e8 e4 35 00 00       	call   4ffc <open>
    1a18:	83 c4 10             	add    $0x10,%esp
    1a1b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1a1e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1a22:	79 1a                	jns    1a3e <newFile+0xe3>
		printf(0, "cat: cannot open %s\n", name);
    1a24:	83 ec 04             	sub    $0x4,%esp
    1a27:	ff 75 08             	pushl  0x8(%ebp)
    1a2a:	68 b6 b9 00 00       	push   $0xb9b6
    1a2f:	6a 00                	push   $0x0
    1a31:	e8 63 37 00 00       	call   5199 <printf>
    1a36:	83 c4 10             	add    $0x10,%esp
		exit();
    1a39:	e8 7e 35 00 00       	call   4fbc <exit>
	}
	close(fd);
    1a3e:	83 ec 0c             	sub    $0xc,%esp
    1a41:	ff 75 e8             	pushl  -0x18(%ebp)
    1a44:	e8 9b 35 00 00       	call   4fe4 <close>
    1a49:	83 c4 10             	add    $0x10,%esp
}
    1a4c:	c9                   	leave  
    1a4d:	c3                   	ret    

00001a4e <h_newFile>:

void h_newFile(Point p) {
    1a4e:	55                   	push   %ebp
    1a4f:	89 e5                	mov    %esp,%ebp
    1a51:	83 ec 38             	sub    $0x38,%esp
	char nf[32] = "file.txt";
    1a54:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    1a5b:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    1a62:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    1a69:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1a70:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1a77:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    1a7e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1a85:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    1a8c:	83 ec 0c             	sub    $0xc,%esp
    1a8f:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1a92:	50                   	push   %eax
    1a93:	e8 c3 fe ff ff       	call   195b <newFile>
    1a98:	83 c4 10             	add    $0x10,%esp
	updateFileList(context);
    1a9b:	83 ec 04             	sub    $0x4,%esp
    1a9e:	ff 35 08 3f 01 00    	pushl  0x13f08
    1aa4:	ff 35 04 3f 01 00    	pushl  0x13f04
    1aaa:	ff 35 00 3f 01 00    	pushl  0x13f00
    1ab0:	e8 3a f1 ff ff       	call   bef <updateFileList>
    1ab5:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1ab8:	83 ec 04             	sub    $0x4,%esp
    1abb:	ff 35 08 3f 01 00    	pushl  0x13f08
    1ac1:	ff 35 04 3f 01 00    	pushl  0x13f04
    1ac7:	ff 35 00 3f 01 00    	pushl  0x13f00
    1acd:	e8 70 f2 ff ff       	call   d42 <drawFinderContent>
    1ad2:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1ad5:	83 ec 04             	sub    $0x4,%esp
    1ad8:	ff 35 08 3f 01 00    	pushl  0x13f08
    1ade:	ff 35 04 3f 01 00    	pushl  0x13f04
    1ae4:	ff 35 00 3f 01 00    	pushl  0x13f00
    1aea:	e8 e0 ef ff ff       	call   acf <drawFinderWnd>
    1aef:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1af2:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1af5:	83 ec 0c             	sub    $0xc,%esp
    1af8:	68 58 02 00 00       	push   $0x258
    1afd:	68 20 03 00 00       	push   $0x320
    1b02:	6a 00                	push   $0x0
    1b04:	6a 00                	push   $0x0
    1b06:	50                   	push   %eax
    1b07:	e8 c7 2c 00 00       	call   47d3 <initRect>
    1b0c:	83 c4 1c             	add    $0x1c,%esp
    1b0f:	83 ec 0c             	sub    $0xc,%esp
    1b12:	ff 75 f4             	pushl  -0xc(%ebp)
    1b15:	ff 75 f0             	pushl  -0x10(%ebp)
    1b18:	ff 75 ec             	pushl  -0x14(%ebp)
    1b1b:	ff 75 e8             	pushl  -0x18(%ebp)
    1b1e:	68 40 40 01 00       	push   $0x14040
    1b23:	e8 70 2e 00 00       	call   4998 <deleteClickable>
    1b28:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1b2b:	83 ec 0c             	sub    $0xc,%esp
    1b2e:	68 40 40 01 00       	push   $0x14040
    1b33:	e8 72 f6 ff ff       	call   11aa <addWndEvent>
    1b38:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1b3b:	83 ec 0c             	sub    $0xc,%esp
    1b3e:	68 40 40 01 00       	push   $0x14040
    1b43:	e8 07 f6 ff ff       	call   114f <addListEvent>
    1b48:	83 c4 10             	add    $0x10,%esp
}
    1b4b:	c9                   	leave  
    1b4c:	c3                   	ret    

00001b4d <newFolder>:

void newFolder(char *name) {
    1b4d:	55                   	push   %ebp
    1b4e:	89 e5                	mov    %esp,%ebp
    1b50:	83 ec 18             	sub    $0x18,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    1b53:	83 ec 0c             	sub    $0xc,%esp
    1b56:	ff 75 08             	pushl  0x8(%ebp)
    1b59:	e8 9d 32 00 00       	call   4dfb <strlen>
    1b5e:	83 c4 10             	add    $0x10,%esp
    1b61:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    1b64:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    1b6b:	eb 62                	jmp    1bcf <newFolder+0x82>
		n = strlen(name);
    1b6d:	83 ec 0c             	sub    $0xc,%esp
    1b70:	ff 75 08             	pushl  0x8(%ebp)
    1b73:	e8 83 32 00 00       	call   4dfb <strlen>
    1b78:	83 c4 10             	add    $0x10,%esp
    1b7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1b7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b81:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1b84:	75 09                	jne    1b8f <newFolder+0x42>
		{
			counter = 1;
    1b86:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1b8d:	eb 1b                	jmp    1baa <newFolder+0x5d>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1b8f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1b92:	8b 45 08             	mov    0x8(%ebp),%eax
    1b95:	01 d0                	add    %edx,%eax
    1b97:	83 ec 0c             	sub    $0xc,%esp
    1b9a:	50                   	push   %eax
    1b9b:	e8 8a 33 00 00       	call   4f2a <atoi>
    1ba0:	83 c4 10             	add    $0x10,%esp
    1ba3:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1ba6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1baa:	83 ec 0c             	sub    $0xc,%esp
    1bad:	ff 75 f4             	pushl  -0xc(%ebp)
    1bb0:	e8 13 f3 ff ff       	call   ec8 <int2str>
    1bb5:	83 c4 10             	add    $0x10,%esp
    1bb8:	89 c1                	mov    %eax,%ecx
    1bba:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1bbd:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc0:	01 d0                	add    %edx,%eax
    1bc2:	83 ec 08             	sub    $0x8,%esp
    1bc5:	51                   	push   %ecx
    1bc6:	50                   	push   %eax
    1bc7:	e8 c0 31 00 00       	call   4d8c <strcpy>
    1bcc:	83 c4 10             	add    $0x10,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    1bcf:	83 ec 0c             	sub    $0xc,%esp
    1bd2:	ff 75 08             	pushl  0x8(%ebp)
    1bd5:	e8 4a 34 00 00       	call   5024 <mkdir>
    1bda:	83 c4 10             	add    $0x10,%esp
    1bdd:	85 c0                	test   %eax,%eax
    1bdf:	78 8c                	js     1b6d <newFolder+0x20>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    1be1:	c9                   	leave  
    1be2:	c3                   	ret    

00001be3 <h_newFolder>:

void h_newFolder(Point p) {
    1be3:	55                   	push   %ebp
    1be4:	89 e5                	mov    %esp,%ebp
    1be6:	83 ec 38             	sub    $0x38,%esp
	char nf[32] = "newFolder";
    1be9:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    1bf0:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    1bf7:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    1bfe:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1c05:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1c0c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    1c13:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1c1a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    1c21:	83 ec 0c             	sub    $0xc,%esp
    1c24:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1c27:	50                   	push   %eax
    1c28:	e8 20 ff ff ff       	call   1b4d <newFolder>
    1c2d:	83 c4 10             	add    $0x10,%esp
	printf(0, "new folder!\n");
    1c30:	83 ec 08             	sub    $0x8,%esp
    1c33:	68 cb b9 00 00       	push   $0xb9cb
    1c38:	6a 00                	push   $0x0
    1c3a:	e8 5a 35 00 00       	call   5199 <printf>
    1c3f:	83 c4 10             	add    $0x10,%esp
	updateFileList(context);
    1c42:	83 ec 04             	sub    $0x4,%esp
    1c45:	ff 35 08 3f 01 00    	pushl  0x13f08
    1c4b:	ff 35 04 3f 01 00    	pushl  0x13f04
    1c51:	ff 35 00 3f 01 00    	pushl  0x13f00
    1c57:	e8 93 ef ff ff       	call   bef <updateFileList>
    1c5c:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1c5f:	e8 4c f3 ff ff       	call   fb0 <printItemList>
	drawFinderContent(context);
    1c64:	83 ec 04             	sub    $0x4,%esp
    1c67:	ff 35 08 3f 01 00    	pushl  0x13f08
    1c6d:	ff 35 04 3f 01 00    	pushl  0x13f04
    1c73:	ff 35 00 3f 01 00    	pushl  0x13f00
    1c79:	e8 c4 f0 ff ff       	call   d42 <drawFinderContent>
    1c7e:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1c81:	83 ec 04             	sub    $0x4,%esp
    1c84:	ff 35 08 3f 01 00    	pushl  0x13f08
    1c8a:	ff 35 04 3f 01 00    	pushl  0x13f04
    1c90:	ff 35 00 3f 01 00    	pushl  0x13f00
    1c96:	e8 34 ee ff ff       	call   acf <drawFinderWnd>
    1c9b:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1c9e:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1ca1:	83 ec 0c             	sub    $0xc,%esp
    1ca4:	68 58 02 00 00       	push   $0x258
    1ca9:	68 20 03 00 00       	push   $0x320
    1cae:	6a 00                	push   $0x0
    1cb0:	6a 00                	push   $0x0
    1cb2:	50                   	push   %eax
    1cb3:	e8 1b 2b 00 00       	call   47d3 <initRect>
    1cb8:	83 c4 1c             	add    $0x1c,%esp
    1cbb:	83 ec 0c             	sub    $0xc,%esp
    1cbe:	ff 75 f4             	pushl  -0xc(%ebp)
    1cc1:	ff 75 f0             	pushl  -0x10(%ebp)
    1cc4:	ff 75 ec             	pushl  -0x14(%ebp)
    1cc7:	ff 75 e8             	pushl  -0x18(%ebp)
    1cca:	68 40 40 01 00       	push   $0x14040
    1ccf:	e8 c4 2c 00 00       	call   4998 <deleteClickable>
    1cd4:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1cd7:	83 ec 0c             	sub    $0xc,%esp
    1cda:	68 40 40 01 00       	push   $0x14040
    1cdf:	e8 c6 f4 ff ff       	call   11aa <addWndEvent>
    1ce4:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1ce7:	83 ec 0c             	sub    $0xc,%esp
    1cea:	68 40 40 01 00       	push   $0x14040
    1cef:	e8 5b f4 ff ff       	call   114f <addListEvent>
    1cf4:	83 c4 10             	add    $0x10,%esp
}
    1cf7:	c9                   	leave  
    1cf8:	c3                   	ret    

00001cf9 <deleteFile>:

void deleteFile(char *name)
{
    1cf9:	55                   	push   %ebp
    1cfa:	89 e5                	mov    %esp,%ebp
    1cfc:	83 ec 18             	sub    $0x18,%esp
	printf(0, "currently having sex with %s\n", name);
    1cff:	83 ec 04             	sub    $0x4,%esp
    1d02:	ff 75 08             	pushl  0x8(%ebp)
    1d05:	68 d8 b9 00 00       	push   $0xb9d8
    1d0a:	6a 00                	push   $0x0
    1d0c:	e8 88 34 00 00       	call   5199 <printf>
    1d11:	83 c4 10             	add    $0x10,%esp
	if(unlink(name) < 0){
    1d14:	83 ec 0c             	sub    $0xc,%esp
    1d17:	ff 75 08             	pushl  0x8(%ebp)
    1d1a:	e8 ed 32 00 00       	call   500c <unlink>
    1d1f:	83 c4 10             	add    $0x10,%esp
    1d22:	85 c0                	test   %eax,%eax
    1d24:	0f 89 cb 00 00 00    	jns    1df5 <deleteFile+0xfc>
		if (chdir(name) < 0){
    1d2a:	83 ec 0c             	sub    $0xc,%esp
    1d2d:	ff 75 08             	pushl  0x8(%ebp)
    1d30:	e8 f7 32 00 00       	call   502c <chdir>
    1d35:	83 c4 10             	add    $0x10,%esp
    1d38:	85 c0                	test   %eax,%eax
    1d3a:	79 1a                	jns    1d56 <deleteFile+0x5d>
			printf(2, "rm: %s failed to delete\n", name);
    1d3c:	83 ec 04             	sub    $0x4,%esp
    1d3f:	ff 75 08             	pushl  0x8(%ebp)
    1d42:	68 f6 b9 00 00       	push   $0xb9f6
    1d47:	6a 02                	push   $0x2
    1d49:	e8 4b 34 00 00       	call   5199 <printf>
    1d4e:	83 c4 10             	add    $0x10,%esp
    1d51:	e9 9f 00 00 00       	jmp    1df5 <deleteFile+0xfc>
		}
		else{
			updateFileList(context);
    1d56:	83 ec 04             	sub    $0x4,%esp
    1d59:	ff 35 08 3f 01 00    	pushl  0x13f08
    1d5f:	ff 35 04 3f 01 00    	pushl  0x13f04
    1d65:	ff 35 00 3f 01 00    	pushl  0x13f00
    1d6b:	e8 7f ee ff ff       	call   bef <updateFileList>
    1d70:	83 c4 10             	add    $0x10,%esp
			struct fileItem *p;
			p = fileItemList;
    1d73:	a1 50 07 01 00       	mov    0x10750,%eax
    1d78:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    1d7b:	eb 37                	jmp    1db4 <deleteFile+0xbb>
				deleteFile(p->name);
    1d7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d80:	8b 40 14             	mov    0x14(%eax),%eax
    1d83:	83 ec 0c             	sub    $0xc,%esp
    1d86:	50                   	push   %eax
    1d87:	e8 6d ff ff ff       	call   1cf9 <deleteFile>
    1d8c:	83 c4 10             	add    $0x10,%esp
				updateFileList(context);
    1d8f:	83 ec 04             	sub    $0x4,%esp
    1d92:	ff 35 08 3f 01 00    	pushl  0x13f08
    1d98:	ff 35 04 3f 01 00    	pushl  0x13f04
    1d9e:	ff 35 00 3f 01 00    	pushl  0x13f00
    1da4:	e8 46 ee ff ff       	call   bef <updateFileList>
    1da9:	83 c4 10             	add    $0x10,%esp
				p = fileItemList;
    1dac:	a1 50 07 01 00       	mov    0x10750,%eax
    1db1:	89 45 f4             	mov    %eax,-0xc(%ebp)
		}
		else{
			updateFileList(context);
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
    1db4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1db8:	75 c3                	jne    1d7d <deleteFile+0x84>
				deleteFile(p->name);
				updateFileList(context);
				p = fileItemList;
			}
			chdir("..");
    1dba:	83 ec 0c             	sub    $0xc,%esp
    1dbd:	68 0f ba 00 00       	push   $0xba0f
    1dc2:	e8 65 32 00 00       	call   502c <chdir>
    1dc7:	83 c4 10             	add    $0x10,%esp
			updateFileList(context);
    1dca:	83 ec 04             	sub    $0x4,%esp
    1dcd:	ff 35 08 3f 01 00    	pushl  0x13f08
    1dd3:	ff 35 04 3f 01 00    	pushl  0x13f04
    1dd9:	ff 35 00 3f 01 00    	pushl  0x13f00
    1ddf:	e8 0b ee ff ff       	call   bef <updateFileList>
    1de4:	83 c4 10             	add    $0x10,%esp
			unlink(name);
    1de7:	83 ec 0c             	sub    $0xc,%esp
    1dea:	ff 75 08             	pushl  0x8(%ebp)
    1ded:	e8 1a 32 00 00       	call   500c <unlink>
    1df2:	83 c4 10             	add    $0x10,%esp
		}
	}
}
    1df5:	c9                   	leave  
    1df6:	c3                   	ret    

00001df7 <h_deleteFile>:
void h_deleteFile(Point p) {
    1df7:	55                   	push   %ebp
    1df8:	89 e5                	mov    %esp,%ebp
    1dfa:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    1dfd:	a1 50 07 01 00       	mov    0x10750,%eax
    1e02:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    1e05:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1e0c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1e12:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e15:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    1e18:	83 ec 08             	sub    $0x8,%esp
    1e1b:	68 12 ba 00 00       	push   $0xba12
    1e20:	6a 00                	push   $0x0
    1e22:	e8 72 33 00 00       	call   5199 <printf>
    1e27:	83 c4 10             	add    $0x10,%esp
	while (q != 0)
    1e2a:	e9 90 00 00 00       	jmp    1ebf <h_deleteFile+0xc8>
	{
		printf(0, "hi2\n");
    1e2f:	83 ec 08             	sub    $0x8,%esp
    1e32:	68 17 ba 00 00       	push   $0xba17
    1e37:	6a 00                	push   $0x0
    1e39:	e8 5b 33 00 00       	call   5199 <printf>
    1e3e:	83 c4 10             	add    $0x10,%esp
		if (q->chosen)
    1e41:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e44:	8b 40 28             	mov    0x28(%eax),%eax
    1e47:	85 c0                	test   %eax,%eax
    1e49:	74 6b                	je     1eb6 <h_deleteFile+0xbf>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    1e4b:	83 ec 0c             	sub    $0xc,%esp
    1e4e:	6a 30                	push   $0x30
    1e50:	e8 15 36 00 00       	call   546a <malloc>
    1e55:	83 c4 10             	add    $0x10,%esp
    1e58:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    1e5b:	83 ec 0c             	sub    $0xc,%esp
    1e5e:	6a 20                	push   $0x20
    1e60:	e8 05 36 00 00       	call   546a <malloc>
    1e65:	83 c4 10             	add    $0x10,%esp
    1e68:	89 c2                	mov    %eax,%edx
    1e6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e6d:	89 50 14             	mov    %edx,0x14(%eax)
			strcpy(p1->name, q->name);
    1e70:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e73:	8b 50 14             	mov    0x14(%eax),%edx
    1e76:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e79:	8b 40 14             	mov    0x14(%eax),%eax
    1e7c:	83 ec 08             	sub    $0x8,%esp
    1e7f:	52                   	push   %edx
    1e80:	50                   	push   %eax
    1e81:	e8 06 2f 00 00       	call   4d8c <strcpy>
    1e86:	83 c4 10             	add    $0x10,%esp
			if(head == 0)
    1e89:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1e8d:	75 0e                	jne    1e9d <h_deleteFile+0xa6>
			{
				head = p1;
    1e8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e92:	89 45 ec             	mov    %eax,-0x14(%ebp)
				p2 = p1;
    1e95:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e98:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1e9b:	eb 0f                	jmp    1eac <h_deleteFile+0xb5>
			} else {
				p2->next = p1;
    1e9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ea0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1ea3:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    1ea6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ea9:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
    1eac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1eaf:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
		q = q->next;
    1eb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1eb9:	8b 40 2c             	mov    0x2c(%eax),%eax
    1ebc:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
    1ebf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ec3:	0f 85 66 ff ff ff    	jne    1e2f <h_deleteFile+0x38>
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
    1ec9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ecc:	89 45 f0             	mov    %eax,-0x10(%ebp)
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    1ecf:	83 ec 08             	sub    $0x8,%esp
    1ed2:	68 1c ba 00 00       	push   $0xba1c
    1ed7:	6a 00                	push   $0x0
    1ed9:	e8 bb 32 00 00       	call   5199 <printf>
    1ede:	83 c4 10             	add    $0x10,%esp
	while (p1 != 0)
    1ee1:	eb 1b                	jmp    1efe <h_deleteFile+0x107>
	{
		deleteFile(p1->name);
    1ee3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ee6:	8b 40 14             	mov    0x14(%eax),%eax
    1ee9:	83 ec 0c             	sub    $0xc,%esp
    1eec:	50                   	push   %eax
    1eed:	e8 07 fe ff ff       	call   1cf9 <deleteFile>
    1ef2:	83 c4 10             	add    $0x10,%esp
		p1 = p1->next;
    1ef5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ef8:	8b 40 2c             	mov    0x2c(%eax),%eax
    1efb:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
    1efe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1f02:	75 df                	jne    1ee3 <h_deleteFile+0xec>
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
    1f04:	83 ec 08             	sub    $0x8,%esp
    1f07:	68 84 ba 00 00       	push   $0xba84
    1f0c:	6a 00                	push   $0x0
    1f0e:	e8 86 32 00 00       	call   5199 <printf>
    1f13:	83 c4 10             	add    $0x10,%esp
	p1 = head;
    1f16:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1f19:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while (p1 != 0) {
    1f1c:	eb 48                	jmp    1f66 <h_deleteFile+0x16f>
		p2 = p1;
    1f1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f21:	89 45 e8             	mov    %eax,-0x18(%ebp)
		printf(0, "freeing %s\n", p2->name);
    1f24:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f27:	8b 40 14             	mov    0x14(%eax),%eax
    1f2a:	83 ec 04             	sub    $0x4,%esp
    1f2d:	50                   	push   %eax
    1f2e:	68 9a ba 00 00       	push   $0xba9a
    1f33:	6a 00                	push   $0x0
    1f35:	e8 5f 32 00 00       	call   5199 <printf>
    1f3a:	83 c4 10             	add    $0x10,%esp
		p1 = p1->next;
    1f3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f40:	8b 40 2c             	mov    0x2c(%eax),%eax
    1f43:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    1f46:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f49:	8b 40 14             	mov    0x14(%eax),%eax
    1f4c:	83 ec 0c             	sub    $0xc,%esp
    1f4f:	50                   	push   %eax
    1f50:	e8 d4 33 00 00       	call   5329 <free>
    1f55:	83 c4 10             	add    $0x10,%esp
		free(p2);
    1f58:	83 ec 0c             	sub    $0xc,%esp
    1f5b:	ff 75 e8             	pushl  -0x18(%ebp)
    1f5e:	e8 c6 33 00 00       	call   5329 <free>
    1f63:	83 c4 10             	add    $0x10,%esp
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
    1f66:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1f6a:	75 b2                	jne    1f1e <h_deleteFile+0x127>
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
    1f6c:	83 ec 08             	sub    $0x8,%esp
    1f6f:	68 a6 ba 00 00       	push   $0xbaa6
    1f74:	6a 00                	push   $0x0
    1f76:	e8 1e 32 00 00       	call   5199 <printf>
    1f7b:	83 c4 10             	add    $0x10,%esp
	updateFileList(context);
    1f7e:	83 ec 04             	sub    $0x4,%esp
    1f81:	ff 35 08 3f 01 00    	pushl  0x13f08
    1f87:	ff 35 04 3f 01 00    	pushl  0x13f04
    1f8d:	ff 35 00 3f 01 00    	pushl  0x13f00
    1f93:	e8 57 ec ff ff       	call   bef <updateFileList>
    1f98:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1f9b:	e8 10 f0 ff ff       	call   fb0 <printItemList>
	drawFinderContent(context);
    1fa0:	83 ec 04             	sub    $0x4,%esp
    1fa3:	ff 35 08 3f 01 00    	pushl  0x13f08
    1fa9:	ff 35 04 3f 01 00    	pushl  0x13f04
    1faf:	ff 35 00 3f 01 00    	pushl  0x13f00
    1fb5:	e8 88 ed ff ff       	call   d42 <drawFinderContent>
    1fba:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1fbd:	83 ec 04             	sub    $0x4,%esp
    1fc0:	ff 35 08 3f 01 00    	pushl  0x13f08
    1fc6:	ff 35 04 3f 01 00    	pushl  0x13f04
    1fcc:	ff 35 00 3f 01 00    	pushl  0x13f00
    1fd2:	e8 f8 ea ff ff       	call   acf <drawFinderWnd>
    1fd7:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1fda:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1fdd:	83 ec 0c             	sub    $0xc,%esp
    1fe0:	68 58 02 00 00       	push   $0x258
    1fe5:	68 20 03 00 00       	push   $0x320
    1fea:	6a 00                	push   $0x0
    1fec:	6a 00                	push   $0x0
    1fee:	50                   	push   %eax
    1fef:	e8 df 27 00 00       	call   47d3 <initRect>
    1ff4:	83 c4 1c             	add    $0x1c,%esp
    1ff7:	83 ec 0c             	sub    $0xc,%esp
    1ffa:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ffd:	ff 75 e0             	pushl  -0x20(%ebp)
    2000:	ff 75 dc             	pushl  -0x24(%ebp)
    2003:	ff 75 d8             	pushl  -0x28(%ebp)
    2006:	68 40 40 01 00       	push   $0x14040
    200b:	e8 88 29 00 00       	call   4998 <deleteClickable>
    2010:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    2013:	83 ec 0c             	sub    $0xc,%esp
    2016:	68 40 40 01 00       	push   $0x14040
    201b:	e8 8a f1 ff ff       	call   11aa <addWndEvent>
    2020:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    2023:	83 ec 0c             	sub    $0xc,%esp
    2026:	68 40 40 01 00       	push   $0x14040
    202b:	e8 1f f1 ff ff       	call   114f <addListEvent>
    2030:	83 c4 10             	add    $0x10,%esp
}
    2033:	c9                   	leave  
    2034:	c3                   	ret    

00002035 <saveRename>:

void saveRename(){
    2035:	55                   	push   %ebp
    2036:	89 e5                	mov    %esp,%ebp
    2038:	53                   	push   %ebx
    2039:	81 ec 14 02 00 00    	sub    $0x214,%esp
	char tempName[MAX_NAME_LEN];
	char tempNameFrom[MAX_NAME_LEN];
	int i;
	strcpy(tempNameFrom, currentPath);
    203f:	83 ec 08             	sub    $0x8,%esp
    2042:	68 40 3f 01 00       	push   $0x13f40
    2047:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    204d:	50                   	push   %eax
    204e:	e8 39 2d 00 00       	call   4d8c <strcpy>
    2053:	83 c4 10             	add    $0x10,%esp
	strcpy(tempName, currentlyRenaming->name);
    2056:	a1 4c 07 01 00       	mov    0x1074c,%eax
    205b:	8b 40 14             	mov    0x14(%eax),%eax
    205e:	83 ec 08             	sub    $0x8,%esp
    2061:	50                   	push   %eax
    2062:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    2068:	50                   	push   %eax
    2069:	e8 1e 2d 00 00       	call   4d8c <strcpy>
    206e:	83 c4 10             	add    $0x10,%esp
	strcpy(tempNameFrom + strlen(tempNameFrom), renameFrom);
    2071:	83 ec 0c             	sub    $0xc,%esp
    2074:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    207a:	50                   	push   %eax
    207b:	e8 7b 2d 00 00       	call   4dfb <strlen>
    2080:	83 c4 10             	add    $0x10,%esp
    2083:	89 c2                	mov    %eax,%edx
    2085:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    208b:	01 d0                	add    %edx,%eax
    208d:	83 ec 08             	sub    $0x8,%esp
    2090:	68 00 3e 01 00       	push   $0x13e00
    2095:	50                   	push   %eax
    2096:	e8 f1 2c 00 00       	call   4d8c <strcpy>
    209b:	83 c4 10             	add    $0x10,%esp
	printf(0, "why? %s", tempName);
    209e:	83 ec 04             	sub    $0x4,%esp
    20a1:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    20a7:	50                   	push   %eax
    20a8:	68 b8 ba 00 00       	push   $0xbab8
    20ad:	6a 00                	push   $0x0
    20af:	e8 e5 30 00 00       	call   5199 <printf>
    20b4:	83 c4 10             	add    $0x10,%esp
	if(currentlyRenaming->st.type != T_DIR){
    20b7:	a1 4c 07 01 00       	mov    0x1074c,%eax
    20bc:	0f b7 00             	movzwl (%eax),%eax
    20bf:	66 83 f8 01          	cmp    $0x1,%ax
    20c3:	0f 84 8c 00 00 00    	je     2155 <saveRename+0x120>
		for(i = 0; i < strlen(tempName); i++){
    20c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    20d0:	eb 4e                	jmp    2120 <saveRename+0xeb>
			if(tempName[i] == '.'){
    20d2:	8d 95 f4 fe ff ff    	lea    -0x10c(%ebp),%edx
    20d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20db:	01 d0                	add    %edx,%eax
    20dd:	0f b6 00             	movzbl (%eax),%eax
    20e0:	3c 2e                	cmp    $0x2e,%al
    20e2:	75 38                	jne    211c <saveRename+0xe7>
				if(pasteJustFile(tempNameFrom, tempName)){
    20e4:	83 ec 08             	sub    $0x8,%esp
    20e7:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    20ed:	50                   	push   %eax
    20ee:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    20f4:	50                   	push   %eax
    20f5:	e8 4c 03 00 00       	call   2446 <pasteJustFile>
    20fa:	83 c4 10             	add    $0x10,%esp
    20fd:	85 c0                	test   %eax,%eax
    20ff:	0f 84 98 00 00 00    	je     219d <saveRename+0x168>
					deleteFile(tempNameFrom);
    2105:	83 ec 0c             	sub    $0xc,%esp
    2108:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    210e:	50                   	push   %eax
    210f:	e8 e5 fb ff ff       	call   1cf9 <deleteFile>
    2114:	83 c4 10             	add    $0x10,%esp
				}
				return;
    2117:	e9 81 00 00 00       	jmp    219d <saveRename+0x168>
	strcpy(tempNameFrom, currentPath);
	strcpy(tempName, currentlyRenaming->name);
	strcpy(tempNameFrom + strlen(tempNameFrom), renameFrom);
	printf(0, "why? %s", tempName);
	if(currentlyRenaming->st.type != T_DIR){
		for(i = 0; i < strlen(tempName); i++){
    211c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2120:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    2123:	83 ec 0c             	sub    $0xc,%esp
    2126:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    212c:	50                   	push   %eax
    212d:	e8 c9 2c 00 00       	call   4dfb <strlen>
    2132:	83 c4 10             	add    $0x10,%esp
    2135:	39 c3                	cmp    %eax,%ebx
    2137:	72 99                	jb     20d2 <saveRename+0x9d>
					deleteFile(tempNameFrom);
				}
				return;
			}
		}
		tempName[i] = '.';
    2139:	8d 95 f4 fe ff ff    	lea    -0x10c(%ebp),%edx
    213f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2142:	01 d0                	add    %edx,%eax
    2144:	c6 00 2e             	movb   $0x2e,(%eax)
		tempName[i + 1] = 0;
    2147:	8b 45 f4             	mov    -0xc(%ebp),%eax
    214a:	83 c0 01             	add    $0x1,%eax
    214d:	c6 84 05 f4 fe ff ff 	movb   $0x0,-0x10c(%ebp,%eax,1)
    2154:	00 
	}
	printf(0, "renameFrom is %s\n", tempNameFrom);
    2155:	83 ec 04             	sub    $0x4,%esp
    2158:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    215e:	50                   	push   %eax
    215f:	68 c0 ba 00 00       	push   $0xbac0
    2164:	6a 00                	push   $0x0
    2166:	e8 2e 30 00 00       	call   5199 <printf>
    216b:	83 c4 10             	add    $0x10,%esp
	if(pasteJustFile(tempNameFrom, tempName))
    216e:	83 ec 08             	sub    $0x8,%esp
    2171:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    2177:	50                   	push   %eax
    2178:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    217e:	50                   	push   %eax
    217f:	e8 c2 02 00 00       	call   2446 <pasteJustFile>
    2184:	83 c4 10             	add    $0x10,%esp
    2187:	85 c0                	test   %eax,%eax
    2189:	74 12                	je     219d <saveRename+0x168>
		deleteFile(tempNameFrom);
    218b:	83 ec 0c             	sub    $0xc,%esp
    218e:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    2194:	50                   	push   %eax
    2195:	e8 5f fb ff ff       	call   1cf9 <deleteFile>
    219a:	83 c4 10             	add    $0x10,%esp
}
    219d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    21a0:	c9                   	leave  
    21a1:	c3                   	ret    

000021a2 <unrename>:

void unrename(){
    21a2:	55                   	push   %ebp
    21a3:	89 e5                	mov    %esp,%ebp
    21a5:	83 ec 18             	sub    $0x18,%esp
	printf(0, "renaming! currentlyRenaming: %s\n", currentlyRenaming->name);
    21a8:	a1 4c 07 01 00       	mov    0x1074c,%eax
    21ad:	8b 40 14             	mov    0x14(%eax),%eax
    21b0:	83 ec 04             	sub    $0x4,%esp
    21b3:	50                   	push   %eax
    21b4:	68 d4 ba 00 00       	push   $0xbad4
    21b9:	6a 00                	push   $0x0
    21bb:	e8 d9 2f 00 00       	call   5199 <printf>
    21c0:	83 c4 10             	add    $0x10,%esp
	saveRename();
    21c3:	e8 6d fe ff ff       	call   2035 <saveRename>
	currentlyRenaming->chosen = 1;
    21c8:	a1 4c 07 01 00       	mov    0x1074c,%eax
    21cd:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	currentlyRenaming = 0;
    21d4:	c7 05 4c 07 01 00 00 	movl   $0x0,0x1074c
    21db:	00 00 00 
	renaming = 0;
    21de:	c7 05 54 40 01 00 00 	movl   $0x0,0x14054
    21e5:	00 00 00 
	freeFileItemList();
    21e8:	e8 b0 e1 ff ff       	call   39d <freeFileItemList>
	list(".");
    21ed:	83 ec 0c             	sub    $0xc,%esp
    21f0:	68 c8 b8 00 00       	push   $0xb8c8
    21f5:	e8 8d e2 ff ff       	call   487 <list>
    21fa:	83 c4 10             	add    $0x10,%esp
	printItemList();
    21fd:	e8 ae ed ff ff       	call   fb0 <printItemList>
	drawFinderContent(context);
    2202:	83 ec 04             	sub    $0x4,%esp
    2205:	ff 35 08 3f 01 00    	pushl  0x13f08
    220b:	ff 35 04 3f 01 00    	pushl  0x13f04
    2211:	ff 35 00 3f 01 00    	pushl  0x13f00
    2217:	e8 26 eb ff ff       	call   d42 <drawFinderContent>
    221c:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    221f:	83 ec 04             	sub    $0x4,%esp
    2222:	ff 35 08 3f 01 00    	pushl  0x13f08
    2228:	ff 35 04 3f 01 00    	pushl  0x13f04
    222e:	ff 35 00 3f 01 00    	pushl  0x13f00
    2234:	e8 96 e8 ff ff       	call   acf <drawFinderWnd>
    2239:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    223c:	8d 45 e8             	lea    -0x18(%ebp),%eax
    223f:	83 ec 0c             	sub    $0xc,%esp
    2242:	68 58 02 00 00       	push   $0x258
    2247:	68 20 03 00 00       	push   $0x320
    224c:	6a 00                	push   $0x0
    224e:	6a 00                	push   $0x0
    2250:	50                   	push   %eax
    2251:	e8 7d 25 00 00       	call   47d3 <initRect>
    2256:	83 c4 1c             	add    $0x1c,%esp
    2259:	83 ec 0c             	sub    $0xc,%esp
    225c:	ff 75 f4             	pushl  -0xc(%ebp)
    225f:	ff 75 f0             	pushl  -0x10(%ebp)
    2262:	ff 75 ec             	pushl  -0x14(%ebp)
    2265:	ff 75 e8             	pushl  -0x18(%ebp)
    2268:	68 40 40 01 00       	push   $0x14040
    226d:	e8 26 27 00 00       	call   4998 <deleteClickable>
    2272:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    2275:	83 ec 0c             	sub    $0xc,%esp
    2278:	68 40 40 01 00       	push   $0x14040
    227d:	e8 28 ef ff ff       	call   11aa <addWndEvent>
    2282:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    2285:	83 ec 0c             	sub    $0xc,%esp
    2288:	68 40 40 01 00       	push   $0x14040
    228d:	e8 bd ee ff ff       	call   114f <addListEvent>
    2292:	83 c4 10             	add    $0x10,%esp
}
    2295:	c9                   	leave  
    2296:	c3                   	ret    

00002297 <copyFile>:

void copyFile(){
    2297:	55                   	push   %ebp
    2298:	89 e5                	mov    %esp,%ebp
    229a:	56                   	push   %esi
    229b:	53                   	push   %ebx
    229c:	83 ec 10             	sub    $0x10,%esp
	int fd;
	struct fileItem *p = fileItemList;
    229f:	a1 50 07 01 00       	mov    0x10750,%eax
    22a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    22a7:	e9 07 01 00 00       	jmp    23b3 <copyFile+0x11c>
		if (p->chosen == 1){
    22ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22af:	8b 40 28             	mov    0x28(%eax),%eax
    22b2:	83 f8 01             	cmp    $0x1,%eax
    22b5:	0f 85 ef 00 00 00    	jne    23aa <copyFile+0x113>
			if(lenOfWaited >= MAX_COPY_SIZE){
    22bb:	a1 58 40 01 00       	mov    0x14058,%eax
    22c0:	83 f8 07             	cmp    $0x7,%eax
    22c3:	7e 1d                	jle    22e2 <copyFile+0x4b>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    22c5:	a1 58 40 01 00       	mov    0x14058,%eax
    22ca:	83 ec 04             	sub    $0x4,%esp
    22cd:	50                   	push   %eax
    22ce:	68 f5 ba 00 00       	push   $0xbaf5
    22d3:	6a 00                	push   $0x0
    22d5:	e8 bf 2e 00 00       	call   5199 <printf>
    22da:	83 c4 10             	add    $0x10,%esp
    22dd:	e9 c8 00 00 00       	jmp    23aa <copyFile+0x113>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    22e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22e5:	8b 40 14             	mov    0x14(%eax),%eax
    22e8:	83 ec 08             	sub    $0x8,%esp
    22eb:	6a 00                	push   $0x0
    22ed:	50                   	push   %eax
    22ee:	e8 09 2d 00 00       	call   4ffc <open>
    22f3:	83 c4 10             	add    $0x10,%esp
    22f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    22f9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    22fd:	0f 88 8e 00 00 00    	js     2391 <copyFile+0xfa>
					strcpy(filesWaited[lenOfWaited], currentPath);
    2303:	a1 58 40 01 00       	mov    0x14058,%eax
    2308:	c1 e0 08             	shl    $0x8,%eax
    230b:	05 00 36 01 00       	add    $0x13600,%eax
    2310:	83 ec 08             	sub    $0x8,%esp
    2313:	68 40 3f 01 00       	push   $0x13f40
    2318:	50                   	push   %eax
    2319:	e8 6e 2a 00 00       	call   4d8c <strcpy>
    231e:	83 c4 10             	add    $0x10,%esp
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    2321:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2324:	8b 58 14             	mov    0x14(%eax),%ebx
    2327:	a1 58 40 01 00       	mov    0x14058,%eax
    232c:	c1 e0 08             	shl    $0x8,%eax
    232f:	8d b0 00 36 01 00    	lea    0x13600(%eax),%esi
    2335:	83 ec 0c             	sub    $0xc,%esp
    2338:	68 40 3f 01 00       	push   $0x13f40
    233d:	e8 b9 2a 00 00       	call   4dfb <strlen>
    2342:	83 c4 10             	add    $0x10,%esp
    2345:	01 f0                	add    %esi,%eax
    2347:	83 ec 08             	sub    $0x8,%esp
    234a:	53                   	push   %ebx
    234b:	50                   	push   %eax
    234c:	e8 3b 2a 00 00       	call   4d8c <strcpy>
    2351:	83 c4 10             	add    $0x10,%esp
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    2354:	a1 58 40 01 00       	mov    0x14058,%eax
    2359:	c1 e0 08             	shl    $0x8,%eax
    235c:	05 00 36 01 00       	add    $0x13600,%eax
    2361:	83 ec 04             	sub    $0x4,%esp
    2364:	50                   	push   %eax
    2365:	68 10 bb 00 00       	push   $0xbb10
    236a:	6a 00                	push   $0x0
    236c:	e8 28 2e 00 00       	call   5199 <printf>
    2371:	83 c4 10             	add    $0x10,%esp
					lenOfWaited++;
    2374:	a1 58 40 01 00       	mov    0x14058,%eax
    2379:	83 c0 01             	add    $0x1,%eax
    237c:	a3 58 40 01 00       	mov    %eax,0x14058
					close(fd);
    2381:	83 ec 0c             	sub    $0xc,%esp
    2384:	ff 75 f0             	pushl  -0x10(%ebp)
    2387:	e8 58 2c 00 00       	call   4fe4 <close>
    238c:	83 c4 10             	add    $0x10,%esp
    238f:	eb 19                	jmp    23aa <copyFile+0x113>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    2391:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2394:	8b 40 14             	mov    0x14(%eax),%eax
    2397:	83 ec 04             	sub    $0x4,%esp
    239a:	50                   	push   %eax
    239b:	68 26 bb 00 00       	push   $0xbb26
    23a0:	6a 00                	push   $0x0
    23a2:	e8 f2 2d 00 00       	call   5199 <printf>
    23a7:	83 c4 10             	add    $0x10,%esp
				}
			}
		}
		p = p->next;
    23aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23ad:	8b 40 2c             	mov    0x2c(%eax),%eax
    23b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    23b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    23b7:	0f 85 ef fe ff ff    	jne    22ac <copyFile+0x15>
				}
			}
		}
		p = p->next;
	}
}
    23bd:	8d 65 f8             	lea    -0x8(%ebp),%esp
    23c0:	5b                   	pop    %ebx
    23c1:	5e                   	pop    %esi
    23c2:	5d                   	pop    %ebp
    23c3:	c3                   	ret    

000023c4 <h_copyFile>:

void h_copyFile(Point p){
    23c4:	55                   	push   %ebp
    23c5:	89 e5                	mov    %esp,%ebp
    23c7:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 0;
    23ca:	c7 05 44 07 01 00 00 	movl   $0x0,0x10744
    23d1:	00 00 00 
	lenOfWaited = 0;
    23d4:	c7 05 58 40 01 00 00 	movl   $0x0,0x14058
    23db:	00 00 00 
	copyFile();
    23de:	e8 b4 fe ff ff       	call   2297 <copyFile>
}
    23e3:	c9                   	leave  
    23e4:	c3                   	ret    

000023e5 <moveFile>:

void moveFile(){
    23e5:	55                   	push   %ebp
    23e6:	89 e5                	mov    %esp,%ebp
    23e8:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < lenOfWaited; i++)
    23eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    23f2:	eb 1b                	jmp    240f <moveFile+0x2a>
		deleteFile(filesWaited[i]);
    23f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23f7:	c1 e0 08             	shl    $0x8,%eax
    23fa:	05 00 36 01 00       	add    $0x13600,%eax
    23ff:	83 ec 0c             	sub    $0xc,%esp
    2402:	50                   	push   %eax
    2403:	e8 f1 f8 ff ff       	call   1cf9 <deleteFile>
    2408:	83 c4 10             	add    $0x10,%esp
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
    240b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    240f:	a1 58 40 01 00       	mov    0x14058,%eax
    2414:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    2417:	7c db                	jl     23f4 <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    2419:	c7 05 58 40 01 00 00 	movl   $0x0,0x14058
    2420:	00 00 00 
}
    2423:	c9                   	leave  
    2424:	c3                   	ret    

00002425 <h_cutFile>:

void h_cutFile(Point p){
    2425:	55                   	push   %ebp
    2426:	89 e5                	mov    %esp,%ebp
    2428:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 1;
    242b:	c7 05 44 07 01 00 01 	movl   $0x1,0x10744
    2432:	00 00 00 
	lenOfWaited = 0;
    2435:	c7 05 58 40 01 00 00 	movl   $0x0,0x14058
    243c:	00 00 00 
	copyFile();
    243f:	e8 53 fe ff ff       	call   2297 <copyFile>
}
    2444:	c9                   	leave  
    2445:	c3                   	ret    

00002446 <pasteJustFile>:

int pasteJustFile(char *src, char *filename){
    2446:	55                   	push   %ebp
    2447:	89 e5                	mov    %esp,%ebp
    2449:	81 ec 28 02 00 00    	sub    $0x228,%esp
	printf(0, "currentPath: %s, copying from %s, to %s~\n", currentPath, src, filename);
    244f:	83 ec 0c             	sub    $0xc,%esp
    2452:	ff 75 0c             	pushl  0xc(%ebp)
    2455:	ff 75 08             	pushl  0x8(%ebp)
    2458:	68 40 3f 01 00       	push   $0x13f40
    245d:	68 3c bb 00 00       	push   $0xbb3c
    2462:	6a 00                	push   $0x0
    2464:	e8 30 2d 00 00       	call   5199 <printf>
    2469:	83 c4 20             	add    $0x20,%esp
	int size = 0;
    246c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	int file_src, file_dest;
	struct fileItem *p;
	struct fileItem *p1, *head, *p2;
	char* buff = (char*)malloc(4096 * sizeof(char));
    2473:	83 ec 0c             	sub    $0xc,%esp
    2476:	68 00 10 00 00       	push   $0x1000
    247b:	e8 ea 2f 00 00       	call   546a <malloc>
    2480:	83 c4 10             	add    $0x10,%esp
    2483:	89 45 d8             	mov    %eax,-0x28(%ebp)
	char tempSrc[MAX_NAME_LEN];
	char tempName[MAX_NAME_LEN];
	memset(tempName, '\0', sizeof(tempName)/sizeof(char));
    2486:	83 ec 04             	sub    $0x4,%esp
    2489:	68 00 01 00 00       	push   $0x100
    248e:	6a 00                	push   $0x0
    2490:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2496:	50                   	push   %eax
    2497:	e8 86 29 00 00       	call   4e22 <memset>
    249c:	83 c4 10             	add    $0x10,%esp
	memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
    249f:	83 ec 04             	sub    $0x4,%esp
    24a2:	68 00 01 00 00       	push   $0x100
    24a7:	6a 00                	push   $0x0
    24a9:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    24af:	50                   	push   %eax
    24b0:	e8 6d 29 00 00       	call   4e22 <memset>
    24b5:	83 c4 10             	add    $0x10,%esp
	memset(buff, 0, 4096);
    24b8:	83 ec 04             	sub    $0x4,%esp
    24bb:	68 00 10 00 00       	push   $0x1000
    24c0:	6a 00                	push   $0x0
    24c2:	ff 75 d8             	pushl  -0x28(%ebp)
    24c5:	e8 58 29 00 00       	call   4e22 <memset>
    24ca:	83 c4 10             	add    $0x10,%esp
	if(chdir(filename) >= 0){
    24cd:	83 ec 0c             	sub    $0xc,%esp
    24d0:	ff 75 0c             	pushl  0xc(%ebp)
    24d3:	e8 54 2b 00 00       	call   502c <chdir>
    24d8:	83 c4 10             	add    $0x10,%esp
    24db:	85 c0                	test   %eax,%eax
    24dd:	78 3d                	js     251c <pasteJustFile+0xd6>
		printf(0, "Directory %s already exist\n", filename);
    24df:	83 ec 04             	sub    $0x4,%esp
    24e2:	ff 75 0c             	pushl  0xc(%ebp)
    24e5:	68 66 bb 00 00       	push   $0xbb66
    24ea:	6a 00                	push   $0x0
    24ec:	e8 a8 2c 00 00       	call   5199 <printf>
    24f1:	83 c4 10             	add    $0x10,%esp
		free(buff);
    24f4:	83 ec 0c             	sub    $0xc,%esp
    24f7:	ff 75 d8             	pushl  -0x28(%ebp)
    24fa:	e8 2a 2e 00 00       	call   5329 <free>
    24ff:	83 c4 10             	add    $0x10,%esp
		chdir("..");
    2502:	83 ec 0c             	sub    $0xc,%esp
    2505:	68 0f ba 00 00       	push   $0xba0f
    250a:	e8 1d 2b 00 00       	call   502c <chdir>
    250f:	83 c4 10             	add    $0x10,%esp
		return 0;
    2512:	b8 00 00 00 00       	mov    $0x0,%eax
    2517:	e9 ee 03 00 00       	jmp    290a <pasteJustFile+0x4c4>
	}
	else if(chdir(src) >= 0){
    251c:	83 ec 0c             	sub    $0xc,%esp
    251f:	ff 75 08             	pushl  0x8(%ebp)
    2522:	e8 05 2b 00 00       	call   502c <chdir>
    2527:	83 c4 10             	add    $0x10,%esp
    252a:	85 c0                	test   %eax,%eax
    252c:	0f 88 8b 02 00 00    	js     27bd <pasteJustFile+0x377>
		freeFileItemList();
    2532:	e8 66 de ff ff       	call   39d <freeFileItemList>
		list(".");
    2537:	83 ec 0c             	sub    $0xc,%esp
    253a:	68 c8 b8 00 00       	push   $0xb8c8
    253f:	e8 43 df ff ff       	call   487 <list>
    2544:	83 c4 10             	add    $0x10,%esp
		chdir(currentPath);
    2547:	83 ec 0c             	sub    $0xc,%esp
    254a:	68 40 3f 01 00       	push   $0x13f40
    254f:	e8 d8 2a 00 00       	call   502c <chdir>
    2554:	83 c4 10             	add    $0x10,%esp
		mkdir(filename);
    2557:	83 ec 0c             	sub    $0xc,%esp
    255a:	ff 75 0c             	pushl  0xc(%ebp)
    255d:	e8 c2 2a 00 00       	call   5024 <mkdir>
    2562:	83 c4 10             	add    $0x10,%esp
		updatePath(filename);
    2565:	83 ec 0c             	sub    $0xc,%esp
    2568:	ff 75 0c             	pushl  0xc(%ebp)
    256b:	e8 90 f1 ff ff       	call   1700 <updatePath>
    2570:	83 c4 10             	add    $0x10,%esp
		chdir(currentPath);
    2573:	83 ec 0c             	sub    $0xc,%esp
    2576:	68 40 3f 01 00       	push   $0x13f40
    257b:	e8 ac 2a 00 00       	call   502c <chdir>
    2580:	83 c4 10             	add    $0x10,%esp
        head = p1 = p2 = 0;
    2583:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    258a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    258d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2590:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2593:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        p = fileItemList;
    2596:	a1 50 07 01 00       	mov    0x10750,%eax
    259b:	89 45 ec             	mov    %eax,-0x14(%ebp)
	    printf(0, "hello1\n");
    259e:	83 ec 08             	sub    $0x8,%esp
    25a1:	68 82 bb 00 00       	push   $0xbb82
    25a6:	6a 00                	push   $0x0
    25a8:	e8 ec 2b 00 00       	call   5199 <printf>
    25ad:	83 c4 10             	add    $0x10,%esp
		while (p != 0)
    25b0:	e9 86 00 00 00       	jmp    263b <pasteJustFile+0x1f5>
		{
			printf(0, "hello2\n");
    25b5:	83 ec 08             	sub    $0x8,%esp
    25b8:	68 8a bb 00 00       	push   $0xbb8a
    25bd:	6a 00                	push   $0x0
    25bf:	e8 d5 2b 00 00       	call   5199 <printf>
    25c4:	83 c4 10             	add    $0x10,%esp
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    25c7:	83 ec 0c             	sub    $0xc,%esp
    25ca:	6a 30                	push   $0x30
    25cc:	e8 99 2e 00 00       	call   546a <malloc>
    25d1:	83 c4 10             	add    $0x10,%esp
    25d4:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    25d7:	83 ec 0c             	sub    $0xc,%esp
    25da:	6a 20                	push   $0x20
    25dc:	e8 89 2e 00 00       	call   546a <malloc>
    25e1:	83 c4 10             	add    $0x10,%esp
    25e4:	89 c2                	mov    %eax,%edx
    25e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    25e9:	89 50 14             	mov    %edx,0x14(%eax)
			strcpy(p1->name, p->name);
    25ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
    25ef:	8b 50 14             	mov    0x14(%eax),%edx
    25f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    25f5:	8b 40 14             	mov    0x14(%eax),%eax
    25f8:	83 ec 08             	sub    $0x8,%esp
    25fb:	52                   	push   %edx
    25fc:	50                   	push   %eax
    25fd:	e8 8a 27 00 00       	call   4d8c <strcpy>
    2602:	83 c4 10             	add    $0x10,%esp
			if(head == 0)
    2605:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2609:	75 0e                	jne    2619 <pasteJustFile+0x1d3>
			{
				head = p1;
    260b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    260e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				p2 = p1;
    2611:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2614:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2617:	eb 0f                	jmp    2628 <pasteJustFile+0x1e2>
			} else {
				p2->next = p1;
    2619:	8b 45 e0             	mov    -0x20(%ebp),%eax
    261c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    261f:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    2622:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2625:	89 45 e0             	mov    %eax,-0x20(%ebp)
			}
			p1->next = 0;
    2628:	8b 45 e8             	mov    -0x18(%ebp),%eax
    262b:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
			p = p->next;
    2632:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2635:	8b 40 2c             	mov    0x2c(%eax),%eax
    2638:	89 45 ec             	mov    %eax,-0x14(%ebp)
		updatePath(filename);
		chdir(currentPath);
        head = p1 = p2 = 0;
        p = fileItemList;
	    printf(0, "hello1\n");
		while (p != 0)
    263b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    263f:	0f 85 70 ff ff ff    	jne    25b5 <pasteJustFile+0x16f>
				p2 = p1;
			}
			p1->next = 0;
			p = p->next;
		}
		p1 = head;
    2645:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2648:	89 45 e8             	mov    %eax,-0x18(%ebp)
		while(p1 != 0){
    264b:	e9 e8 00 00 00       	jmp    2738 <pasteJustFile+0x2f2>
			strcpy(tempSrc, src);
    2650:	83 ec 08             	sub    $0x8,%esp
    2653:	ff 75 08             	pushl  0x8(%ebp)
    2656:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    265c:	50                   	push   %eax
    265d:	e8 2a 27 00 00       	call   4d8c <strcpy>
    2662:	83 c4 10             	add    $0x10,%esp
			strcpy(tempName, p1->name);
    2665:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2668:	8b 40 14             	mov    0x14(%eax),%eax
    266b:	83 ec 08             	sub    $0x8,%esp
    266e:	50                   	push   %eax
    266f:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2675:	50                   	push   %eax
    2676:	e8 11 27 00 00       	call   4d8c <strcpy>
    267b:	83 c4 10             	add    $0x10,%esp
			tempSrc[strlen(tempSrc) + 1] = 0;
    267e:	83 ec 0c             	sub    $0xc,%esp
    2681:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2687:	50                   	push   %eax
    2688:	e8 6e 27 00 00       	call   4dfb <strlen>
    268d:	83 c4 10             	add    $0x10,%esp
    2690:	83 c0 01             	add    $0x1,%eax
    2693:	c6 84 05 d8 fe ff ff 	movb   $0x0,-0x128(%ebp,%eax,1)
    269a:	00 
			tempSrc[strlen(tempSrc)] = '/';
    269b:	83 ec 0c             	sub    $0xc,%esp
    269e:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    26a4:	50                   	push   %eax
    26a5:	e8 51 27 00 00       	call   4dfb <strlen>
    26aa:	83 c4 10             	add    $0x10,%esp
    26ad:	c6 84 05 d8 fe ff ff 	movb   $0x2f,-0x128(%ebp,%eax,1)
    26b4:	2f 
			strcpy(tempSrc+strlen(tempSrc), tempName);
    26b5:	83 ec 0c             	sub    $0xc,%esp
    26b8:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    26be:	50                   	push   %eax
    26bf:	e8 37 27 00 00       	call   4dfb <strlen>
    26c4:	83 c4 10             	add    $0x10,%esp
    26c7:	89 c2                	mov    %eax,%edx
    26c9:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    26cf:	01 c2                	add    %eax,%edx
    26d1:	83 ec 08             	sub    $0x8,%esp
    26d4:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    26da:	50                   	push   %eax
    26db:	52                   	push   %edx
    26dc:	e8 ab 26 00 00       	call   4d8c <strcpy>
    26e1:	83 c4 10             	add    $0x10,%esp
			pasteJustFile(tempSrc, tempName);
    26e4:	83 ec 08             	sub    $0x8,%esp
    26e7:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    26ed:	50                   	push   %eax
    26ee:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    26f4:	50                   	push   %eax
    26f5:	e8 4c fd ff ff       	call   2446 <pasteJustFile>
    26fa:	83 c4 10             	add    $0x10,%esp
			memset(tempName, '\0', sizeof(tempName)/sizeof(char));
    26fd:	83 ec 04             	sub    $0x4,%esp
    2700:	68 00 01 00 00       	push   $0x100
    2705:	6a 00                	push   $0x0
    2707:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    270d:	50                   	push   %eax
    270e:	e8 0f 27 00 00       	call   4e22 <memset>
    2713:	83 c4 10             	add    $0x10,%esp
			memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
    2716:	83 ec 04             	sub    $0x4,%esp
    2719:	68 00 01 00 00       	push   $0x100
    271e:	6a 00                	push   $0x0
    2720:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2726:	50                   	push   %eax
    2727:	e8 f6 26 00 00       	call   4e22 <memset>
    272c:	83 c4 10             	add    $0x10,%esp
			p1 = p1->next;
    272f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2732:	8b 40 2c             	mov    0x2c(%eax),%eax
    2735:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
			p = p->next;
		}
		p1 = head;
		while(p1 != 0){
    2738:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    273c:	0f 85 0e ff ff ff    	jne    2650 <pasteJustFile+0x20a>
			pasteJustFile(tempSrc, tempName);
			memset(tempName, '\0', sizeof(tempName)/sizeof(char));
			memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
			p1 = p1->next;
		}
		chdir("..");
    2742:	83 ec 0c             	sub    $0xc,%esp
    2745:	68 0f ba 00 00       	push   $0xba0f
    274a:	e8 dd 28 00 00       	call   502c <chdir>
    274f:	83 c4 10             	add    $0x10,%esp
		updatePath("..");
    2752:	83 ec 0c             	sub    $0xc,%esp
    2755:	68 0f ba 00 00       	push   $0xba0f
    275a:	e8 a1 ef ff ff       	call   1700 <updatePath>
    275f:	83 c4 10             	add    $0x10,%esp
		p1 = head;
    2762:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2765:	89 45 e8             	mov    %eax,-0x18(%ebp)
		while (p1 != 0) {
    2768:	eb 48                	jmp    27b2 <pasteJustFile+0x36c>
			p2 = p1;
    276a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    276d:	89 45 e0             	mov    %eax,-0x20(%ebp)
			printf(0, "freeing %s\n", p2->name);
    2770:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2773:	8b 40 14             	mov    0x14(%eax),%eax
    2776:	83 ec 04             	sub    $0x4,%esp
    2779:	50                   	push   %eax
    277a:	68 9a ba 00 00       	push   $0xba9a
    277f:	6a 00                	push   $0x0
    2781:	e8 13 2a 00 00       	call   5199 <printf>
    2786:	83 c4 10             	add    $0x10,%esp
			p1 = p1->next;
    2789:	8b 45 e8             	mov    -0x18(%ebp),%eax
    278c:	8b 40 2c             	mov    0x2c(%eax),%eax
    278f:	89 45 e8             	mov    %eax,-0x18(%ebp)
			free(p2->name);
    2792:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2795:	8b 40 14             	mov    0x14(%eax),%eax
    2798:	83 ec 0c             	sub    $0xc,%esp
    279b:	50                   	push   %eax
    279c:	e8 88 2b 00 00       	call   5329 <free>
    27a1:	83 c4 10             	add    $0x10,%esp
			free(p2);
    27a4:	83 ec 0c             	sub    $0xc,%esp
    27a7:	ff 75 e0             	pushl  -0x20(%ebp)
    27aa:	e8 7a 2b 00 00       	call   5329 <free>
    27af:	83 c4 10             	add    $0x10,%esp
			p1 = p1->next;
		}
		chdir("..");
		updatePath("..");
		p1 = head;
		while (p1 != 0) {
    27b2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    27b6:	75 b2                	jne    276a <pasteJustFile+0x324>
    27b8:	e9 0c 01 00 00       	jmp    28c9 <pasteJustFile+0x483>
			free(p2->name);
			free(p2);
		}
	}
	else{
		file_src = open(src, O_RDONLY);
    27bd:	83 ec 08             	sub    $0x8,%esp
    27c0:	6a 00                	push   $0x0
    27c2:	ff 75 08             	pushl  0x8(%ebp)
    27c5:	e8 32 28 00 00       	call   4ffc <open>
    27ca:	83 c4 10             	add    $0x10,%esp
    27cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if((file_dest = open(filename, O_RDONLY)) >= 0){
    27d0:	83 ec 08             	sub    $0x8,%esp
    27d3:	6a 00                	push   $0x0
    27d5:	ff 75 0c             	pushl  0xc(%ebp)
    27d8:	e8 1f 28 00 00       	call   4ffc <open>
    27dd:	83 c4 10             	add    $0x10,%esp
    27e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    27e3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    27e7:	78 49                	js     2832 <pasteJustFile+0x3ec>
			printf(0, "File %s already exist\n", filename);
    27e9:	83 ec 04             	sub    $0x4,%esp
    27ec:	ff 75 0c             	pushl  0xc(%ebp)
    27ef:	68 92 bb 00 00       	push   $0xbb92
    27f4:	6a 00                	push   $0x0
    27f6:	e8 9e 29 00 00       	call   5199 <printf>
    27fb:	83 c4 10             	add    $0x10,%esp
			close(file_dest);
    27fe:	83 ec 0c             	sub    $0xc,%esp
    2801:	ff 75 f0             	pushl  -0x10(%ebp)
    2804:	e8 db 27 00 00       	call   4fe4 <close>
    2809:	83 c4 10             	add    $0x10,%esp
			close(file_src);
    280c:	83 ec 0c             	sub    $0xc,%esp
    280f:	ff 75 f4             	pushl  -0xc(%ebp)
    2812:	e8 cd 27 00 00       	call   4fe4 <close>
    2817:	83 c4 10             	add    $0x10,%esp
			free(buff);
    281a:	83 ec 0c             	sub    $0xc,%esp
    281d:	ff 75 d8             	pushl  -0x28(%ebp)
    2820:	e8 04 2b 00 00       	call   5329 <free>
    2825:	83 c4 10             	add    $0x10,%esp
			return 0;
    2828:	b8 00 00 00 00       	mov    $0x0,%eax
    282d:	e9 d8 00 00 00       	jmp    290a <pasteJustFile+0x4c4>
		}
		else{
			file_dest = open(filename, O_CREATE);
    2832:	83 ec 08             	sub    $0x8,%esp
    2835:	68 00 02 00 00       	push   $0x200
    283a:	ff 75 0c             	pushl  0xc(%ebp)
    283d:	e8 ba 27 00 00       	call   4ffc <open>
    2842:	83 c4 10             	add    $0x10,%esp
    2845:	89 45 f0             	mov    %eax,-0x10(%ebp)
			while((size = read(file_src, buff, 4096)) > 0)
    2848:	eb 14                	jmp    285e <pasteJustFile+0x418>
				write(file_dest, buff, size);
    284a:	83 ec 04             	sub    $0x4,%esp
    284d:	ff 75 dc             	pushl  -0x24(%ebp)
    2850:	ff 75 d8             	pushl  -0x28(%ebp)
    2853:	ff 75 f0             	pushl  -0x10(%ebp)
    2856:	e8 81 27 00 00       	call   4fdc <write>
    285b:	83 c4 10             	add    $0x10,%esp
			free(buff);
			return 0;
		}
		else{
			file_dest = open(filename, O_CREATE);
			while((size = read(file_src, buff, 4096)) > 0)
    285e:	83 ec 04             	sub    $0x4,%esp
    2861:	68 00 10 00 00       	push   $0x1000
    2866:	ff 75 d8             	pushl  -0x28(%ebp)
    2869:	ff 75 f4             	pushl  -0xc(%ebp)
    286c:	e8 63 27 00 00       	call   4fd4 <read>
    2871:	83 c4 10             	add    $0x10,%esp
    2874:	89 45 dc             	mov    %eax,-0x24(%ebp)
    2877:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    287b:	7f cd                	jg     284a <pasteJustFile+0x404>
				write(file_dest, buff, size);
			if(size < 0)
    287d:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    2881:	79 46                	jns    28c9 <pasteJustFile+0x483>
			{
				//printf(2, "copy file error!!!\r\n");
				printf(0, "File %s error\n", filename);
    2883:	83 ec 04             	sub    $0x4,%esp
    2886:	ff 75 0c             	pushl  0xc(%ebp)
    2889:	68 a9 bb 00 00       	push   $0xbba9
    288e:	6a 00                	push   $0x0
    2890:	e8 04 29 00 00       	call   5199 <printf>
    2895:	83 c4 10             	add    $0x10,%esp
				close(file_dest);
    2898:	83 ec 0c             	sub    $0xc,%esp
    289b:	ff 75 f0             	pushl  -0x10(%ebp)
    289e:	e8 41 27 00 00       	call   4fe4 <close>
    28a3:	83 c4 10             	add    $0x10,%esp
				close(file_src);
    28a6:	83 ec 0c             	sub    $0xc,%esp
    28a9:	ff 75 f4             	pushl  -0xc(%ebp)
    28ac:	e8 33 27 00 00       	call   4fe4 <close>
    28b1:	83 c4 10             	add    $0x10,%esp
				free(buff);
    28b4:	83 ec 0c             	sub    $0xc,%esp
    28b7:	ff 75 d8             	pushl  -0x28(%ebp)
    28ba:	e8 6a 2a 00 00       	call   5329 <free>
    28bf:	83 c4 10             	add    $0x10,%esp
				return 0;
    28c2:	b8 00 00 00 00       	mov    $0x0,%eax
    28c7:	eb 41                	jmp    290a <pasteJustFile+0x4c4>
			}
		}
	}
	close(file_dest);
    28c9:	83 ec 0c             	sub    $0xc,%esp
    28cc:	ff 75 f0             	pushl  -0x10(%ebp)
    28cf:	e8 10 27 00 00       	call   4fe4 <close>
    28d4:	83 c4 10             	add    $0x10,%esp
	close(file_src);
    28d7:	83 ec 0c             	sub    $0xc,%esp
    28da:	ff 75 f4             	pushl  -0xc(%ebp)
    28dd:	e8 02 27 00 00       	call   4fe4 <close>
    28e2:	83 c4 10             	add    $0x10,%esp
	free(buff);
    28e5:	83 ec 0c             	sub    $0xc,%esp
    28e8:	ff 75 d8             	pushl  -0x28(%ebp)
    28eb:	e8 39 2a 00 00       	call   5329 <free>
    28f0:	83 c4 10             	add    $0x10,%esp
	printf(0,"copy end\n");
    28f3:	83 ec 08             	sub    $0x8,%esp
    28f6:	68 b8 bb 00 00       	push   $0xbbb8
    28fb:	6a 00                	push   $0x0
    28fd:	e8 97 28 00 00       	call   5199 <printf>
    2902:	83 c4 10             	add    $0x10,%esp
	return 1;
    2905:	b8 01 00 00 00       	mov    $0x1,%eax
}
    290a:	c9                   	leave  
    290b:	c3                   	ret    

0000290c <pasteFile>:

void pasteFile(){
    290c:	55                   	push   %ebp
    290d:	89 e5                	mov    %esp,%ebp
    290f:	83 ec 18             	sub    $0x18,%esp
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
    2912:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2919:	e9 ab 00 00 00       	jmp    29c9 <pasteFile+0xbd>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    291e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2921:	c1 e0 08             	shl    $0x8,%eax
    2924:	05 00 36 01 00       	add    $0x13600,%eax
    2929:	50                   	push   %eax
    292a:	ff 75 f4             	pushl  -0xc(%ebp)
    292d:	68 c2 bb 00 00       	push   $0xbbc2
    2932:	6a 00                	push   $0x0
    2934:	e8 60 28 00 00       	call   5199 <printf>
    2939:	83 c4 10             	add    $0x10,%esp
		for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    293c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    293f:	c1 e0 08             	shl    $0x8,%eax
    2942:	05 00 36 01 00       	add    $0x13600,%eax
    2947:	83 ec 0c             	sub    $0xc,%esp
    294a:	50                   	push   %eax
    294b:	e8 ab 24 00 00       	call   4dfb <strlen>
    2950:	83 c4 10             	add    $0x10,%esp
    2953:	83 e8 01             	sub    $0x1,%eax
    2956:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2959:	eb 35                	jmp    2990 <pasteFile+0x84>
			if (*(filesWaited[i]+j) == '/'){
    295b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    295e:	c1 e0 08             	shl    $0x8,%eax
    2961:	8d 90 00 36 01 00    	lea    0x13600(%eax),%edx
    2967:	8b 45 f0             	mov    -0x10(%ebp),%eax
    296a:	01 d0                	add    %edx,%eax
    296c:	0f b6 00             	movzbl (%eax),%eax
    296f:	3c 2f                	cmp    $0x2f,%al
    2971:	75 19                	jne    298c <pasteFile+0x80>
				filename = filesWaited[i] + j + 1;
    2973:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2976:	c1 e0 08             	shl    $0x8,%eax
    2979:	8d 90 00 36 01 00    	lea    0x13600(%eax),%edx
    297f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2982:	83 c0 01             	add    $0x1,%eax
    2985:	01 d0                	add    %edx,%eax
    2987:	89 45 ec             	mov    %eax,-0x14(%ebp)
				break;
    298a:	eb 0a                	jmp    2996 <pasteFile+0x8a>
void pasteFile(){
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
		for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    298c:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    2990:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2994:	79 c5                	jns    295b <pasteFile+0x4f>
			if (*(filesWaited[i]+j) == '/'){
				filename = filesWaited[i] + j + 1;
				break;
			}
		}
		printf(0, "NO.%d file %s name get\n", i, filename);
    2996:	ff 75 ec             	pushl  -0x14(%ebp)
    2999:	ff 75 f4             	pushl  -0xc(%ebp)
    299c:	68 df bb 00 00       	push   $0xbbdf
    29a1:	6a 00                	push   $0x0
    29a3:	e8 f1 27 00 00       	call   5199 <printf>
    29a8:	83 c4 10             	add    $0x10,%esp
		pasteJustFile(filesWaited[i], filename);
    29ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29ae:	c1 e0 08             	shl    $0x8,%eax
    29b1:	05 00 36 01 00       	add    $0x13600,%eax
    29b6:	83 ec 08             	sub    $0x8,%esp
    29b9:	ff 75 ec             	pushl  -0x14(%ebp)
    29bc:	50                   	push   %eax
    29bd:	e8 84 fa ff ff       	call   2446 <pasteJustFile>
    29c2:	83 c4 10             	add    $0x10,%esp
}

void pasteFile(){
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
    29c5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    29c9:	a1 58 40 01 00       	mov    0x14058,%eax
    29ce:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    29d1:	0f 8c 47 ff ff ff    	jl     291e <pasteFile+0x12>
			}
		}
		printf(0, "NO.%d file %s name get\n", i, filename);
		pasteJustFile(filesWaited[i], filename);
	}
}
    29d7:	c9                   	leave  
    29d8:	c3                   	ret    

000029d9 <h_pasteFile>:

void h_pasteFile(Point p){
    29d9:	55                   	push   %ebp
    29da:	89 e5                	mov    %esp,%ebp
    29dc:	83 ec 18             	sub    $0x18,%esp
	pasteFile();
    29df:	e8 28 ff ff ff       	call   290c <pasteFile>
	if(copyOrCut == 1)
    29e4:	a1 44 07 01 00       	mov    0x10744,%eax
    29e9:	83 f8 01             	cmp    $0x1,%eax
    29ec:	75 05                	jne    29f3 <h_pasteFile+0x1a>
		moveFile();
    29ee:	e8 f2 f9 ff ff       	call   23e5 <moveFile>
    updateFileList(context);
    29f3:	83 ec 04             	sub    $0x4,%esp
    29f6:	ff 35 08 3f 01 00    	pushl  0x13f08
    29fc:	ff 35 04 3f 01 00    	pushl  0x13f04
    2a02:	ff 35 00 3f 01 00    	pushl  0x13f00
    2a08:	e8 e2 e1 ff ff       	call   bef <updateFileList>
    2a0d:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    2a10:	83 ec 04             	sub    $0x4,%esp
    2a13:	ff 35 08 3f 01 00    	pushl  0x13f08
    2a19:	ff 35 04 3f 01 00    	pushl  0x13f04
    2a1f:	ff 35 00 3f 01 00    	pushl  0x13f00
    2a25:	e8 18 e3 ff ff       	call   d42 <drawFinderContent>
    2a2a:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    2a2d:	83 ec 04             	sub    $0x4,%esp
    2a30:	ff 35 08 3f 01 00    	pushl  0x13f08
    2a36:	ff 35 04 3f 01 00    	pushl  0x13f04
    2a3c:	ff 35 00 3f 01 00    	pushl  0x13f00
    2a42:	e8 88 e0 ff ff       	call   acf <drawFinderWnd>
    2a47:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2a4a:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2a4d:	83 ec 0c             	sub    $0xc,%esp
    2a50:	68 58 02 00 00       	push   $0x258
    2a55:	68 20 03 00 00       	push   $0x320
    2a5a:	6a 00                	push   $0x0
    2a5c:	6a 00                	push   $0x0
    2a5e:	50                   	push   %eax
    2a5f:	e8 6f 1d 00 00       	call   47d3 <initRect>
    2a64:	83 c4 1c             	add    $0x1c,%esp
    2a67:	83 ec 0c             	sub    $0xc,%esp
    2a6a:	ff 75 f4             	pushl  -0xc(%ebp)
    2a6d:	ff 75 f0             	pushl  -0x10(%ebp)
    2a70:	ff 75 ec             	pushl  -0x14(%ebp)
    2a73:	ff 75 e8             	pushl  -0x18(%ebp)
    2a76:	68 40 40 01 00       	push   $0x14040
    2a7b:	e8 18 1f 00 00       	call   4998 <deleteClickable>
    2a80:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    2a83:	83 ec 0c             	sub    $0xc,%esp
    2a86:	68 40 40 01 00       	push   $0x14040
    2a8b:	e8 1a e7 ff ff       	call   11aa <addWndEvent>
    2a90:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    2a93:	83 ec 0c             	sub    $0xc,%esp
    2a96:	68 40 40 01 00       	push   $0x14040
    2a9b:	e8 af e6 ff ff       	call   114f <addListEvent>
    2aa0:	83 c4 10             	add    $0x10,%esp
}
    2aa3:	c9                   	leave  
    2aa4:	c3                   	ret    

00002aa5 <h_chooseFile>:

void h_chooseFile(Point p) {
    2aa5:	55                   	push   %ebp
    2aa6:	89 e5                	mov    %esp,%ebp
    2aa8:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *temp = getFileItem(p);
    2aab:	83 ec 08             	sub    $0x8,%esp
    2aae:	ff 75 0c             	pushl  0xc(%ebp)
    2ab1:	ff 75 08             	pushl  0x8(%ebp)
    2ab4:	e8 dd e7 ff ff       	call   1296 <getFileItem>
    2ab9:	83 c4 10             	add    $0x10,%esp
    2abc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    2abf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ac2:	8b 40 28             	mov    0x28(%eax),%eax
    2ac5:	85 c0                	test   %eax,%eax
    2ac7:	74 1e                	je     2ae7 <h_chooseFile+0x42>
	{
		printf(0, "unchooseFile!\n");
    2ac9:	83 ec 08             	sub    $0x8,%esp
    2acc:	68 f7 bb 00 00       	push   $0xbbf7
    2ad1:	6a 00                	push   $0x0
    2ad3:	e8 c1 26 00 00       	call   5199 <printf>
    2ad8:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 0;
    2adb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ade:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    2ae5:	eb 1c                	jmp    2b03 <h_chooseFile+0x5e>
	}
	else
	{
		printf(0, "chooseFile!\n");
    2ae7:	83 ec 08             	sub    $0x8,%esp
    2aea:	68 06 bc 00 00       	push   $0xbc06
    2aef:	6a 00                	push   $0x0
    2af1:	e8 a3 26 00 00       	call   5199 <printf>
    2af6:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 1;
    2af9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2afc:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    2b03:	83 ec 04             	sub    $0x4,%esp
    2b06:	ff 35 08 3f 01 00    	pushl  0x13f08
    2b0c:	ff 35 04 3f 01 00    	pushl  0x13f04
    2b12:	ff 35 00 3f 01 00    	pushl  0x13f00
    2b18:	e8 25 e2 ff ff       	call   d42 <drawFinderContent>
    2b1d:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    2b20:	83 ec 04             	sub    $0x4,%esp
    2b23:	ff 35 08 3f 01 00    	pushl  0x13f08
    2b29:	ff 35 04 3f 01 00    	pushl  0x13f04
    2b2f:	ff 35 00 3f 01 00    	pushl  0x13f00
    2b35:	e8 95 df ff ff       	call   acf <drawFinderWnd>
    2b3a:	83 c4 10             	add    $0x10,%esp
}
    2b3d:	c9                   	leave  
    2b3e:	c3                   	ret    

00002b3f <h_closeWnd>:

void h_closeWnd(Point p) {
    2b3f:	55                   	push   %ebp
    2b40:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    2b42:	c7 05 00 fd 00 00 00 	movl   $0x0,0xfd00
    2b49:	00 00 00 
}
    2b4c:	5d                   	pop    %ebp
    2b4d:	c3                   	ret    

00002b4e <h_chvm1>:

void h_chvm1(Point p) {
    2b4e:	55                   	push   %ebp
    2b4f:	89 e5                	mov    %esp,%ebp
    2b51:	83 ec 18             	sub    $0x18,%esp
	style = ICON_STYLE;
    2b54:	c7 05 04 fd 00 00 01 	movl   $0x1,0xfd04
    2b5b:	00 00 00 
	updateFileList(context);
    2b5e:	83 ec 04             	sub    $0x4,%esp
    2b61:	ff 35 08 3f 01 00    	pushl  0x13f08
    2b67:	ff 35 04 3f 01 00    	pushl  0x13f04
    2b6d:	ff 35 00 3f 01 00    	pushl  0x13f00
    2b73:	e8 77 e0 ff ff       	call   bef <updateFileList>
    2b78:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    2b7b:	83 ec 04             	sub    $0x4,%esp
    2b7e:	ff 35 08 3f 01 00    	pushl  0x13f08
    2b84:	ff 35 04 3f 01 00    	pushl  0x13f04
    2b8a:	ff 35 00 3f 01 00    	pushl  0x13f00
    2b90:	e8 ad e1 ff ff       	call   d42 <drawFinderContent>
    2b95:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    2b98:	83 ec 04             	sub    $0x4,%esp
    2b9b:	ff 35 08 3f 01 00    	pushl  0x13f08
    2ba1:	ff 35 04 3f 01 00    	pushl  0x13f04
    2ba7:	ff 35 00 3f 01 00    	pushl  0x13f00
    2bad:	e8 1d df ff ff       	call   acf <drawFinderWnd>
    2bb2:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2bb5:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2bb8:	83 ec 0c             	sub    $0xc,%esp
    2bbb:	68 58 02 00 00       	push   $0x258
    2bc0:	68 20 03 00 00       	push   $0x320
    2bc5:	6a 00                	push   $0x0
    2bc7:	6a 00                	push   $0x0
    2bc9:	50                   	push   %eax
    2bca:	e8 04 1c 00 00       	call   47d3 <initRect>
    2bcf:	83 c4 1c             	add    $0x1c,%esp
    2bd2:	83 ec 0c             	sub    $0xc,%esp
    2bd5:	ff 75 f4             	pushl  -0xc(%ebp)
    2bd8:	ff 75 f0             	pushl  -0x10(%ebp)
    2bdb:	ff 75 ec             	pushl  -0x14(%ebp)
    2bde:	ff 75 e8             	pushl  -0x18(%ebp)
    2be1:	68 40 40 01 00       	push   $0x14040
    2be6:	e8 ad 1d 00 00       	call   4998 <deleteClickable>
    2beb:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    2bee:	83 ec 0c             	sub    $0xc,%esp
    2bf1:	68 40 40 01 00       	push   $0x14040
    2bf6:	e8 af e5 ff ff       	call   11aa <addWndEvent>
    2bfb:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    2bfe:	83 ec 0c             	sub    $0xc,%esp
    2c01:	68 40 40 01 00       	push   $0x14040
    2c06:	e8 44 e5 ff ff       	call   114f <addListEvent>
    2c0b:	83 c4 10             	add    $0x10,%esp
}
    2c0e:	c9                   	leave  
    2c0f:	c3                   	ret    

00002c10 <h_chvm2>:

void h_chvm2(Point p) {
    2c10:	55                   	push   %ebp
    2c11:	89 e5                	mov    %esp,%ebp
    2c13:	83 ec 18             	sub    $0x18,%esp
	style = LIST_STYLE;
    2c16:	c7 05 04 fd 00 00 02 	movl   $0x2,0xfd04
    2c1d:	00 00 00 
	updateFileList(context);
    2c20:	83 ec 04             	sub    $0x4,%esp
    2c23:	ff 35 08 3f 01 00    	pushl  0x13f08
    2c29:	ff 35 04 3f 01 00    	pushl  0x13f04
    2c2f:	ff 35 00 3f 01 00    	pushl  0x13f00
    2c35:	e8 b5 df ff ff       	call   bef <updateFileList>
    2c3a:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    2c3d:	83 ec 04             	sub    $0x4,%esp
    2c40:	ff 35 08 3f 01 00    	pushl  0x13f08
    2c46:	ff 35 04 3f 01 00    	pushl  0x13f04
    2c4c:	ff 35 00 3f 01 00    	pushl  0x13f00
    2c52:	e8 eb e0 ff ff       	call   d42 <drawFinderContent>
    2c57:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    2c5a:	83 ec 04             	sub    $0x4,%esp
    2c5d:	ff 35 08 3f 01 00    	pushl  0x13f08
    2c63:	ff 35 04 3f 01 00    	pushl  0x13f04
    2c69:	ff 35 00 3f 01 00    	pushl  0x13f00
    2c6f:	e8 5b de ff ff       	call   acf <drawFinderWnd>
    2c74:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2c77:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2c7a:	83 ec 0c             	sub    $0xc,%esp
    2c7d:	68 58 02 00 00       	push   $0x258
    2c82:	68 20 03 00 00       	push   $0x320
    2c87:	6a 00                	push   $0x0
    2c89:	6a 00                	push   $0x0
    2c8b:	50                   	push   %eax
    2c8c:	e8 42 1b 00 00       	call   47d3 <initRect>
    2c91:	83 c4 1c             	add    $0x1c,%esp
    2c94:	83 ec 0c             	sub    $0xc,%esp
    2c97:	ff 75 f4             	pushl  -0xc(%ebp)
    2c9a:	ff 75 f0             	pushl  -0x10(%ebp)
    2c9d:	ff 75 ec             	pushl  -0x14(%ebp)
    2ca0:	ff 75 e8             	pushl  -0x18(%ebp)
    2ca3:	68 40 40 01 00       	push   $0x14040
    2ca8:	e8 eb 1c 00 00       	call   4998 <deleteClickable>
    2cad:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    2cb0:	83 ec 0c             	sub    $0xc,%esp
    2cb3:	68 40 40 01 00       	push   $0x14040
    2cb8:	e8 ed e4 ff ff       	call   11aa <addWndEvent>
    2cbd:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    2cc0:	83 ec 0c             	sub    $0xc,%esp
    2cc3:	68 40 40 01 00       	push   $0x14040
    2cc8:	e8 82 e4 ff ff       	call   114f <addListEvent>
    2ccd:	83 c4 10             	add    $0x10,%esp
}
    2cd0:	c9                   	leave  
    2cd1:	c3                   	ret    

00002cd2 <h_goUp>:

void h_goUp(Point p) {
    2cd2:	55                   	push   %ebp
    2cd3:	89 e5                	mov    %esp,%ebp
    2cd5:	83 ec 18             	sub    $0x18,%esp
	enterDir("..");
    2cd8:	83 ec 0c             	sub    $0xc,%esp
    2cdb:	68 0f ba 00 00       	push   $0xba0f
    2ce0:	e8 23 eb ff ff       	call   1808 <enterDir>
    2ce5:	83 c4 10             	add    $0x10,%esp
	updateFileList(context);
    2ce8:	83 ec 04             	sub    $0x4,%esp
    2ceb:	ff 35 08 3f 01 00    	pushl  0x13f08
    2cf1:	ff 35 04 3f 01 00    	pushl  0x13f04
    2cf7:	ff 35 00 3f 01 00    	pushl  0x13f00
    2cfd:	e8 ed de ff ff       	call   bef <updateFileList>
    2d02:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    2d05:	83 ec 04             	sub    $0x4,%esp
    2d08:	ff 35 08 3f 01 00    	pushl  0x13f08
    2d0e:	ff 35 04 3f 01 00    	pushl  0x13f04
    2d14:	ff 35 00 3f 01 00    	pushl  0x13f00
    2d1a:	e8 23 e0 ff ff       	call   d42 <drawFinderContent>
    2d1f:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    2d22:	83 ec 04             	sub    $0x4,%esp
    2d25:	ff 35 08 3f 01 00    	pushl  0x13f08
    2d2b:	ff 35 04 3f 01 00    	pushl  0x13f04
    2d31:	ff 35 00 3f 01 00    	pushl  0x13f00
    2d37:	e8 93 dd ff ff       	call   acf <drawFinderWnd>
    2d3c:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2d3f:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2d42:	83 ec 0c             	sub    $0xc,%esp
    2d45:	68 58 02 00 00       	push   $0x258
    2d4a:	68 20 03 00 00       	push   $0x320
    2d4f:	6a 00                	push   $0x0
    2d51:	6a 00                	push   $0x0
    2d53:	50                   	push   %eax
    2d54:	e8 7a 1a 00 00       	call   47d3 <initRect>
    2d59:	83 c4 1c             	add    $0x1c,%esp
    2d5c:	83 ec 0c             	sub    $0xc,%esp
    2d5f:	ff 75 f4             	pushl  -0xc(%ebp)
    2d62:	ff 75 f0             	pushl  -0x10(%ebp)
    2d65:	ff 75 ec             	pushl  -0x14(%ebp)
    2d68:	ff 75 e8             	pushl  -0x18(%ebp)
    2d6b:	68 40 40 01 00       	push   $0x14040
    2d70:	e8 23 1c 00 00       	call   4998 <deleteClickable>
    2d75:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    2d78:	83 ec 0c             	sub    $0xc,%esp
    2d7b:	68 40 40 01 00       	push   $0x14040
    2d80:	e8 25 e4 ff ff       	call   11aa <addWndEvent>
    2d85:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    2d88:	83 ec 0c             	sub    $0xc,%esp
    2d8b:	68 40 40 01 00       	push   $0x14040
    2d90:	e8 ba e3 ff ff       	call   114f <addListEvent>
    2d95:	83 c4 10             	add    $0x10,%esp
}
    2d98:	c9                   	leave  
    2d99:	c3                   	ret    

00002d9a <h_empty>:

void h_empty(Point p) {
    2d9a:	55                   	push   %ebp
    2d9b:	89 e5                	mov    %esp,%ebp

}
    2d9d:	5d                   	pop    %ebp
    2d9e:	c3                   	ret    

00002d9f <rename>:

void rename() {
    2d9f:	55                   	push   %ebp
    2da0:	89 e5                	mov    %esp,%ebp
    2da2:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *temp = fileItemList;
    2da5:	a1 50 07 01 00       	mov    0x10750,%eax
    2daa:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (temp != 0){
    2dad:	eb 49                	jmp    2df8 <rename+0x59>
		if (temp->chosen == 1){
    2daf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2db2:	8b 40 28             	mov    0x28(%eax),%eax
    2db5:	83 f8 01             	cmp    $0x1,%eax
    2db8:	75 35                	jne    2def <rename+0x50>
			currentlyRenaming = temp;
    2dba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dbd:	a3 4c 07 01 00       	mov    %eax,0x1074c
			temp->chosen = 2;
    2dc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dc5:	c7 40 28 02 00 00 00 	movl   $0x2,0x28(%eax)
			strcpy(renameFrom, temp->name);
    2dcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dcf:	8b 40 14             	mov    0x14(%eax),%eax
    2dd2:	83 ec 08             	sub    $0x8,%esp
    2dd5:	50                   	push   %eax
    2dd6:	68 00 3e 01 00       	push   $0x13e00
    2ddb:	e8 ac 1f 00 00       	call   4d8c <strcpy>
    2de0:	83 c4 10             	add    $0x10,%esp
			renaming = 1;
    2de3:	c7 05 54 40 01 00 01 	movl   $0x1,0x14054
    2dea:	00 00 00 
			break;
    2ded:	eb 0f                	jmp    2dfe <rename+0x5f>
		}
		else
			temp = temp->next;
    2def:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2df2:	8b 40 2c             	mov    0x2c(%eax),%eax
    2df5:	89 45 f4             	mov    %eax,-0xc(%ebp)

}

void rename() {
	struct fileItem *temp = fileItemList;
	while (temp != 0){
    2df8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2dfc:	75 b1                	jne    2daf <rename+0x10>
			break;
		}
		else
			temp = temp->next;
	}
}
    2dfe:	c9                   	leave  
    2dff:	c3                   	ret    

00002e00 <h_rename>:

void h_rename(Point p) {
    2e00:	55                   	push   %ebp
    2e01:	89 e5                	mov    %esp,%ebp
    2e03:	83 ec 08             	sub    $0x8,%esp
	rename();
    2e06:	e8 94 ff ff ff       	call   2d9f <rename>
	drawFinderContent(context);
    2e0b:	83 ec 04             	sub    $0x4,%esp
    2e0e:	ff 35 08 3f 01 00    	pushl  0x13f08
    2e14:	ff 35 04 3f 01 00    	pushl  0x13f04
    2e1a:	ff 35 00 3f 01 00    	pushl  0x13f00
    2e20:	e8 1d df ff ff       	call   d42 <drawFinderContent>
    2e25:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    2e28:	83 ec 04             	sub    $0x4,%esp
    2e2b:	ff 35 08 3f 01 00    	pushl  0x13f08
    2e31:	ff 35 04 3f 01 00    	pushl  0x13f04
    2e37:	ff 35 00 3f 01 00    	pushl  0x13f00
    2e3d:	e8 8d dc ff ff       	call   acf <drawFinderWnd>
    2e42:	83 c4 10             	add    $0x10,%esp
}
    2e45:	c9                   	leave  
    2e46:	c3                   	ret    

00002e47 <main>:

int main(int argc, char *argv[]) {
    2e47:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    2e4b:	83 e4 f0             	and    $0xfffffff0,%esp
    2e4e:	ff 71 fc             	pushl  -0x4(%ecx)
    2e51:	55                   	push   %ebp
    2e52:	89 e5                	mov    %esp,%ebp
    2e54:	56                   	push   %esi
    2e55:	53                   	push   %ebx
    2e56:	51                   	push   %ecx
    2e57:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
	struct Msg msg;
	char key;

	Point p;

	init_keyContent();
    2e5d:	e8 08 d2 ff ff       	call   6a <init_keyContent>
	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    2e62:	83 ec 04             	sub    $0x4,%esp
    2e65:	68 c2 01 00 00       	push   $0x1c2
    2e6a:	68 58 02 00 00       	push   $0x258
    2e6f:	68 00 3f 01 00       	push   $0x13f00
    2e74:	e8 2b 07 00 00       	call   35a4 <init_context>
    2e79:	83 c4 10             	add    $0x10,%esp
    2e7c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    2e7f:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
    2e85:	ff 35 08 3f 01 00    	pushl  0x13f08
    2e8b:	ff 35 04 3f 01 00    	pushl  0x13f04
    2e91:	ff 35 00 3f 01 00    	pushl  0x13f00
    2e97:	50                   	push   %eax
    2e98:	e8 ca 19 00 00       	call   4867 <initClickManager>
    2e9d:	83 c4 0c             	add    $0xc,%esp
    2ea0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
    2ea6:	a3 40 40 01 00       	mov    %eax,0x14040
    2eab:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
    2eb1:	a3 44 40 01 00       	mov    %eax,0x14044
    2eb6:	8b 45 80             	mov    -0x80(%ebp),%eax
    2eb9:	a3 48 40 01 00       	mov    %eax,0x14048
    2ebe:	8b 45 84             	mov    -0x7c(%ebp),%eax
    2ec1:	a3 4c 40 01 00       	mov    %eax,0x1404c
    2ec6:	8b 45 88             	mov    -0x78(%ebp),%eax
    2ec9:	a3 50 40 01 00       	mov    %eax,0x14050
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    2ece:	83 ec 08             	sub    $0x8,%esp
    2ed1:	6a 0f                	push   $0xf
    2ed3:	68 40 fe 00 00       	push   $0xfe40
    2ed8:	e8 f1 10 00 00       	call   3fce <load_iconlist>
    2edd:	83 c4 10             	add    $0x10,%esp
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    2ee0:	83 ec 08             	sub    $0x8,%esp
    2ee3:	6a 04                	push   $0x4
    2ee5:	68 40 fd 00 00       	push   $0xfd40
    2eea:	e8 df 10 00 00       	call   3fce <load_iconlist>
    2eef:	83 c4 10             	add    $0x10,%esp
	//testHandlers();
	strcpy(currentPath, "/");
    2ef2:	83 ec 08             	sub    $0x8,%esp
    2ef5:	68 13 bc 00 00       	push   $0xbc13
    2efa:	68 40 3f 01 00       	push   $0x13f40
    2eff:	e8 88 1e 00 00       	call   4d8c <strcpy>
    2f04:	83 c4 10             	add    $0x10,%esp
	mkdir("userfolder");
    2f07:	83 ec 0c             	sub    $0xc,%esp
    2f0a:	68 15 bc 00 00       	push   $0xbc15
    2f0f:	e8 10 21 00 00       	call   5024 <mkdir>
    2f14:	83 c4 10             	add    $0x10,%esp
	enterDir("userfolder");
    2f17:	83 ec 0c             	sub    $0xc,%esp
    2f1a:	68 15 bc 00 00       	push   $0xbc15
    2f1f:	e8 e4 e8 ff ff       	call   1808 <enterDir>
    2f24:	83 c4 10             	add    $0x10,%esp
	updateFileList(context);
    2f27:	83 ec 04             	sub    $0x4,%esp
    2f2a:	ff 35 08 3f 01 00    	pushl  0x13f08
    2f30:	ff 35 04 3f 01 00    	pushl  0x13f04
    2f36:	ff 35 00 3f 01 00    	pushl  0x13f00
    2f3c:	e8 ae dc ff ff       	call   bef <updateFileList>
    2f41:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2f44:	8d 45 c0             	lea    -0x40(%ebp),%eax
    2f47:	83 ec 0c             	sub    $0xc,%esp
    2f4a:	68 58 02 00 00       	push   $0x258
    2f4f:	68 20 03 00 00       	push   $0x320
    2f54:	6a 00                	push   $0x0
    2f56:	6a 00                	push   $0x0
    2f58:	50                   	push   %eax
    2f59:	e8 75 18 00 00       	call   47d3 <initRect>
    2f5e:	83 c4 1c             	add    $0x1c,%esp
    2f61:	83 ec 0c             	sub    $0xc,%esp
    2f64:	ff 75 cc             	pushl  -0x34(%ebp)
    2f67:	ff 75 c8             	pushl  -0x38(%ebp)
    2f6a:	ff 75 c4             	pushl  -0x3c(%ebp)
    2f6d:	ff 75 c0             	pushl  -0x40(%ebp)
    2f70:	68 40 40 01 00       	push   $0x14040
    2f75:	e8 1e 1a 00 00       	call   4998 <deleteClickable>
    2f7a:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    2f7d:	83 ec 0c             	sub    $0xc,%esp
    2f80:	68 40 40 01 00       	push   $0x14040
    2f85:	e8 20 e2 ff ff       	call   11aa <addWndEvent>
    2f8a:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    2f8d:	83 ec 0c             	sub    $0xc,%esp
    2f90:	68 40 40 01 00       	push   $0x14040
    2f95:	e8 b5 e1 ff ff       	call   114f <addListEvent>
    2f9a:	83 c4 10             	add    $0x10,%esp
	lenOfWaited = 0;
    2f9d:	c7 05 58 40 01 00 00 	movl   $0x0,0x14058
    2fa4:	00 00 00 
	while (isRun) {
    2fa7:	e9 ba 04 00 00       	jmp    3466 <main+0x61f>
		getMsg(&msg);
    2fac:	83 ec 0c             	sub    $0xc,%esp
    2faf:	8d 45 a8             	lea    -0x58(%ebp),%eax
    2fb2:	50                   	push   %eax
    2fb3:	e8 a4 20 00 00       	call   505c <getMsg>
    2fb8:	83 c4 10             	add    $0x10,%esp
		switch (msg.msg_type) {
    2fbb:	8b 45 a8             	mov    -0x58(%ebp),%eax
    2fbe:	83 f8 08             	cmp    $0x8,%eax
    2fc1:	0f 87 9e 04 00 00    	ja     3465 <main+0x61e>
    2fc7:	8b 04 85 20 bc 00 00 	mov    0xbc20(,%eax,4),%eax
    2fce:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2fd0:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    2fd3:	8b 55 ac             	mov    -0x54(%ebp),%edx
    2fd6:	8d 45 a0             	lea    -0x60(%ebp),%eax
    2fd9:	83 ec 04             	sub    $0x4,%esp
    2fdc:	51                   	push   %ecx
    2fdd:	52                   	push   %edx
    2fde:	50                   	push   %eax
    2fdf:	e8 c8 17 00 00       	call   47ac <initPoint>
    2fe4:	83 c4 0c             	add    $0xc,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    2fe7:	a1 44 40 01 00       	mov    0x14044,%eax
    2fec:	83 ec 04             	sub    $0x4,%esp
    2fef:	ff 75 a4             	pushl  -0x5c(%ebp)
    2ff2:	ff 75 a0             	pushl  -0x60(%ebp)
    2ff5:	50                   	push   %eax
    2ff6:	e8 6f 1a 00 00       	call   4a6a <executeHandler>
    2ffb:	83 c4 10             	add    $0x10,%esp
    2ffe:	85 c0                	test   %eax,%eax
    3000:	74 14                	je     3016 <main+0x1cf>
				updateWindow(winid, context.addr);
    3002:	a1 00 3f 01 00       	mov    0x13f00,%eax
    3007:	83 ec 08             	sub    $0x8,%esp
    300a:	50                   	push   %eax
    300b:	ff 75 e4             	pushl  -0x1c(%ebp)
    300e:	e8 61 20 00 00       	call   5074 <updateWindow>
    3013:	83 c4 10             	add    $0x10,%esp
			}
			break;
    3016:	e9 4b 04 00 00       	jmp    3466 <main+0x61f>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    301b:	83 ec 04             	sub    $0x4,%esp
    301e:	ff 35 08 3f 01 00    	pushl  0x13f08
    3024:	ff 35 04 3f 01 00    	pushl  0x13f04
    302a:	ff 35 00 3f 01 00    	pushl  0x13f00
    3030:	e8 0d dd ff ff       	call   d42 <drawFinderContent>
    3035:	83 c4 10             	add    $0x10,%esp
			drawFinderWnd(context);
    3038:	83 ec 04             	sub    $0x4,%esp
    303b:	ff 35 08 3f 01 00    	pushl  0x13f08
    3041:	ff 35 04 3f 01 00    	pushl  0x13f04
    3047:	ff 35 00 3f 01 00    	pushl  0x13f00
    304d:	e8 7d da ff ff       	call   acf <drawFinderWnd>
    3052:	83 c4 10             	add    $0x10,%esp
			updateWindow(winid, context.addr);
    3055:	a1 00 3f 01 00       	mov    0x13f00,%eax
    305a:	83 ec 08             	sub    $0x8,%esp
    305d:	50                   	push   %eax
    305e:	ff 75 e4             	pushl  -0x1c(%ebp)
    3061:	e8 0e 20 00 00       	call   5074 <updateWindow>
    3066:	83 c4 10             	add    $0x10,%esp
			break;
    3069:	e9 f8 03 00 00       	jmp    3466 <main+0x61f>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    306e:	8b 75 b8             	mov    -0x48(%ebp),%esi
    3071:	8b 5d b4             	mov    -0x4c(%ebp),%ebx
    3074:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    3077:	8b 55 ac             	mov    -0x54(%ebp),%edx
    307a:	a1 00 3f 01 00       	mov    0x13f00,%eax
    307f:	83 ec 08             	sub    $0x8,%esp
    3082:	56                   	push   %esi
    3083:	53                   	push   %ebx
    3084:	51                   	push   %ecx
    3085:	52                   	push   %edx
    3086:	50                   	push   %eax
    3087:	ff 75 e4             	pushl  -0x1c(%ebp)
    308a:	e8 ed 1f 00 00       	call   507c <updatePartialWindow>
    308f:	83 c4 20             	add    $0x20,%esp
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    3092:	e9 cf 03 00 00       	jmp    3466 <main+0x61f>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    3097:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    309a:	8b 55 ac             	mov    -0x54(%ebp),%edx
    309d:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    30a3:	83 ec 04             	sub    $0x4,%esp
    30a6:	51                   	push   %ecx
    30a7:	52                   	push   %edx
    30a8:	50                   	push   %eax
    30a9:	e8 fe 16 00 00       	call   47ac <initPoint>
    30ae:	83 c4 0c             	add    $0xc,%esp
    30b1:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    30b7:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
    30bd:	89 45 a0             	mov    %eax,-0x60(%ebp)
    30c0:	89 55 a4             	mov    %edx,-0x5c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			// if (executeHandler(cm.left_click, p)) {
			// 	updateWindow(winid, context.addr);
			// }
			if(renaming == 1){
    30c3:	a1 54 40 01 00       	mov    0x14054,%eax
    30c8:	83 f8 01             	cmp    $0x1,%eax
    30cb:	75 19                	jne    30e6 <main+0x29f>
				unrename();
    30cd:	e8 d0 f0 ff ff       	call   21a2 <unrename>
				updateWindow(winid, context.addr);
    30d2:	a1 00 3f 01 00       	mov    0x13f00,%eax
    30d7:	83 ec 08             	sub    $0x8,%esp
    30da:	50                   	push   %eax
    30db:	ff 75 e4             	pushl  -0x1c(%ebp)
    30de:	e8 91 1f 00 00       	call   5074 <updateWindow>
    30e3:	83 c4 10             	add    $0x10,%esp
			}
			executeHandler(cm.left_click, p);
    30e6:	a1 40 40 01 00       	mov    0x14040,%eax
    30eb:	83 ec 04             	sub    $0x4,%esp
    30ee:	ff 75 a4             	pushl  -0x5c(%ebp)
    30f1:	ff 75 a0             	pushl  -0x60(%ebp)
    30f4:	50                   	push   %eax
    30f5:	e8 70 19 00 00       	call   4a6a <executeHandler>
    30fa:	83 c4 10             	add    $0x10,%esp
			draw_searchbox();
    30fd:	e8 98 cf ff ff       	call   9a <draw_searchbox>
			puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
    3102:	83 ec 04             	sub    $0x4,%esp
    3105:	6a 28                	push   $0x28
    3107:	68 a4 01 00 00       	push   $0x1a4
    310c:	6a 00                	push   $0x0
    310e:	68 0c 3f 01 00       	push   $0x13f0c
    3113:	ff 35 08 3f 01 00    	pushl  0x13f08
    3119:	ff 35 04 3f 01 00    	pushl  0x13f04
    311f:	ff 35 00 3f 01 00    	pushl  0x13f00
    3125:	e8 b9 0a 00 00       	call   3be3 <puts_str>
    312a:	83 c4 20             	add    $0x20,%esp
				- (BUTTON_HEIGHT + 3) + 5);
			updateWindow(winid, context.addr);
    312d:	a1 00 3f 01 00       	mov    0x13f00,%eax
    3132:	83 ec 08             	sub    $0x8,%esp
    3135:	50                   	push   %eax
    3136:	ff 75 e4             	pushl  -0x1c(%ebp)
    3139:	e8 36 1f 00 00       	call   5074 <updateWindow>
    313e:	83 c4 10             	add    $0x10,%esp
			break;
    3141:	e9 20 03 00 00       	jmp    3466 <main+0x61f>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    3146:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    3149:	8b 55 ac             	mov    -0x54(%ebp),%edx
    314c:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    3152:	83 ec 04             	sub    $0x4,%esp
    3155:	51                   	push   %ecx
    3156:	52                   	push   %edx
    3157:	50                   	push   %eax
    3158:	e8 4f 16 00 00       	call   47ac <initPoint>
    315d:	83 c4 0c             	add    $0xc,%esp
    3160:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    3166:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
    316c:	89 45 a0             	mov    %eax,-0x60(%ebp)
    316f:	89 55 a4             	mov    %edx,-0x5c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    3172:	a1 48 40 01 00       	mov    0x14048,%eax
    3177:	83 ec 04             	sub    $0x4,%esp
    317a:	ff 75 a4             	pushl  -0x5c(%ebp)
    317d:	ff 75 a0             	pushl  -0x60(%ebp)
    3180:	50                   	push   %eax
    3181:	e8 e4 18 00 00       	call   4a6a <executeHandler>
    3186:	83 c4 10             	add    $0x10,%esp
    3189:	85 c0                	test   %eax,%eax
    318b:	74 14                	je     31a1 <main+0x35a>
				updateWindow(winid, context.addr);
    318d:	a1 00 3f 01 00       	mov    0x13f00,%eax
    3192:	83 ec 08             	sub    $0x8,%esp
    3195:	50                   	push   %eax
    3196:	ff 75 e4             	pushl  -0x1c(%ebp)
    3199:	e8 d6 1e 00 00       	call   5074 <updateWindow>
    319e:	83 c4 10             	add    $0x10,%esp
			}
			break;
    31a1:	e9 c0 02 00 00       	jmp    3466 <main+0x61f>
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
    31a6:	0f b6 45 ac          	movzbl -0x54(%ebp),%eax
    31aa:	88 45 e3             	mov    %al,-0x1d(%ebp)
			if (isSearching) {
    31ad:	a1 c0 35 01 00       	mov    0x135c0,%eax
    31b2:	85 c0                	test   %eax,%eax
    31b4:	0f 84 6b 01 00 00    	je     3325 <main+0x4de>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
    31ba:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    31be:	74 2a                	je     31ea <main+0x3a3>
    31c0:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    31c4:	74 24                	je     31ea <main+0x3a3>
    31c6:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    31ca:	7e 06                	jle    31d2 <main+0x38b>
    31cc:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    31d0:	7e 18                	jle    31ea <main+0x3a3>
    31d2:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    31d6:	7e 06                	jle    31de <main+0x397>
    31d8:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    31dc:	7e 0c                	jle    31ea <main+0x3a3>
    31de:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    31e2:	7e 4b                	jle    322f <main+0x3e8>
    31e4:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    31e8:	7f 45                	jg     322f <main+0x3e8>
    31ea:	a1 20 3f 01 00       	mov    0x13f20,%eax
    31ef:	83 f8 13             	cmp    $0x13,%eax
    31f2:	7f 3b                	jg     322f <main+0x3e8>
					keyContent.content[keyContent.length++] = key;
    31f4:	a1 20 3f 01 00       	mov    0x13f20,%eax
    31f9:	8d 50 01             	lea    0x1(%eax),%edx
    31fc:	89 15 20 3f 01 00    	mov    %edx,0x13f20
    3202:	0f b6 55 e3          	movzbl -0x1d(%ebp),%edx
    3206:	88 90 0c 3f 01 00    	mov    %dl,0x13f0c(%eax)
					scrollOffset = 0;
    320c:	c7 05 40 07 01 00 00 	movl   $0x0,0x10740
    3213:	00 00 00 
					printf(0, "%s\n", keyContent.content);
    3216:	83 ec 04             	sub    $0x4,%esp
    3219:	68 0c 3f 01 00       	push   $0x13f0c
    321e:	68 d4 b8 00 00       	push   $0xb8d4
    3223:	6a 00                	push   $0x0
    3225:	e8 6f 1f 00 00       	call   5199 <printf>
    322a:	83 c4 10             	add    $0x10,%esp
    322d:	eb 32                	jmp    3261 <main+0x41a>
				}
				else if (key == 8 && keyContent.length > 0) {
    322f:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    3233:	75 2c                	jne    3261 <main+0x41a>
    3235:	a1 20 3f 01 00       	mov    0x13f20,%eax
    323a:	85 c0                	test   %eax,%eax
    323c:	7e 23                	jle    3261 <main+0x41a>
					keyContent.content[--keyContent.length] = 0;
    323e:	a1 20 3f 01 00       	mov    0x13f20,%eax
    3243:	83 e8 01             	sub    $0x1,%eax
    3246:	a3 20 3f 01 00       	mov    %eax,0x13f20
    324b:	a1 20 3f 01 00       	mov    0x13f20,%eax
    3250:	c6 80 0c 3f 01 00 00 	movb   $0x0,0x13f0c(%eax)
					scrollOffset = 0;
    3257:	c7 05 40 07 01 00 00 	movl   $0x0,0x10740
    325e:	00 00 00 
				}
				deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    3261:	8d 45 d0             	lea    -0x30(%ebp),%eax
    3264:	83 ec 0c             	sub    $0xc,%esp
    3267:	68 58 02 00 00       	push   $0x258
    326c:	68 20 03 00 00       	push   $0x320
    3271:	6a 00                	push   $0x0
    3273:	6a 00                	push   $0x0
    3275:	50                   	push   %eax
    3276:	e8 58 15 00 00       	call   47d3 <initRect>
    327b:	83 c4 1c             	add    $0x1c,%esp
    327e:	83 ec 0c             	sub    $0xc,%esp
    3281:	ff 75 dc             	pushl  -0x24(%ebp)
    3284:	ff 75 d8             	pushl  -0x28(%ebp)
    3287:	ff 75 d4             	pushl  -0x2c(%ebp)
    328a:	ff 75 d0             	pushl  -0x30(%ebp)
    328d:	68 40 40 01 00       	push   $0x14040
    3292:	e8 01 17 00 00       	call   4998 <deleteClickable>
    3297:	83 c4 20             	add    $0x20,%esp
				addWndEvent(&cm);
    329a:	83 ec 0c             	sub    $0xc,%esp
    329d:	68 40 40 01 00       	push   $0x14040
    32a2:	e8 03 df ff ff       	call   11aa <addWndEvent>
    32a7:	83 c4 10             	add    $0x10,%esp
				updateFileList(context);
    32aa:	83 ec 04             	sub    $0x4,%esp
    32ad:	ff 35 08 3f 01 00    	pushl  0x13f08
    32b3:	ff 35 04 3f 01 00    	pushl  0x13f04
    32b9:	ff 35 00 3f 01 00    	pushl  0x13f00
    32bf:	e8 2b d9 ff ff       	call   bef <updateFileList>
    32c4:	83 c4 10             	add    $0x10,%esp
				addListEvent(&cm);
    32c7:	83 ec 0c             	sub    $0xc,%esp
    32ca:	68 40 40 01 00       	push   $0x14040
    32cf:	e8 7b de ff ff       	call   114f <addListEvent>
    32d4:	83 c4 10             	add    $0x10,%esp
				drawFinderContent(context);
    32d7:	83 ec 04             	sub    $0x4,%esp
    32da:	ff 35 08 3f 01 00    	pushl  0x13f08
    32e0:	ff 35 04 3f 01 00    	pushl  0x13f04
    32e6:	ff 35 00 3f 01 00    	pushl  0x13f00
    32ec:	e8 51 da ff ff       	call   d42 <drawFinderContent>
    32f1:	83 c4 10             	add    $0x10,%esp
				drawFinderWnd(context);
    32f4:	83 ec 04             	sub    $0x4,%esp
    32f7:	ff 35 08 3f 01 00    	pushl  0x13f08
    32fd:	ff 35 04 3f 01 00    	pushl  0x13f04
    3303:	ff 35 00 3f 01 00    	pushl  0x13f00
    3309:	e8 c1 d7 ff ff       	call   acf <drawFinderWnd>
    330e:	83 c4 10             	add    $0x10,%esp
				updateWindow(winid, context.addr);
    3311:	a1 00 3f 01 00       	mov    0x13f00,%eax
    3316:	83 ec 08             	sub    $0x8,%esp
    3319:	50                   	push   %eax
    331a:	ff 75 e4             	pushl  -0x1c(%ebp)
    331d:	e8 52 1d 00 00       	call   5074 <updateWindow>
    3322:	83 c4 10             	add    $0x10,%esp
			}
			if (renaming) {
    3325:	a1 54 40 01 00       	mov    0x14054,%eax
    332a:	85 c0                	test   %eax,%eax
    332c:	0f 84 31 01 00 00    	je     3463 <main+0x61c>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (strlen(currentlyRenaming->name)<30)) {
    3332:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    3336:	74 2a                	je     3362 <main+0x51b>
    3338:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    333c:	74 24                	je     3362 <main+0x51b>
    333e:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    3342:	7e 06                	jle    334a <main+0x503>
    3344:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    3348:	7e 18                	jle    3362 <main+0x51b>
    334a:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    334e:	7e 06                	jle    3356 <main+0x50f>
    3350:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    3354:	7e 0c                	jle    3362 <main+0x51b>
    3356:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    335a:	7e 6a                	jle    33c6 <main+0x57f>
    335c:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    3360:	7f 64                	jg     33c6 <main+0x57f>
    3362:	a1 4c 07 01 00       	mov    0x1074c,%eax
    3367:	8b 40 14             	mov    0x14(%eax),%eax
    336a:	83 ec 0c             	sub    $0xc,%esp
    336d:	50                   	push   %eax
    336e:	e8 88 1a 00 00       	call   4dfb <strlen>
    3373:	83 c4 10             	add    $0x10,%esp
    3376:	83 f8 1d             	cmp    $0x1d,%eax
    3379:	77 4b                	ja     33c6 <main+0x57f>
					currentlyRenaming->name[strlen(currentlyRenaming->name) + 1] = 0;
    337b:	a1 4c 07 01 00       	mov    0x1074c,%eax
    3380:	8b 58 14             	mov    0x14(%eax),%ebx
    3383:	a1 4c 07 01 00       	mov    0x1074c,%eax
    3388:	8b 40 14             	mov    0x14(%eax),%eax
    338b:	83 ec 0c             	sub    $0xc,%esp
    338e:	50                   	push   %eax
    338f:	e8 67 1a 00 00       	call   4dfb <strlen>
    3394:	83 c4 10             	add    $0x10,%esp
    3397:	83 c0 01             	add    $0x1,%eax
    339a:	01 d8                	add    %ebx,%eax
    339c:	c6 00 00             	movb   $0x0,(%eax)
					currentlyRenaming->name[strlen(currentlyRenaming->name)] = key;
    339f:	a1 4c 07 01 00       	mov    0x1074c,%eax
    33a4:	8b 58 14             	mov    0x14(%eax),%ebx
    33a7:	a1 4c 07 01 00       	mov    0x1074c,%eax
    33ac:	8b 40 14             	mov    0x14(%eax),%eax
    33af:	83 ec 0c             	sub    $0xc,%esp
    33b2:	50                   	push   %eax
    33b3:	e8 43 1a 00 00       	call   4dfb <strlen>
    33b8:	83 c4 10             	add    $0x10,%esp
    33bb:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    33be:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
    33c2:	88 02                	mov    %al,(%edx)
    33c4:	eb 4f                	jmp    3415 <main+0x5ce>
				}
				else if (key == 8 && (strlen(currentlyRenaming->name)>0)) {
    33c6:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    33ca:	75 3e                	jne    340a <main+0x5c3>
    33cc:	a1 4c 07 01 00       	mov    0x1074c,%eax
    33d1:	8b 40 14             	mov    0x14(%eax),%eax
    33d4:	83 ec 0c             	sub    $0xc,%esp
    33d7:	50                   	push   %eax
    33d8:	e8 1e 1a 00 00       	call   4dfb <strlen>
    33dd:	83 c4 10             	add    $0x10,%esp
    33e0:	85 c0                	test   %eax,%eax
    33e2:	74 26                	je     340a <main+0x5c3>
					currentlyRenaming->name[strlen(currentlyRenaming->name) - 1] = 0;
    33e4:	a1 4c 07 01 00       	mov    0x1074c,%eax
    33e9:	8b 58 14             	mov    0x14(%eax),%ebx
    33ec:	a1 4c 07 01 00       	mov    0x1074c,%eax
    33f1:	8b 40 14             	mov    0x14(%eax),%eax
    33f4:	83 ec 0c             	sub    $0xc,%esp
    33f7:	50                   	push   %eax
    33f8:	e8 fe 19 00 00       	call   4dfb <strlen>
    33fd:	83 c4 10             	add    $0x10,%esp
    3400:	83 e8 01             	sub    $0x1,%eax
    3403:	01 d8                	add    %ebx,%eax
    3405:	c6 00 00             	movb   $0x0,(%eax)
    3408:	eb 0b                	jmp    3415 <main+0x5ce>
				} else if (key == '\n') {
    340a:	80 7d e3 0a          	cmpb   $0xa,-0x1d(%ebp)
    340e:	75 05                	jne    3415 <main+0x5ce>
					unrename();
    3410:	e8 8d ed ff ff       	call   21a2 <unrename>
				}
				drawFinderContent(context);
    3415:	83 ec 04             	sub    $0x4,%esp
    3418:	ff 35 08 3f 01 00    	pushl  0x13f08
    341e:	ff 35 04 3f 01 00    	pushl  0x13f04
    3424:	ff 35 00 3f 01 00    	pushl  0x13f00
    342a:	e8 13 d9 ff ff       	call   d42 <drawFinderContent>
    342f:	83 c4 10             	add    $0x10,%esp
				drawFinderWnd(context);
    3432:	83 ec 04             	sub    $0x4,%esp
    3435:	ff 35 08 3f 01 00    	pushl  0x13f08
    343b:	ff 35 04 3f 01 00    	pushl  0x13f04
    3441:	ff 35 00 3f 01 00    	pushl  0x13f00
    3447:	e8 83 d6 ff ff       	call   acf <drawFinderWnd>
    344c:	83 c4 10             	add    $0x10,%esp
				updateWindow(winid, context.addr);
    344f:	a1 00 3f 01 00       	mov    0x13f00,%eax
    3454:	83 ec 08             	sub    $0x8,%esp
    3457:	50                   	push   %eax
    3458:	ff 75 e4             	pushl  -0x1c(%ebp)
    345b:	e8 14 1c 00 00       	call   5074 <updateWindow>
    3460:	83 c4 10             	add    $0x10,%esp
			}
			break;
    3463:	eb 01                	jmp    3466 <main+0x61f>
		default:
			break;
    3465:	90                   	nop
	updateFileList(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    3466:	a1 00 fd 00 00       	mov    0xfd00,%eax
    346b:	85 c0                	test   %eax,%eax
    346d:	0f 85 39 fb ff ff    	jne    2fac <main+0x165>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    3473:	83 ec 08             	sub    $0x8,%esp
    3476:	ff 75 e4             	pushl  -0x1c(%ebp)
    3479:	68 00 3f 01 00       	push   $0x13f00
    347e:	e8 95 01 00 00       	call   3618 <free_context>
    3483:	83 c4 10             	add    $0x10,%esp
	exit();
    3486:	e8 31 1b 00 00       	call   4fbc <exit>

0000348b <testHandlers>:
}

void testHandlers() {
    348b:	55                   	push   %ebp
    348c:	89 e5                	mov    %esp,%ebp
    348e:	83 ec 08             	sub    $0x8,%esp

	list(".");
    3491:	83 ec 0c             	sub    $0xc,%esp
    3494:	68 c8 b8 00 00       	push   $0xb8c8
    3499:	e8 e9 cf ff ff       	call   487 <list>
    349e:	83 c4 10             	add    $0x10,%esp
	printf(0, "original list:\n");
    34a1:	83 ec 08             	sub    $0x8,%esp
    34a4:	68 44 bc 00 00       	push   $0xbc44
    34a9:	6a 00                	push   $0x0
    34ab:	e8 e9 1c 00 00       	call   5199 <printf>
    34b0:	83 c4 10             	add    $0x10,%esp
	printItemList();
    34b3:	e8 f8 da ff ff       	call   fb0 <printItemList>
	printf(0, "\n");
    34b8:	83 ec 08             	sub    $0x8,%esp
    34bb:	68 54 bc 00 00       	push   $0xbc54
    34c0:	6a 00                	push   $0x0
    34c2:	e8 d2 1c 00 00       	call   5199 <printf>
    34c7:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a folder:\n");
    34ca:	83 ec 08             	sub    $0x8,%esp
    34cd:	68 56 bc 00 00       	push   $0xbc56
    34d2:	6a 00                	push   $0x0
    34d4:	e8 c0 1c 00 00       	call   5199 <printf>
    34d9:	83 c4 10             	add    $0x10,%esp
	newFolder("newfolder");
    34dc:	83 ec 0c             	sub    $0xc,%esp
    34df:	68 65 bc 00 00       	push   $0xbc65
    34e4:	e8 64 e6 ff ff       	call   1b4d <newFolder>
    34e9:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    34ec:	e8 ac ce ff ff       	call   39d <freeFileItemList>
	list(".");
    34f1:	83 ec 0c             	sub    $0xc,%esp
    34f4:	68 c8 b8 00 00       	push   $0xb8c8
    34f9:	e8 89 cf ff ff       	call   487 <list>
    34fe:	83 c4 10             	add    $0x10,%esp
	printItemList();
    3501:	e8 aa da ff ff       	call   fb0 <printItemList>
	printf(0, "\n");
    3506:	83 ec 08             	sub    $0x8,%esp
    3509:	68 54 bc 00 00       	push   $0xbc54
    350e:	6a 00                	push   $0x0
    3510:	e8 84 1c 00 00       	call   5199 <printf>
    3515:	83 c4 10             	add    $0x10,%esp
	printf(0, "enter new folder:\n");
    3518:	83 ec 08             	sub    $0x8,%esp
    351b:	68 6f bc 00 00       	push   $0xbc6f
    3520:	6a 00                	push   $0x0
    3522:	e8 72 1c 00 00       	call   5199 <printf>
    3527:	83 c4 10             	add    $0x10,%esp
	enterDir("newfolder");
    352a:	83 ec 0c             	sub    $0xc,%esp
    352d:	68 65 bc 00 00       	push   $0xbc65
    3532:	e8 d1 e2 ff ff       	call   1808 <enterDir>
    3537:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    353a:	e8 5e ce ff ff       	call   39d <freeFileItemList>
	list(".");
    353f:	83 ec 0c             	sub    $0xc,%esp
    3542:	68 c8 b8 00 00       	push   $0xb8c8
    3547:	e8 3b cf ff ff       	call   487 <list>
    354c:	83 c4 10             	add    $0x10,%esp
	printItemList();
    354f:	e8 5c da ff ff       	call   fb0 <printItemList>
	printf(0, "\n");
    3554:	83 ec 08             	sub    $0x8,%esp
    3557:	68 54 bc 00 00       	push   $0xbc54
    355c:	6a 00                	push   $0x0
    355e:	e8 36 1c 00 00       	call   5199 <printf>
    3563:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a file:\n");
    3566:	83 ec 08             	sub    $0x8,%esp
    3569:	68 82 bc 00 00       	push   $0xbc82
    356e:	6a 00                	push   $0x0
    3570:	e8 24 1c 00 00       	call   5199 <printf>
    3575:	83 c4 10             	add    $0x10,%esp
	newFile("newfile.txt");
    3578:	83 ec 0c             	sub    $0xc,%esp
    357b:	68 8f bc 00 00       	push   $0xbc8f
    3580:	e8 d6 e3 ff ff       	call   195b <newFile>
    3585:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    3588:	e8 10 ce ff ff       	call   39d <freeFileItemList>
	list(".");
    358d:	83 ec 0c             	sub    $0xc,%esp
    3590:	68 c8 b8 00 00       	push   $0xb8c8
    3595:	e8 ed ce ff ff       	call   487 <list>
    359a:	83 c4 10             	add    $0x10,%esp
	printItemList();
    359d:	e8 0e da ff ff       	call   fb0 <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    35a2:	c9                   	leave  
    35a3:	c3                   	ret    

000035a4 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    35a4:	55                   	push   %ebp
    35a5:	89 e5                	mov    %esp,%ebp
    35a7:	83 ec 08             	sub    $0x8,%esp
    context_ptr->width = width;
    35aa:	8b 45 08             	mov    0x8(%ebp),%eax
    35ad:	8b 55 0c             	mov    0xc(%ebp),%edx
    35b0:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    35b3:	8b 45 08             	mov    0x8(%ebp),%eax
    35b6:	8b 55 10             	mov    0x10(%ebp),%edx
    35b9:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    35bc:	8b 55 0c             	mov    0xc(%ebp),%edx
    35bf:	8b 45 10             	mov    0x10(%ebp),%eax
    35c2:	0f af c2             	imul   %edx,%eax
    35c5:	01 c0                	add    %eax,%eax
    35c7:	83 ec 0c             	sub    $0xc,%esp
    35ca:	50                   	push   %eax
    35cb:	e8 9a 1e 00 00       	call   546a <malloc>
    35d0:	83 c4 10             	add    $0x10,%esp
    35d3:	89 c2                	mov    %eax,%edx
    35d5:	8b 45 08             	mov    0x8(%ebp),%eax
    35d8:	89 10                	mov    %edx,(%eax)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    35da:	8b 55 0c             	mov    0xc(%ebp),%edx
    35dd:	8b 45 10             	mov    0x10(%ebp),%eax
    35e0:	0f af c2             	imul   %edx,%eax
    35e3:	8d 14 00             	lea    (%eax,%eax,1),%edx
    35e6:	8b 45 08             	mov    0x8(%ebp),%eax
    35e9:	8b 00                	mov    (%eax),%eax
    35eb:	83 ec 04             	sub    $0x4,%esp
    35ee:	52                   	push   %edx
    35ef:	6a 00                	push   $0x0
    35f1:	50                   	push   %eax
    35f2:	e8 2b 18 00 00       	call   4e22 <memset>
    35f7:	83 c4 10             	add    $0x10,%esp
    initializeASCII();
    35fa:	e8 73 01 00 00       	call   3772 <initializeASCII>
    initializeGBK();
    35ff:	e8 f4 02 00 00       	call   38f8 <initializeGBK>
    return createWindow(0, 0, width, height);
    3604:	ff 75 10             	pushl  0x10(%ebp)
    3607:	ff 75 0c             	pushl  0xc(%ebp)
    360a:	6a 00                	push   $0x0
    360c:	6a 00                	push   $0x0
    360e:	e8 51 1a 00 00       	call   5064 <createWindow>
    3613:	83 c4 10             	add    $0x10,%esp
}
    3616:	c9                   	leave  
    3617:	c3                   	ret    

00003618 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    3618:	55                   	push   %ebp
    3619:	89 e5                	mov    %esp,%ebp
    361b:	83 ec 08             	sub    $0x8,%esp
    free(context_ptr->addr);
    361e:	8b 45 08             	mov    0x8(%ebp),%eax
    3621:	8b 00                	mov    (%eax),%eax
    3623:	83 ec 0c             	sub    $0xc,%esp
    3626:	50                   	push   %eax
    3627:	e8 fd 1c 00 00       	call   5329 <free>
    362c:	83 c4 10             	add    $0x10,%esp
    freeASCII();
    362f:	e8 ab 02 00 00       	call   38df <freeASCII>
    freeGBK();
    3634:	e8 60 03 00 00       	call   3999 <freeGBK>
    destroyWindow(winid);
    3639:	83 ec 0c             	sub    $0xc,%esp
    363c:	ff 75 0c             	pushl  0xc(%ebp)
    363f:	e8 28 1a 00 00       	call   506c <destroyWindow>
    3644:	83 c4 10             	add    $0x10,%esp
}
    3647:	c9                   	leave  
    3648:	c3                   	ret    

00003649 <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    3649:	55                   	push   %ebp
    364a:	89 e5                	mov    %esp,%ebp
    364c:	83 ec 04             	sub    $0x4,%esp
    364f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3652:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    3656:	8b 45 0c             	mov    0xc(%ebp),%eax
    3659:	3b 45 14             	cmp    0x14(%ebp),%eax
    365c:	77 02                	ja     3660 <draw_point+0x17>
    return;
    365e:	eb 26                	jmp    3686 <draw_point+0x3d>
  if(y >= c.height)
    3660:	8b 45 10             	mov    0x10(%ebp),%eax
    3663:	3b 45 18             	cmp    0x18(%ebp),%eax
    3666:	77 02                	ja     366a <draw_point+0x21>
    return;
    3668:	eb 1c                	jmp    3686 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    366a:	8b 45 08             	mov    0x8(%ebp),%eax
    366d:	8b 55 0c             	mov    0xc(%ebp),%edx
    3670:	89 d1                	mov    %edx,%ecx
    3672:	0f af 4d 18          	imul   0x18(%ebp),%ecx
    3676:	8b 55 14             	mov    0x14(%ebp),%edx
    3679:	01 ca                	add    %ecx,%edx
    367b:	01 d2                	add    %edx,%edx
    367d:	01 c2                	add    %eax,%edx
    367f:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    3683:	66 89 02             	mov    %ax,(%edx)
}
    3686:	c9                   	leave  
    3687:	c3                   	ret    

00003688 <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    3688:	55                   	push   %ebp
    3689:	89 e5                	mov    %esp,%ebp
    368b:	83 ec 14             	sub    $0x14,%esp
    368e:	8b 45 24             	mov    0x24(%ebp),%eax
    3691:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    3695:	8b 55 14             	mov    0x14(%ebp),%edx
    3698:	8b 45 1c             	mov    0x1c(%ebp),%eax
    369b:	01 d0                	add    %edx,%eax
    369d:	8b 55 0c             	mov    0xc(%ebp),%edx
    36a0:	39 d0                	cmp    %edx,%eax
    36a2:	0f 47 c2             	cmova  %edx,%eax
    36a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    36a8:	8b 55 18             	mov    0x18(%ebp),%edx
    36ab:	8b 45 20             	mov    0x20(%ebp),%eax
    36ae:	01 d0                	add    %edx,%eax
    36b0:	8b 55 10             	mov    0x10(%ebp),%edx
    36b3:	39 d0                	cmp    %edx,%eax
    36b5:	0f 47 c2             	cmova  %edx,%eax
    36b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    36bb:	8b 45 18             	mov    0x18(%ebp),%eax
    36be:	89 45 f8             	mov    %eax,-0x8(%ebp)
    36c1:	eb 36                	jmp    36f9 <fill_rect+0x71>
	{
		for (x = bx; x < mx; x++)
    36c3:	8b 45 14             	mov    0x14(%ebp),%eax
    36c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    36c9:	eb 22                	jmp    36ed <fill_rect+0x65>
		{
			draw_point(c, x, y, color);
    36cb:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    36cf:	8b 55 f8             	mov    -0x8(%ebp),%edx
    36d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    36d5:	51                   	push   %ecx
    36d6:	52                   	push   %edx
    36d7:	50                   	push   %eax
    36d8:	ff 75 10             	pushl  0x10(%ebp)
    36db:	ff 75 0c             	pushl  0xc(%ebp)
    36de:	ff 75 08             	pushl  0x8(%ebp)
    36e1:	e8 63 ff ff ff       	call   3649 <draw_point>
    36e6:	83 c4 18             	add    $0x18,%esp
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    36e9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    36ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
    36f0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    36f3:	7c d6                	jl     36cb <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    36f5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    36f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    36fc:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    36ff:	7c c2                	jl     36c3 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    3701:	c9                   	leave  
    3702:	c3                   	ret    

00003703 <printBinary>:

void printBinary(char c)
{
    3703:	55                   	push   %ebp
    3704:	89 e5                	mov    %esp,%ebp
    3706:	83 ec 28             	sub    $0x28,%esp
    3709:	8b 45 08             	mov    0x8(%ebp),%eax
    370c:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    370f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3716:	eb 40                	jmp    3758 <printBinary+0x55>
	{
		if(((c << i) & 0x80) != 0)
    3718:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    371c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    371f:	89 c1                	mov    %eax,%ecx
    3721:	d3 e2                	shl    %cl,%edx
    3723:	89 d0                	mov    %edx,%eax
    3725:	25 80 00 00 00       	and    $0x80,%eax
    372a:	85 c0                	test   %eax,%eax
    372c:	74 14                	je     3742 <printBinary+0x3f>
		{
			printf(0, "1");
    372e:	83 ec 08             	sub    $0x8,%esp
    3731:	68 9b bc 00 00       	push   $0xbc9b
    3736:	6a 00                	push   $0x0
    3738:	e8 5c 1a 00 00       	call   5199 <printf>
    373d:	83 c4 10             	add    $0x10,%esp
    3740:	eb 12                	jmp    3754 <printBinary+0x51>
		}
		else
		{
			printf(0, "0");
    3742:	83 ec 08             	sub    $0x8,%esp
    3745:	68 9d bc 00 00       	push   $0xbc9d
    374a:	6a 00                	push   $0x0
    374c:	e8 48 1a 00 00       	call   5199 <printf>
    3751:	83 c4 10             	add    $0x10,%esp
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    3754:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3758:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    375c:	7e ba                	jle    3718 <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    375e:	83 ec 08             	sub    $0x8,%esp
    3761:	68 9f bc 00 00       	push   $0xbc9f
    3766:	6a 00                	push   $0x0
    3768:	e8 2c 1a 00 00       	call   5199 <printf>
    376d:	83 c4 10             	add    $0x10,%esp
}
    3770:	c9                   	leave  
    3771:	c3                   	ret    

00003772 <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    3772:	55                   	push   %ebp
    3773:	89 e5                	mov    %esp,%ebp
    3775:	56                   	push   %esi
    3776:	53                   	push   %ebx
    3777:	83 ec 20             	sub    $0x20,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    377a:	83 ec 08             	sub    $0x8,%esp
    377d:	68 a1 bc 00 00       	push   $0xbca1
    3782:	6a 00                	push   $0x0
    3784:	e8 10 1a 00 00       	call   5199 <printf>
    3789:	83 c4 10             	add    $0x10,%esp
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    378c:	83 ec 08             	sub    $0x8,%esp
    378f:	6a 00                	push   $0x0
    3791:	68 b4 bc 00 00       	push   $0xbcb4
    3796:	e8 61 18 00 00       	call   4ffc <open>
    379b:	83 c4 10             	add    $0x10,%esp
    379e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    37a1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    37a5:	79 1c                	jns    37c3 <initializeASCII+0x51>
	  printf(0,"cannot open %s\n", HANKAKU);
    37a7:	83 ec 04             	sub    $0x4,%esp
    37aa:	68 b4 bc 00 00       	push   $0xbcb4
    37af:	68 c0 bc 00 00       	push   $0xbcc0
    37b4:	6a 00                	push   $0x0
    37b6:	e8 de 19 00 00       	call   5199 <printf>
    37bb:	83 c4 10             	add    $0x10,%esp
	  return;
    37be:	e9 15 01 00 00       	jmp    38d8 <initializeASCII+0x166>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    37c3:	83 ec 0c             	sub    $0xc,%esp
    37c6:	68 00 10 00 00       	push   $0x1000
    37cb:	e8 9a 1c 00 00       	call   546a <malloc>
    37d0:	83 c4 10             	add    $0x10,%esp
    37d3:	a3 80 40 01 00       	mov    %eax,0x14080
	for (i = 0; i < ASCII_NUM; i++)
    37d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    37df:	eb 12                	jmp    37f3 <initializeASCII+0x81>
	{
		hankaku[i] = 0;
    37e1:	8b 15 80 40 01 00    	mov    0x14080,%edx
    37e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37ea:	01 d0                	add    %edx,%eax
    37ec:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    37ef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    37f3:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    37fa:	7e e5                	jle    37e1 <initializeASCII+0x6f>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    37fc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    3803:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    380a:	e9 84 00 00 00       	jmp    3893 <initializeASCII+0x121>
	{
		for (i = 0; i < n; i++){
    380f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3816:	eb 73                	jmp    388b <initializeASCII+0x119>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    3818:	8b 45 f4             	mov    -0xc(%ebp),%eax
    381b:	05 c0 40 01 00       	add    $0x140c0,%eax
    3820:	0f b6 00             	movzbl (%eax),%eax
    3823:	3c 2a                	cmp    $0x2a,%al
    3825:	74 0f                	je     3836 <initializeASCII+0xc4>
    3827:	8b 45 f4             	mov    -0xc(%ebp),%eax
    382a:	05 c0 40 01 00       	add    $0x140c0,%eax
    382f:	0f b6 00             	movzbl (%eax),%eax
    3832:	3c 2e                	cmp    $0x2e,%al
    3834:	75 51                	jne    3887 <initializeASCII+0x115>
			{
				if (buf[i] == '*')
    3836:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3839:	05 c0 40 01 00       	add    $0x140c0,%eax
    383e:	0f b6 00             	movzbl (%eax),%eax
    3841:	3c 2a                	cmp    $0x2a,%al
    3843:	75 2d                	jne    3872 <initializeASCII+0x100>
				{
					hankaku[y] |= (0x80 >> x);
    3845:	8b 15 80 40 01 00    	mov    0x14080,%edx
    384b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    384e:	01 c2                	add    %eax,%edx
    3850:	8b 0d 80 40 01 00    	mov    0x14080,%ecx
    3856:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3859:	01 c8                	add    %ecx,%eax
    385b:	0f b6 00             	movzbl (%eax),%eax
    385e:	89 c3                	mov    %eax,%ebx
    3860:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3863:	be 80 00 00 00       	mov    $0x80,%esi
    3868:	89 c1                	mov    %eax,%ecx
    386a:	d3 fe                	sar    %cl,%esi
    386c:	89 f0                	mov    %esi,%eax
    386e:	09 d8                	or     %ebx,%eax
    3870:	88 02                	mov    %al,(%edx)
				}
				x ++;
    3872:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    3876:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    387a:	7e 0b                	jle    3887 <initializeASCII+0x115>
				{
					x = 0;
    387c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    3883:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    3887:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    388b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    388e:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    3891:	7c 85                	jl     3818 <initializeASCII+0xa6>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    3893:	83 ec 04             	sub    $0x4,%esp
    3896:	68 00 02 00 00       	push   $0x200
    389b:	68 c0 40 01 00       	push   $0x140c0
    38a0:	ff 75 e8             	pushl  -0x18(%ebp)
    38a3:	e8 2c 17 00 00       	call   4fd4 <read>
    38a8:	83 c4 10             	add    $0x10,%esp
    38ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    38ae:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    38b2:	0f 8f 57 ff ff ff    	jg     380f <initializeASCII+0x9d>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    38b8:	83 ec 08             	sub    $0x8,%esp
    38bb:	68 d0 bc 00 00       	push   $0xbcd0
    38c0:	6a 00                	push   $0x0
    38c2:	e8 d2 18 00 00       	call   5199 <printf>
    38c7:	83 c4 10             	add    $0x10,%esp
	close(fd);
    38ca:	83 ec 0c             	sub    $0xc,%esp
    38cd:	ff 75 e8             	pushl  -0x18(%ebp)
    38d0:	e8 0f 17 00 00       	call   4fe4 <close>
    38d5:	83 c4 10             	add    $0x10,%esp
}
    38d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
    38db:	5b                   	pop    %ebx
    38dc:	5e                   	pop    %esi
    38dd:	5d                   	pop    %ebp
    38de:	c3                   	ret    

000038df <freeASCII>:

void freeASCII(){
    38df:	55                   	push   %ebp
    38e0:	89 e5                	mov    %esp,%ebp
    38e2:	83 ec 08             	sub    $0x8,%esp
	free(hankaku);
    38e5:	a1 80 40 01 00       	mov    0x14080,%eax
    38ea:	83 ec 0c             	sub    $0xc,%esp
    38ed:	50                   	push   %eax
    38ee:	e8 36 1a 00 00       	call   5329 <free>
    38f3:	83 c4 10             	add    $0x10,%esp
}
    38f6:	c9                   	leave  
    38f7:	c3                   	ret    

000038f8 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    38f8:	55                   	push   %ebp
    38f9:	89 e5                	mov    %esp,%ebp
    38fb:	83 ec 18             	sub    $0x18,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    38fe:	83 ec 08             	sub    $0x8,%esp
    3901:	68 ed bc 00 00       	push   $0xbced
    3906:	6a 00                	push   $0x0
    3908:	e8 8c 18 00 00       	call   5199 <printf>
    390d:	83 c4 10             	add    $0x10,%esp
	if((fd = open(HZK16, 0)) < 0){
    3910:	83 ec 08             	sub    $0x8,%esp
    3913:	6a 00                	push   $0x0
    3915:	68 fe bc 00 00       	push   $0xbcfe
    391a:	e8 dd 16 00 00       	call   4ffc <open>
    391f:	83 c4 10             	add    $0x10,%esp
    3922:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3925:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3929:	79 19                	jns    3944 <initializeGBK+0x4c>
		printf(0,"cannot open %s\n", HZK16);
    392b:	83 ec 04             	sub    $0x4,%esp
    392e:	68 fe bc 00 00       	push   $0xbcfe
    3933:	68 c0 bc 00 00       	push   $0xbcc0
    3938:	6a 00                	push   $0x0
    393a:	e8 5a 18 00 00       	call   5199 <printf>
    393f:	83 c4 10             	add    $0x10,%esp
		return;
    3942:	eb 53                	jmp    3997 <initializeGBK+0x9f>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    3944:	83 ec 0c             	sub    $0xc,%esp
    3947:	68 78 69 00 00       	push   $0x6978
    394c:	e8 19 1b 00 00       	call   546a <malloc>
    3951:	83 c4 10             	add    $0x10,%esp
    3954:	a3 84 40 01 00       	mov    %eax,0x14084
	fontFile.size = read(fd, fontFile.buf, 27000);
    3959:	a1 84 40 01 00       	mov    0x14084,%eax
    395e:	83 ec 04             	sub    $0x4,%esp
    3961:	68 78 69 00 00       	push   $0x6978
    3966:	50                   	push   %eax
    3967:	ff 75 f4             	pushl  -0xc(%ebp)
    396a:	e8 65 16 00 00       	call   4fd4 <read>
    396f:	83 c4 10             	add    $0x10,%esp
    3972:	a3 88 40 01 00       	mov    %eax,0x14088
	printf(0,"initialzing gbk complete!\n");
    3977:	83 ec 08             	sub    $0x8,%esp
    397a:	68 08 bd 00 00       	push   $0xbd08
    397f:	6a 00                	push   $0x0
    3981:	e8 13 18 00 00       	call   5199 <printf>
    3986:	83 c4 10             	add    $0x10,%esp
	close(fd);
    3989:	83 ec 0c             	sub    $0xc,%esp
    398c:	ff 75 f4             	pushl  -0xc(%ebp)
    398f:	e8 50 16 00 00       	call   4fe4 <close>
    3994:	83 c4 10             	add    $0x10,%esp
}
    3997:	c9                   	leave  
    3998:	c3                   	ret    

00003999 <freeGBK>:

void freeGBK(){
    3999:	55                   	push   %ebp
    399a:	89 e5                	mov    %esp,%ebp
    399c:	83 ec 08             	sub    $0x8,%esp
	free(fontFile.buf);
    399f:	a1 84 40 01 00       	mov    0x14084,%eax
    39a4:	83 ec 0c             	sub    $0xc,%esp
    39a7:	50                   	push   %eax
    39a8:	e8 7c 19 00 00       	call   5329 <free>
    39ad:	83 c4 10             	add    $0x10,%esp
}
    39b0:	c9                   	leave  
    39b1:	c3                   	ret    

000039b2 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    39b2:	55                   	push   %ebp
    39b3:	89 e5                	mov    %esp,%ebp
    39b5:	53                   	push   %ebx
    39b6:	83 ec 18             	sub    $0x18,%esp
    39b9:	8b 55 14             	mov    0x14(%ebp),%edx
    39bc:	8b 45 18             	mov    0x18(%ebp),%eax
    39bf:	88 55 e8             	mov    %dl,-0x18(%ebp)
    39c2:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    39c6:	8b 45 20             	mov    0x20(%ebp),%eax
    39c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    39cc:	eb 6b                	jmp    3a39 <put_ascii+0x87>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    39ce:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    39d5:	eb 58                	jmp    3a2f <put_ascii+0x7d>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    39d7:	8b 15 80 40 01 00    	mov    0x14080,%edx
    39dd:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
    39e1:	c1 e0 04             	shl    $0x4,%eax
    39e4:	89 c1                	mov    %eax,%ecx
    39e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39e9:	2b 45 20             	sub    0x20(%ebp),%eax
    39ec:	01 c8                	add    %ecx,%eax
    39ee:	01 d0                	add    %edx,%eax
    39f0:	0f b6 00             	movzbl (%eax),%eax
    39f3:	0f b6 d0             	movzbl %al,%edx
    39f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    39f9:	89 c1                	mov    %eax,%ecx
    39fb:	d3 e2                	shl    %cl,%edx
    39fd:	89 d0                	mov    %edx,%eax
    39ff:	25 80 00 00 00       	and    $0x80,%eax
    3a04:	85 c0                	test   %eax,%eax
    3a06:	74 23                	je     3a2b <put_ascii+0x79>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    3a08:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a0f:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3a12:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    3a15:	01 d9                	add    %ebx,%ecx
    3a17:	52                   	push   %edx
    3a18:	50                   	push   %eax
    3a19:	51                   	push   %ecx
    3a1a:	ff 75 10             	pushl  0x10(%ebp)
    3a1d:	ff 75 0c             	pushl  0xc(%ebp)
    3a20:	ff 75 08             	pushl  0x8(%ebp)
    3a23:	e8 21 fc ff ff       	call   3649 <draw_point>
    3a28:	83 c4 18             	add    $0x18,%esp
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    3a2b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3a2f:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    3a33:	7e a2                	jle    39d7 <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    3a35:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3a39:	8b 45 20             	mov    0x20(%ebp),%eax
    3a3c:	83 c0 10             	add    $0x10,%eax
    3a3f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3a42:	7f 8a                	jg     39ce <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    3a44:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3a47:	c9                   	leave  
    3a48:	c3                   	ret    

00003a49 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    3a49:	55                   	push   %ebp
    3a4a:	89 e5                	mov    %esp,%ebp
    3a4c:	53                   	push   %ebx
    3a4d:	83 ec 18             	sub    $0x18,%esp
    3a50:	8b 55 14             	mov    0x14(%ebp),%edx
    3a53:	8b 45 18             	mov    0x18(%ebp),%eax
    3a56:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    3a5a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    3a5e:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    3a62:	0f b6 c0             	movzbl %al,%eax
    3a65:	3d a0 00 00 00       	cmp    $0xa0,%eax
    3a6a:	0f 8e 1e 01 00 00    	jle    3b8e <put_gbk+0x145>
    3a70:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    3a74:	66 c1 f8 08          	sar    $0x8,%ax
    3a78:	98                   	cwtl   
    3a79:	0f b6 c0             	movzbl %al,%eax
    3a7c:	3d a0 00 00 00       	cmp    $0xa0,%eax
    3a81:	0f 8e 07 01 00 00    	jle    3b8e <put_gbk+0x145>
		hzk16Base = fontFile.buf;
    3a87:	a1 84 40 01 00       	mov    0x14084,%eax
    3a8c:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    3a8f:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    3a93:	0f b6 c0             	movzbl %al,%eax
    3a96:	2d a1 00 00 00       	sub    $0xa1,%eax
    3a9b:	6b c0 5e             	imul   $0x5e,%eax,%eax
    3a9e:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    3aa2:	66 c1 fa 08          	sar    $0x8,%dx
    3aa6:	0f bf d2             	movswl %dx,%edx
    3aa9:	0f b6 d2             	movzbl %dl,%edx
    3aac:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    3ab2:	01 d0                	add    %edx,%eax
    3ab4:	c1 e0 05             	shl    $0x5,%eax
    3ab7:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    3aba:	8b 45 20             	mov    0x20(%ebp),%eax
    3abd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3ac0:	e9 b8 00 00 00       	jmp    3b7d <put_gbk+0x134>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    3ac5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3acc:	eb 47                	jmp    3b15 <put_gbk+0xcc>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    3ace:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3ad1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ad4:	01 d0                	add    %edx,%eax
    3ad6:	0f b6 00             	movzbl (%eax),%eax
    3ad9:	0f b6 d0             	movzbl %al,%edx
    3adc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3adf:	89 c1                	mov    %eax,%ecx
    3ae1:	d3 e2                	shl    %cl,%edx
    3ae3:	89 d0                	mov    %edx,%eax
    3ae5:	25 80 00 00 00       	and    $0x80,%eax
    3aea:	85 c0                	test   %eax,%eax
    3aec:	74 23                	je     3b11 <put_gbk+0xc8>
					draw_point(c, x + tmpX, tmpY, colorNum);
    3aee:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3af5:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3af8:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    3afb:	01 d9                	add    %ebx,%ecx
    3afd:	52                   	push   %edx
    3afe:	50                   	push   %eax
    3aff:	51                   	push   %ecx
    3b00:	ff 75 10             	pushl  0x10(%ebp)
    3b03:	ff 75 0c             	pushl  0xc(%ebp)
    3b06:	ff 75 08             	pushl  0x8(%ebp)
    3b09:	e8 3b fb ff ff       	call   3649 <draw_point>
    3b0e:	83 c4 18             	add    $0x18,%esp
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    3b11:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3b15:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    3b19:	7e b3                	jle    3ace <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    3b1b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    3b1f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3b26:	eb 47                	jmp    3b6f <put_gbk+0x126>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    3b28:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3b2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3b2e:	01 d0                	add    %edx,%eax
    3b30:	0f b6 00             	movzbl (%eax),%eax
    3b33:	0f b6 d0             	movzbl %al,%edx
    3b36:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3b39:	89 c1                	mov    %eax,%ecx
    3b3b:	d3 e2                	shl    %cl,%edx
    3b3d:	89 d0                	mov    %edx,%eax
    3b3f:	25 80 00 00 00       	and    $0x80,%eax
    3b44:	85 c0                	test   %eax,%eax
    3b46:	74 23                	je     3b6b <put_gbk+0x122>
					draw_point(c, x + tmpX, tmpY, colorNum);
    3b48:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3b4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b4f:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3b52:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    3b55:	01 d9                	add    %ebx,%ecx
    3b57:	52                   	push   %edx
    3b58:	50                   	push   %eax
    3b59:	51                   	push   %ecx
    3b5a:	ff 75 10             	pushl  0x10(%ebp)
    3b5d:	ff 75 0c             	pushl  0xc(%ebp)
    3b60:	ff 75 08             	pushl  0x8(%ebp)
    3b63:	e8 e1 fa ff ff       	call   3649 <draw_point>
    3b68:	83 c4 18             	add    $0x18,%esp
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    3b6b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3b6f:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    3b73:	7e b3                	jle    3b28 <put_gbk+0xdf>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    3b75:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    3b79:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3b7d:	8b 45 20             	mov    0x20(%ebp),%eax
    3b80:	83 c0 10             	add    $0x10,%eax
    3b83:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3b86:	0f 8f 39 ff ff ff    	jg     3ac5 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    3b8c:	eb 50                	jmp    3bde <put_gbk+0x195>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    3b8e:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3b92:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    3b96:	0f b6 c0             	movzbl %al,%eax
    3b99:	ff 75 20             	pushl  0x20(%ebp)
    3b9c:	ff 75 1c             	pushl  0x1c(%ebp)
    3b9f:	52                   	push   %edx
    3ba0:	50                   	push   %eax
    3ba1:	ff 75 10             	pushl  0x10(%ebp)
    3ba4:	ff 75 0c             	pushl  0xc(%ebp)
    3ba7:	ff 75 08             	pushl  0x8(%ebp)
    3baa:	e8 03 fe ff ff       	call   39b2 <put_ascii>
    3baf:	83 c4 1c             	add    $0x1c,%esp
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    3bb2:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3bb5:	8d 48 08             	lea    0x8(%eax),%ecx
    3bb8:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3bbc:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    3bc0:	66 c1 f8 08          	sar    $0x8,%ax
    3bc4:	0f b6 c0             	movzbl %al,%eax
    3bc7:	ff 75 20             	pushl  0x20(%ebp)
    3bca:	51                   	push   %ecx
    3bcb:	52                   	push   %edx
    3bcc:	50                   	push   %eax
    3bcd:	ff 75 10             	pushl  0x10(%ebp)
    3bd0:	ff 75 0c             	pushl  0xc(%ebp)
    3bd3:	ff 75 08             	pushl  0x8(%ebp)
    3bd6:	e8 d7 fd ff ff       	call   39b2 <put_ascii>
    3bdb:	83 c4 1c             	add    $0x1c,%esp
	}
}
    3bde:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3be1:	c9                   	leave  
    3be2:	c3                   	ret    

00003be3 <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    3be3:	55                   	push   %ebp
    3be4:	89 e5                	mov    %esp,%ebp
    3be6:	83 ec 28             	sub    $0x28,%esp
    3be9:	8b 45 18             	mov    0x18(%ebp),%eax
    3bec:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    3bf0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    3bf7:	83 ec 0c             	sub    $0xc,%esp
    3bfa:	ff 75 14             	pushl  0x14(%ebp)
    3bfd:	e8 f9 11 00 00       	call   4dfb <strlen>
    3c02:	83 c4 10             	add    $0x10,%esp
    3c05:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    3c08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3c0f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3c12:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3c15:	eb 36                	jmp    3c4d <puts_str+0x6a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    3c17:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3c1b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3c1e:	8b 45 14             	mov    0x14(%ebp),%eax
    3c21:	01 c8                	add    %ecx,%eax
    3c23:	0f b6 00             	movzbl (%eax),%eax
    3c26:	0f b6 c0             	movzbl %al,%eax
    3c29:	83 ec 04             	sub    $0x4,%esp
    3c2c:	ff 75 20             	pushl  0x20(%ebp)
    3c2f:	ff 75 f0             	pushl  -0x10(%ebp)
    3c32:	52                   	push   %edx
    3c33:	50                   	push   %eax
    3c34:	ff 75 10             	pushl  0x10(%ebp)
    3c37:	ff 75 0c             	pushl  0xc(%ebp)
    3c3a:	ff 75 08             	pushl  0x8(%ebp)
    3c3d:	e8 70 fd ff ff       	call   39b2 <put_ascii>
    3c42:	83 c4 20             	add    $0x20,%esp
			xTmp += 8;
    3c45:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    3c49:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    3c4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c50:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    3c53:	72 c2                	jb     3c17 <puts_str+0x34>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    3c55:	c9                   	leave  
    3c56:	c3                   	ret    

00003c57 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    3c57:	55                   	push   %ebp
    3c58:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    3c5a:	8b 45 10             	mov    0x10(%ebp),%eax
    3c5d:	8d 50 07             	lea    0x7(%eax),%edx
    3c60:	85 c0                	test   %eax,%eax
    3c62:	0f 48 c2             	cmovs  %edx,%eax
    3c65:	c1 f8 03             	sar    $0x3,%eax
    3c68:	89 c1                	mov    %eax,%ecx
    3c6a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c6d:	8d 50 03             	lea    0x3(%eax),%edx
    3c70:	85 c0                	test   %eax,%eax
    3c72:	0f 48 c2             	cmovs  %edx,%eax
    3c75:	c1 f8 02             	sar    $0x2,%eax
    3c78:	c1 e0 05             	shl    $0x5,%eax
    3c7b:	01 c1                	add    %eax,%ecx
    3c7d:	8b 45 08             	mov    0x8(%ebp),%eax
    3c80:	8d 50 07             	lea    0x7(%eax),%edx
    3c83:	85 c0                	test   %eax,%eax
    3c85:	0f 48 c2             	cmovs  %edx,%eax
    3c88:	c1 f8 03             	sar    $0x3,%eax
    3c8b:	c1 e0 0b             	shl    $0xb,%eax
    3c8e:	01 c8                	add    %ecx,%eax
}
    3c90:	5d                   	pop    %ebp
    3c91:	c3                   	ret    

00003c92 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    3c92:	55                   	push   %ebp
    3c93:	89 e5                	mov    %esp,%ebp
    3c95:	53                   	push   %ebx
    3c96:	83 ec 10             	sub    $0x10,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    3c99:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3ca0:	e9 98 00 00 00       	jmp    3d3d <draw_picture+0xab>
	{
		for (j = 0; j < pic.width; j++)
    3ca5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3cac:	eb 7f                	jmp    3d2d <draw_picture+0x9b>
		{
			rgb = pic.data[i*pic.width+j];
    3cae:	8b 55 14             	mov    0x14(%ebp),%edx
    3cb1:	8b 45 18             	mov    0x18(%ebp),%eax
    3cb4:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    3cb8:	89 c1                	mov    %eax,%ecx
    3cba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cbd:	01 c8                	add    %ecx,%eax
    3cbf:	c1 e0 02             	shl    $0x2,%eax
    3cc2:	01 d0                	add    %edx,%eax
    3cc4:	8b 00                	mov    (%eax),%eax
    3cc6:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    3cc9:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    3ccd:	3c 01                	cmp    $0x1,%al
    3ccf:	75 02                	jne    3cd3 <draw_picture+0x41>
    3cd1:	eb 56                	jmp    3d29 <draw_picture+0x97>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    3cd3:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    3cd7:	0f b6 c8             	movzbl %al,%ecx
    3cda:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3cde:	0f b6 d0             	movzbl %al,%edx
    3ce1:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    3ce5:	0f b6 c0             	movzbl %al,%eax
    3ce8:	51                   	push   %ecx
    3ce9:	52                   	push   %edx
    3cea:	50                   	push   %eax
    3ceb:	e8 67 ff ff ff       	call   3c57 <_RGB16BIT565>
    3cf0:	83 c4 0c             	add    $0xc,%esp
    3cf3:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    3cf7:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
    3cfb:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3cfe:	83 ea 01             	sub    $0x1,%edx
    3d01:	89 d1                	mov    %edx,%ecx
    3d03:	2b 4d f8             	sub    -0x8(%ebp),%ecx
    3d06:	8b 55 24             	mov    0x24(%ebp),%edx
    3d09:	01 ca                	add    %ecx,%edx
    3d0b:	89 d3                	mov    %edx,%ebx
    3d0d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3d10:	8b 55 20             	mov    0x20(%ebp),%edx
    3d13:	01 ca                	add    %ecx,%edx
    3d15:	50                   	push   %eax
    3d16:	53                   	push   %ebx
    3d17:	52                   	push   %edx
    3d18:	ff 75 10             	pushl  0x10(%ebp)
    3d1b:	ff 75 0c             	pushl  0xc(%ebp)
    3d1e:	ff 75 08             	pushl  0x8(%ebp)
    3d21:	e8 23 f9 ff ff       	call   3649 <draw_point>
    3d26:	83 c4 18             	add    $0x18,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    3d29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3d2d:	8b 45 18             	mov    0x18(%ebp),%eax
    3d30:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3d33:	0f 8f 75 ff ff ff    	jg     3cae <draw_picture+0x1c>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    3d39:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3d3d:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3d40:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3d43:	0f 8f 5c ff ff ff    	jg     3ca5 <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    3d49:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3d4c:	c9                   	leave  
    3d4d:	c3                   	ret    

00003d4e <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    3d4e:	55                   	push   %ebp
    3d4f:	89 e5                	mov    %esp,%ebp
    3d51:	83 ec 24             	sub    $0x24,%esp
    3d54:	8b 45 24             	mov    0x24(%ebp),%eax
    3d57:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    3d5b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3d5e:	2b 45 14             	sub    0x14(%ebp),%eax
    3d61:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    3d64:	8b 45 20             	mov    0x20(%ebp),%eax
    3d67:	2b 45 18             	sub    0x18(%ebp),%eax
    3d6a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    3d6d:	8b 45 14             	mov    0x14(%ebp),%eax
    3d70:	c1 e0 0a             	shl    $0xa,%eax
    3d73:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    3d76:	8b 45 18             	mov    0x18(%ebp),%eax
    3d79:	c1 e0 0a             	shl    $0xa,%eax
    3d7c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    3d7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d82:	c1 f8 1f             	sar    $0x1f,%eax
    3d85:	31 45 fc             	xor    %eax,-0x4(%ebp)
    3d88:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    3d8b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d8e:	c1 f8 1f             	sar    $0x1f,%eax
    3d91:	31 45 f8             	xor    %eax,-0x8(%ebp)
    3d94:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    3d97:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d9a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3d9d:	7c 4f                	jl     3dee <draw_line+0xa0>
		len = dx + 1;
    3d9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3da2:	83 c0 01             	add    $0x1,%eax
    3da5:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    3da8:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3dab:	3b 45 14             	cmp    0x14(%ebp),%eax
    3dae:	7e 07                	jle    3db7 <draw_line+0x69>
    3db0:	b8 00 04 00 00       	mov    $0x400,%eax
    3db5:	eb 05                	jmp    3dbc <draw_line+0x6e>
    3db7:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3dbc:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    3dbf:	8b 45 20             	mov    0x20(%ebp),%eax
    3dc2:	3b 45 18             	cmp    0x18(%ebp),%eax
    3dc5:	7c 12                	jl     3dd9 <draw_line+0x8b>
    3dc7:	8b 45 20             	mov    0x20(%ebp),%eax
    3dca:	2b 45 18             	sub    0x18(%ebp),%eax
    3dcd:	83 c0 01             	add    $0x1,%eax
    3dd0:	c1 e0 0a             	shl    $0xa,%eax
    3dd3:	99                   	cltd   
    3dd4:	f7 7d ec             	idivl  -0x14(%ebp)
    3dd7:	eb 10                	jmp    3de9 <draw_line+0x9b>
    3dd9:	8b 45 20             	mov    0x20(%ebp),%eax
    3ddc:	2b 45 18             	sub    0x18(%ebp),%eax
    3ddf:	83 e8 01             	sub    $0x1,%eax
    3de2:	c1 e0 0a             	shl    $0xa,%eax
    3de5:	99                   	cltd   
    3de6:	f7 7d ec             	idivl  -0x14(%ebp)
    3de9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3dec:	eb 4d                	jmp    3e3b <draw_line+0xed>
	}
	else {
		len = dy + 1;
    3dee:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3df1:	83 c0 01             	add    $0x1,%eax
    3df4:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    3df7:	8b 45 20             	mov    0x20(%ebp),%eax
    3dfa:	3b 45 18             	cmp    0x18(%ebp),%eax
    3dfd:	7e 07                	jle    3e06 <draw_line+0xb8>
    3dff:	b8 00 04 00 00       	mov    $0x400,%eax
    3e04:	eb 05                	jmp    3e0b <draw_line+0xbd>
    3e06:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3e0b:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    3e0e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3e11:	3b 45 14             	cmp    0x14(%ebp),%eax
    3e14:	7c 12                	jl     3e28 <draw_line+0xda>
    3e16:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3e19:	2b 45 14             	sub    0x14(%ebp),%eax
    3e1c:	83 c0 01             	add    $0x1,%eax
    3e1f:	c1 e0 0a             	shl    $0xa,%eax
    3e22:	99                   	cltd   
    3e23:	f7 7d ec             	idivl  -0x14(%ebp)
    3e26:	eb 10                	jmp    3e38 <draw_line+0xea>
    3e28:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3e2b:	2b 45 14             	sub    0x14(%ebp),%eax
    3e2e:	83 e8 01             	sub    $0x1,%eax
    3e31:	c1 e0 0a             	shl    $0xa,%eax
    3e34:	99                   	cltd   
    3e35:	f7 7d ec             	idivl  -0x14(%ebp)
    3e38:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    3e3b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    3e42:	eb 36                	jmp    3e7a <draw_line+0x12c>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    3e44:	0f b7 45 dc          	movzwl -0x24(%ebp),%eax
    3e48:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3e4b:	c1 fa 0a             	sar    $0xa,%edx
    3e4e:	89 d1                	mov    %edx,%ecx
    3e50:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3e53:	c1 fa 0a             	sar    $0xa,%edx
    3e56:	50                   	push   %eax
    3e57:	51                   	push   %ecx
    3e58:	52                   	push   %edx
    3e59:	ff 75 10             	pushl  0x10(%ebp)
    3e5c:	ff 75 0c             	pushl  0xc(%ebp)
    3e5f:	ff 75 08             	pushl  0x8(%ebp)
    3e62:	e8 e2 f7 ff ff       	call   3649 <draw_point>
    3e67:	83 c4 18             	add    $0x18,%esp
		y += dy;
    3e6a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3e6d:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    3e70:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3e73:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    3e76:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    3e7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e7d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    3e80:	7c c2                	jl     3e44 <draw_line+0xf6>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    3e82:	c9                   	leave  
    3e83:	c3                   	ret    

00003e84 <draw_window>:

void
draw_window(Context c, char *title)
{
    3e84:	55                   	push   %ebp
    3e85:	89 e5                	mov    %esp,%ebp
    3e87:	83 ec 18             	sub    $0x18,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    3e8a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e8d:	83 e8 01             	sub    $0x1,%eax
    3e90:	6a 00                	push   $0x0
    3e92:	6a 00                	push   $0x0
    3e94:	50                   	push   %eax
    3e95:	6a 00                	push   $0x0
    3e97:	6a 00                	push   $0x0
    3e99:	ff 75 10             	pushl  0x10(%ebp)
    3e9c:	ff 75 0c             	pushl  0xc(%ebp)
    3e9f:	ff 75 08             	pushl  0x8(%ebp)
    3ea2:	e8 a7 fe ff ff       	call   3d4e <draw_line>
    3ea7:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    3eaa:	8b 45 10             	mov    0x10(%ebp),%eax
    3ead:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3eb0:	8b 45 0c             	mov    0xc(%ebp),%eax
    3eb3:	8d 50 ff             	lea    -0x1(%eax),%edx
    3eb6:	8b 45 0c             	mov    0xc(%ebp),%eax
    3eb9:	83 e8 01             	sub    $0x1,%eax
    3ebc:	6a 00                	push   $0x0
    3ebe:	51                   	push   %ecx
    3ebf:	52                   	push   %edx
    3ec0:	6a 00                	push   $0x0
    3ec2:	50                   	push   %eax
    3ec3:	ff 75 10             	pushl  0x10(%ebp)
    3ec6:	ff 75 0c             	pushl  0xc(%ebp)
    3ec9:	ff 75 08             	pushl  0x8(%ebp)
    3ecc:	e8 7d fe ff ff       	call   3d4e <draw_line>
    3ed1:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    3ed4:	8b 45 10             	mov    0x10(%ebp),%eax
    3ed7:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3eda:	8b 45 10             	mov    0x10(%ebp),%eax
    3edd:	8d 50 ff             	lea    -0x1(%eax),%edx
    3ee0:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ee3:	83 e8 01             	sub    $0x1,%eax
    3ee6:	6a 00                	push   $0x0
    3ee8:	51                   	push   %ecx
    3ee9:	6a 00                	push   $0x0
    3eeb:	52                   	push   %edx
    3eec:	50                   	push   %eax
    3eed:	ff 75 10             	pushl  0x10(%ebp)
    3ef0:	ff 75 0c             	pushl  0xc(%ebp)
    3ef3:	ff 75 08             	pushl  0x8(%ebp)
    3ef6:	e8 53 fe ff ff       	call   3d4e <draw_line>
    3efb:	83 c4 20             	add    $0x20,%esp
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    3efe:	8b 45 10             	mov    0x10(%ebp),%eax
    3f01:	83 e8 01             	sub    $0x1,%eax
    3f04:	6a 00                	push   $0x0
    3f06:	6a 00                	push   $0x0
    3f08:	6a 00                	push   $0x0
    3f0a:	50                   	push   %eax
    3f0b:	6a 00                	push   $0x0
    3f0d:	ff 75 10             	pushl  0x10(%ebp)
    3f10:	ff 75 0c             	pushl  0xc(%ebp)
    3f13:	ff 75 08             	pushl  0x8(%ebp)
    3f16:	e8 33 fe ff ff       	call   3d4e <draw_line>
    3f1b:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    3f1e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f21:	83 e8 02             	sub    $0x2,%eax
    3f24:	68 cb 5a 00 00       	push   $0x5acb
    3f29:	6a 14                	push   $0x14
    3f2b:	50                   	push   %eax
    3f2c:	6a 01                	push   $0x1
    3f2e:	6a 01                	push   $0x1
    3f30:	ff 75 10             	pushl  0x10(%ebp)
    3f33:	ff 75 0c             	pushl  0xc(%ebp)
    3f36:	ff 75 08             	pushl  0x8(%ebp)
    3f39:	e8 4a f7 ff ff       	call   3688 <fill_rect>
    3f3e:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    3f41:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f44:	83 e8 02             	sub    $0x2,%eax
    3f47:	89 c2                	mov    %eax,%edx
    3f49:	8b 45 10             	mov    0x10(%ebp),%eax
    3f4c:	83 e8 15             	sub    $0x15,%eax
    3f4f:	68 cb 5a 00 00       	push   $0x5acb
    3f54:	6a 14                	push   $0x14
    3f56:	52                   	push   %edx
    3f57:	50                   	push   %eax
    3f58:	6a 01                	push   $0x1
    3f5a:	ff 75 10             	pushl  0x10(%ebp)
    3f5d:	ff 75 0c             	pushl  0xc(%ebp)
    3f60:	ff 75 08             	pushl  0x8(%ebp)
    3f63:	e8 20 f7 ff ff       	call   3688 <fill_rect>
    3f68:	83 c4 20             	add    $0x20,%esp

  loadBitmap(&pic, "close.bmp");
    3f6b:	83 ec 08             	sub    $0x8,%esp
    3f6e:	68 23 bd 00 00       	push   $0xbd23
    3f73:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3f76:	50                   	push   %eax
    3f77:	e8 fb 00 00 00       	call   4077 <loadBitmap>
    3f7c:	83 c4 10             	add    $0x10,%esp
  draw_picture(c, pic, 3, 3);
    3f7f:	6a 03                	push   $0x3
    3f81:	6a 03                	push   $0x3
    3f83:	ff 75 f4             	pushl  -0xc(%ebp)
    3f86:	ff 75 f0             	pushl  -0x10(%ebp)
    3f89:	ff 75 ec             	pushl  -0x14(%ebp)
    3f8c:	ff 75 10             	pushl  0x10(%ebp)
    3f8f:	ff 75 0c             	pushl  0xc(%ebp)
    3f92:	ff 75 08             	pushl  0x8(%ebp)
    3f95:	e8 f8 fc ff ff       	call   3c92 <draw_picture>
    3f9a:	83 c4 20             	add    $0x20,%esp
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    3f9d:	83 ec 04             	sub    $0x4,%esp
    3fa0:	6a 02                	push   $0x2
    3fa2:	6a 19                	push   $0x19
    3fa4:	68 ff ff 00 00       	push   $0xffff
    3fa9:	ff 75 14             	pushl  0x14(%ebp)
    3fac:	ff 75 10             	pushl  0x10(%ebp)
    3faf:	ff 75 0c             	pushl  0xc(%ebp)
    3fb2:	ff 75 08             	pushl  0x8(%ebp)
    3fb5:	e8 29 fc ff ff       	call   3be3 <puts_str>
    3fba:	83 c4 20             	add    $0x20,%esp
  freepic(&pic);
    3fbd:	83 ec 0c             	sub    $0xc,%esp
    3fc0:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3fc3:	50                   	push   %eax
    3fc4:	e8 cd 05 00 00       	call   4596 <freepic>
    3fc9:	83 c4 10             	add    $0x10,%esp
}
    3fcc:	c9                   	leave  
    3fcd:	c3                   	ret    

00003fce <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    3fce:	55                   	push   %ebp
    3fcf:	89 e5                	mov    %esp,%ebp
    3fd1:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < len; i++)
    3fd4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3fdb:	eb 2c                	jmp    4009 <load_iconlist+0x3b>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    3fdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fe0:	6b d0 34             	imul   $0x34,%eax,%edx
    3fe3:	8b 45 08             	mov    0x8(%ebp),%eax
    3fe6:	01 d0                	add    %edx,%eax
    3fe8:	89 c1                	mov    %eax,%ecx
    3fea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fed:	6b d0 34             	imul   $0x34,%eax,%edx
    3ff0:	8b 45 08             	mov    0x8(%ebp),%eax
    3ff3:	01 d0                	add    %edx,%eax
    3ff5:	83 c0 28             	add    $0x28,%eax
    3ff8:	83 ec 08             	sub    $0x8,%esp
    3ffb:	51                   	push   %ecx
    3ffc:	50                   	push   %eax
    3ffd:	e8 75 00 00 00       	call   4077 <loadBitmap>
    4002:	83 c4 10             	add    $0x10,%esp
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    4005:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4009:	8b 45 f4             	mov    -0xc(%ebp),%eax
    400c:	3b 45 0c             	cmp    0xc(%ebp),%eax
    400f:	7c cc                	jl     3fdd <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    4011:	c9                   	leave  
    4012:	c3                   	ret    

00004013 <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    4013:	55                   	push   %ebp
    4014:	89 e5                	mov    %esp,%ebp
    4016:	53                   	push   %ebx
    4017:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; i < len; i++)
    401a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    4021:	eb 47                	jmp    406a <draw_iconlist+0x57>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    4023:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4026:	6b d0 34             	imul   $0x34,%eax,%edx
    4029:	8b 45 14             	mov    0x14(%ebp),%eax
    402c:	01 d0                	add    %edx,%eax
    402e:	8b 48 24             	mov    0x24(%eax),%ecx
    4031:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4034:	6b d0 34             	imul   $0x34,%eax,%edx
    4037:	8b 45 14             	mov    0x14(%ebp),%eax
    403a:	01 d0                	add    %edx,%eax
    403c:	8b 50 20             	mov    0x20(%eax),%edx
    403f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4042:	6b d8 34             	imul   $0x34,%eax,%ebx
    4045:	8b 45 14             	mov    0x14(%ebp),%eax
    4048:	01 d8                	add    %ebx,%eax
    404a:	51                   	push   %ecx
    404b:	52                   	push   %edx
    404c:	ff 70 30             	pushl  0x30(%eax)
    404f:	ff 70 2c             	pushl  0x2c(%eax)
    4052:	ff 70 28             	pushl  0x28(%eax)
    4055:	ff 75 10             	pushl  0x10(%ebp)
    4058:	ff 75 0c             	pushl  0xc(%ebp)
    405b:	ff 75 08             	pushl  0x8(%ebp)
    405e:	e8 2f fc ff ff       	call   3c92 <draw_picture>
    4063:	83 c4 20             	add    $0x20,%esp
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    4066:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    406a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    406d:	3b 45 18             	cmp    0x18(%ebp),%eax
    4070:	7c b1                	jl     4023 <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    4072:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4075:	c9                   	leave  
    4076:	c3                   	ret    

00004077 <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    4077:	55                   	push   %ebp
    4078:	89 e5                	mov    %esp,%ebp
    407a:	81 ec 88 00 00 00    	sub    $0x88,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    4080:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    4087:	83 ec 08             	sub    $0x8,%esp
    408a:	6a 00                	push   $0x0
    408c:	ff 75 0c             	pushl  0xc(%ebp)
    408f:	e8 68 0f 00 00       	call   4ffc <open>
    4094:	83 c4 10             	add    $0x10,%esp
    4097:	89 45 e8             	mov    %eax,-0x18(%ebp)
    409a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    409e:	79 1a                	jns    40ba <loadBitmap+0x43>
		printf(0, "cannot open %s\n", pic_name);
    40a0:	83 ec 04             	sub    $0x4,%esp
    40a3:	ff 75 0c             	pushl  0xc(%ebp)
    40a6:	68 30 bd 00 00       	push   $0xbd30
    40ab:	6a 00                	push   $0x0
    40ad:	e8 e7 10 00 00       	call   5199 <printf>
    40b2:	83 c4 10             	add    $0x10,%esp
		return;
    40b5:	e9 ca 02 00 00       	jmp    4384 <loadBitmap+0x30d>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    40ba:	83 ec 04             	sub    $0x4,%esp
    40bd:	ff 75 0c             	pushl  0xc(%ebp)
    40c0:	68 40 bd 00 00       	push   $0xbd40
    40c5:	6a 00                	push   $0x0
    40c7:	e8 cd 10 00 00       	call   5199 <printf>
    40cc:	83 c4 10             	add    $0x10,%esp
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    40cf:	83 ec 0c             	sub    $0xc,%esp
    40d2:	6a 0e                	push   $0xe
    40d4:	e8 91 13 00 00       	call   546a <malloc>
    40d9:	83 c4 10             	add    $0x10,%esp
    40dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    40df:	83 ec 04             	sub    $0x4,%esp
    40e2:	6a 0e                	push   $0xe
    40e4:	ff 75 e4             	pushl  -0x1c(%ebp)
    40e7:	ff 75 e8             	pushl  -0x18(%ebp)
    40ea:	e8 e5 0e 00 00       	call   4fd4 <read>
    40ef:	83 c4 10             	add    $0x10,%esp
    40f2:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    40f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    40f8:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    40fb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    40fe:	0f b7 00             	movzwl (%eax),%eax
    4101:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    4105:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    4109:	66 3d 42 4d          	cmp    $0x4d42,%ax
    410d:	74 17                	je     4126 <loadBitmap+0xaf>
		printf(0, "file is not .bmp file!");
    410f:	83 ec 08             	sub    $0x8,%esp
    4112:	68 54 bd 00 00       	push   $0xbd54
    4117:	6a 00                	push   $0x0
    4119:	e8 7b 10 00 00       	call   5199 <printf>
    411e:	83 c4 10             	add    $0x10,%esp
		return;
    4121:	e9 5e 02 00 00       	jmp    4384 <loadBitmap+0x30d>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    4126:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4129:	83 c0 02             	add    $0x2,%eax
    412c:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    412f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4132:	8b 00                	mov    (%eax),%eax
    4134:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    4137:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    413a:	83 c0 06             	add    $0x6,%eax
    413d:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    4140:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4143:	0f b7 00             	movzwl (%eax),%eax
    4146:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    414a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    414d:	83 c0 08             	add    $0x8,%eax
    4150:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    4153:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4156:	0f b7 00             	movzwl (%eax),%eax
    4159:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    415d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4160:	83 c0 0a             	add    $0xa,%eax
    4163:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    4166:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4169:	8b 00                	mov    (%eax),%eax
    416b:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    416e:	83 ec 04             	sub    $0x4,%esp
    4171:	6a 28                	push   $0x28
    4173:	8d 45 84             	lea    -0x7c(%ebp),%eax
    4176:	50                   	push   %eax
    4177:	ff 75 e8             	pushl  -0x18(%ebp)
    417a:	e8 55 0e 00 00       	call   4fd4 <read>
    417f:	83 c4 10             	add    $0x10,%esp
	width = bitInfoHead.biWidth;
    4182:	8b 45 88             	mov    -0x78(%ebp),%eax
    4185:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    4188:	8b 45 8c             	mov    -0x74(%ebp),%eax
    418b:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    418e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4191:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    4195:	c1 e0 02             	shl    $0x2,%eax
    4198:	83 ec 0c             	sub    $0xc,%esp
    419b:	50                   	push   %eax
    419c:	ff 75 d0             	pushl  -0x30(%ebp)
    419f:	ff 75 d4             	pushl  -0x2c(%ebp)
    41a2:	68 6c bd 00 00       	push   $0xbd6c
    41a7:	6a 00                	push   $0x0
    41a9:	e8 eb 0f 00 00       	call   5199 <printf>
    41ae:	83 c4 20             	add    $0x20,%esp
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    41b1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    41b5:	75 12                	jne    41c9 <loadBitmap+0x152>
		printf(0, "0");
    41b7:	83 ec 08             	sub    $0x8,%esp
    41ba:	68 91 bd 00 00       	push   $0xbd91
    41bf:	6a 00                	push   $0x0
    41c1:	e8 d3 0f 00 00       	call   5199 <printf>
    41c6:	83 c4 10             	add    $0x10,%esp
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    41c9:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    41cd:	0f b7 c0             	movzwl %ax,%eax
    41d0:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    41d4:	83 c0 1f             	add    $0x1f,%eax
    41d7:	8d 50 1f             	lea    0x1f(%eax),%edx
    41da:	85 c0                	test   %eax,%eax
    41dc:	0f 48 c2             	cmovs  %edx,%eax
    41df:	c1 f8 05             	sar    $0x5,%eax
    41e2:	c1 e0 02             	shl    $0x2,%eax
    41e5:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    41e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    41eb:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    41ef:	83 ec 0c             	sub    $0xc,%esp
    41f2:	50                   	push   %eax
    41f3:	e8 72 12 00 00       	call   546a <malloc>
    41f8:	83 c4 10             	add    $0x10,%esp
    41fb:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    41fe:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4201:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4204:	0f af c2             	imul   %edx,%eax
    4207:	83 ec 04             	sub    $0x4,%esp
    420a:	50                   	push   %eax
    420b:	6a 00                	push   $0x0
    420d:	ff 75 c8             	pushl  -0x38(%ebp)
    4210:	e8 0d 0c 00 00       	call   4e22 <memset>
    4215:	83 c4 10             	add    $0x10,%esp
	long nData = height * l_width;
    4218:	8b 45 d0             	mov    -0x30(%ebp),%eax
    421b:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    421f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    4222:	83 ec 04             	sub    $0x4,%esp
    4225:	ff 75 c4             	pushl  -0x3c(%ebp)
    4228:	ff 75 c8             	pushl  -0x38(%ebp)
    422b:	ff 75 e8             	pushl  -0x18(%ebp)
    422e:	e8 a1 0d 00 00       	call   4fd4 <read>
    4233:	83 c4 10             	add    $0x10,%esp

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    4236:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4239:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    423d:	c1 e0 02             	shl    $0x2,%eax
    4240:	83 ec 0c             	sub    $0xc,%esp
    4243:	50                   	push   %eax
    4244:	e8 21 12 00 00       	call   546a <malloc>
    4249:	83 c4 10             	add    $0x10,%esp
    424c:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    424f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4252:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4255:	0f af c2             	imul   %edx,%eax
    4258:	c1 e0 02             	shl    $0x2,%eax
    425b:	83 ec 04             	sub    $0x4,%esp
    425e:	50                   	push   %eax
    425f:	6a 00                	push   $0x0
    4261:	ff 75 c0             	pushl  -0x40(%ebp)
    4264:	e8 b9 0b 00 00       	call   4e22 <memset>
    4269:	83 c4 10             	add    $0x10,%esp
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    426c:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    4270:	66 83 f8 17          	cmp    $0x17,%ax
    4274:	77 17                	ja     428d <loadBitmap+0x216>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    4276:	83 ec 08             	sub    $0x8,%esp
    4279:	68 94 bd 00 00       	push   $0xbd94
    427e:	6a 00                	push   $0x0
    4280:	e8 14 0f 00 00       	call   5199 <printf>
    4285:	83 c4 10             	add    $0x10,%esp
		return;
    4288:	e9 f7 00 00 00       	jmp    4384 <loadBitmap+0x30d>
	} else	//位图为24位真彩色
	{
		index = 0;
    428d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    4294:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    429b:	e9 94 00 00 00       	jmp    4334 <loadBitmap+0x2bd>
			for (j = 0; j < width; j++) {
    42a0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    42a7:	eb 7b                	jmp    4324 <loadBitmap+0x2ad>
				k = i * l_width + j * 3;
    42a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42ac:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    42b0:	89 c1                	mov    %eax,%ecx
    42b2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    42b5:	89 d0                	mov    %edx,%eax
    42b7:	01 c0                	add    %eax,%eax
    42b9:	01 d0                	add    %edx,%eax
    42bb:	01 c8                	add    %ecx,%eax
    42bd:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    42c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    42c3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    42ca:	8b 45 c0             	mov    -0x40(%ebp),%eax
    42cd:	01 c2                	add    %eax,%edx
    42cf:	8b 45 bc             	mov    -0x44(%ebp),%eax
    42d2:	8d 48 02             	lea    0x2(%eax),%ecx
    42d5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    42d8:	01 c8                	add    %ecx,%eax
    42da:	0f b6 00             	movzbl (%eax),%eax
    42dd:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    42e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    42e3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    42ea:	8b 45 c0             	mov    -0x40(%ebp),%eax
    42ed:	01 c2                	add    %eax,%edx
    42ef:	8b 45 bc             	mov    -0x44(%ebp),%eax
    42f2:	8d 48 01             	lea    0x1(%eax),%ecx
    42f5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    42f8:	01 c8                	add    %ecx,%eax
    42fa:	0f b6 00             	movzbl (%eax),%eax
    42fd:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    4300:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4303:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    430a:	8b 45 c0             	mov    -0x40(%ebp),%eax
    430d:	01 c2                	add    %eax,%edx
    430f:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    4312:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4315:	01 c8                	add    %ecx,%eax
    4317:	0f b6 00             	movzbl (%eax),%eax
    431a:	88 02                	mov    %al,(%edx)
				index++;
    431c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    4320:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4324:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4327:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    432a:	0f 8c 79 ff ff ff    	jl     42a9 <loadBitmap+0x232>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    4330:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4334:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4337:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    433a:	0f 8c 60 ff ff ff    	jl     42a0 <loadBitmap+0x229>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    4340:	83 ec 0c             	sub    $0xc,%esp
    4343:	ff 75 e8             	pushl  -0x18(%ebp)
    4346:	e8 99 0c 00 00       	call   4fe4 <close>
    434b:	83 c4 10             	add    $0x10,%esp

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    434e:	8b 45 08             	mov    0x8(%ebp),%eax
    4351:	8b 55 c0             	mov    -0x40(%ebp),%edx
    4354:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    4356:	8b 45 08             	mov    0x8(%ebp),%eax
    4359:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    435c:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    435f:	8b 45 08             	mov    0x8(%ebp),%eax
    4362:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4365:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    4368:	83 ec 0c             	sub    $0xc,%esp
    436b:	ff 75 c8             	pushl  -0x38(%ebp)
    436e:	e8 b6 0f 00 00       	call   5329 <free>
    4373:	83 c4 10             	add    $0x10,%esp
	free(BmpFileHeader);
    4376:	83 ec 0c             	sub    $0xc,%esp
    4379:	ff 75 e4             	pushl  -0x1c(%ebp)
    437c:	e8 a8 0f 00 00       	call   5329 <free>
    4381:	83 c4 10             	add    $0x10,%esp
	//printf("\n");
}
    4384:	c9                   	leave  
    4385:	c3                   	ret    

00004386 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    4386:	55                   	push   %ebp
    4387:	89 e5                	mov    %esp,%ebp
    4389:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图文件头:\n");
    438c:	83 ec 08             	sub    $0x8,%esp
    438f:	68 b4 bd 00 00       	push   $0xbdb4
    4394:	6a 00                	push   $0x0
    4396:	e8 fe 0d 00 00       	call   5199 <printf>
    439b:	83 c4 10             	add    $0x10,%esp
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    439e:	8b 45 08             	mov    0x8(%ebp),%eax
    43a1:	0f b7 00             	movzwl (%eax),%eax
    43a4:	0f b7 c0             	movzwl %ax,%eax
    43a7:	83 ec 04             	sub    $0x4,%esp
    43aa:	50                   	push   %eax
    43ab:	68 c6 bd 00 00       	push   $0xbdc6
    43b0:	6a 00                	push   $0x0
    43b2:	e8 e2 0d 00 00       	call   5199 <printf>
    43b7:	83 c4 10             	add    $0x10,%esp
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    43ba:	8b 45 08             	mov    0x8(%ebp),%eax
    43bd:	8b 40 04             	mov    0x4(%eax),%eax
    43c0:	83 ec 04             	sub    $0x4,%esp
    43c3:	50                   	push   %eax
    43c4:	68 e4 bd 00 00       	push   $0xbde4
    43c9:	6a 00                	push   $0x0
    43cb:	e8 c9 0d 00 00       	call   5199 <printf>
    43d0:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    43d3:	8b 45 08             	mov    0x8(%ebp),%eax
    43d6:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    43da:	0f b7 c0             	movzwl %ax,%eax
    43dd:	83 ec 04             	sub    $0x4,%esp
    43e0:	50                   	push   %eax
    43e1:	68 f5 bd 00 00       	push   $0xbdf5
    43e6:	6a 00                	push   $0x0
    43e8:	e8 ac 0d 00 00       	call   5199 <printf>
    43ed:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    43f0:	8b 45 08             	mov    0x8(%ebp),%eax
    43f3:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    43f7:	0f b7 c0             	movzwl %ax,%eax
    43fa:	83 ec 04             	sub    $0x4,%esp
    43fd:	50                   	push   %eax
    43fe:	68 f5 bd 00 00       	push   $0xbdf5
    4403:	6a 00                	push   $0x0
    4405:	e8 8f 0d 00 00       	call   5199 <printf>
    440a:	83 c4 10             	add    $0x10,%esp
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    440d:	8b 45 08             	mov    0x8(%ebp),%eax
    4410:	8b 40 0c             	mov    0xc(%eax),%eax
    4413:	83 ec 04             	sub    $0x4,%esp
    4416:	50                   	push   %eax
    4417:	68 04 be 00 00       	push   $0xbe04
    441c:	6a 00                	push   $0x0
    441e:	e8 76 0d 00 00       	call   5199 <printf>
    4423:	83 c4 10             	add    $0x10,%esp
}
    4426:	c9                   	leave  
    4427:	c3                   	ret    

00004428 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    4428:	55                   	push   %ebp
    4429:	89 e5                	mov    %esp,%ebp
    442b:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图信息头:\n");
    442e:	83 ec 08             	sub    $0x8,%esp
    4431:	68 2d be 00 00       	push   $0xbe2d
    4436:	6a 00                	push   $0x0
    4438:	e8 5c 0d 00 00       	call   5199 <printf>
    443d:	83 c4 10             	add    $0x10,%esp
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    4440:	8b 45 08             	mov    0x8(%ebp),%eax
    4443:	8b 00                	mov    (%eax),%eax
    4445:	83 ec 04             	sub    $0x4,%esp
    4448:	50                   	push   %eax
    4449:	68 3f be 00 00       	push   $0xbe3f
    444e:	6a 00                	push   $0x0
    4450:	e8 44 0d 00 00       	call   5199 <printf>
    4455:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    4458:	8b 45 08             	mov    0x8(%ebp),%eax
    445b:	8b 40 04             	mov    0x4(%eax),%eax
    445e:	83 ec 04             	sub    $0x4,%esp
    4461:	50                   	push   %eax
    4462:	68 56 be 00 00       	push   $0xbe56
    4467:	6a 00                	push   $0x0
    4469:	e8 2b 0d 00 00       	call   5199 <printf>
    446e:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    4471:	8b 45 08             	mov    0x8(%ebp),%eax
    4474:	8b 40 08             	mov    0x8(%eax),%eax
    4477:	83 ec 04             	sub    $0x4,%esp
    447a:	50                   	push   %eax
    447b:	68 64 be 00 00       	push   $0xbe64
    4480:	6a 00                	push   $0x0
    4482:	e8 12 0d 00 00       	call   5199 <printf>
    4487:	83 c4 10             	add    $0x10,%esp
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    448a:	8b 45 08             	mov    0x8(%ebp),%eax
    448d:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    4491:	0f b7 c0             	movzwl %ax,%eax
    4494:	83 ec 04             	sub    $0x4,%esp
    4497:	50                   	push   %eax
    4498:	68 72 be 00 00       	push   $0xbe72
    449d:	6a 00                	push   $0x0
    449f:	e8 f5 0c 00 00       	call   5199 <printf>
    44a4:	83 c4 10             	add    $0x10,%esp
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    44a7:	8b 45 08             	mov    0x8(%ebp),%eax
    44aa:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    44ae:	0f b7 c0             	movzwl %ax,%eax
    44b1:	83 ec 04             	sub    $0x4,%esp
    44b4:	50                   	push   %eax
    44b5:	68 88 be 00 00       	push   $0xbe88
    44ba:	6a 00                	push   $0x0
    44bc:	e8 d8 0c 00 00       	call   5199 <printf>
    44c1:	83 c4 10             	add    $0x10,%esp
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    44c4:	8b 45 08             	mov    0x8(%ebp),%eax
    44c7:	8b 40 10             	mov    0x10(%eax),%eax
    44ca:	83 ec 04             	sub    $0x4,%esp
    44cd:	50                   	push   %eax
    44ce:	68 a9 be 00 00       	push   $0xbea9
    44d3:	6a 00                	push   $0x0
    44d5:	e8 bf 0c 00 00       	call   5199 <printf>
    44da:	83 c4 10             	add    $0x10,%esp
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    44dd:	8b 45 08             	mov    0x8(%ebp),%eax
    44e0:	8b 40 14             	mov    0x14(%eax),%eax
    44e3:	83 ec 04             	sub    $0x4,%esp
    44e6:	50                   	push   %eax
    44e7:	68 bc be 00 00       	push   $0xbebc
    44ec:	6a 00                	push   $0x0
    44ee:	e8 a6 0c 00 00       	call   5199 <printf>
    44f3:	83 c4 10             	add    $0x10,%esp
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    44f6:	8b 45 08             	mov    0x8(%ebp),%eax
    44f9:	8b 40 18             	mov    0x18(%eax),%eax
    44fc:	83 ec 04             	sub    $0x4,%esp
    44ff:	50                   	push   %eax
    4500:	68 f0 be 00 00       	push   $0xbef0
    4505:	6a 00                	push   $0x0
    4507:	e8 8d 0c 00 00       	call   5199 <printf>
    450c:	83 c4 10             	add    $0x10,%esp
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    450f:	8b 45 08             	mov    0x8(%ebp),%eax
    4512:	8b 40 1c             	mov    0x1c(%eax),%eax
    4515:	83 ec 04             	sub    $0x4,%esp
    4518:	50                   	push   %eax
    4519:	68 05 bf 00 00       	push   $0xbf05
    451e:	6a 00                	push   $0x0
    4520:	e8 74 0c 00 00       	call   5199 <printf>
    4525:	83 c4 10             	add    $0x10,%esp
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    4528:	8b 45 08             	mov    0x8(%ebp),%eax
    452b:	8b 40 20             	mov    0x20(%eax),%eax
    452e:	83 ec 04             	sub    $0x4,%esp
    4531:	50                   	push   %eax
    4532:	68 1a bf 00 00       	push   $0xbf1a
    4537:	6a 00                	push   $0x0
    4539:	e8 5b 0c 00 00       	call   5199 <printf>
    453e:	83 c4 10             	add    $0x10,%esp
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    4541:	8b 45 08             	mov    0x8(%ebp),%eax
    4544:	8b 40 24             	mov    0x24(%eax),%eax
    4547:	83 ec 04             	sub    $0x4,%esp
    454a:	50                   	push   %eax
    454b:	68 31 bf 00 00       	push   $0xbf31
    4550:	6a 00                	push   $0x0
    4552:	e8 42 0c 00 00       	call   5199 <printf>
    4557:	83 c4 10             	add    $0x10,%esp
}
    455a:	c9                   	leave  
    455b:	c3                   	ret    

0000455c <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    455c:	55                   	push   %ebp
    455d:	89 e5                	mov    %esp,%ebp
    455f:	83 ec 08             	sub    $0x8,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    4562:	8b 45 08             	mov    0x8(%ebp),%eax
    4565:	0f b6 00             	movzbl (%eax),%eax
    4568:	0f b6 c8             	movzbl %al,%ecx
    456b:	8b 45 08             	mov    0x8(%ebp),%eax
    456e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4572:	0f b6 d0             	movzbl %al,%edx
    4575:	8b 45 08             	mov    0x8(%ebp),%eax
    4578:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    457c:	0f b6 c0             	movzbl %al,%eax
    457f:	83 ec 0c             	sub    $0xc,%esp
    4582:	51                   	push   %ecx
    4583:	52                   	push   %edx
    4584:	50                   	push   %eax
    4585:	68 45 bf 00 00       	push   $0xbf45
    458a:	6a 00                	push   $0x0
    458c:	e8 08 0c 00 00       	call   5199 <printf>
    4591:	83 c4 20             	add    $0x20,%esp
}
    4594:	c9                   	leave  
    4595:	c3                   	ret    

00004596 <freepic>:

void freepic(PICNODE *pic) {
    4596:	55                   	push   %ebp
    4597:	89 e5                	mov    %esp,%ebp
    4599:	83 ec 08             	sub    $0x8,%esp
	free(pic->data);
    459c:	8b 45 08             	mov    0x8(%ebp),%eax
    459f:	8b 00                	mov    (%eax),%eax
    45a1:	83 ec 0c             	sub    $0xc,%esp
    45a4:	50                   	push   %eax
    45a5:	e8 7f 0d 00 00       	call   5329 <free>
    45aa:	83 c4 10             	add    $0x10,%esp
}
    45ad:	c9                   	leave  
    45ae:	c3                   	ret    

000045af <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    45af:	55                   	push   %ebp
    45b0:	89 e5                	mov    %esp,%ebp
    45b2:	83 ec 68             	sub    $0x68,%esp
	int W = 15;
    45b5:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    45bc:	8d 45 dc             	lea    -0x24(%ebp),%eax
    45bf:	83 ec 0c             	sub    $0xc,%esp
    45c2:	ff 75 ec             	pushl  -0x14(%ebp)
    45c5:	ff 75 ec             	pushl  -0x14(%ebp)
    45c8:	6a 00                	push   $0x0
    45ca:	6a 00                	push   $0x0
    45cc:	50                   	push   %eax
    45cd:	e8 01 02 00 00       	call   47d3 <initRect>
    45d2:	83 c4 1c             	add    $0x1c,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    45d5:	8b 45 08             	mov    0x8(%ebp),%eax
    45d8:	8b 40 04             	mov    0x4(%eax),%eax
    45db:	2b 45 ec             	sub    -0x14(%ebp),%eax
    45de:	89 c2                	mov    %eax,%edx
    45e0:	8d 45 cc             	lea    -0x34(%ebp),%eax
    45e3:	83 ec 0c             	sub    $0xc,%esp
    45e6:	ff 75 ec             	pushl  -0x14(%ebp)
    45e9:	ff 75 ec             	pushl  -0x14(%ebp)
    45ec:	6a 00                	push   $0x0
    45ee:	52                   	push   %edx
    45ef:	50                   	push   %eax
    45f0:	e8 de 01 00 00       	call   47d3 <initRect>
    45f5:	83 c4 1c             	add    $0x1c,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    45f8:	8b 45 08             	mov    0x8(%ebp),%eax
    45fb:	8b 40 08             	mov    0x8(%eax),%eax
    45fe:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4601:	89 c1                	mov    %eax,%ecx
    4603:	8b 45 08             	mov    0x8(%ebp),%eax
    4606:	8b 40 04             	mov    0x4(%eax),%eax
    4609:	2b 45 ec             	sub    -0x14(%ebp),%eax
    460c:	89 c2                	mov    %eax,%edx
    460e:	8d 45 bc             	lea    -0x44(%ebp),%eax
    4611:	83 ec 0c             	sub    $0xc,%esp
    4614:	ff 75 ec             	pushl  -0x14(%ebp)
    4617:	ff 75 ec             	pushl  -0x14(%ebp)
    461a:	51                   	push   %ecx
    461b:	52                   	push   %edx
    461c:	50                   	push   %eax
    461d:	e8 b1 01 00 00       	call   47d3 <initRect>
    4622:	83 c4 1c             	add    $0x1c,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    4625:	8b 45 08             	mov    0x8(%ebp),%eax
    4628:	8b 40 08             	mov    0x8(%eax),%eax
    462b:	2b 45 ec             	sub    -0x14(%ebp),%eax
    462e:	89 c2                	mov    %eax,%edx
    4630:	8d 45 ac             	lea    -0x54(%ebp),%eax
    4633:	83 ec 0c             	sub    $0xc,%esp
    4636:	ff 75 ec             	pushl  -0x14(%ebp)
    4639:	ff 75 ec             	pushl  -0x14(%ebp)
    463c:	52                   	push   %edx
    463d:	6a 00                	push   $0x0
    463f:	50                   	push   %eax
    4640:	e8 8e 01 00 00       	call   47d3 <initRect>
    4645:	83 c4 1c             	add    $0x1c,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    4648:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    464f:	e9 47 01 00 00       	jmp    479b <set_icon_alpha+0x1ec>
		for (j = 0; j < pic->height; j++) {
    4654:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    465b:	e9 28 01 00 00       	jmp    4788 <set_icon_alpha+0x1d9>
			p = initPoint(i, j);
    4660:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4663:	83 ec 04             	sub    $0x4,%esp
    4666:	ff 75 f0             	pushl  -0x10(%ebp)
    4669:	ff 75 f4             	pushl  -0xc(%ebp)
    466c:	50                   	push   %eax
    466d:	e8 3a 01 00 00       	call   47ac <initPoint>
    4672:	83 c4 0c             	add    $0xc,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    4675:	83 ec 08             	sub    $0x8,%esp
    4678:	ff 75 e8             	pushl  -0x18(%ebp)
    467b:	ff 75 e4             	pushl  -0x1c(%ebp)
    467e:	ff 75 e0             	pushl  -0x20(%ebp)
    4681:	ff 75 dc             	pushl  -0x24(%ebp)
    4684:	ff 75 a8             	pushl  -0x58(%ebp)
    4687:	ff 75 a4             	pushl  -0x5c(%ebp)
    468a:	e8 95 01 00 00       	call   4824 <isIn>
    468f:	83 c4 20             	add    $0x20,%esp
    4692:	85 c0                	test   %eax,%eax
    4694:	75 67                	jne    46fd <set_icon_alpha+0x14e>
    4696:	83 ec 08             	sub    $0x8,%esp
    4699:	ff 75 d8             	pushl  -0x28(%ebp)
    469c:	ff 75 d4             	pushl  -0x2c(%ebp)
    469f:	ff 75 d0             	pushl  -0x30(%ebp)
    46a2:	ff 75 cc             	pushl  -0x34(%ebp)
    46a5:	ff 75 a8             	pushl  -0x58(%ebp)
    46a8:	ff 75 a4             	pushl  -0x5c(%ebp)
    46ab:	e8 74 01 00 00       	call   4824 <isIn>
    46b0:	83 c4 20             	add    $0x20,%esp
    46b3:	85 c0                	test   %eax,%eax
    46b5:	75 46                	jne    46fd <set_icon_alpha+0x14e>
    46b7:	83 ec 08             	sub    $0x8,%esp
    46ba:	ff 75 c8             	pushl  -0x38(%ebp)
    46bd:	ff 75 c4             	pushl  -0x3c(%ebp)
    46c0:	ff 75 c0             	pushl  -0x40(%ebp)
    46c3:	ff 75 bc             	pushl  -0x44(%ebp)
    46c6:	ff 75 a8             	pushl  -0x58(%ebp)
    46c9:	ff 75 a4             	pushl  -0x5c(%ebp)
    46cc:	e8 53 01 00 00       	call   4824 <isIn>
    46d1:	83 c4 20             	add    $0x20,%esp
    46d4:	85 c0                	test   %eax,%eax
    46d6:	75 25                	jne    46fd <set_icon_alpha+0x14e>
    46d8:	83 ec 08             	sub    $0x8,%esp
    46db:	ff 75 b8             	pushl  -0x48(%ebp)
    46de:	ff 75 b4             	pushl  -0x4c(%ebp)
    46e1:	ff 75 b0             	pushl  -0x50(%ebp)
    46e4:	ff 75 ac             	pushl  -0x54(%ebp)
    46e7:	ff 75 a8             	pushl  -0x58(%ebp)
    46ea:	ff 75 a4             	pushl  -0x5c(%ebp)
    46ed:	e8 32 01 00 00       	call   4824 <isIn>
    46f2:	83 c4 20             	add    $0x20,%esp
    46f5:	85 c0                	test   %eax,%eax
    46f7:	0f 84 87 00 00 00    	je     4784 <set_icon_alpha+0x1d5>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    46fd:	8b 45 08             	mov    0x8(%ebp),%eax
    4700:	8b 10                	mov    (%eax),%edx
    4702:	8b 45 08             	mov    0x8(%ebp),%eax
    4705:	8b 40 04             	mov    0x4(%eax),%eax
    4708:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    470c:	89 c1                	mov    %eax,%ecx
    470e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4711:	01 c8                	add    %ecx,%eax
    4713:	c1 e0 02             	shl    $0x2,%eax
    4716:	01 d0                	add    %edx,%eax
    4718:	0f b6 00             	movzbl (%eax),%eax
    471b:	3c ff                	cmp    $0xff,%al
    471d:	75 65                	jne    4784 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    471f:	8b 45 08             	mov    0x8(%ebp),%eax
    4722:	8b 10                	mov    (%eax),%edx
    4724:	8b 45 08             	mov    0x8(%ebp),%eax
    4727:	8b 40 04             	mov    0x4(%eax),%eax
    472a:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    472e:	89 c1                	mov    %eax,%ecx
    4730:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4733:	01 c8                	add    %ecx,%eax
    4735:	c1 e0 02             	shl    $0x2,%eax
    4738:	01 d0                	add    %edx,%eax
    473a:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    473e:	3c ff                	cmp    $0xff,%al
    4740:	75 42                	jne    4784 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    4742:	8b 45 08             	mov    0x8(%ebp),%eax
    4745:	8b 10                	mov    (%eax),%edx
    4747:	8b 45 08             	mov    0x8(%ebp),%eax
    474a:	8b 40 04             	mov    0x4(%eax),%eax
    474d:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    4751:	89 c1                	mov    %eax,%ecx
    4753:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4756:	01 c8                	add    %ecx,%eax
    4758:	c1 e0 02             	shl    $0x2,%eax
    475b:	01 d0                	add    %edx,%eax
    475d:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    4761:	3c ff                	cmp    $0xff,%al
    4763:	75 1f                	jne    4784 <set_icon_alpha+0x1d5>
					pic->data[j * pic->width + i].rgbReserved = 1;
    4765:	8b 45 08             	mov    0x8(%ebp),%eax
    4768:	8b 10                	mov    (%eax),%edx
    476a:	8b 45 08             	mov    0x8(%ebp),%eax
    476d:	8b 40 04             	mov    0x4(%eax),%eax
    4770:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    4774:	89 c1                	mov    %eax,%ecx
    4776:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4779:	01 c8                	add    %ecx,%eax
    477b:	c1 e0 02             	shl    $0x2,%eax
    477e:	01 d0                	add    %edx,%eax
    4780:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    4784:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4788:	8b 45 08             	mov    0x8(%ebp),%eax
    478b:	8b 40 08             	mov    0x8(%eax),%eax
    478e:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    4791:	0f 8f c9 fe ff ff    	jg     4660 <set_icon_alpha+0xb1>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    4797:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    479b:	8b 45 08             	mov    0x8(%ebp),%eax
    479e:	8b 40 04             	mov    0x4(%eax),%eax
    47a1:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    47a4:	0f 8f aa fe ff ff    	jg     4654 <set_icon_alpha+0xa5>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    47aa:	c9                   	leave  
    47ab:	c3                   	ret    

000047ac <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
    47ac:	55                   	push   %ebp
    47ad:	89 e5                	mov    %esp,%ebp
    47af:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    47b2:	8b 45 0c             	mov    0xc(%ebp),%eax
    47b5:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    47b8:	8b 45 10             	mov    0x10(%ebp),%eax
    47bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    47be:	8b 4d 08             	mov    0x8(%ebp),%ecx
    47c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    47c4:	8b 55 fc             	mov    -0x4(%ebp),%edx
    47c7:	89 01                	mov    %eax,(%ecx)
    47c9:	89 51 04             	mov    %edx,0x4(%ecx)
}
    47cc:	8b 45 08             	mov    0x8(%ebp),%eax
    47cf:	c9                   	leave  
    47d0:	c2 04 00             	ret    $0x4

000047d3 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    47d3:	55                   	push   %ebp
    47d4:	89 e5                	mov    %esp,%ebp
    47d6:	83 ec 18             	sub    $0x18,%esp
	Rect r;
	r.start = initPoint(x, y);
    47d9:	8d 45 e8             	lea    -0x18(%ebp),%eax
    47dc:	ff 75 10             	pushl  0x10(%ebp)
    47df:	ff 75 0c             	pushl  0xc(%ebp)
    47e2:	50                   	push   %eax
    47e3:	e8 c4 ff ff ff       	call   47ac <initPoint>
    47e8:	83 c4 08             	add    $0x8,%esp
    47eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    47ee:	8b 55 ec             	mov    -0x14(%ebp),%edx
    47f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    47f4:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    47f7:	8b 45 14             	mov    0x14(%ebp),%eax
    47fa:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    47fd:	8b 45 18             	mov    0x18(%ebp),%eax
    4800:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    4803:	8b 45 08             	mov    0x8(%ebp),%eax
    4806:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4809:	89 10                	mov    %edx,(%eax)
    480b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    480e:	89 50 04             	mov    %edx,0x4(%eax)
    4811:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4814:	89 50 08             	mov    %edx,0x8(%eax)
    4817:	8b 55 fc             	mov    -0x4(%ebp),%edx
    481a:	89 50 0c             	mov    %edx,0xc(%eax)
}
    481d:	8b 45 08             	mov    0x8(%ebp),%eax
    4820:	c9                   	leave  
    4821:	c2 04 00             	ret    $0x4

00004824 <isIn>:

int isIn(Point p, Rect r)
{
    4824:	55                   	push   %ebp
    4825:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    4827:	8b 55 08             	mov    0x8(%ebp),%edx
    482a:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    482d:	39 c2                	cmp    %eax,%edx
    482f:	7c 2f                	jl     4860 <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    4831:	8b 45 08             	mov    0x8(%ebp),%eax
    4834:	8b 4d 10             	mov    0x10(%ebp),%ecx
    4837:	8b 55 18             	mov    0x18(%ebp),%edx
    483a:	01 ca                	add    %ecx,%edx
    483c:	39 d0                	cmp    %edx,%eax
    483e:	7d 20                	jge    4860 <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    4840:	8b 55 0c             	mov    0xc(%ebp),%edx
    4843:	8b 45 14             	mov    0x14(%ebp),%eax
    4846:	39 c2                	cmp    %eax,%edx
    4848:	7c 16                	jl     4860 <isIn+0x3c>
    484a:	8b 45 0c             	mov    0xc(%ebp),%eax
    484d:	8b 4d 14             	mov    0x14(%ebp),%ecx
    4850:	8b 55 1c             	mov    0x1c(%ebp),%edx
    4853:	01 ca                	add    %ecx,%edx
    4855:	39 d0                	cmp    %edx,%eax
    4857:	7d 07                	jge    4860 <isIn+0x3c>
    4859:	b8 01 00 00 00       	mov    $0x1,%eax
    485e:	eb 05                	jmp    4865 <isIn+0x41>
    4860:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4865:	5d                   	pop    %ebp
    4866:	c3                   	ret    

00004867 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    4867:	55                   	push   %ebp
    4868:	89 e5                	mov    %esp,%ebp
    486a:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    486d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    4874:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    487b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    4882:	8b 45 10             	mov    0x10(%ebp),%eax
    4885:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    4888:	8b 45 14             	mov    0x14(%ebp),%eax
    488b:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    488e:	8b 45 08             	mov    0x8(%ebp),%eax
    4891:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4894:	89 10                	mov    %edx,(%eax)
    4896:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4899:	89 50 04             	mov    %edx,0x4(%eax)
    489c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    489f:	89 50 08             	mov    %edx,0x8(%eax)
    48a2:	8b 55 f8             	mov    -0x8(%ebp),%edx
    48a5:	89 50 0c             	mov    %edx,0xc(%eax)
    48a8:	8b 55 fc             	mov    -0x4(%ebp),%edx
    48ab:	89 50 10             	mov    %edx,0x10(%eax)
}
    48ae:	8b 45 08             	mov    0x8(%ebp),%eax
    48b1:	c9                   	leave  
    48b2:	c2 04 00             	ret    $0x4

000048b5 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    48b5:	55                   	push   %ebp
    48b6:	89 e5                	mov    %esp,%ebp
    48b8:	83 ec 08             	sub    $0x8,%esp
	switch (MsgType)
    48bb:	8b 45 1c             	mov    0x1c(%ebp),%eax
    48be:	83 f8 03             	cmp    $0x3,%eax
    48c1:	74 4f                	je     4912 <createClickable+0x5d>
    48c3:	83 f8 04             	cmp    $0x4,%eax
    48c6:	74 07                	je     48cf <createClickable+0x1a>
    48c8:	83 f8 02             	cmp    $0x2,%eax
    48cb:	74 25                	je     48f2 <createClickable+0x3d>
    48cd:	eb 66                	jmp    4935 <createClickable+0x80>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    48cf:	8b 45 08             	mov    0x8(%ebp),%eax
    48d2:	83 c0 04             	add    $0x4,%eax
    48d5:	83 ec 08             	sub    $0x8,%esp
    48d8:	ff 75 20             	pushl  0x20(%ebp)
    48db:	ff 75 18             	pushl  0x18(%ebp)
    48de:	ff 75 14             	pushl  0x14(%ebp)
    48e1:	ff 75 10             	pushl  0x10(%ebp)
    48e4:	ff 75 0c             	pushl  0xc(%ebp)
    48e7:	50                   	push   %eax
    48e8:	e8 5d 00 00 00       	call   494a <addClickable>
    48ed:	83 c4 20             	add    $0x20,%esp
	        break;
    48f0:	eb 56                	jmp    4948 <createClickable+0x93>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    48f2:	8b 45 08             	mov    0x8(%ebp),%eax
    48f5:	83 ec 08             	sub    $0x8,%esp
    48f8:	ff 75 20             	pushl  0x20(%ebp)
    48fb:	ff 75 18             	pushl  0x18(%ebp)
    48fe:	ff 75 14             	pushl  0x14(%ebp)
    4901:	ff 75 10             	pushl  0x10(%ebp)
    4904:	ff 75 0c             	pushl  0xc(%ebp)
    4907:	50                   	push   %eax
    4908:	e8 3d 00 00 00       	call   494a <addClickable>
    490d:	83 c4 20             	add    $0x20,%esp
	    	break;
    4910:	eb 36                	jmp    4948 <createClickable+0x93>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    4912:	8b 45 08             	mov    0x8(%ebp),%eax
    4915:	83 c0 08             	add    $0x8,%eax
    4918:	83 ec 08             	sub    $0x8,%esp
    491b:	ff 75 20             	pushl  0x20(%ebp)
    491e:	ff 75 18             	pushl  0x18(%ebp)
    4921:	ff 75 14             	pushl  0x14(%ebp)
    4924:	ff 75 10             	pushl  0x10(%ebp)
    4927:	ff 75 0c             	pushl  0xc(%ebp)
    492a:	50                   	push   %eax
    492b:	e8 1a 00 00 00       	call   494a <addClickable>
    4930:	83 c4 20             	add    $0x20,%esp
	    	break;
    4933:	eb 13                	jmp    4948 <createClickable+0x93>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    4935:	83 ec 08             	sub    $0x8,%esp
    4938:	68 54 bf 00 00       	push   $0xbf54
    493d:	6a 00                	push   $0x0
    493f:	e8 55 08 00 00       	call   5199 <printf>
    4944:	83 c4 10             	add    $0x10,%esp
	    	break;
    4947:	90                   	nop
	}
}
    4948:	c9                   	leave  
    4949:	c3                   	ret    

0000494a <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    494a:	55                   	push   %ebp
    494b:	89 e5                	mov    %esp,%ebp
    494d:	83 ec 18             	sub    $0x18,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    4950:	83 ec 0c             	sub    $0xc,%esp
    4953:	6a 18                	push   $0x18
    4955:	e8 10 0b 00 00       	call   546a <malloc>
    495a:	83 c4 10             	add    $0x10,%esp
    495d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    4960:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4963:	8b 55 0c             	mov    0xc(%ebp),%edx
    4966:	89 10                	mov    %edx,(%eax)
    4968:	8b 55 10             	mov    0x10(%ebp),%edx
    496b:	89 50 04             	mov    %edx,0x4(%eax)
    496e:	8b 55 14             	mov    0x14(%ebp),%edx
    4971:	89 50 08             	mov    %edx,0x8(%eax)
    4974:	8b 55 18             	mov    0x18(%ebp),%edx
    4977:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    497a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    497d:	8b 55 1c             	mov    0x1c(%ebp),%edx
    4980:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    4983:	8b 45 08             	mov    0x8(%ebp),%eax
    4986:	8b 10                	mov    (%eax),%edx
    4988:	8b 45 f4             	mov    -0xc(%ebp),%eax
    498b:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    498e:	8b 45 08             	mov    0x8(%ebp),%eax
    4991:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4994:	89 10                	mov    %edx,(%eax)
}
    4996:	c9                   	leave  
    4997:	c3                   	ret    

00004998 <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    4998:	55                   	push   %ebp
    4999:	89 e5                	mov    %esp,%ebp
    499b:	83 ec 18             	sub    $0x18,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    499e:	8b 45 08             	mov    0x8(%ebp),%eax
    49a1:	8b 00                	mov    (%eax),%eax
    49a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    49a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    49a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    49ac:	e9 ad 00 00 00       	jmp    4a5e <deleteClickable+0xc6>
	{
		if (isIn(cur->area.start, region))
    49b1:	ff 75 18             	pushl  0x18(%ebp)
    49b4:	ff 75 14             	pushl  0x14(%ebp)
    49b7:	ff 75 10             	pushl  0x10(%ebp)
    49ba:	ff 75 0c             	pushl  0xc(%ebp)
    49bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    49c0:	ff 70 04             	pushl  0x4(%eax)
    49c3:	ff 30                	pushl  (%eax)
    49c5:	e8 5a fe ff ff       	call   4824 <isIn>
    49ca:	83 c4 18             	add    $0x18,%esp
    49cd:	85 c0                	test   %eax,%eax
    49cf:	74 66                	je     4a37 <deleteClickable+0x9f>
		{
			//如果当前指针指向头部
			if (cur == *head)
    49d1:	8b 45 08             	mov    0x8(%ebp),%eax
    49d4:	8b 00                	mov    (%eax),%eax
    49d6:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    49d9:	75 31                	jne    4a0c <deleteClickable+0x74>
			{
				//删除头节点
				temp = *head;
    49db:	8b 45 08             	mov    0x8(%ebp),%eax
    49de:	8b 00                	mov    (%eax),%eax
    49e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    49e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    49e6:	8b 50 14             	mov    0x14(%eax),%edx
    49e9:	8b 45 08             	mov    0x8(%ebp),%eax
    49ec:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    49ee:	8b 45 08             	mov    0x8(%ebp),%eax
    49f1:	8b 00                	mov    (%eax),%eax
    49f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    49f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    49f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    49fc:	83 ec 0c             	sub    $0xc,%esp
    49ff:	ff 75 ec             	pushl  -0x14(%ebp)
    4a02:	e8 22 09 00 00       	call   5329 <free>
    4a07:	83 c4 10             	add    $0x10,%esp
    4a0a:	eb 52                	jmp    4a5e <deleteClickable+0xc6>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    4a0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a0f:	8b 50 14             	mov    0x14(%eax),%edx
    4a12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a15:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    4a18:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a1b:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    4a1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a21:	8b 40 14             	mov    0x14(%eax),%eax
    4a24:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    4a27:	83 ec 0c             	sub    $0xc,%esp
    4a2a:	ff 75 ec             	pushl  -0x14(%ebp)
    4a2d:	e8 f7 08 00 00       	call   5329 <free>
    4a32:	83 c4 10             	add    $0x10,%esp
    4a35:	eb 27                	jmp    4a5e <deleteClickable+0xc6>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    4a37:	8b 45 08             	mov    0x8(%ebp),%eax
    4a3a:	8b 00                	mov    (%eax),%eax
    4a3c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    4a3f:	75 0b                	jne    4a4c <deleteClickable+0xb4>
			{
				cur = cur->next;
    4a41:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a44:	8b 40 14             	mov    0x14(%eax),%eax
    4a47:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4a4a:	eb 12                	jmp    4a5e <deleteClickable+0xc6>
			}
			else
			{
				cur = cur->next;
    4a4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a4f:	8b 40 14             	mov    0x14(%eax),%eax
    4a52:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    4a55:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a58:	8b 40 14             	mov    0x14(%eax),%eax
    4a5b:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    4a5e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4a62:	0f 85 49 ff ff ff    	jne    49b1 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    4a68:	c9                   	leave  
    4a69:	c3                   	ret    

00004a6a <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    4a6a:	55                   	push   %ebp
    4a6b:	89 e5                	mov    %esp,%ebp
    4a6d:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    4a70:	8b 45 08             	mov    0x8(%ebp),%eax
    4a73:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    4a76:	eb 58                	jmp    4ad0 <executeHandler+0x66>
	{
		if (isIn(click, cur->area))
    4a78:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a7b:	ff 70 0c             	pushl  0xc(%eax)
    4a7e:	ff 70 08             	pushl  0x8(%eax)
    4a81:	ff 70 04             	pushl  0x4(%eax)
    4a84:	ff 30                	pushl  (%eax)
    4a86:	ff 75 10             	pushl  0x10(%ebp)
    4a89:	ff 75 0c             	pushl  0xc(%ebp)
    4a8c:	e8 93 fd ff ff       	call   4824 <isIn>
    4a91:	83 c4 18             	add    $0x18,%esp
    4a94:	85 c0                	test   %eax,%eax
    4a96:	74 2f                	je     4ac7 <executeHandler+0x5d>
		{
			renaming = 0;
    4a98:	c7 05 54 40 01 00 00 	movl   $0x0,0x14054
    4a9f:	00 00 00 
			isSearching = 0;
    4aa2:	c7 05 c0 35 01 00 00 	movl   $0x0,0x135c0
    4aa9:	00 00 00 
			cur->handler(click);
    4aac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4aaf:	8b 40 10             	mov    0x10(%eax),%eax
    4ab2:	83 ec 08             	sub    $0x8,%esp
    4ab5:	ff 75 10             	pushl  0x10(%ebp)
    4ab8:	ff 75 0c             	pushl  0xc(%ebp)
    4abb:	ff d0                	call   *%eax
    4abd:	83 c4 10             	add    $0x10,%esp
			return 1;
    4ac0:	b8 01 00 00 00       	mov    $0x1,%eax
    4ac5:	eb 4b                	jmp    4b12 <executeHandler+0xa8>
		}
		cur = cur->next;
    4ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4aca:	8b 40 14             	mov    0x14(%eax),%eax
    4acd:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    4ad0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4ad4:	75 a2                	jne    4a78 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
    4ad6:	c7 05 c0 35 01 00 00 	movl   $0x0,0x135c0
    4add:	00 00 00 
	if (renaming == 1){
    4ae0:	a1 54 40 01 00       	mov    0x14054,%eax
    4ae5:	83 f8 01             	cmp    $0x1,%eax
    4ae8:	75 11                	jne    4afb <executeHandler+0x91>
		renaming = 0;
    4aea:	c7 05 54 40 01 00 00 	movl   $0x0,0x14054
    4af1:	00 00 00 
		return 1;
    4af4:	b8 01 00 00 00       	mov    $0x1,%eax
    4af9:	eb 17                	jmp    4b12 <executeHandler+0xa8>
	}
	printf(0, "execute: none!\n");
    4afb:	83 ec 08             	sub    $0x8,%esp
    4afe:	68 82 bf 00 00       	push   $0xbf82
    4b03:	6a 00                	push   $0x0
    4b05:	e8 8f 06 00 00       	call   5199 <printf>
    4b0a:	83 c4 10             	add    $0x10,%esp
	return 0;
    4b0d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4b12:	c9                   	leave  
    4b13:	c3                   	ret    

00004b14 <printClickable>:

void printClickable(Clickable *c)
{
    4b14:	55                   	push   %ebp
    4b15:	89 e5                	mov    %esp,%ebp
    4b17:	53                   	push   %ebx
    4b18:	83 ec 04             	sub    $0x4,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    4b1b:	8b 45 08             	mov    0x8(%ebp),%eax
    4b1e:	8b 58 0c             	mov    0xc(%eax),%ebx
    4b21:	8b 45 08             	mov    0x8(%ebp),%eax
    4b24:	8b 48 08             	mov    0x8(%eax),%ecx
    4b27:	8b 45 08             	mov    0x8(%ebp),%eax
    4b2a:	8b 50 04             	mov    0x4(%eax),%edx
    4b2d:	8b 45 08             	mov    0x8(%ebp),%eax
    4b30:	8b 00                	mov    (%eax),%eax
    4b32:	83 ec 08             	sub    $0x8,%esp
    4b35:	53                   	push   %ebx
    4b36:	51                   	push   %ecx
    4b37:	52                   	push   %edx
    4b38:	50                   	push   %eax
    4b39:	68 92 bf 00 00       	push   $0xbf92
    4b3e:	6a 00                	push   $0x0
    4b40:	e8 54 06 00 00       	call   5199 <printf>
    4b45:	83 c4 20             	add    $0x20,%esp
}
    4b48:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4b4b:	c9                   	leave  
    4b4c:	c3                   	ret    

00004b4d <printClickableList>:

void printClickableList(Clickable *head)
{
    4b4d:	55                   	push   %ebp
    4b4e:	89 e5                	mov    %esp,%ebp
    4b50:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    4b53:	8b 45 08             	mov    0x8(%ebp),%eax
    4b56:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    4b59:	83 ec 08             	sub    $0x8,%esp
    4b5c:	68 a4 bf 00 00       	push   $0xbfa4
    4b61:	6a 00                	push   $0x0
    4b63:	e8 31 06 00 00       	call   5199 <printf>
    4b68:	83 c4 10             	add    $0x10,%esp
	while(cur != 0)
    4b6b:	eb 17                	jmp    4b84 <printClickableList+0x37>
	{
		printClickable(cur);
    4b6d:	83 ec 0c             	sub    $0xc,%esp
    4b70:	ff 75 f4             	pushl  -0xc(%ebp)
    4b73:	e8 9c ff ff ff       	call   4b14 <printClickable>
    4b78:	83 c4 10             	add    $0x10,%esp
		cur = cur->next;
    4b7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b7e:	8b 40 14             	mov    0x14(%eax),%eax
    4b81:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    4b84:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4b88:	75 e3                	jne    4b6d <printClickableList+0x20>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    4b8a:	83 ec 08             	sub    $0x8,%esp
    4b8d:	68 b5 bf 00 00       	push   $0xbfb5
    4b92:	6a 00                	push   $0x0
    4b94:	e8 00 06 00 00       	call   5199 <printf>
    4b99:	83 c4 10             	add    $0x10,%esp
}
    4b9c:	c9                   	leave  
    4b9d:	c3                   	ret    

00004b9e <testHanler>:

void testHanler(struct Point p)
{
    4b9e:	55                   	push   %ebp
    4b9f:	89 e5                	mov    %esp,%ebp
    4ba1:	83 ec 08             	sub    $0x8,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    4ba4:	8b 55 0c             	mov    0xc(%ebp),%edx
    4ba7:	8b 45 08             	mov    0x8(%ebp),%eax
    4baa:	52                   	push   %edx
    4bab:	50                   	push   %eax
    4bac:	68 b7 bf 00 00       	push   $0xbfb7
    4bb1:	6a 00                	push   $0x0
    4bb3:	e8 e1 05 00 00       	call   5199 <printf>
    4bb8:	83 c4 10             	add    $0x10,%esp
}
    4bbb:	c9                   	leave  
    4bbc:	c3                   	ret    

00004bbd <testClickable>:
void testClickable(struct Context c)
{
    4bbd:	55                   	push   %ebp
    4bbe:	89 e5                	mov    %esp,%ebp
    4bc0:	83 ec 78             	sub    $0x78,%esp
	ClickableManager cm = initClickManager(c);
    4bc3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4bc6:	ff 75 10             	pushl  0x10(%ebp)
    4bc9:	ff 75 0c             	pushl  0xc(%ebp)
    4bcc:	ff 75 08             	pushl  0x8(%ebp)
    4bcf:	50                   	push   %eax
    4bd0:	e8 92 fc ff ff       	call   4867 <initClickManager>
    4bd5:	83 c4 0c             	add    $0xc,%esp

	Rect r1 = initRect(5,5,20,20);
    4bd8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    4bdb:	83 ec 04             	sub    $0x4,%esp
    4bde:	6a 14                	push   $0x14
    4be0:	6a 14                	push   $0x14
    4be2:	6a 05                	push   $0x5
    4be4:	6a 05                	push   $0x5
    4be6:	50                   	push   %eax
    4be7:	e8 e7 fb ff ff       	call   47d3 <initRect>
    4bec:	83 c4 14             	add    $0x14,%esp
	Rect r2 = initRect(20,20,20,20);
    4bef:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    4bf2:	83 ec 04             	sub    $0x4,%esp
    4bf5:	6a 14                	push   $0x14
    4bf7:	6a 14                	push   $0x14
    4bf9:	6a 14                	push   $0x14
    4bfb:	6a 14                	push   $0x14
    4bfd:	50                   	push   %eax
    4bfe:	e8 d0 fb ff ff       	call   47d3 <initRect>
    4c03:	83 c4 14             	add    $0x14,%esp
	Rect r3 = initRect(50,50,15,15);
    4c06:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    4c09:	83 ec 04             	sub    $0x4,%esp
    4c0c:	6a 0f                	push   $0xf
    4c0e:	6a 0f                	push   $0xf
    4c10:	6a 32                	push   $0x32
    4c12:	6a 32                	push   $0x32
    4c14:	50                   	push   %eax
    4c15:	e8 b9 fb ff ff       	call   47d3 <initRect>
    4c1a:	83 c4 14             	add    $0x14,%esp
	Rect r4 = initRect(0,0,30,30);
    4c1d:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4c20:	83 ec 04             	sub    $0x4,%esp
    4c23:	6a 1e                	push   $0x1e
    4c25:	6a 1e                	push   $0x1e
    4c27:	6a 00                	push   $0x0
    4c29:	6a 00                	push   $0x0
    4c2b:	50                   	push   %eax
    4c2c:	e8 a2 fb ff ff       	call   47d3 <initRect>
    4c31:	83 c4 14             	add    $0x14,%esp
	Point p1 = initPoint(23, 23);
    4c34:	8d 45 9c             	lea    -0x64(%ebp),%eax
    4c37:	83 ec 04             	sub    $0x4,%esp
    4c3a:	6a 17                	push   $0x17
    4c3c:	6a 17                	push   $0x17
    4c3e:	50                   	push   %eax
    4c3f:	e8 68 fb ff ff       	call   47ac <initPoint>
    4c44:	83 c4 0c             	add    $0xc,%esp
	Point p2 = initPoint(70, 70);
    4c47:	8d 45 94             	lea    -0x6c(%ebp),%eax
    4c4a:	83 ec 04             	sub    $0x4,%esp
    4c4d:	6a 46                	push   $0x46
    4c4f:	6a 46                	push   $0x46
    4c51:	50                   	push   %eax
    4c52:	e8 55 fb ff ff       	call   47ac <initPoint>
    4c57:	83 c4 0c             	add    $0xc,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    4c5a:	83 ec 04             	sub    $0x4,%esp
    4c5d:	68 9e 4b 00 00       	push   $0x4b9e
    4c62:	6a 02                	push   $0x2
    4c64:	ff 75 e0             	pushl  -0x20(%ebp)
    4c67:	ff 75 dc             	pushl  -0x24(%ebp)
    4c6a:	ff 75 d8             	pushl  -0x28(%ebp)
    4c6d:	ff 75 d4             	pushl  -0x2c(%ebp)
    4c70:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4c73:	50                   	push   %eax
    4c74:	e8 3c fc ff ff       	call   48b5 <createClickable>
    4c79:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    4c7c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4c7f:	83 ec 04             	sub    $0x4,%esp
    4c82:	50                   	push   %eax
    4c83:	68 cb bf 00 00       	push   $0xbfcb
    4c88:	6a 00                	push   $0x0
    4c8a:	e8 0a 05 00 00       	call   5199 <printf>
    4c8f:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    4c92:	83 ec 04             	sub    $0x4,%esp
    4c95:	68 9e 4b 00 00       	push   $0x4b9e
    4c9a:	6a 02                	push   $0x2
    4c9c:	ff 75 d0             	pushl  -0x30(%ebp)
    4c9f:	ff 75 cc             	pushl  -0x34(%ebp)
    4ca2:	ff 75 c8             	pushl  -0x38(%ebp)
    4ca5:	ff 75 c4             	pushl  -0x3c(%ebp)
    4ca8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4cab:	50                   	push   %eax
    4cac:	e8 04 fc ff ff       	call   48b5 <createClickable>
    4cb1:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    4cb4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4cb7:	83 ec 04             	sub    $0x4,%esp
    4cba:	50                   	push   %eax
    4cbb:	68 cb bf 00 00       	push   $0xbfcb
    4cc0:	6a 00                	push   $0x0
    4cc2:	e8 d2 04 00 00       	call   5199 <printf>
    4cc7:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    4cca:	83 ec 04             	sub    $0x4,%esp
    4ccd:	68 9e 4b 00 00       	push   $0x4b9e
    4cd2:	6a 02                	push   $0x2
    4cd4:	ff 75 c0             	pushl  -0x40(%ebp)
    4cd7:	ff 75 bc             	pushl  -0x44(%ebp)
    4cda:	ff 75 b8             	pushl  -0x48(%ebp)
    4cdd:	ff 75 b4             	pushl  -0x4c(%ebp)
    4ce0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4ce3:	50                   	push   %eax
    4ce4:	e8 cc fb ff ff       	call   48b5 <createClickable>
    4ce9:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    4cec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4cef:	83 ec 04             	sub    $0x4,%esp
    4cf2:	50                   	push   %eax
    4cf3:	68 cb bf 00 00       	push   $0xbfcb
    4cf8:	6a 00                	push   $0x0
    4cfa:	e8 9a 04 00 00       	call   5199 <printf>
    4cff:	83 c4 10             	add    $0x10,%esp
	printClickableList(cm.left_click);
    4d02:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d05:	83 ec 0c             	sub    $0xc,%esp
    4d08:	50                   	push   %eax
    4d09:	e8 3f fe ff ff       	call   4b4d <printClickableList>
    4d0e:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p1);
    4d11:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d14:	83 ec 04             	sub    $0x4,%esp
    4d17:	ff 75 a0             	pushl  -0x60(%ebp)
    4d1a:	ff 75 9c             	pushl  -0x64(%ebp)
    4d1d:	50                   	push   %eax
    4d1e:	e8 47 fd ff ff       	call   4a6a <executeHandler>
    4d23:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p2);
    4d26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d29:	83 ec 04             	sub    $0x4,%esp
    4d2c:	ff 75 98             	pushl  -0x68(%ebp)
    4d2f:	ff 75 94             	pushl  -0x6c(%ebp)
    4d32:	50                   	push   %eax
    4d33:	e8 32 fd ff ff       	call   4a6a <executeHandler>
    4d38:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, r4);
    4d3b:	83 ec 0c             	sub    $0xc,%esp
    4d3e:	ff 75 b0             	pushl  -0x50(%ebp)
    4d41:	ff 75 ac             	pushl  -0x54(%ebp)
    4d44:	ff 75 a8             	pushl  -0x58(%ebp)
    4d47:	ff 75 a4             	pushl  -0x5c(%ebp)
    4d4a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4d4d:	50                   	push   %eax
    4d4e:	e8 45 fc ff ff       	call   4998 <deleteClickable>
    4d53:	83 c4 20             	add    $0x20,%esp
	printClickableList(cm.left_click);
    4d56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d59:	83 ec 0c             	sub    $0xc,%esp
    4d5c:	50                   	push   %eax
    4d5d:	e8 eb fd ff ff       	call   4b4d <printClickableList>
    4d62:	83 c4 10             	add    $0x10,%esp
}
    4d65:	c9                   	leave  
    4d66:	c3                   	ret    

00004d67 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    4d67:	55                   	push   %ebp
    4d68:	89 e5                	mov    %esp,%ebp
    4d6a:	57                   	push   %edi
    4d6b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    4d6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4d6f:	8b 55 10             	mov    0x10(%ebp),%edx
    4d72:	8b 45 0c             	mov    0xc(%ebp),%eax
    4d75:	89 cb                	mov    %ecx,%ebx
    4d77:	89 df                	mov    %ebx,%edi
    4d79:	89 d1                	mov    %edx,%ecx
    4d7b:	fc                   	cld    
    4d7c:	f3 aa                	rep stos %al,%es:(%edi)
    4d7e:	89 ca                	mov    %ecx,%edx
    4d80:	89 fb                	mov    %edi,%ebx
    4d82:	89 5d 08             	mov    %ebx,0x8(%ebp)
    4d85:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    4d88:	5b                   	pop    %ebx
    4d89:	5f                   	pop    %edi
    4d8a:	5d                   	pop    %ebp
    4d8b:	c3                   	ret    

00004d8c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    4d8c:	55                   	push   %ebp
    4d8d:	89 e5                	mov    %esp,%ebp
    4d8f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    4d92:	8b 45 08             	mov    0x8(%ebp),%eax
    4d95:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    4d98:	90                   	nop
    4d99:	8b 45 08             	mov    0x8(%ebp),%eax
    4d9c:	8d 50 01             	lea    0x1(%eax),%edx
    4d9f:	89 55 08             	mov    %edx,0x8(%ebp)
    4da2:	8b 55 0c             	mov    0xc(%ebp),%edx
    4da5:	8d 4a 01             	lea    0x1(%edx),%ecx
    4da8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    4dab:	0f b6 12             	movzbl (%edx),%edx
    4dae:	88 10                	mov    %dl,(%eax)
    4db0:	0f b6 00             	movzbl (%eax),%eax
    4db3:	84 c0                	test   %al,%al
    4db5:	75 e2                	jne    4d99 <strcpy+0xd>
    ;
  return os;
    4db7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4dba:	c9                   	leave  
    4dbb:	c3                   	ret    

00004dbc <strcmp>:

int
strcmp(const char *p, const char *q)
{
    4dbc:	55                   	push   %ebp
    4dbd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    4dbf:	eb 08                	jmp    4dc9 <strcmp+0xd>
    p++, q++;
    4dc1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4dc5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    4dc9:	8b 45 08             	mov    0x8(%ebp),%eax
    4dcc:	0f b6 00             	movzbl (%eax),%eax
    4dcf:	84 c0                	test   %al,%al
    4dd1:	74 10                	je     4de3 <strcmp+0x27>
    4dd3:	8b 45 08             	mov    0x8(%ebp),%eax
    4dd6:	0f b6 10             	movzbl (%eax),%edx
    4dd9:	8b 45 0c             	mov    0xc(%ebp),%eax
    4ddc:	0f b6 00             	movzbl (%eax),%eax
    4ddf:	38 c2                	cmp    %al,%dl
    4de1:	74 de                	je     4dc1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    4de3:	8b 45 08             	mov    0x8(%ebp),%eax
    4de6:	0f b6 00             	movzbl (%eax),%eax
    4de9:	0f b6 d0             	movzbl %al,%edx
    4dec:	8b 45 0c             	mov    0xc(%ebp),%eax
    4def:	0f b6 00             	movzbl (%eax),%eax
    4df2:	0f b6 c0             	movzbl %al,%eax
    4df5:	29 c2                	sub    %eax,%edx
    4df7:	89 d0                	mov    %edx,%eax
}
    4df9:	5d                   	pop    %ebp
    4dfa:	c3                   	ret    

00004dfb <strlen>:

uint
strlen(char *s)
{
    4dfb:	55                   	push   %ebp
    4dfc:	89 e5                	mov    %esp,%ebp
    4dfe:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    4e01:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    4e08:	eb 04                	jmp    4e0e <strlen+0x13>
    4e0a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    4e0e:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4e11:	8b 45 08             	mov    0x8(%ebp),%eax
    4e14:	01 d0                	add    %edx,%eax
    4e16:	0f b6 00             	movzbl (%eax),%eax
    4e19:	84 c0                	test   %al,%al
    4e1b:	75 ed                	jne    4e0a <strlen+0xf>
    ;
  return n;
    4e1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4e20:	c9                   	leave  
    4e21:	c3                   	ret    

00004e22 <memset>:

void*
memset(void *dst, int c, uint n)
{
    4e22:	55                   	push   %ebp
    4e23:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    4e25:	8b 45 10             	mov    0x10(%ebp),%eax
    4e28:	50                   	push   %eax
    4e29:	ff 75 0c             	pushl  0xc(%ebp)
    4e2c:	ff 75 08             	pushl  0x8(%ebp)
    4e2f:	e8 33 ff ff ff       	call   4d67 <stosb>
    4e34:	83 c4 0c             	add    $0xc,%esp
  return dst;
    4e37:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4e3a:	c9                   	leave  
    4e3b:	c3                   	ret    

00004e3c <strchr>:

char*
strchr(const char *s, char c)
{
    4e3c:	55                   	push   %ebp
    4e3d:	89 e5                	mov    %esp,%ebp
    4e3f:	83 ec 04             	sub    $0x4,%esp
    4e42:	8b 45 0c             	mov    0xc(%ebp),%eax
    4e45:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    4e48:	eb 14                	jmp    4e5e <strchr+0x22>
    if(*s == c)
    4e4a:	8b 45 08             	mov    0x8(%ebp),%eax
    4e4d:	0f b6 00             	movzbl (%eax),%eax
    4e50:	3a 45 fc             	cmp    -0x4(%ebp),%al
    4e53:	75 05                	jne    4e5a <strchr+0x1e>
      return (char*)s;
    4e55:	8b 45 08             	mov    0x8(%ebp),%eax
    4e58:	eb 13                	jmp    4e6d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    4e5a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4e5e:	8b 45 08             	mov    0x8(%ebp),%eax
    4e61:	0f b6 00             	movzbl (%eax),%eax
    4e64:	84 c0                	test   %al,%al
    4e66:	75 e2                	jne    4e4a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    4e68:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4e6d:	c9                   	leave  
    4e6e:	c3                   	ret    

00004e6f <gets>:

char*
gets(char *buf, int max)
{
    4e6f:	55                   	push   %ebp
    4e70:	89 e5                	mov    %esp,%ebp
    4e72:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4e75:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4e7c:	eb 44                	jmp    4ec2 <gets+0x53>
    cc = read(0, &c, 1);
    4e7e:	83 ec 04             	sub    $0x4,%esp
    4e81:	6a 01                	push   $0x1
    4e83:	8d 45 ef             	lea    -0x11(%ebp),%eax
    4e86:	50                   	push   %eax
    4e87:	6a 00                	push   $0x0
    4e89:	e8 46 01 00 00       	call   4fd4 <read>
    4e8e:	83 c4 10             	add    $0x10,%esp
    4e91:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    4e94:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4e98:	7f 02                	jg     4e9c <gets+0x2d>
      break;
    4e9a:	eb 31                	jmp    4ecd <gets+0x5e>
    buf[i++] = c;
    4e9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e9f:	8d 50 01             	lea    0x1(%eax),%edx
    4ea2:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4ea5:	89 c2                	mov    %eax,%edx
    4ea7:	8b 45 08             	mov    0x8(%ebp),%eax
    4eaa:	01 c2                	add    %eax,%edx
    4eac:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4eb0:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    4eb2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4eb6:	3c 0a                	cmp    $0xa,%al
    4eb8:	74 13                	je     4ecd <gets+0x5e>
    4eba:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4ebe:	3c 0d                	cmp    $0xd,%al
    4ec0:	74 0b                	je     4ecd <gets+0x5e>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4ec2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ec5:	83 c0 01             	add    $0x1,%eax
    4ec8:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4ecb:	7c b1                	jl     4e7e <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    4ecd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4ed0:	8b 45 08             	mov    0x8(%ebp),%eax
    4ed3:	01 d0                	add    %edx,%eax
    4ed5:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    4ed8:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4edb:	c9                   	leave  
    4edc:	c3                   	ret    

00004edd <stat>:

int
stat(char *n, struct stat *st)
{
    4edd:	55                   	push   %ebp
    4ede:	89 e5                	mov    %esp,%ebp
    4ee0:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    4ee3:	83 ec 08             	sub    $0x8,%esp
    4ee6:	6a 00                	push   $0x0
    4ee8:	ff 75 08             	pushl  0x8(%ebp)
    4eeb:	e8 0c 01 00 00       	call   4ffc <open>
    4ef0:	83 c4 10             	add    $0x10,%esp
    4ef3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    4ef6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4efa:	79 07                	jns    4f03 <stat+0x26>
    return -1;
    4efc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4f01:	eb 25                	jmp    4f28 <stat+0x4b>
  r = fstat(fd, st);
    4f03:	83 ec 08             	sub    $0x8,%esp
    4f06:	ff 75 0c             	pushl  0xc(%ebp)
    4f09:	ff 75 f4             	pushl  -0xc(%ebp)
    4f0c:	e8 03 01 00 00       	call   5014 <fstat>
    4f11:	83 c4 10             	add    $0x10,%esp
    4f14:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    4f17:	83 ec 0c             	sub    $0xc,%esp
    4f1a:	ff 75 f4             	pushl  -0xc(%ebp)
    4f1d:	e8 c2 00 00 00       	call   4fe4 <close>
    4f22:	83 c4 10             	add    $0x10,%esp
  return r;
    4f25:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    4f28:	c9                   	leave  
    4f29:	c3                   	ret    

00004f2a <atoi>:

int
atoi(const char *s)
{
    4f2a:	55                   	push   %ebp
    4f2b:	89 e5                	mov    %esp,%ebp
    4f2d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    4f30:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    4f37:	eb 25                	jmp    4f5e <atoi+0x34>
    n = n*10 + *s++ - '0';
    4f39:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4f3c:	89 d0                	mov    %edx,%eax
    4f3e:	c1 e0 02             	shl    $0x2,%eax
    4f41:	01 d0                	add    %edx,%eax
    4f43:	01 c0                	add    %eax,%eax
    4f45:	89 c1                	mov    %eax,%ecx
    4f47:	8b 45 08             	mov    0x8(%ebp),%eax
    4f4a:	8d 50 01             	lea    0x1(%eax),%edx
    4f4d:	89 55 08             	mov    %edx,0x8(%ebp)
    4f50:	0f b6 00             	movzbl (%eax),%eax
    4f53:	0f be c0             	movsbl %al,%eax
    4f56:	01 c8                	add    %ecx,%eax
    4f58:	83 e8 30             	sub    $0x30,%eax
    4f5b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4f5e:	8b 45 08             	mov    0x8(%ebp),%eax
    4f61:	0f b6 00             	movzbl (%eax),%eax
    4f64:	3c 2f                	cmp    $0x2f,%al
    4f66:	7e 0a                	jle    4f72 <atoi+0x48>
    4f68:	8b 45 08             	mov    0x8(%ebp),%eax
    4f6b:	0f b6 00             	movzbl (%eax),%eax
    4f6e:	3c 39                	cmp    $0x39,%al
    4f70:	7e c7                	jle    4f39 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    4f72:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4f75:	c9                   	leave  
    4f76:	c3                   	ret    

00004f77 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4f77:	55                   	push   %ebp
    4f78:	89 e5                	mov    %esp,%ebp
    4f7a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    4f7d:	8b 45 08             	mov    0x8(%ebp),%eax
    4f80:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    4f83:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f86:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    4f89:	eb 17                	jmp    4fa2 <memmove+0x2b>
    *dst++ = *src++;
    4f8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f8e:	8d 50 01             	lea    0x1(%eax),%edx
    4f91:	89 55 fc             	mov    %edx,-0x4(%ebp)
    4f94:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4f97:	8d 4a 01             	lea    0x1(%edx),%ecx
    4f9a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    4f9d:	0f b6 12             	movzbl (%edx),%edx
    4fa0:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    4fa2:	8b 45 10             	mov    0x10(%ebp),%eax
    4fa5:	8d 50 ff             	lea    -0x1(%eax),%edx
    4fa8:	89 55 10             	mov    %edx,0x10(%ebp)
    4fab:	85 c0                	test   %eax,%eax
    4fad:	7f dc                	jg     4f8b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    4faf:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4fb2:	c9                   	leave  
    4fb3:	c3                   	ret    

00004fb4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    4fb4:	b8 01 00 00 00       	mov    $0x1,%eax
    4fb9:	cd 40                	int    $0x40
    4fbb:	c3                   	ret    

00004fbc <exit>:
SYSCALL(exit)
    4fbc:	b8 02 00 00 00       	mov    $0x2,%eax
    4fc1:	cd 40                	int    $0x40
    4fc3:	c3                   	ret    

00004fc4 <wait>:
SYSCALL(wait)
    4fc4:	b8 03 00 00 00       	mov    $0x3,%eax
    4fc9:	cd 40                	int    $0x40
    4fcb:	c3                   	ret    

00004fcc <pipe>:
SYSCALL(pipe)
    4fcc:	b8 04 00 00 00       	mov    $0x4,%eax
    4fd1:	cd 40                	int    $0x40
    4fd3:	c3                   	ret    

00004fd4 <read>:
SYSCALL(read)
    4fd4:	b8 05 00 00 00       	mov    $0x5,%eax
    4fd9:	cd 40                	int    $0x40
    4fdb:	c3                   	ret    

00004fdc <write>:
SYSCALL(write)
    4fdc:	b8 10 00 00 00       	mov    $0x10,%eax
    4fe1:	cd 40                	int    $0x40
    4fe3:	c3                   	ret    

00004fe4 <close>:
SYSCALL(close)
    4fe4:	b8 15 00 00 00       	mov    $0x15,%eax
    4fe9:	cd 40                	int    $0x40
    4feb:	c3                   	ret    

00004fec <kill>:
SYSCALL(kill)
    4fec:	b8 06 00 00 00       	mov    $0x6,%eax
    4ff1:	cd 40                	int    $0x40
    4ff3:	c3                   	ret    

00004ff4 <exec>:
SYSCALL(exec)
    4ff4:	b8 07 00 00 00       	mov    $0x7,%eax
    4ff9:	cd 40                	int    $0x40
    4ffb:	c3                   	ret    

00004ffc <open>:
SYSCALL(open)
    4ffc:	b8 0f 00 00 00       	mov    $0xf,%eax
    5001:	cd 40                	int    $0x40
    5003:	c3                   	ret    

00005004 <mknod>:
SYSCALL(mknod)
    5004:	b8 11 00 00 00       	mov    $0x11,%eax
    5009:	cd 40                	int    $0x40
    500b:	c3                   	ret    

0000500c <unlink>:
SYSCALL(unlink)
    500c:	b8 12 00 00 00       	mov    $0x12,%eax
    5011:	cd 40                	int    $0x40
    5013:	c3                   	ret    

00005014 <fstat>:
SYSCALL(fstat)
    5014:	b8 08 00 00 00       	mov    $0x8,%eax
    5019:	cd 40                	int    $0x40
    501b:	c3                   	ret    

0000501c <link>:
SYSCALL(link)
    501c:	b8 13 00 00 00       	mov    $0x13,%eax
    5021:	cd 40                	int    $0x40
    5023:	c3                   	ret    

00005024 <mkdir>:
SYSCALL(mkdir)
    5024:	b8 14 00 00 00       	mov    $0x14,%eax
    5029:	cd 40                	int    $0x40
    502b:	c3                   	ret    

0000502c <chdir>:
SYSCALL(chdir)
    502c:	b8 09 00 00 00       	mov    $0x9,%eax
    5031:	cd 40                	int    $0x40
    5033:	c3                   	ret    

00005034 <dup>:
SYSCALL(dup)
    5034:	b8 0a 00 00 00       	mov    $0xa,%eax
    5039:	cd 40                	int    $0x40
    503b:	c3                   	ret    

0000503c <getpid>:
SYSCALL(getpid)
    503c:	b8 0b 00 00 00       	mov    $0xb,%eax
    5041:	cd 40                	int    $0x40
    5043:	c3                   	ret    

00005044 <sbrk>:
SYSCALL(sbrk)
    5044:	b8 0c 00 00 00       	mov    $0xc,%eax
    5049:	cd 40                	int    $0x40
    504b:	c3                   	ret    

0000504c <sleep>:
SYSCALL(sleep)
    504c:	b8 0d 00 00 00       	mov    $0xd,%eax
    5051:	cd 40                	int    $0x40
    5053:	c3                   	ret    

00005054 <uptime>:
SYSCALL(uptime)
    5054:	b8 0e 00 00 00       	mov    $0xe,%eax
    5059:	cd 40                	int    $0x40
    505b:	c3                   	ret    

0000505c <getMsg>:
SYSCALL(getMsg)
    505c:	b8 16 00 00 00       	mov    $0x16,%eax
    5061:	cd 40                	int    $0x40
    5063:	c3                   	ret    

00005064 <createWindow>:
SYSCALL(createWindow)
    5064:	b8 17 00 00 00       	mov    $0x17,%eax
    5069:	cd 40                	int    $0x40
    506b:	c3                   	ret    

0000506c <destroyWindow>:
SYSCALL(destroyWindow)
    506c:	b8 18 00 00 00       	mov    $0x18,%eax
    5071:	cd 40                	int    $0x40
    5073:	c3                   	ret    

00005074 <updateWindow>:
SYSCALL(updateWindow)
    5074:	b8 19 00 00 00       	mov    $0x19,%eax
    5079:	cd 40                	int    $0x40
    507b:	c3                   	ret    

0000507c <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    507c:	b8 1a 00 00 00       	mov    $0x1a,%eax
    5081:	cd 40                	int    $0x40
    5083:	c3                   	ret    

00005084 <kwrite>:
SYSCALL(kwrite)
    5084:	b8 1c 00 00 00       	mov    $0x1c,%eax
    5089:	cd 40                	int    $0x40
    508b:	c3                   	ret    

0000508c <setSampleRate>:
SYSCALL(setSampleRate)
    508c:	b8 1b 00 00 00       	mov    $0x1b,%eax
    5091:	cd 40                	int    $0x40
    5093:	c3                   	ret    

00005094 <pause>:
SYSCALL(pause)
    5094:	b8 1d 00 00 00       	mov    $0x1d,%eax
    5099:	cd 40                	int    $0x40
    509b:	c3                   	ret    

0000509c <wavdecode>:
SYSCALL(wavdecode)
    509c:	b8 1e 00 00 00       	mov    $0x1e,%eax
    50a1:	cd 40                	int    $0x40
    50a3:	c3                   	ret    

000050a4 <beginDecode>:
SYSCALL(beginDecode)
    50a4:	b8 1f 00 00 00       	mov    $0x1f,%eax
    50a9:	cd 40                	int    $0x40
    50ab:	c3                   	ret    

000050ac <waitForDecode>:
SYSCALL(waitForDecode)
    50ac:	b8 20 00 00 00       	mov    $0x20,%eax
    50b1:	cd 40                	int    $0x40
    50b3:	c3                   	ret    

000050b4 <endDecode>:
SYSCALL(endDecode)
    50b4:	b8 21 00 00 00       	mov    $0x21,%eax
    50b9:	cd 40                	int    $0x40
    50bb:	c3                   	ret    

000050bc <getCoreBuf>:
    50bc:	b8 22 00 00 00       	mov    $0x22,%eax
    50c1:	cd 40                	int    $0x40
    50c3:	c3                   	ret    

000050c4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    50c4:	55                   	push   %ebp
    50c5:	89 e5                	mov    %esp,%ebp
    50c7:	83 ec 18             	sub    $0x18,%esp
    50ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    50cd:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    50d0:	83 ec 04             	sub    $0x4,%esp
    50d3:	6a 01                	push   $0x1
    50d5:	8d 45 f4             	lea    -0xc(%ebp),%eax
    50d8:	50                   	push   %eax
    50d9:	ff 75 08             	pushl  0x8(%ebp)
    50dc:	e8 fb fe ff ff       	call   4fdc <write>
    50e1:	83 c4 10             	add    $0x10,%esp
}
    50e4:	c9                   	leave  
    50e5:	c3                   	ret    

000050e6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    50e6:	55                   	push   %ebp
    50e7:	89 e5                	mov    %esp,%ebp
    50e9:	53                   	push   %ebx
    50ea:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    50ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    50f4:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    50f8:	74 17                	je     5111 <printint+0x2b>
    50fa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    50fe:	79 11                	jns    5111 <printint+0x2b>
    neg = 1;
    5100:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    5107:	8b 45 0c             	mov    0xc(%ebp),%eax
    510a:	f7 d8                	neg    %eax
    510c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    510f:	eb 06                	jmp    5117 <printint+0x31>
  } else {
    x = xx;
    5111:	8b 45 0c             	mov    0xc(%ebp),%eax
    5114:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    5117:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    511e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5121:	8d 41 01             	lea    0x1(%ecx),%eax
    5124:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5127:	8b 5d 10             	mov    0x10(%ebp),%ebx
    512a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    512d:	ba 00 00 00 00       	mov    $0x0,%edx
    5132:	f7 f3                	div    %ebx
    5134:	89 d0                	mov    %edx,%eax
    5136:	0f b6 80 9c 01 01 00 	movzbl 0x1019c(%eax),%eax
    513d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    5141:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5144:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5147:	ba 00 00 00 00       	mov    $0x0,%edx
    514c:	f7 f3                	div    %ebx
    514e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5151:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5155:	75 c7                	jne    511e <printint+0x38>
  if(neg)
    5157:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    515b:	74 0e                	je     516b <printint+0x85>
    buf[i++] = '-';
    515d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5160:	8d 50 01             	lea    0x1(%eax),%edx
    5163:	89 55 f4             	mov    %edx,-0xc(%ebp)
    5166:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    516b:	eb 1d                	jmp    518a <printint+0xa4>
    putc(fd, buf[i]);
    516d:	8d 55 dc             	lea    -0x24(%ebp),%edx
    5170:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5173:	01 d0                	add    %edx,%eax
    5175:	0f b6 00             	movzbl (%eax),%eax
    5178:	0f be c0             	movsbl %al,%eax
    517b:	83 ec 08             	sub    $0x8,%esp
    517e:	50                   	push   %eax
    517f:	ff 75 08             	pushl  0x8(%ebp)
    5182:	e8 3d ff ff ff       	call   50c4 <putc>
    5187:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    518a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    518e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5192:	79 d9                	jns    516d <printint+0x87>
    putc(fd, buf[i]);
}
    5194:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5197:	c9                   	leave  
    5198:	c3                   	ret    

00005199 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    5199:	55                   	push   %ebp
    519a:	89 e5                	mov    %esp,%ebp
    519c:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    519f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    51a6:	8d 45 0c             	lea    0xc(%ebp),%eax
    51a9:	83 c0 04             	add    $0x4,%eax
    51ac:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    51af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    51b6:	e9 59 01 00 00       	jmp    5314 <printf+0x17b>
    c = fmt[i] & 0xff;
    51bb:	8b 55 0c             	mov    0xc(%ebp),%edx
    51be:	8b 45 f0             	mov    -0x10(%ebp),%eax
    51c1:	01 d0                	add    %edx,%eax
    51c3:	0f b6 00             	movzbl (%eax),%eax
    51c6:	0f be c0             	movsbl %al,%eax
    51c9:	25 ff 00 00 00       	and    $0xff,%eax
    51ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    51d1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    51d5:	75 2c                	jne    5203 <printf+0x6a>
      if(c == '%'){
    51d7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    51db:	75 0c                	jne    51e9 <printf+0x50>
        state = '%';
    51dd:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    51e4:	e9 27 01 00 00       	jmp    5310 <printf+0x177>
      } else {
        putc(fd, c);
    51e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    51ec:	0f be c0             	movsbl %al,%eax
    51ef:	83 ec 08             	sub    $0x8,%esp
    51f2:	50                   	push   %eax
    51f3:	ff 75 08             	pushl  0x8(%ebp)
    51f6:	e8 c9 fe ff ff       	call   50c4 <putc>
    51fb:	83 c4 10             	add    $0x10,%esp
    51fe:	e9 0d 01 00 00       	jmp    5310 <printf+0x177>
      }
    } else if(state == '%'){
    5203:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    5207:	0f 85 03 01 00 00    	jne    5310 <printf+0x177>
      if(c == 'd'){
    520d:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    5211:	75 1e                	jne    5231 <printf+0x98>
        printint(fd, *ap, 10, 1);
    5213:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5216:	8b 00                	mov    (%eax),%eax
    5218:	6a 01                	push   $0x1
    521a:	6a 0a                	push   $0xa
    521c:	50                   	push   %eax
    521d:	ff 75 08             	pushl  0x8(%ebp)
    5220:	e8 c1 fe ff ff       	call   50e6 <printint>
    5225:	83 c4 10             	add    $0x10,%esp
        ap++;
    5228:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    522c:	e9 d8 00 00 00       	jmp    5309 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    5231:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    5235:	74 06                	je     523d <printf+0xa4>
    5237:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    523b:	75 1e                	jne    525b <printf+0xc2>
        printint(fd, *ap, 16, 0);
    523d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5240:	8b 00                	mov    (%eax),%eax
    5242:	6a 00                	push   $0x0
    5244:	6a 10                	push   $0x10
    5246:	50                   	push   %eax
    5247:	ff 75 08             	pushl  0x8(%ebp)
    524a:	e8 97 fe ff ff       	call   50e6 <printint>
    524f:	83 c4 10             	add    $0x10,%esp
        ap++;
    5252:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5256:	e9 ae 00 00 00       	jmp    5309 <printf+0x170>
      } else if(c == 's'){
    525b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    525f:	75 43                	jne    52a4 <printf+0x10b>
        s = (char*)*ap;
    5261:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5264:	8b 00                	mov    (%eax),%eax
    5266:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    5269:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    526d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5271:	75 07                	jne    527a <printf+0xe1>
          s = "(null)";
    5273:	c7 45 f4 db bf 00 00 	movl   $0xbfdb,-0xc(%ebp)
        while(*s != 0){
    527a:	eb 1c                	jmp    5298 <printf+0xff>
          putc(fd, *s);
    527c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    527f:	0f b6 00             	movzbl (%eax),%eax
    5282:	0f be c0             	movsbl %al,%eax
    5285:	83 ec 08             	sub    $0x8,%esp
    5288:	50                   	push   %eax
    5289:	ff 75 08             	pushl  0x8(%ebp)
    528c:	e8 33 fe ff ff       	call   50c4 <putc>
    5291:	83 c4 10             	add    $0x10,%esp
          s++;
    5294:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    5298:	8b 45 f4             	mov    -0xc(%ebp),%eax
    529b:	0f b6 00             	movzbl (%eax),%eax
    529e:	84 c0                	test   %al,%al
    52a0:	75 da                	jne    527c <printf+0xe3>
    52a2:	eb 65                	jmp    5309 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    52a4:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    52a8:	75 1d                	jne    52c7 <printf+0x12e>
        putc(fd, *ap);
    52aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    52ad:	8b 00                	mov    (%eax),%eax
    52af:	0f be c0             	movsbl %al,%eax
    52b2:	83 ec 08             	sub    $0x8,%esp
    52b5:	50                   	push   %eax
    52b6:	ff 75 08             	pushl  0x8(%ebp)
    52b9:	e8 06 fe ff ff       	call   50c4 <putc>
    52be:	83 c4 10             	add    $0x10,%esp
        ap++;
    52c1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    52c5:	eb 42                	jmp    5309 <printf+0x170>
      } else if(c == '%'){
    52c7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    52cb:	75 17                	jne    52e4 <printf+0x14b>
        putc(fd, c);
    52cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    52d0:	0f be c0             	movsbl %al,%eax
    52d3:	83 ec 08             	sub    $0x8,%esp
    52d6:	50                   	push   %eax
    52d7:	ff 75 08             	pushl  0x8(%ebp)
    52da:	e8 e5 fd ff ff       	call   50c4 <putc>
    52df:	83 c4 10             	add    $0x10,%esp
    52e2:	eb 25                	jmp    5309 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    52e4:	83 ec 08             	sub    $0x8,%esp
    52e7:	6a 25                	push   $0x25
    52e9:	ff 75 08             	pushl  0x8(%ebp)
    52ec:	e8 d3 fd ff ff       	call   50c4 <putc>
    52f1:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    52f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    52f7:	0f be c0             	movsbl %al,%eax
    52fa:	83 ec 08             	sub    $0x8,%esp
    52fd:	50                   	push   %eax
    52fe:	ff 75 08             	pushl  0x8(%ebp)
    5301:	e8 be fd ff ff       	call   50c4 <putc>
    5306:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    5309:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    5310:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5314:	8b 55 0c             	mov    0xc(%ebp),%edx
    5317:	8b 45 f0             	mov    -0x10(%ebp),%eax
    531a:	01 d0                	add    %edx,%eax
    531c:	0f b6 00             	movzbl (%eax),%eax
    531f:	84 c0                	test   %al,%al
    5321:	0f 85 94 fe ff ff    	jne    51bb <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    5327:	c9                   	leave  
    5328:	c3                   	ret    

00005329 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    5329:	55                   	push   %ebp
    532a:	89 e5                	mov    %esp,%ebp
    532c:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    532f:	8b 45 08             	mov    0x8(%ebp),%eax
    5332:	83 e8 08             	sub    $0x8,%eax
    5335:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5338:	a1 60 07 01 00       	mov    0x10760,%eax
    533d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5340:	eb 24                	jmp    5366 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    5342:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5345:	8b 00                	mov    (%eax),%eax
    5347:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    534a:	77 12                	ja     535e <free+0x35>
    534c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    534f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    5352:	77 24                	ja     5378 <free+0x4f>
    5354:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5357:	8b 00                	mov    (%eax),%eax
    5359:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    535c:	77 1a                	ja     5378 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    535e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5361:	8b 00                	mov    (%eax),%eax
    5363:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5366:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5369:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    536c:	76 d4                	jbe    5342 <free+0x19>
    536e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5371:	8b 00                	mov    (%eax),%eax
    5373:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    5376:	76 ca                	jbe    5342 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    5378:	8b 45 f8             	mov    -0x8(%ebp),%eax
    537b:	8b 40 04             	mov    0x4(%eax),%eax
    537e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    5385:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5388:	01 c2                	add    %eax,%edx
    538a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    538d:	8b 00                	mov    (%eax),%eax
    538f:	39 c2                	cmp    %eax,%edx
    5391:	75 24                	jne    53b7 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    5393:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5396:	8b 50 04             	mov    0x4(%eax),%edx
    5399:	8b 45 fc             	mov    -0x4(%ebp),%eax
    539c:	8b 00                	mov    (%eax),%eax
    539e:	8b 40 04             	mov    0x4(%eax),%eax
    53a1:	01 c2                	add    %eax,%edx
    53a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    53a6:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    53a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53ac:	8b 00                	mov    (%eax),%eax
    53ae:	8b 10                	mov    (%eax),%edx
    53b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    53b3:	89 10                	mov    %edx,(%eax)
    53b5:	eb 0a                	jmp    53c1 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    53b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53ba:	8b 10                	mov    (%eax),%edx
    53bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    53bf:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    53c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53c4:	8b 40 04             	mov    0x4(%eax),%eax
    53c7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    53ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53d1:	01 d0                	add    %edx,%eax
    53d3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    53d6:	75 20                	jne    53f8 <free+0xcf>
    p->s.size += bp->s.size;
    53d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53db:	8b 50 04             	mov    0x4(%eax),%edx
    53de:	8b 45 f8             	mov    -0x8(%ebp),%eax
    53e1:	8b 40 04             	mov    0x4(%eax),%eax
    53e4:	01 c2                	add    %eax,%edx
    53e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53e9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    53ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
    53ef:	8b 10                	mov    (%eax),%edx
    53f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53f4:	89 10                	mov    %edx,(%eax)
    53f6:	eb 08                	jmp    5400 <free+0xd7>
  } else
    p->s.ptr = bp;
    53f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53fb:	8b 55 f8             	mov    -0x8(%ebp),%edx
    53fe:	89 10                	mov    %edx,(%eax)
  freep = p;
    5400:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5403:	a3 60 07 01 00       	mov    %eax,0x10760
}
    5408:	c9                   	leave  
    5409:	c3                   	ret    

0000540a <morecore>:

static Header*
morecore(uint nu)
{
    540a:	55                   	push   %ebp
    540b:	89 e5                	mov    %esp,%ebp
    540d:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    5410:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    5417:	77 07                	ja     5420 <morecore+0x16>
    nu = 4096;
    5419:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    5420:	8b 45 08             	mov    0x8(%ebp),%eax
    5423:	c1 e0 03             	shl    $0x3,%eax
    5426:	83 ec 0c             	sub    $0xc,%esp
    5429:	50                   	push   %eax
    542a:	e8 15 fc ff ff       	call   5044 <sbrk>
    542f:	83 c4 10             	add    $0x10,%esp
    5432:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    5435:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    5439:	75 07                	jne    5442 <morecore+0x38>
    return 0;
    543b:	b8 00 00 00 00       	mov    $0x0,%eax
    5440:	eb 26                	jmp    5468 <morecore+0x5e>
  hp = (Header*)p;
    5442:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5445:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    5448:	8b 45 f0             	mov    -0x10(%ebp),%eax
    544b:	8b 55 08             	mov    0x8(%ebp),%edx
    544e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    5451:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5454:	83 c0 08             	add    $0x8,%eax
    5457:	83 ec 0c             	sub    $0xc,%esp
    545a:	50                   	push   %eax
    545b:	e8 c9 fe ff ff       	call   5329 <free>
    5460:	83 c4 10             	add    $0x10,%esp
  return freep;
    5463:	a1 60 07 01 00       	mov    0x10760,%eax
}
    5468:	c9                   	leave  
    5469:	c3                   	ret    

0000546a <malloc>:

void*
malloc(uint nbytes)
{
    546a:	55                   	push   %ebp
    546b:	89 e5                	mov    %esp,%ebp
    546d:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    5470:	8b 45 08             	mov    0x8(%ebp),%eax
    5473:	83 c0 07             	add    $0x7,%eax
    5476:	c1 e8 03             	shr    $0x3,%eax
    5479:	83 c0 01             	add    $0x1,%eax
    547c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    547f:	a1 60 07 01 00       	mov    0x10760,%eax
    5484:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5487:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    548b:	75 23                	jne    54b0 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    548d:	c7 45 f0 58 07 01 00 	movl   $0x10758,-0x10(%ebp)
    5494:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5497:	a3 60 07 01 00       	mov    %eax,0x10760
    549c:	a1 60 07 01 00       	mov    0x10760,%eax
    54a1:	a3 58 07 01 00       	mov    %eax,0x10758
    base.s.size = 0;
    54a6:	c7 05 5c 07 01 00 00 	movl   $0x0,0x1075c
    54ad:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    54b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    54b3:	8b 00                	mov    (%eax),%eax
    54b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    54b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54bb:	8b 40 04             	mov    0x4(%eax),%eax
    54be:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    54c1:	72 4d                	jb     5510 <malloc+0xa6>
      if(p->s.size == nunits)
    54c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54c6:	8b 40 04             	mov    0x4(%eax),%eax
    54c9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    54cc:	75 0c                	jne    54da <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    54ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54d1:	8b 10                	mov    (%eax),%edx
    54d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    54d6:	89 10                	mov    %edx,(%eax)
    54d8:	eb 26                	jmp    5500 <malloc+0x96>
      else {
        p->s.size -= nunits;
    54da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54dd:	8b 40 04             	mov    0x4(%eax),%eax
    54e0:	2b 45 ec             	sub    -0x14(%ebp),%eax
    54e3:	89 c2                	mov    %eax,%edx
    54e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54e8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    54eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54ee:	8b 40 04             	mov    0x4(%eax),%eax
    54f1:	c1 e0 03             	shl    $0x3,%eax
    54f4:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    54f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54fa:	8b 55 ec             	mov    -0x14(%ebp),%edx
    54fd:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    5500:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5503:	a3 60 07 01 00       	mov    %eax,0x10760
      return (void*)(p + 1);
    5508:	8b 45 f4             	mov    -0xc(%ebp),%eax
    550b:	83 c0 08             	add    $0x8,%eax
    550e:	eb 3b                	jmp    554b <malloc+0xe1>
    }
    if(p == freep)
    5510:	a1 60 07 01 00       	mov    0x10760,%eax
    5515:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    5518:	75 1e                	jne    5538 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    551a:	83 ec 0c             	sub    $0xc,%esp
    551d:	ff 75 ec             	pushl  -0x14(%ebp)
    5520:	e8 e5 fe ff ff       	call   540a <morecore>
    5525:	83 c4 10             	add    $0x10,%esp
    5528:	89 45 f4             	mov    %eax,-0xc(%ebp)
    552b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    552f:	75 07                	jne    5538 <malloc+0xce>
        return 0;
    5531:	b8 00 00 00 00       	mov    $0x0,%eax
    5536:	eb 13                	jmp    554b <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5538:	8b 45 f4             	mov    -0xc(%ebp),%eax
    553b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    553e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5541:	8b 00                	mov    (%eax),%eax
    5543:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    5546:	e9 6d ff ff ff       	jmp    54b8 <malloc+0x4e>
}
    554b:	c9                   	leave  
    554c:	c3                   	ret    

0000554d <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    554d:	55                   	push   %ebp
    554e:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    5550:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    5554:	79 07                	jns    555d <abs+0x10>
		return x * -1;
    5556:	8b 45 08             	mov    0x8(%ebp),%eax
    5559:	f7 d8                	neg    %eax
    555b:	eb 03                	jmp    5560 <abs+0x13>
	else
		return x;
    555d:	8b 45 08             	mov    0x8(%ebp),%eax
}
    5560:	5d                   	pop    %ebp
    5561:	c3                   	ret    

00005562 <sin>:
double sin(double x)  
{  
    5562:	55                   	push   %ebp
    5563:	89 e5                	mov    %esp,%ebp
    5565:	83 ec 40             	sub    $0x40,%esp
    5568:	8b 45 08             	mov    0x8(%ebp),%eax
    556b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    556e:	8b 45 0c             	mov    0xc(%ebp),%eax
    5571:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    5574:	dd 45 c8             	fldl   -0x38(%ebp)
    5577:	dd 5d f8             	fstpl  -0x8(%ebp)
    557a:	d9 e8                	fld1   
    557c:	dd 5d f0             	fstpl  -0x10(%ebp)
    557f:	dd 45 c8             	fldl   -0x38(%ebp)
    5582:	dd 5d e8             	fstpl  -0x18(%ebp)
    5585:	dd 45 c8             	fldl   -0x38(%ebp)
    5588:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    558b:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    5592:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    5599:	eb 50                	jmp    55eb <sin+0x89>
	{  
		n = n+1;  
    559b:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    559f:	db 45 dc             	fildl  -0x24(%ebp)
    55a2:	dc 4d f0             	fmull  -0x10(%ebp)
    55a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    55a8:	83 c0 01             	add    $0x1,%eax
    55ab:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    55ae:	db 45 c4             	fildl  -0x3c(%ebp)
    55b1:	de c9                	fmulp  %st,%st(1)
    55b3:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    55b6:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    55ba:	dd 45 c8             	fldl   -0x38(%ebp)
    55bd:	dc 4d c8             	fmull  -0x38(%ebp)
    55c0:	dd 45 e8             	fldl   -0x18(%ebp)
    55c3:	de c9                	fmulp  %st,%st(1)
    55c5:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    55c8:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    55cb:	dd 45 e8             	fldl   -0x18(%ebp)
    55ce:	dc 75 f0             	fdivl  -0x10(%ebp)
    55d1:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    55d4:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    55d8:	7e 08                	jle    55e2 <sin+0x80>
    55da:	dd 45 f8             	fldl   -0x8(%ebp)
    55dd:	dc 45 e0             	faddl  -0x20(%ebp)
    55e0:	eb 06                	jmp    55e8 <sin+0x86>
    55e2:	dd 45 f8             	fldl   -0x8(%ebp)
    55e5:	dc 65 e0             	fsubl  -0x20(%ebp)
    55e8:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    55eb:	dd 45 e0             	fldl   -0x20(%ebp)
    55ee:	dd 05 e8 bf 00 00    	fldl   0xbfe8
    55f4:	d9 c9                	fxch   %st(1)
    55f6:	df e9                	fucomip %st(1),%st
    55f8:	dd d8                	fstp   %st(0)
    55fa:	77 9f                	ja     559b <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    55fc:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    55ff:	c9                   	leave  
    5600:	c3                   	ret    

00005601 <cos>:
double cos(double x)  
{  
    5601:	55                   	push   %ebp
    5602:	89 e5                	mov    %esp,%ebp
    5604:	83 ec 08             	sub    $0x8,%esp
    5607:	8b 45 08             	mov    0x8(%ebp),%eax
    560a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    560d:	8b 45 0c             	mov    0xc(%ebp),%eax
    5610:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    5613:	dd 05 f0 bf 00 00    	fldl   0xbff0
    5619:	dc 65 f8             	fsubl  -0x8(%ebp)
    561c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5620:	dd 1c 24             	fstpl  (%esp)
    5623:	e8 3a ff ff ff       	call   5562 <sin>
    5628:	83 c4 08             	add    $0x8,%esp
}  
    562b:	c9                   	leave  
    562c:	c3                   	ret    

0000562d <tan>:
double tan(double x)  
{  
    562d:	55                   	push   %ebp
    562e:	89 e5                	mov    %esp,%ebp
    5630:	83 ec 10             	sub    $0x10,%esp
    5633:	8b 45 08             	mov    0x8(%ebp),%eax
    5636:	89 45 f8             	mov    %eax,-0x8(%ebp)
    5639:	8b 45 0c             	mov    0xc(%ebp),%eax
    563c:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    563f:	ff 75 fc             	pushl  -0x4(%ebp)
    5642:	ff 75 f8             	pushl  -0x8(%ebp)
    5645:	e8 18 ff ff ff       	call   5562 <sin>
    564a:	83 c4 08             	add    $0x8,%esp
    564d:	dd 5d f0             	fstpl  -0x10(%ebp)
    5650:	ff 75 fc             	pushl  -0x4(%ebp)
    5653:	ff 75 f8             	pushl  -0x8(%ebp)
    5656:	e8 a6 ff ff ff       	call   5601 <cos>
    565b:	83 c4 08             	add    $0x8,%esp
    565e:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    5661:	c9                   	leave  
    5662:	c3                   	ret    

00005663 <pow>:

double pow(double x, double y)
{
    5663:	55                   	push   %ebp
    5664:	89 e5                	mov    %esp,%ebp
    5666:	83 ec 38             	sub    $0x38,%esp
    5669:	8b 45 08             	mov    0x8(%ebp),%eax
    566c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    566f:	8b 45 0c             	mov    0xc(%ebp),%eax
    5672:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5675:	8b 45 10             	mov    0x10(%ebp),%eax
    5678:	89 45 d8             	mov    %eax,-0x28(%ebp)
    567b:	8b 45 14             	mov    0x14(%ebp),%eax
    567e:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    5681:	dd 45 e0             	fldl   -0x20(%ebp)
    5684:	d9 ee                	fldz   
    5686:	df e9                	fucomip %st(1),%st
    5688:	dd d8                	fstp   %st(0)
    568a:	7a 28                	jp     56b4 <pow+0x51>
    568c:	dd 45 e0             	fldl   -0x20(%ebp)
    568f:	d9 ee                	fldz   
    5691:	df e9                	fucomip %st(1),%st
    5693:	dd d8                	fstp   %st(0)
    5695:	75 1d                	jne    56b4 <pow+0x51>
    5697:	dd 45 d8             	fldl   -0x28(%ebp)
    569a:	d9 ee                	fldz   
    569c:	df e9                	fucomip %st(1),%st
    569e:	dd d8                	fstp   %st(0)
    56a0:	7a 0b                	jp     56ad <pow+0x4a>
    56a2:	dd 45 d8             	fldl   -0x28(%ebp)
    56a5:	d9 ee                	fldz   
    56a7:	df e9                	fucomip %st(1),%st
    56a9:	dd d8                	fstp   %st(0)
    56ab:	74 07                	je     56b4 <pow+0x51>
    56ad:	d9 ee                	fldz   
    56af:	e9 3a 01 00 00       	jmp    57ee <pow+0x18b>
	else if(x==0 && y==0) return 1;
    56b4:	dd 45 e0             	fldl   -0x20(%ebp)
    56b7:	d9 ee                	fldz   
    56b9:	df e9                	fucomip %st(1),%st
    56bb:	dd d8                	fstp   %st(0)
    56bd:	7a 28                	jp     56e7 <pow+0x84>
    56bf:	dd 45 e0             	fldl   -0x20(%ebp)
    56c2:	d9 ee                	fldz   
    56c4:	df e9                	fucomip %st(1),%st
    56c6:	dd d8                	fstp   %st(0)
    56c8:	75 1d                	jne    56e7 <pow+0x84>
    56ca:	dd 45 d8             	fldl   -0x28(%ebp)
    56cd:	d9 ee                	fldz   
    56cf:	df e9                	fucomip %st(1),%st
    56d1:	dd d8                	fstp   %st(0)
    56d3:	7a 12                	jp     56e7 <pow+0x84>
    56d5:	dd 45 d8             	fldl   -0x28(%ebp)
    56d8:	d9 ee                	fldz   
    56da:	df e9                	fucomip %st(1),%st
    56dc:	dd d8                	fstp   %st(0)
    56de:	75 07                	jne    56e7 <pow+0x84>
    56e0:	d9 e8                	fld1   
    56e2:	e9 07 01 00 00       	jmp    57ee <pow+0x18b>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    56e7:	d9 ee                	fldz   
    56e9:	dd 45 d8             	fldl   -0x28(%ebp)
    56ec:	d9 c9                	fxch   %st(1)
    56ee:	df e9                	fucomip %st(1),%st
    56f0:	dd d8                	fstp   %st(0)
    56f2:	76 23                	jbe    5717 <pow+0xb4>
    56f4:	dd 45 d8             	fldl   -0x28(%ebp)
    56f7:	d9 e0                	fchs   
    56f9:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    56fd:	dd 1c 24             	fstpl  (%esp)
    5700:	ff 75 e4             	pushl  -0x1c(%ebp)
    5703:	ff 75 e0             	pushl  -0x20(%ebp)
    5706:	e8 58 ff ff ff       	call   5663 <pow>
    570b:	83 c4 10             	add    $0x10,%esp
    570e:	d9 e8                	fld1   
    5710:	de f1                	fdivp  %st,%st(1)
    5712:	e9 d7 00 00 00       	jmp    57ee <pow+0x18b>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    5717:	d9 ee                	fldz   
    5719:	dd 45 e0             	fldl   -0x20(%ebp)
    571c:	d9 c9                	fxch   %st(1)
    571e:	df e9                	fucomip %st(1),%st
    5720:	dd d8                	fstp   %st(0)
    5722:	76 3a                	jbe    575e <pow+0xfb>
    5724:	dd 45 d8             	fldl   -0x28(%ebp)
    5727:	d9 7d d6             	fnstcw -0x2a(%ebp)
    572a:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    572e:	b4 0c                	mov    $0xc,%ah
    5730:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    5734:	d9 6d d4             	fldcw  -0x2c(%ebp)
    5737:	db 5d cc             	fistpl -0x34(%ebp)
    573a:	d9 6d d6             	fldcw  -0x2a(%ebp)
    573d:	db 45 cc             	fildl  -0x34(%ebp)
    5740:	dd 45 d8             	fldl   -0x28(%ebp)
    5743:	de e1                	fsubp  %st,%st(1)
    5745:	d9 ee                	fldz   
    5747:	df e9                	fucomip %st(1),%st
    5749:	7a 0a                	jp     5755 <pow+0xf2>
    574b:	d9 ee                	fldz   
    574d:	df e9                	fucomip %st(1),%st
    574f:	dd d8                	fstp   %st(0)
    5751:	74 0b                	je     575e <pow+0xfb>
    5753:	eb 02                	jmp    5757 <pow+0xf4>
    5755:	dd d8                	fstp   %st(0)
    5757:	d9 ee                	fldz   
    5759:	e9 90 00 00 00       	jmp    57ee <pow+0x18b>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    575e:	d9 ee                	fldz   
    5760:	dd 45 e0             	fldl   -0x20(%ebp)
    5763:	d9 c9                	fxch   %st(1)
    5765:	df e9                	fucomip %st(1),%st
    5767:	dd d8                	fstp   %st(0)
    5769:	76 5d                	jbe    57c8 <pow+0x165>
    576b:	dd 45 d8             	fldl   -0x28(%ebp)
    576e:	d9 7d d6             	fnstcw -0x2a(%ebp)
    5771:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    5775:	b4 0c                	mov    $0xc,%ah
    5777:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    577b:	d9 6d d4             	fldcw  -0x2c(%ebp)
    577e:	db 5d cc             	fistpl -0x34(%ebp)
    5781:	d9 6d d6             	fldcw  -0x2a(%ebp)
    5784:	db 45 cc             	fildl  -0x34(%ebp)
    5787:	dd 45 d8             	fldl   -0x28(%ebp)
    578a:	de e1                	fsubp  %st,%st(1)
    578c:	d9 ee                	fldz   
    578e:	df e9                	fucomip %st(1),%st
    5790:	7a 34                	jp     57c6 <pow+0x163>
    5792:	d9 ee                	fldz   
    5794:	df e9                	fucomip %st(1),%st
    5796:	dd d8                	fstp   %st(0)
    5798:	75 2e                	jne    57c8 <pow+0x165>
	{
		double powint=1;
    579a:	d9 e8                	fld1   
    579c:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    579f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    57a6:	eb 0d                	jmp    57b5 <pow+0x152>
    57a8:	dd 45 f0             	fldl   -0x10(%ebp)
    57ab:	dc 4d e0             	fmull  -0x20(%ebp)
    57ae:	dd 5d f0             	fstpl  -0x10(%ebp)
    57b1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    57b5:	db 45 ec             	fildl  -0x14(%ebp)
    57b8:	dd 45 d8             	fldl   -0x28(%ebp)
    57bb:	df e9                	fucomip %st(1),%st
    57bd:	dd d8                	fstp   %st(0)
    57bf:	73 e7                	jae    57a8 <pow+0x145>
		return powint;
    57c1:	dd 45 f0             	fldl   -0x10(%ebp)
    57c4:	eb 28                	jmp    57ee <pow+0x18b>
    57c6:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    57c8:	83 ec 08             	sub    $0x8,%esp
    57cb:	ff 75 e4             	pushl  -0x1c(%ebp)
    57ce:	ff 75 e0             	pushl  -0x20(%ebp)
    57d1:	e8 49 00 00 00       	call   581f <ln>
    57d6:	83 c4 10             	add    $0x10,%esp
    57d9:	dc 4d d8             	fmull  -0x28(%ebp)
    57dc:	83 ec 08             	sub    $0x8,%esp
    57df:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    57e3:	dd 1c 24             	fstpl  (%esp)
    57e6:	e8 2a 02 00 00       	call   5a15 <exp>
    57eb:	83 c4 10             	add    $0x10,%esp
}
    57ee:	c9                   	leave  
    57ef:	c3                   	ret    

000057f0 <sqrt>:
// 求根
double sqrt(double x)
{
    57f0:	55                   	push   %ebp
    57f1:	89 e5                	mov    %esp,%ebp
    57f3:	83 ec 18             	sub    $0x18,%esp
    57f6:	8b 45 08             	mov    0x8(%ebp),%eax
    57f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    57fc:	8b 45 0c             	mov    0xc(%ebp),%eax
    57ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    5802:	dd 05 f8 bf 00 00    	fldl   0xbff8
    5808:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    580c:	dd 1c 24             	fstpl  (%esp)
    580f:	ff 75 f4             	pushl  -0xc(%ebp)
    5812:	ff 75 f0             	pushl  -0x10(%ebp)
    5815:	e8 49 fe ff ff       	call   5663 <pow>
    581a:	83 c4 10             	add    $0x10,%esp
}
    581d:	c9                   	leave  
    581e:	c3                   	ret    

0000581f <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    581f:	55                   	push   %ebp
    5820:	89 e5                	mov    %esp,%ebp
    5822:	83 ec 78             	sub    $0x78,%esp
    5825:	8b 45 08             	mov    0x8(%ebp),%eax
    5828:	89 45 90             	mov    %eax,-0x70(%ebp)
    582b:	8b 45 0c             	mov    0xc(%ebp),%eax
    582e:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    5831:	dd 45 90             	fldl   -0x70(%ebp)
    5834:	d9 e8                	fld1   
    5836:	de e9                	fsubrp %st,%st(1)
    5838:	dd 5d c0             	fstpl  -0x40(%ebp)
    583b:	d9 ee                	fldz   
    583d:	dd 5d f0             	fstpl  -0x10(%ebp)
    5840:	d9 ee                	fldz   
    5842:	dd 5d b8             	fstpl  -0x48(%ebp)
    5845:	d9 ee                	fldz   
    5847:	dd 5d b0             	fstpl  -0x50(%ebp)
    584a:	d9 ee                	fldz   
    584c:	dd 5d e8             	fstpl  -0x18(%ebp)
    584f:	d9 e8                	fld1   
    5851:	dd 5d e0             	fstpl  -0x20(%ebp)
    5854:	d9 e8                	fld1   
    5856:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    5859:	dd 45 90             	fldl   -0x70(%ebp)
    585c:	d9 e8                	fld1   
    585e:	df e9                	fucomip %st(1),%st
    5860:	dd d8                	fstp   %st(0)
    5862:	7a 12                	jp     5876 <ln+0x57>
    5864:	dd 45 90             	fldl   -0x70(%ebp)
    5867:	d9 e8                	fld1   
    5869:	df e9                	fucomip %st(1),%st
    586b:	dd d8                	fstp   %st(0)
    586d:	75 07                	jne    5876 <ln+0x57>
    586f:	d9 ee                	fldz   
    5871:	e9 9d 01 00 00       	jmp    5a13 <ln+0x1f4>
	else if(x>2) return -ln(1/x);
    5876:	dd 45 90             	fldl   -0x70(%ebp)
    5879:	dd 05 00 c0 00 00    	fldl   0xc000
    587f:	d9 c9                	fxch   %st(1)
    5881:	df e9                	fucomip %st(1),%st
    5883:	dd d8                	fstp   %st(0)
    5885:	76 1e                	jbe    58a5 <ln+0x86>
    5887:	d9 e8                	fld1   
    5889:	dc 75 90             	fdivl  -0x70(%ebp)
    588c:	83 ec 08             	sub    $0x8,%esp
    588f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5893:	dd 1c 24             	fstpl  (%esp)
    5896:	e8 84 ff ff ff       	call   581f <ln>
    589b:	83 c4 10             	add    $0x10,%esp
    589e:	d9 e0                	fchs   
    58a0:	e9 6e 01 00 00       	jmp    5a13 <ln+0x1f4>
	else if(x<.1)
    58a5:	dd 05 08 c0 00 00    	fldl   0xc008
    58ab:	dd 45 90             	fldl   -0x70(%ebp)
    58ae:	d9 c9                	fxch   %st(1)
    58b0:	df e9                	fucomip %st(1),%st
    58b2:	dd d8                	fstp   %st(0)
    58b4:	76 65                	jbe    591b <ln+0xfc>
	{
		double n=-1;
    58b6:	d9 e8                	fld1   
    58b8:	d9 e0                	fchs   
    58ba:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    58bd:	dd 45 c8             	fldl   -0x38(%ebp)
    58c0:	dd 05 10 c0 00 00    	fldl   0xc010
    58c6:	de e9                	fsubrp %st,%st(1)
    58c8:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    58cb:	83 ec 08             	sub    $0x8,%esp
    58ce:	ff 75 cc             	pushl  -0x34(%ebp)
    58d1:	ff 75 c8             	pushl  -0x38(%ebp)
    58d4:	e8 3c 01 00 00       	call   5a15 <exp>
    58d9:	83 c4 10             	add    $0x10,%esp
    58dc:	dd 45 90             	fldl   -0x70(%ebp)
    58df:	de f1                	fdivp  %st,%st(1)
    58e1:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    58e4:	dd 45 a0             	fldl   -0x60(%ebp)
    58e7:	dd 05 00 c0 00 00    	fldl   0xc000
    58ed:	d9 c9                	fxch   %st(1)
    58ef:	df e9                	fucomip %st(1),%st
    58f1:	dd d8                	fstp   %st(0)
    58f3:	77 c8                	ja     58bd <ln+0x9e>
    58f5:	d9 e8                	fld1   
    58f7:	dd 45 a0             	fldl   -0x60(%ebp)
    58fa:	d9 c9                	fxch   %st(1)
    58fc:	df e9                	fucomip %st(1),%st
    58fe:	dd d8                	fstp   %st(0)
    5900:	77 bb                	ja     58bd <ln+0x9e>
		return ln(a)+n;
    5902:	83 ec 08             	sub    $0x8,%esp
    5905:	ff 75 a4             	pushl  -0x5c(%ebp)
    5908:	ff 75 a0             	pushl  -0x60(%ebp)
    590b:	e8 0f ff ff ff       	call   581f <ln>
    5910:	83 c4 10             	add    $0x10,%esp
    5913:	dc 45 c8             	faddl  -0x38(%ebp)
    5916:	e9 f8 00 00 00       	jmp    5a13 <ln+0x1f4>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    591b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    5922:	d9 e8                	fld1   
    5924:	dd 5d d8             	fstpl  -0x28(%ebp)
    5927:	e9 b6 00 00 00       	jmp    59e2 <ln+0x1c3>
	{
		ln_tmp=ln_px;
    592c:	dd 45 e8             	fldl   -0x18(%ebp)
    592f:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    5932:	dd 45 d8             	fldl   -0x28(%ebp)
    5935:	dc 4d c0             	fmull  -0x40(%ebp)
    5938:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    593b:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    593f:	75 0d                	jne    594e <ln+0x12f>
    5941:	db 45 d4             	fildl  -0x2c(%ebp)
    5944:	dd 45 d8             	fldl   -0x28(%ebp)
    5947:	de f1                	fdivp  %st,%st(1)
    5949:	dd 5d d8             	fstpl  -0x28(%ebp)
    594c:	eb 13                	jmp    5961 <ln+0x142>
		else tmp=tmp/-l;
    594e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5951:	f7 d8                	neg    %eax
    5953:	89 45 8c             	mov    %eax,-0x74(%ebp)
    5956:	db 45 8c             	fildl  -0x74(%ebp)
    5959:	dd 45 d8             	fldl   -0x28(%ebp)
    595c:	de f1                	fdivp  %st,%st(1)
    595e:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    5961:	dd 45 f0             	fldl   -0x10(%ebp)
    5964:	dc 45 d8             	faddl  -0x28(%ebp)
    5967:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    596a:	dd 45 d8             	fldl   -0x28(%ebp)
    596d:	d9 e0                	fchs   
    596f:	dc 4d c0             	fmull  -0x40(%ebp)
    5972:	db 45 d4             	fildl  -0x2c(%ebp)
    5975:	de c9                	fmulp  %st,%st(1)
    5977:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    597a:	83 c0 01             	add    $0x1,%eax
    597d:	89 45 8c             	mov    %eax,-0x74(%ebp)
    5980:	db 45 8c             	fildl  -0x74(%ebp)
    5983:	de f9                	fdivrp %st,%st(1)
    5985:	dc 45 f0             	faddl  -0x10(%ebp)
    5988:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    598b:	dd 45 d8             	fldl   -0x28(%ebp)
    598e:	dc 4d c0             	fmull  -0x40(%ebp)
    5991:	dc 4d c0             	fmull  -0x40(%ebp)
    5994:	db 45 d4             	fildl  -0x2c(%ebp)
    5997:	de c9                	fmulp  %st,%st(1)
    5999:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    599c:	83 c0 02             	add    $0x2,%eax
    599f:	89 45 8c             	mov    %eax,-0x74(%ebp)
    59a2:	db 45 8c             	fildl  -0x74(%ebp)
    59a5:	de f9                	fdivrp %st,%st(1)
    59a7:	dc 45 b8             	faddl  -0x48(%ebp)
    59aa:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    59ad:	dd 45 b0             	fldl   -0x50(%ebp)
    59b0:	dc 65 b8             	fsubl  -0x48(%ebp)
    59b3:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    59b6:	dd 45 a8             	fldl   -0x58(%ebp)
    59b9:	dc 4d a8             	fmull  -0x58(%ebp)
    59bc:	dd 45 b8             	fldl   -0x48(%ebp)
    59bf:	d8 c0                	fadd   %st(0),%st
    59c1:	dd 45 b0             	fldl   -0x50(%ebp)
    59c4:	de e1                	fsubp  %st,%st(1)
    59c6:	dc 45 f0             	faddl  -0x10(%ebp)
    59c9:	de f9                	fdivrp %st,%st(1)
    59cb:	dd 45 b0             	fldl   -0x50(%ebp)
    59ce:	de e1                	fsubp  %st,%st(1)
    59d0:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    59d3:	db 45 d4             	fildl  -0x2c(%ebp)
    59d6:	dd 45 d8             	fldl   -0x28(%ebp)
    59d9:	de c9                	fmulp  %st,%st(1)
    59db:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    59de:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    59e2:	dd 45 e8             	fldl   -0x18(%ebp)
    59e5:	dc 65 e0             	fsubl  -0x20(%ebp)
    59e8:	dd 05 18 c0 00 00    	fldl   0xc018
    59ee:	d9 c9                	fxch   %st(1)
    59f0:	df e9                	fucomip %st(1),%st
    59f2:	dd d8                	fstp   %st(0)
    59f4:	0f 87 32 ff ff ff    	ja     592c <ln+0x10d>
    59fa:	dd 45 e8             	fldl   -0x18(%ebp)
    59fd:	dc 65 e0             	fsubl  -0x20(%ebp)
    5a00:	dd 05 20 c0 00 00    	fldl   0xc020
    5a06:	df e9                	fucomip %st(1),%st
    5a08:	dd d8                	fstp   %st(0)
    5a0a:	0f 87 1c ff ff ff    	ja     592c <ln+0x10d>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    5a10:	dd 45 e8             	fldl   -0x18(%ebp)
}
    5a13:	c9                   	leave  
    5a14:	c3                   	ret    

00005a15 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    5a15:	55                   	push   %ebp
    5a16:	89 e5                	mov    %esp,%ebp
    5a18:	83 ec 68             	sub    $0x68,%esp
    5a1b:	8b 45 08             	mov    0x8(%ebp),%eax
    5a1e:	89 45 a0             	mov    %eax,-0x60(%ebp)
    5a21:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a24:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    5a27:	dd 45 a0             	fldl   -0x60(%ebp)
    5a2a:	dd 5d c0             	fstpl  -0x40(%ebp)
    5a2d:	d9 ee                	fldz   
    5a2f:	dd 5d f0             	fstpl  -0x10(%ebp)
    5a32:	d9 ee                	fldz   
    5a34:	dd 5d b8             	fstpl  -0x48(%ebp)
    5a37:	d9 ee                	fldz   
    5a39:	dd 5d b0             	fstpl  -0x50(%ebp)
    5a3c:	d9 ee                	fldz   
    5a3e:	dd 5d e8             	fstpl  -0x18(%ebp)
    5a41:	d9 e8                	fld1   
    5a43:	dd 5d e0             	fstpl  -0x20(%ebp)
    5a46:	d9 e8                	fld1   
    5a48:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    5a4b:	dd 45 a0             	fldl   -0x60(%ebp)
    5a4e:	d9 ee                	fldz   
    5a50:	df e9                	fucomip %st(1),%st
    5a52:	dd d8                	fstp   %st(0)
    5a54:	7a 12                	jp     5a68 <exp+0x53>
    5a56:	dd 45 a0             	fldl   -0x60(%ebp)
    5a59:	d9 ee                	fldz   
    5a5b:	df e9                	fucomip %st(1),%st
    5a5d:	dd d8                	fstp   %st(0)
    5a5f:	75 07                	jne    5a68 <exp+0x53>
    5a61:	d9 e8                	fld1   
    5a63:	e9 12 01 00 00       	jmp    5b7a <exp+0x165>
	if(x<0) return 1/exp(-x); 
    5a68:	d9 ee                	fldz   
    5a6a:	dd 45 a0             	fldl   -0x60(%ebp)
    5a6d:	d9 c9                	fxch   %st(1)
    5a6f:	df e9                	fucomip %st(1),%st
    5a71:	dd d8                	fstp   %st(0)
    5a73:	76 20                	jbe    5a95 <exp+0x80>
    5a75:	dd 45 a0             	fldl   -0x60(%ebp)
    5a78:	d9 e0                	fchs   
    5a7a:	83 ec 08             	sub    $0x8,%esp
    5a7d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5a81:	dd 1c 24             	fstpl  (%esp)
    5a84:	e8 8c ff ff ff       	call   5a15 <exp>
    5a89:	83 c4 10             	add    $0x10,%esp
    5a8c:	d9 e8                	fld1   
    5a8e:	de f1                	fdivp  %st,%st(1)
    5a90:	e9 e5 00 00 00       	jmp    5b7a <exp+0x165>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    5a95:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    5a9c:	d9 e8                	fld1   
    5a9e:	dd 5d d0             	fstpl  -0x30(%ebp)
    5aa1:	e9 92 00 00 00       	jmp    5b38 <exp+0x123>
	{
		ex_tmp=ex_px;
    5aa6:	dd 45 e8             	fldl   -0x18(%ebp)
    5aa9:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    5aac:	dd 45 d0             	fldl   -0x30(%ebp)
    5aaf:	dc 4d c0             	fmull  -0x40(%ebp)
    5ab2:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    5ab5:	db 45 cc             	fildl  -0x34(%ebp)
    5ab8:	dd 45 d0             	fldl   -0x30(%ebp)
    5abb:	de f1                	fdivp  %st,%st(1)
    5abd:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    5ac0:	dd 45 f0             	fldl   -0x10(%ebp)
    5ac3:	dc 45 d0             	faddl  -0x30(%ebp)
    5ac6:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    5ac9:	dd 45 d0             	fldl   -0x30(%ebp)
    5acc:	dc 4d c0             	fmull  -0x40(%ebp)
    5acf:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5ad2:	83 c0 01             	add    $0x1,%eax
    5ad5:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5ad8:	db 45 9c             	fildl  -0x64(%ebp)
    5adb:	de f9                	fdivrp %st,%st(1)
    5add:	dc 45 f0             	faddl  -0x10(%ebp)
    5ae0:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    5ae3:	dd 45 d0             	fldl   -0x30(%ebp)
    5ae6:	dc 4d c0             	fmull  -0x40(%ebp)
    5ae9:	dc 4d c0             	fmull  -0x40(%ebp)
    5aec:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5aef:	83 c0 01             	add    $0x1,%eax
    5af2:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5af5:	db 45 9c             	fildl  -0x64(%ebp)
    5af8:	de f9                	fdivrp %st,%st(1)
    5afa:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5afd:	83 c0 02             	add    $0x2,%eax
    5b00:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5b03:	db 45 9c             	fildl  -0x64(%ebp)
    5b06:	de f9                	fdivrp %st,%st(1)
    5b08:	dc 45 b8             	faddl  -0x48(%ebp)
    5b0b:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    5b0e:	dd 45 b0             	fldl   -0x50(%ebp)
    5b11:	dc 65 b8             	fsubl  -0x48(%ebp)
    5b14:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    5b17:	dd 45 d8             	fldl   -0x28(%ebp)
    5b1a:	dc 4d d8             	fmull  -0x28(%ebp)
    5b1d:	dd 45 b8             	fldl   -0x48(%ebp)
    5b20:	d8 c0                	fadd   %st(0),%st
    5b22:	dd 45 b0             	fldl   -0x50(%ebp)
    5b25:	de e1                	fsubp  %st,%st(1)
    5b27:	dc 45 f0             	faddl  -0x10(%ebp)
    5b2a:	de f9                	fdivrp %st,%st(1)
    5b2c:	dd 45 b0             	fldl   -0x50(%ebp)
    5b2f:	de e1                	fsubp  %st,%st(1)
    5b31:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    5b34:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    5b38:	dd 45 e8             	fldl   -0x18(%ebp)
    5b3b:	dc 65 e0             	fsubl  -0x20(%ebp)
    5b3e:	dd 05 28 c0 00 00    	fldl   0xc028
    5b44:	d9 c9                	fxch   %st(1)
    5b46:	df e9                	fucomip %st(1),%st
    5b48:	dd d8                	fstp   %st(0)
    5b4a:	77 12                	ja     5b5e <exp+0x149>
    5b4c:	dd 45 e8             	fldl   -0x18(%ebp)
    5b4f:	dc 65 e0             	fsubl  -0x20(%ebp)
    5b52:	dd 05 30 c0 00 00    	fldl   0xc030
    5b58:	df e9                	fucomip %st(1),%st
    5b5a:	dd d8                	fstp   %st(0)
    5b5c:	76 15                	jbe    5b73 <exp+0x15e>
    5b5e:	dd 45 d8             	fldl   -0x28(%ebp)
    5b61:	dd 05 28 c0 00 00    	fldl   0xc028
    5b67:	d9 c9                	fxch   %st(1)
    5b69:	df e9                	fucomip %st(1),%st
    5b6b:	dd d8                	fstp   %st(0)
    5b6d:	0f 87 33 ff ff ff    	ja     5aa6 <exp+0x91>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    5b73:	dd 45 e8             	fldl   -0x18(%ebp)
    5b76:	d9 e8                	fld1   
    5b78:	de c1                	faddp  %st,%st(1)
    5b7a:	c9                   	leave  
    5b7b:	c3                   	ret    

00005b7c <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    5b7c:	55                   	push   %ebp
    5b7d:	89 e5                	mov    %esp,%ebp
    5b7f:	83 ec 68             	sub    $0x68,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    5b82:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    5b86:	83 ec 08             	sub    $0x8,%esp
    5b89:	ff 75 08             	pushl  0x8(%ebp)
    5b8c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5b8f:	50                   	push   %eax
    5b90:	e8 f7 f1 ff ff       	call   4d8c <strcpy>
    5b95:	83 c4 10             	add    $0x10,%esp
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    5b98:	83 ec 08             	sub    $0x8,%esp
    5b9b:	6a 02                	push   $0x2
    5b9d:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5ba0:	50                   	push   %eax
    5ba1:	e8 56 f4 ff ff       	call   4ffc <open>
    5ba6:	83 c4 10             	add    $0x10,%esp
    5ba9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5bac:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    5bb0:	75 16                	jne    5bc8 <OpenTableFile+0x4c>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    5bb2:	83 ec 04             	sub    $0x4,%esp
    5bb5:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5bb8:	50                   	push   %eax
    5bb9:	68 64 c0 00 00       	push   $0xc064
    5bbe:	6a 00                	push   $0x0
    5bc0:	e8 d4 f5 ff ff       	call   5199 <printf>
    5bc5:	83 c4 10             	add    $0x10,%esp
    }
    return f;
    5bc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5bcb:	c9                   	leave  
    5bcc:	c3                   	ret    

00005bcd <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    5bcd:	55                   	push   %ebp
    5bce:	89 e5                	mov    %esp,%ebp
    5bd0:	57                   	push   %edi
    5bd1:	56                   	push   %esi
    5bd2:	53                   	push   %ebx
    5bd3:	83 ec 1c             	sub    $0x1c,%esp
	layer *info = fr_ps->header;
    5bd6:	8b 45 08             	mov    0x8(%ebp),%eax
    5bd9:	8b 00                	mov    (%eax),%eax
    5bdb:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    5bde:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5be1:	8b 78 14             	mov    0x14(%eax),%edi
    5be4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5be7:	8b 70 10             	mov    0x10(%eax),%esi
    5bea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5bed:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    5bf0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5bf3:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    5bf6:	85 c0                	test   %eax,%eax
    5bf8:	0f 94 c0             	sete   %al
    5bfb:	0f b6 c8             	movzbl %al,%ecx
    5bfe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c01:	8b 50 04             	mov    0x4(%eax),%edx
    5c04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c07:	8b 00                	mov    (%eax),%eax
    5c09:	57                   	push   %edi
    5c0a:	56                   	push   %esi
    5c0b:	53                   	push   %ebx
    5c0c:	51                   	push   %ecx
    5c0d:	52                   	push   %edx
    5c0e:	50                   	push   %eax
    5c0f:	68 84 c0 00 00       	push   $0xc084
    5c14:	6a 00                	push   $0x0
    5c16:	e8 7e f5 ff ff       	call   5199 <printf>
    5c1b:	83 c4 20             	add    $0x20,%esp
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    5c1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c21:	8b 78 2c             	mov    0x2c(%eax),%edi
    5c24:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c27:	8b 70 28             	mov    0x28(%eax),%esi
    5c2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c2d:	8b 58 24             	mov    0x24(%eax),%ebx
    5c30:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c33:	8b 48 20             	mov    0x20(%eax),%ecx
    5c36:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c39:	8b 50 1c             	mov    0x1c(%eax),%edx
    5c3c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c3f:	8b 40 18             	mov    0x18(%eax),%eax
    5c42:	57                   	push   %edi
    5c43:	56                   	push   %esi
    5c44:	53                   	push   %ebx
    5c45:	51                   	push   %ecx
    5c46:	52                   	push   %edx
    5c47:	50                   	push   %eax
    5c48:	68 c4 c0 00 00       	push   $0xc0c4
    5c4d:	6a 00                	push   $0x0
    5c4f:	e8 45 f5 ff ff       	call   5199 <printf>
    5c54:	83 c4 20             	add    $0x20,%esp
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    5c57:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c5a:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5c5d:	8b 0c 85 e0 02 01 00 	mov    0x102e0(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    5c64:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c67:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5c6a:	dd 04 c5 c0 02 01 00 	fldl   0x102c0(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    5c71:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c74:	8b 40 04             	mov    0x4(%eax),%eax
    5c77:	8d 50 ff             	lea    -0x1(%eax),%edx
    5c7a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c7d:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5c80:	89 d0                	mov    %edx,%eax
    5c82:	c1 e0 04             	shl    $0x4,%eax
    5c85:	29 d0                	sub    %edx,%eax
    5c87:	01 d8                	add    %ebx,%eax
    5c89:	8b 14 85 00 02 01 00 	mov    0x10200(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    5c90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c93:	8b 40 04             	mov    0x4(%eax),%eax
    5c96:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5c99:	8b 04 85 c0 01 01 00 	mov    0x101c0(,%eax,4),%eax
    5ca0:	83 ec 04             	sub    $0x4,%esp
    5ca3:	51                   	push   %ecx
    5ca4:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5ca8:	dd 1c 24             	fstpl  (%esp)
    5cab:	52                   	push   %edx
    5cac:	50                   	push   %eax
    5cad:	68 ec c0 00 00       	push   $0xc0ec
    5cb2:	6a 00                	push   $0x0
    5cb4:	e8 e0 f4 ff ff       	call   5199 <printf>
    5cb9:	83 c4 20             	add    $0x20,%esp
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    5cbc:	8b 45 08             	mov    0x8(%ebp),%eax
    5cbf:	8b 48 08             	mov    0x8(%eax),%ecx
    5cc2:	8b 45 08             	mov    0x8(%ebp),%eax
    5cc5:	8b 50 0c             	mov    0xc(%eax),%edx
    5cc8:	8b 45 08             	mov    0x8(%ebp),%eax
    5ccb:	8b 40 10             	mov    0x10(%eax),%eax
    5cce:	83 ec 0c             	sub    $0xc,%esp
    5cd1:	51                   	push   %ecx
    5cd2:	52                   	push   %edx
    5cd3:	50                   	push   %eax
    5cd4:	68 1b c1 00 00       	push   $0xc11b
    5cd9:	6a 00                	push   $0x0
    5cdb:	e8 b9 f4 ff ff       	call   5199 <printf>
    5ce0:	83 c4 20             	add    $0x20,%esp
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    5ce3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    5ce6:	5b                   	pop    %ebx
    5ce7:	5e                   	pop    %esi
    5ce8:	5f                   	pop    %edi
    5ce9:	5d                   	pop    %ebp
    5cea:	c3                   	ret    

00005ceb <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    5ceb:	55                   	push   %ebp
    5cec:	89 e5                	mov    %esp,%ebp
    5cee:	83 ec 18             	sub    $0x18,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    5cf1:	83 ec 0c             	sub    $0xc,%esp
    5cf4:	ff 75 08             	pushl  0x8(%ebp)
    5cf7:	e8 6e f7 ff ff       	call   546a <malloc>
    5cfc:	83 c4 10             	add    $0x10,%esp
    5cff:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    5d02:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5d06:	74 15                	je     5d1d <mem_alloc+0x32>
		memset(ptr, 0, block);
    5d08:	83 ec 04             	sub    $0x4,%esp
    5d0b:	ff 75 08             	pushl  0x8(%ebp)
    5d0e:	6a 00                	push   $0x0
    5d10:	ff 75 f4             	pushl  -0xc(%ebp)
    5d13:	e8 0a f1 ff ff       	call   4e22 <memset>
    5d18:	83 c4 10             	add    $0x10,%esp
    5d1b:	eb 1a                	jmp    5d37 <mem_alloc+0x4c>
	else{
		printf(0, "Unable to allocate %s\n", item);
    5d1d:	83 ec 04             	sub    $0x4,%esp
    5d20:	ff 75 0c             	pushl  0xc(%ebp)
    5d23:	68 35 c1 00 00       	push   $0xc135
    5d28:	6a 00                	push   $0x0
    5d2a:	e8 6a f4 ff ff       	call   5199 <printf>
    5d2f:	83 c4 10             	add    $0x10,%esp
		exit();
    5d32:	e8 85 f2 ff ff       	call   4fbc <exit>
	}
	return ptr;
    5d37:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5d3a:	c9                   	leave  
    5d3b:	c3                   	ret    

00005d3c <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    5d3c:	55                   	push   %ebp
    5d3d:	89 e5                	mov    %esp,%ebp
    5d3f:	83 ec 08             	sub    $0x8,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    5d42:	8b 45 0c             	mov    0xc(%ebp),%eax
    5d45:	83 ec 08             	sub    $0x8,%esp
    5d48:	68 4c c1 00 00       	push   $0xc14c
    5d4d:	50                   	push   %eax
    5d4e:	e8 98 ff ff ff       	call   5ceb <mem_alloc>
    5d53:	83 c4 10             	add    $0x10,%esp
    5d56:	89 c2                	mov    %eax,%edx
    5d58:	8b 45 08             	mov    0x8(%ebp),%eax
    5d5b:	89 50 04             	mov    %edx,0x4(%eax)
	bs->buf_size = size;
    5d5e:	8b 45 08             	mov    0x8(%ebp),%eax
    5d61:	8b 55 0c             	mov    0xc(%ebp),%edx
    5d64:	89 50 08             	mov    %edx,0x8(%eax)
}
    5d67:	c9                   	leave  
    5d68:	c3                   	ret    

00005d69 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    5d69:	55                   	push   %ebp
    5d6a:	89 e5                	mov    %esp,%ebp
    5d6c:	83 ec 08             	sub    $0x8,%esp
	free(bs->buf);
    5d6f:	8b 45 08             	mov    0x8(%ebp),%eax
    5d72:	8b 40 04             	mov    0x4(%eax),%eax
    5d75:	83 ec 0c             	sub    $0xc,%esp
    5d78:	50                   	push   %eax
    5d79:	e8 ab f5 ff ff       	call   5329 <free>
    5d7e:	83 c4 10             	add    $0x10,%esp
}
    5d81:	c9                   	leave  
    5d82:	c3                   	ret    

00005d83 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    5d83:	55                   	push   %ebp
    5d84:	89 e5                	mov    %esp,%ebp
    5d86:	83 ec 08             	sub    $0x8,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    5d89:	83 ec 08             	sub    $0x8,%esp
    5d8c:	6a 02                	push   $0x2
    5d8e:	ff 75 0c             	pushl  0xc(%ebp)
    5d91:	e8 66 f2 ff ff       	call   4ffc <open>
    5d96:	83 c4 10             	add    $0x10,%esp
    5d99:	89 c2                	mov    %eax,%edx
    5d9b:	8b 45 08             	mov    0x8(%ebp),%eax
    5d9e:	89 10                	mov    %edx,(%eax)
    5da0:	8b 45 08             	mov    0x8(%ebp),%eax
    5da3:	8b 00                	mov    (%eax),%eax
    5da5:	83 f8 ff             	cmp    $0xffffffff,%eax
    5da8:	75 1a                	jne    5dc4 <open_bit_stream_r+0x41>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    5daa:	83 ec 04             	sub    $0x4,%esp
    5dad:	ff 75 0c             	pushl  0xc(%ebp)
    5db0:	68 53 c1 00 00       	push   $0xc153
    5db5:	6a 00                	push   $0x0
    5db7:	e8 dd f3 ff ff       	call   5199 <printf>
    5dbc:	83 c4 10             	add    $0x10,%esp
		exit();
    5dbf:	e8 f8 f1 ff ff       	call   4fbc <exit>
	}

	bs->format = BINARY;
    5dc4:	8b 45 08             	mov    0x8(%ebp),%eax
    5dc7:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    5dcb:	83 ec 08             	sub    $0x8,%esp
    5dce:	ff 75 10             	pushl  0x10(%ebp)
    5dd1:	ff 75 08             	pushl  0x8(%ebp)
    5dd4:	e8 63 ff ff ff       	call   5d3c <alloc_buffer>
    5dd9:	83 c4 10             	add    $0x10,%esp
	bs->buf_byte_idx=0;
    5ddc:	8b 45 08             	mov    0x8(%ebp),%eax
    5ddf:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    5de6:	8b 45 08             	mov    0x8(%ebp),%eax
    5de9:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    5df0:	8b 45 08             	mov    0x8(%ebp),%eax
    5df3:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    5dfa:	8b 45 08             	mov    0x8(%ebp),%eax
    5dfd:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    5e04:	8b 45 08             	mov    0x8(%ebp),%eax
    5e07:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    5e0e:	8b 45 08             	mov    0x8(%ebp),%eax
    5e11:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    5e18:	c9                   	leave  
    5e19:	c3                   	ret    

00005e1a <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    5e1a:	55                   	push   %ebp
    5e1b:	89 e5                	mov    %esp,%ebp
    5e1d:	83 ec 08             	sub    $0x8,%esp
	close(bs->pt);
    5e20:	8b 45 08             	mov    0x8(%ebp),%eax
    5e23:	8b 00                	mov    (%eax),%eax
    5e25:	83 ec 0c             	sub    $0xc,%esp
    5e28:	50                   	push   %eax
    5e29:	e8 b6 f1 ff ff       	call   4fe4 <close>
    5e2e:	83 c4 10             	add    $0x10,%esp
	desalloc_buffer(bs);
    5e31:	83 ec 0c             	sub    $0xc,%esp
    5e34:	ff 75 08             	pushl  0x8(%ebp)
    5e37:	e8 2d ff ff ff       	call   5d69 <desalloc_buffer>
    5e3c:	83 c4 10             	add    $0x10,%esp
}
    5e3f:	c9                   	leave  
    5e40:	c3                   	ret    

00005e41 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    5e41:	55                   	push   %ebp
    5e42:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    5e44:	8b 45 08             	mov    0x8(%ebp),%eax
    5e47:	8b 40 20             	mov    0x20(%eax),%eax
}
    5e4a:	5d                   	pop    %ebp
    5e4b:	c3                   	ret    

00005e4c <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    5e4c:	55                   	push   %ebp
    5e4d:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    5e4f:	8b 45 08             	mov    0x8(%ebp),%eax
    5e52:	8b 40 0c             	mov    0xc(%eax),%eax
}
    5e55:	5d                   	pop    %ebp
    5e56:	c3                   	ret    

00005e57 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    5e57:	55                   	push   %ebp
    5e58:	89 e5                	mov    %esp,%ebp
    5e5a:	56                   	push   %esi
    5e5b:	53                   	push   %ebx
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    5e5c:	8b 45 08             	mov    0x8(%ebp),%eax
    5e5f:	8b 40 08             	mov    0x8(%eax),%eax
    5e62:	8d 50 fe             	lea    -0x2(%eax),%edx
    5e65:	8b 45 08             	mov    0x8(%ebp),%eax
    5e68:	8b 40 10             	mov    0x10(%eax),%eax
    5e6b:	89 d3                	mov    %edx,%ebx
    5e6d:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    5e6f:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    5e74:	eb 30                	jmp    5ea6 <refill_buffer+0x4f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    5e76:	8b 45 08             	mov    0x8(%ebp),%eax
    5e79:	8b 50 04             	mov    0x4(%eax),%edx
    5e7c:	89 d8                	mov    %ebx,%eax
    5e7e:	8d 58 ff             	lea    -0x1(%eax),%ebx
    5e81:	01 c2                	add    %eax,%edx
    5e83:	8b 45 08             	mov    0x8(%ebp),%eax
    5e86:	8b 00                	mov    (%eax),%eax
    5e88:	83 ec 04             	sub    $0x4,%esp
    5e8b:	6a 01                	push   $0x1
    5e8d:	52                   	push   %edx
    5e8e:	50                   	push   %eax
    5e8f:	e8 40 f1 ff ff       	call   4fd4 <read>
    5e94:	83 c4 10             	add    $0x10,%esp
    5e97:	89 c6                	mov    %eax,%esi
		if (!n)
    5e99:	85 f6                	test   %esi,%esi
    5e9b:	75 09                	jne    5ea6 <refill_buffer+0x4f>
		bs->eob= i+1;
    5e9d:	8d 53 01             	lea    0x1(%ebx),%edx
    5ea0:	8b 45 08             	mov    0x8(%ebp),%eax
    5ea3:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    5ea6:	85 db                	test   %ebx,%ebx
    5ea8:	78 0a                	js     5eb4 <refill_buffer+0x5d>
    5eaa:	8b 45 08             	mov    0x8(%ebp),%eax
    5ead:	8b 40 1c             	mov    0x1c(%eax),%eax
    5eb0:	85 c0                	test   %eax,%eax
    5eb2:	74 c2                	je     5e76 <refill_buffer+0x1f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    5eb4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    5eb7:	5b                   	pop    %ebx
    5eb8:	5e                   	pop    %esi
    5eb9:	5d                   	pop    %ebp
    5eba:	c3                   	ret    

00005ebb <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    5ebb:	55                   	push   %ebp
    5ebc:	89 e5                	mov    %esp,%ebp
    5ebe:	53                   	push   %ebx
    5ebf:	83 ec 14             	sub    $0x14,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    5ec2:	8b 45 08             	mov    0x8(%ebp),%eax
    5ec5:	8b 40 0c             	mov    0xc(%eax),%eax
    5ec8:	8d 50 01             	lea    0x1(%eax),%edx
    5ecb:	8b 45 08             	mov    0x8(%ebp),%eax
    5ece:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    5ed1:	8b 45 08             	mov    0x8(%ebp),%eax
    5ed4:	8b 40 14             	mov    0x14(%eax),%eax
    5ed7:	85 c0                	test   %eax,%eax
    5ed9:	0f 85 a2 00 00 00    	jne    5f81 <get1bit+0xc6>
        bs->buf_bit_idx = 8;
    5edf:	8b 45 08             	mov    0x8(%ebp),%eax
    5ee2:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    5ee9:	8b 45 08             	mov    0x8(%ebp),%eax
    5eec:	8b 40 10             	mov    0x10(%eax),%eax
    5eef:	8d 50 ff             	lea    -0x1(%eax),%edx
    5ef2:	8b 45 08             	mov    0x8(%ebp),%eax
    5ef5:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    5ef8:	8b 45 08             	mov    0x8(%ebp),%eax
    5efb:	8b 40 10             	mov    0x10(%eax),%eax
    5efe:	83 f8 03             	cmp    $0x3,%eax
    5f01:	7e 10                	jle    5f13 <get1bit+0x58>
    5f03:	8b 45 08             	mov    0x8(%ebp),%eax
    5f06:	8b 50 10             	mov    0x10(%eax),%edx
    5f09:	8b 45 08             	mov    0x8(%ebp),%eax
    5f0c:	8b 40 1c             	mov    0x1c(%eax),%eax
    5f0f:	39 c2                	cmp    %eax,%edx
    5f11:	7d 6e                	jge    5f81 <get1bit+0xc6>
             if (bs->eob)
    5f13:	8b 45 08             	mov    0x8(%ebp),%eax
    5f16:	8b 40 1c             	mov    0x1c(%eax),%eax
    5f19:	85 c0                	test   %eax,%eax
    5f1b:	74 0c                	je     5f29 <get1bit+0x6e>
                bs->eobs = TRUE;
    5f1d:	8b 45 08             	mov    0x8(%ebp),%eax
    5f20:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    5f27:	eb 58                	jmp    5f81 <get1bit+0xc6>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5f29:	8b 45 08             	mov    0x8(%ebp),%eax
    5f2c:	8b 58 10             	mov    0x10(%eax),%ebx
    5f2f:	eb 2f                	jmp    5f60 <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    5f31:	8b 45 08             	mov    0x8(%ebp),%eax
    5f34:	8b 50 04             	mov    0x4(%eax),%edx
    5f37:	8b 45 08             	mov    0x8(%ebp),%eax
    5f3a:	8b 40 08             	mov    0x8(%eax),%eax
    5f3d:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5f40:	8b 45 08             	mov    0x8(%ebp),%eax
    5f43:	8b 40 10             	mov    0x10(%eax),%eax
    5f46:	29 c1                	sub    %eax,%ecx
    5f48:	89 c8                	mov    %ecx,%eax
    5f4a:	01 d8                	add    %ebx,%eax
    5f4c:	01 c2                	add    %eax,%edx
    5f4e:	8b 45 08             	mov    0x8(%ebp),%eax
    5f51:	8b 40 04             	mov    0x4(%eax),%eax
    5f54:	89 d9                	mov    %ebx,%ecx
    5f56:	01 c8                	add    %ecx,%eax
    5f58:	0f b6 00             	movzbl (%eax),%eax
    5f5b:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5f5d:	83 eb 01             	sub    $0x1,%ebx
    5f60:	85 db                	test   %ebx,%ebx
    5f62:	79 cd                	jns    5f31 <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    5f64:	83 ec 0c             	sub    $0xc,%esp
    5f67:	ff 75 08             	pushl  0x8(%ebp)
    5f6a:	e8 e8 fe ff ff       	call   5e57 <refill_buffer>
    5f6f:	83 c4 10             	add    $0x10,%esp
                bs->buf_byte_idx = bs->buf_size-1;
    5f72:	8b 45 08             	mov    0x8(%ebp),%eax
    5f75:	8b 40 08             	mov    0x8(%eax),%eax
    5f78:	8d 50 ff             	lea    -0x1(%eax),%edx
    5f7b:	8b 45 08             	mov    0x8(%ebp),%eax
    5f7e:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    5f81:	8b 45 08             	mov    0x8(%ebp),%eax
    5f84:	8b 50 04             	mov    0x4(%eax),%edx
    5f87:	8b 45 08             	mov    0x8(%ebp),%eax
    5f8a:	8b 40 10             	mov    0x10(%eax),%eax
    5f8d:	01 d0                	add    %edx,%eax
    5f8f:	0f b6 00             	movzbl (%eax),%eax
    5f92:	0f b6 d0             	movzbl %al,%edx
    5f95:	8b 45 08             	mov    0x8(%ebp),%eax
    5f98:	8b 40 14             	mov    0x14(%eax),%eax
    5f9b:	83 e8 01             	sub    $0x1,%eax
    5f9e:	8b 04 85 00 03 01 00 	mov    0x10300(,%eax,4),%eax
    5fa5:	21 d0                	and    %edx,%eax
    5fa7:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    5faa:	8b 45 08             	mov    0x8(%ebp),%eax
    5fad:	8b 40 14             	mov    0x14(%eax),%eax
    5fb0:	83 e8 01             	sub    $0x1,%eax
    5fb3:	89 c1                	mov    %eax,%ecx
    5fb5:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    5fb8:	8b 45 08             	mov    0x8(%ebp),%eax
    5fbb:	8b 40 14             	mov    0x14(%eax),%eax
    5fbe:	8d 50 ff             	lea    -0x1(%eax),%edx
    5fc1:	8b 45 08             	mov    0x8(%ebp),%eax
    5fc4:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    5fc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5fca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5fcd:	c9                   	leave  
    5fce:	c3                   	ret    

00005fcf <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    5fcf:	55                   	push   %ebp
    5fd0:	89 e5                	mov    %esp,%ebp
    5fd2:	57                   	push   %edi
    5fd3:	56                   	push   %esi
    5fd4:	53                   	push   %ebx
    5fd5:	83 ec 1c             	sub    $0x1c,%esp
	unsigned long val=0;
    5fd8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    5fdf:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    5fe2:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    5fe6:	7e 14                	jle    5ffc <getbits+0x2d>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    5fe8:	83 ec 04             	sub    $0x4,%esp
    5feb:	6a 20                	push   $0x20
    5fed:	68 6c c1 00 00       	push   $0xc16c
    5ff2:	6a 00                	push   $0x0
    5ff4:	e8 a0 f1 ff ff       	call   5199 <printf>
    5ff9:	83 c4 10             	add    $0x10,%esp

	bs->totbit += N;
    5ffc:	8b 45 08             	mov    0x8(%ebp),%eax
    5fff:	8b 50 0c             	mov    0xc(%eax),%edx
    6002:	8b 45 0c             	mov    0xc(%ebp),%eax
    6005:	01 c2                	add    %eax,%edx
    6007:	8b 45 08             	mov    0x8(%ebp),%eax
    600a:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    600d:	e9 0d 01 00 00       	jmp    611f <getbits+0x150>
		if (!bs->buf_bit_idx) {
    6012:	8b 45 08             	mov    0x8(%ebp),%eax
    6015:	8b 40 14             	mov    0x14(%eax),%eax
    6018:	85 c0                	test   %eax,%eax
    601a:	0f 85 a2 00 00 00    	jne    60c2 <getbits+0xf3>
			bs->buf_bit_idx = 8;
    6020:	8b 45 08             	mov    0x8(%ebp),%eax
    6023:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    602a:	8b 45 08             	mov    0x8(%ebp),%eax
    602d:	8b 40 10             	mov    0x10(%eax),%eax
    6030:	8d 50 ff             	lea    -0x1(%eax),%edx
    6033:	8b 45 08             	mov    0x8(%ebp),%eax
    6036:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    6039:	8b 45 08             	mov    0x8(%ebp),%eax
    603c:	8b 40 10             	mov    0x10(%eax),%eax
    603f:	83 f8 03             	cmp    $0x3,%eax
    6042:	7e 10                	jle    6054 <getbits+0x85>
    6044:	8b 45 08             	mov    0x8(%ebp),%eax
    6047:	8b 50 10             	mov    0x10(%eax),%edx
    604a:	8b 45 08             	mov    0x8(%ebp),%eax
    604d:	8b 40 1c             	mov    0x1c(%eax),%eax
    6050:	39 c2                	cmp    %eax,%edx
    6052:	7d 6e                	jge    60c2 <getbits+0xf3>
				if (bs->eob)
    6054:	8b 45 08             	mov    0x8(%ebp),%eax
    6057:	8b 40 1c             	mov    0x1c(%eax),%eax
    605a:	85 c0                	test   %eax,%eax
    605c:	74 0c                	je     606a <getbits+0x9b>
					bs->eobs = TRUE;
    605e:	8b 45 08             	mov    0x8(%ebp),%eax
    6061:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    6068:	eb 58                	jmp    60c2 <getbits+0xf3>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    606a:	8b 45 08             	mov    0x8(%ebp),%eax
    606d:	8b 70 10             	mov    0x10(%eax),%esi
    6070:	eb 2f                	jmp    60a1 <getbits+0xd2>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    6072:	8b 45 08             	mov    0x8(%ebp),%eax
    6075:	8b 50 04             	mov    0x4(%eax),%edx
    6078:	8b 45 08             	mov    0x8(%ebp),%eax
    607b:	8b 40 08             	mov    0x8(%eax),%eax
    607e:	8d 48 ff             	lea    -0x1(%eax),%ecx
    6081:	8b 45 08             	mov    0x8(%ebp),%eax
    6084:	8b 40 10             	mov    0x10(%eax),%eax
    6087:	29 c1                	sub    %eax,%ecx
    6089:	89 c8                	mov    %ecx,%eax
    608b:	01 f0                	add    %esi,%eax
    608d:	01 c2                	add    %eax,%edx
    608f:	8b 45 08             	mov    0x8(%ebp),%eax
    6092:	8b 40 04             	mov    0x4(%eax),%eax
    6095:	89 f1                	mov    %esi,%ecx
    6097:	01 c8                	add    %ecx,%eax
    6099:	0f b6 00             	movzbl (%eax),%eax
    609c:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    609e:	83 ee 01             	sub    $0x1,%esi
    60a1:	85 f6                	test   %esi,%esi
    60a3:	79 cd                	jns    6072 <getbits+0xa3>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    60a5:	83 ec 0c             	sub    $0xc,%esp
    60a8:	ff 75 08             	pushl  0x8(%ebp)
    60ab:	e8 a7 fd ff ff       	call   5e57 <refill_buffer>
    60b0:	83 c4 10             	add    $0x10,%esp
					bs->buf_byte_idx = bs->buf_size-1;
    60b3:	8b 45 08             	mov    0x8(%ebp),%eax
    60b6:	8b 40 08             	mov    0x8(%eax),%eax
    60b9:	8d 50 ff             	lea    -0x1(%eax),%edx
    60bc:	8b 45 08             	mov    0x8(%ebp),%eax
    60bf:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    60c2:	8b 45 08             	mov    0x8(%ebp),%eax
    60c5:	8b 40 14             	mov    0x14(%eax),%eax
    60c8:	39 d8                	cmp    %ebx,%eax
    60ca:	0f 4f c3             	cmovg  %ebx,%eax
    60cd:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    60cf:	8b 45 08             	mov    0x8(%ebp),%eax
    60d2:	8b 50 04             	mov    0x4(%eax),%edx
    60d5:	8b 45 08             	mov    0x8(%ebp),%eax
    60d8:	8b 40 10             	mov    0x10(%eax),%eax
    60db:	01 d0                	add    %edx,%eax
    60dd:	0f b6 00             	movzbl (%eax),%eax
    60e0:	0f b6 d0             	movzbl %al,%edx
    60e3:	8b 45 08             	mov    0x8(%ebp),%eax
    60e6:	8b 40 14             	mov    0x14(%eax),%eax
    60e9:	8b 04 85 20 03 01 00 	mov    0x10320(,%eax,4),%eax
    60f0:	89 d7                	mov    %edx,%edi
    60f2:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    60f4:	8b 45 08             	mov    0x8(%ebp),%eax
    60f7:	8b 40 14             	mov    0x14(%eax),%eax
    60fa:	29 f0                	sub    %esi,%eax
    60fc:	89 c1                	mov    %eax,%ecx
    60fe:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    6100:	89 d8                	mov    %ebx,%eax
    6102:	29 f0                	sub    %esi,%eax
    6104:	89 c1                	mov    %eax,%ecx
    6106:	d3 e7                	shl    %cl,%edi
    6108:	89 f8                	mov    %edi,%eax
    610a:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    610d:	8b 45 08             	mov    0x8(%ebp),%eax
    6110:	8b 40 14             	mov    0x14(%eax),%eax
    6113:	29 f0                	sub    %esi,%eax
    6115:	89 c2                	mov    %eax,%edx
    6117:	8b 45 08             	mov    0x8(%ebp),%eax
    611a:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    611d:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    611f:	85 db                	test   %ebx,%ebx
    6121:	0f 8f eb fe ff ff    	jg     6012 <getbits+0x43>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    6127:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    612a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    612d:	5b                   	pop    %ebx
    612e:	5e                   	pop    %esi
    612f:	5f                   	pop    %edi
    6130:	5d                   	pop    %ebp
    6131:	c3                   	ret    

00006132 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    6132:	55                   	push   %ebp
    6133:	89 e5                	mov    %esp,%ebp
    6135:	83 ec 28             	sub    $0x28,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    6138:	db 45 10             	fildl  0x10(%ebp)
    613b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    613f:	dd 1c 24             	fstpl  (%esp)
    6142:	dd 05 d8 c1 00 00    	fldl   0xc1d8
    6148:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    614c:	dd 1c 24             	fstpl  (%esp)
    614f:	e8 0f f5 ff ff       	call   5663 <pow>
    6154:	83 c4 10             	add    $0x10,%esp
    6157:	d9 7d e6             	fnstcw -0x1a(%ebp)
    615a:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    615e:	b4 0c                	mov    $0xc,%ah
    6160:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    6164:	d9 6d e4             	fldcw  -0x1c(%ebp)
    6167:	db 5d e0             	fistpl -0x20(%ebp)
    616a:	d9 6d e6             	fldcw  -0x1a(%ebp)
    616d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6170:	83 e8 01             	sub    $0x1,%eax
    6173:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    6176:	83 ec 0c             	sub    $0xc,%esp
    6179:	ff 75 08             	pushl  0x8(%ebp)
    617c:	e8 cb fc ff ff       	call   5e4c <sstell>
    6181:	83 c4 10             	add    $0x10,%esp
    6184:	83 e0 07             	and    $0x7,%eax
    6187:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    618a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    618e:	74 17                	je     61a7 <seek_sync+0x75>
		getbits(bs, (int)(ALIGNING-aligning));
    6190:	b8 08 00 00 00       	mov    $0x8,%eax
    6195:	2b 45 ec             	sub    -0x14(%ebp),%eax
    6198:	83 ec 08             	sub    $0x8,%esp
    619b:	50                   	push   %eax
    619c:	ff 75 08             	pushl  0x8(%ebp)
    619f:	e8 2b fe ff ff       	call   5fcf <getbits>
    61a4:	83 c4 10             	add    $0x10,%esp

	val = getbits(bs, N);
    61a7:	83 ec 08             	sub    $0x8,%esp
    61aa:	ff 75 10             	pushl  0x10(%ebp)
    61ad:	ff 75 08             	pushl  0x8(%ebp)
    61b0:	e8 1a fe ff ff       	call   5fcf <getbits>
    61b5:	83 c4 10             	add    $0x10,%esp
    61b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    61bb:	eb 17                	jmp    61d4 <seek_sync+0xa2>
		val <<= ALIGNING;
    61bd:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    61c1:	83 ec 08             	sub    $0x8,%esp
    61c4:	6a 08                	push   $0x8
    61c6:	ff 75 08             	pushl  0x8(%ebp)
    61c9:	e8 01 fe ff ff       	call   5fcf <getbits>
    61ce:	83 c4 10             	add    $0x10,%esp
    61d1:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    61d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    61d7:	23 45 f4             	and    -0xc(%ebp),%eax
    61da:	3b 45 0c             	cmp    0xc(%ebp),%eax
    61dd:	74 12                	je     61f1 <seek_sync+0xbf>
    61df:	83 ec 0c             	sub    $0xc,%esp
    61e2:	ff 75 08             	pushl  0x8(%ebp)
    61e5:	e8 57 fc ff ff       	call   5e41 <end_bs>
    61ea:	83 c4 10             	add    $0x10,%esp
    61ed:	85 c0                	test   %eax,%eax
    61ef:	74 cc                	je     61bd <seek_sync+0x8b>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    61f1:	83 ec 0c             	sub    $0xc,%esp
    61f4:	ff 75 08             	pushl  0x8(%ebp)
    61f7:	e8 45 fc ff ff       	call   5e41 <end_bs>
    61fc:	83 c4 10             	add    $0x10,%esp
    61ff:	85 c0                	test   %eax,%eax
    6201:	74 07                	je     620a <seek_sync+0xd8>
		return(0);
    6203:	b8 00 00 00 00       	mov    $0x0,%eax
    6208:	eb 05                	jmp    620f <seek_sync+0xdd>
	else
		return(1);
    620a:	b8 01 00 00 00       	mov    $0x1,%eax
}
    620f:	c9                   	leave  
    6210:	c3                   	ret    

00006211 <js_bound>:

int js_bound(int lay, int m_ext)
{
    6211:	55                   	push   %ebp
    6212:	89 e5                	mov    %esp,%ebp
    6214:	83 ec 08             	sub    $0x8,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    6217:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    621b:	7e 12                	jle    622f <js_bound+0x1e>
    621d:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    6221:	7f 0c                	jg     622f <js_bound+0x1e>
    6223:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    6227:	78 06                	js     622f <js_bound+0x1e>
    6229:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    622d:	7e 1a                	jle    6249 <js_bound+0x38>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    622f:	ff 75 0c             	pushl  0xc(%ebp)
    6232:	ff 75 08             	pushl  0x8(%ebp)
    6235:	68 a0 c1 00 00       	push   $0xc1a0
    623a:	6a 00                	push   $0x0
    623c:	e8 58 ef ff ff       	call   5199 <printf>
    6241:	83 c4 10             	add    $0x10,%esp
        exit();
    6244:	e8 73 ed ff ff       	call   4fbc <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    6249:	8b 45 08             	mov    0x8(%ebp),%eax
    624c:	83 e8 01             	sub    $0x1,%eax
    624f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    6256:	8b 45 0c             	mov    0xc(%ebp),%eax
    6259:	01 d0                	add    %edx,%eax
    625b:	8b 04 85 60 03 01 00 	mov    0x10360(,%eax,4),%eax
}
    6262:	c9                   	leave  
    6263:	c3                   	ret    

00006264 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    6264:	55                   	push   %ebp
    6265:	89 e5                	mov    %esp,%ebp
    6267:	83 ec 18             	sub    $0x18,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    626a:	8b 45 08             	mov    0x8(%ebp),%eax
    626d:	8b 00                	mov    (%eax),%eax
    626f:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    6272:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6275:	8b 50 1c             	mov    0x1c(%eax),%edx
    6278:	8b 45 08             	mov    0x8(%ebp),%eax
    627b:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    627e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6281:	8b 40 1c             	mov    0x1c(%eax),%eax
    6284:	83 f8 03             	cmp    $0x3,%eax
    6287:	75 07                	jne    6290 <hdr_to_frps+0x2c>
    6289:	ba 01 00 00 00       	mov    $0x1,%edx
    628e:	eb 05                	jmp    6295 <hdr_to_frps+0x31>
    6290:	ba 02 00 00 00       	mov    $0x2,%edx
    6295:	8b 45 08             	mov    0x8(%ebp),%eax
    6298:	89 50 08             	mov    %edx,0x8(%eax)
	fr_ps->sblimit = SBLIMIT;
    629b:	8b 45 08             	mov    0x8(%ebp),%eax
    629e:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    62a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    62a8:	8b 40 1c             	mov    0x1c(%eax),%eax
    62ab:	83 f8 01             	cmp    $0x1,%eax
    62ae:	75 23                	jne    62d3 <hdr_to_frps+0x6f>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    62b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    62b3:	8b 50 20             	mov    0x20(%eax),%edx
    62b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    62b9:	8b 40 04             	mov    0x4(%eax),%eax
    62bc:	83 ec 08             	sub    $0x8,%esp
    62bf:	52                   	push   %edx
    62c0:	50                   	push   %eax
    62c1:	e8 4b ff ff ff       	call   6211 <js_bound>
    62c6:	83 c4 10             	add    $0x10,%esp
    62c9:	89 c2                	mov    %eax,%edx
    62cb:	8b 45 08             	mov    0x8(%ebp),%eax
    62ce:	89 50 0c             	mov    %edx,0xc(%eax)
    62d1:	eb 0c                	jmp    62df <hdr_to_frps+0x7b>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    62d3:	8b 45 08             	mov    0x8(%ebp),%eax
    62d6:	8b 50 10             	mov    0x10(%eax),%edx
    62d9:	8b 45 08             	mov    0x8(%ebp),%eax
    62dc:	89 50 0c             	mov    %edx,0xc(%eax)
}
    62df:	c9                   	leave  
    62e0:	c3                   	ret    

000062e1 <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    62e1:	55                   	push   %ebp
    62e2:	89 e5                	mov    %esp,%ebp
    62e4:	83 ec 08             	sub    $0x8,%esp
	if (N != 8) {
    62e7:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    62eb:	74 17                	je     6304 <hputbuf+0x23>
		printf(0,"Not Supported yet!!\n");
    62ed:	83 ec 08             	sub    $0x8,%esp
    62f0:	68 c3 c1 00 00       	push   $0xc1c3
    62f5:	6a 00                	push   $0x0
    62f7:	e8 9d ee ff ff       	call   5199 <printf>
    62fc:	83 c4 10             	add    $0x10,%esp
		exit();
    62ff:	e8 b8 ec ff ff       	call   4fbc <exit>
	}
	getCoreBuf(1, val);
    6304:	83 ec 08             	sub    $0x8,%esp
    6307:	ff 75 08             	pushl  0x8(%ebp)
    630a:	6a 01                	push   $0x1
    630c:	e8 ab ed ff ff       	call   50bc <getCoreBuf>
    6311:	83 c4 10             	add    $0x10,%esp
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    6314:	c9                   	leave  
    6315:	c3                   	ret    

00006316 <hsstell>:

unsigned long hsstell()
{
    6316:	55                   	push   %ebp
    6317:	89 e5                	mov    %esp,%ebp
    6319:	83 ec 08             	sub    $0x8,%esp
	return getCoreBuf(2, 0);
    631c:	83 ec 08             	sub    $0x8,%esp
    631f:	6a 00                	push   $0x0
    6321:	6a 02                	push   $0x2
    6323:	e8 94 ed ff ff       	call   50bc <getCoreBuf>
    6328:	83 c4 10             	add    $0x10,%esp
//	return(totbit);
}
    632b:	c9                   	leave  
    632c:	c3                   	ret    

0000632d <hgetbits>:

unsigned long hgetbits(int N)
{
    632d:	55                   	push   %ebp
    632e:	89 e5                	mov    %esp,%ebp
    6330:	83 ec 08             	sub    $0x8,%esp

	return getCoreBuf(3, N);
    6333:	83 ec 08             	sub    $0x8,%esp
    6336:	ff 75 08             	pushl  0x8(%ebp)
    6339:	6a 03                	push   $0x3
    633b:	e8 7c ed ff ff       	call   50bc <getCoreBuf>
    6340:	83 c4 10             	add    $0x10,%esp
}
    6343:	c9                   	leave  
    6344:	c3                   	ret    

00006345 <hget1bit>:


unsigned int hget1bit()
{
    6345:	55                   	push   %ebp
    6346:	89 e5                	mov    %esp,%ebp
    6348:	83 ec 08             	sub    $0x8,%esp
	return(hgetbits(1));
    634b:	83 ec 0c             	sub    $0xc,%esp
    634e:	6a 01                	push   $0x1
    6350:	e8 d8 ff ff ff       	call   632d <hgetbits>
    6355:	83 c4 10             	add    $0x10,%esp
}
    6358:	c9                   	leave  
    6359:	c3                   	ret    

0000635a <rewindNbits>:


void rewindNbits(int N)
{
    635a:	55                   	push   %ebp
    635b:	89 e5                	mov    %esp,%ebp
    635d:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(4, N);
    6360:	83 ec 08             	sub    $0x8,%esp
    6363:	ff 75 08             	pushl  0x8(%ebp)
    6366:	6a 04                	push   $0x4
    6368:	e8 4f ed ff ff       	call   50bc <getCoreBuf>
    636d:	83 c4 10             	add    $0x10,%esp
}
    6370:	c9                   	leave  
    6371:	c3                   	ret    

00006372 <rewindNbytes>:


void rewindNbytes(int N)
{
    6372:	55                   	push   %ebp
    6373:	89 e5                	mov    %esp,%ebp
    6375:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(5, N);
    6378:	83 ec 08             	sub    $0x8,%esp
    637b:	ff 75 08             	pushl  0x8(%ebp)
    637e:	6a 05                	push   $0x5
    6380:	e8 37 ed ff ff       	call   50bc <getCoreBuf>
    6385:	83 c4 10             	add    $0x10,%esp
}
    6388:	c9                   	leave  
    6389:	c3                   	ret    

0000638a <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    638a:	55                   	push   %ebp
    638b:	89 e5                	mov    %esp,%ebp
    638d:	57                   	push   %edi
    638e:	56                   	push   %esi
    638f:	53                   	push   %ebx
    6390:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    6396:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    639a:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    639e:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    63a2:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    63a6:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    63aa:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    63ae:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    63b2:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    63b6:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    63ba:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    63be:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    63c2:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    63c6:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    63ca:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    63ce:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    63d2:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    63d6:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    63da:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    63de:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    63e2:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    63e6:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    63ea:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    63ee:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    63f2:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    63f6:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    63fa:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    63fe:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    6402:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    6406:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    640a:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    640e:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    6412:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    6416:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    641a:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    641e:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    6422:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    6426:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    642a:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    642e:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    6432:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    6436:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    643a:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    643e:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    6442:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    6446:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    644a:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    644e:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    6452:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    6456:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    645a:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    645e:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    6462:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    6466:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    646a:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    646e:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    6472:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    6476:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    647a:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    647e:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    6482:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    6486:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    648a:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    648e:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    6492:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    6496:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    649a:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    649e:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    64a2:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    64a6:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    64aa:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    64ae:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    64b2:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    64b6:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    64ba:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    64be:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    64c2:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    64c6:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    64ca:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    64ce:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    64d2:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    64d6:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    64da:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    64de:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    64e5:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    64ec:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    64f3:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    64fa:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    6501:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    6508:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    650f:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    6516:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    651d:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    6524:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    652b:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    6532:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    6539:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    6540:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    6547:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    654e:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    6555:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    655c:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    6563:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    656a:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    6571:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    6578:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    657f:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    6586:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    658d:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    6594:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    659b:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    65a2:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    65a6:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    65aa:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    65ae:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    65b2:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    65b6:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    65ba:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    65be:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    65c2:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    65c6:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    65ca:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    65ce:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    65d2:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    65d6:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    65da:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    65de:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    65e2:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    65e6:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    65ea:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    65ee:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    65f2:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    65f6:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    65fa:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    65fe:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    6602:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    6606:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    660a:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    660e:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    6612:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    6616:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    661a:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    661e:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    6622:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    6626:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    662a:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    6631:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    6638:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    663f:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    6646:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    664d:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    6654:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    665b:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    6662:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    6669:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    6670:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    6677:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    667e:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    6685:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    668c:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    6693:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    669a:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    66a1:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    66a8:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    66af:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    66b6:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    66bd:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    66c4:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    66cb:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    66d2:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    66d9:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    66e0:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    66e7:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    66ee:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    66f5:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    66fc:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    6703:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    670a:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    6711:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    6718:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    671f:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    6726:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    672d:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    6734:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    673b:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    6742:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    6749:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    6750:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    6757:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    675e:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    6765:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    676c:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    6773:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    677a:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    6781:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    6788:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    678f:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    6796:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    679d:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    67a4:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    67ab:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    67b2:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    67b9:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    67c0:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    67c7:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    67ce:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    67d5:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    67dc:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    67e2:	ba 00 c2 00 00       	mov    $0xc200,%edx
    67e7:	b9 23 00 00 00       	mov    $0x23,%ecx
    67ec:	89 c7                	mov    %eax,%edi
    67ee:	89 d6                	mov    %edx,%esi
    67f0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    67f2:	89 f2                	mov    %esi,%edx
    67f4:	89 f8                	mov    %edi,%eax
    67f6:	0f b7 0a             	movzwl (%edx),%ecx
    67f9:	66 89 08             	mov    %cx,(%eax)
    67fc:	8d 40 02             	lea    0x2(%eax),%eax
    67ff:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    6802:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    6808:	bb c0 c2 00 00       	mov    $0xc2c0,%ebx
    680d:	ba 8e 00 00 00       	mov    $0x8e,%edx
    6812:	8b 0b                	mov    (%ebx),%ecx
    6814:	89 08                	mov    %ecx,(%eax)
    6816:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    681a:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    681e:	8d 78 04             	lea    0x4(%eax),%edi
    6821:	83 e7 fc             	and    $0xfffffffc,%edi
    6824:	29 f8                	sub    %edi,%eax
    6826:	29 c3                	sub    %eax,%ebx
    6828:	01 c2                	add    %eax,%edx
    682a:	83 e2 fc             	and    $0xfffffffc,%edx
    682d:	89 d0                	mov    %edx,%eax
    682f:	c1 e8 02             	shr    $0x2,%eax
    6832:	89 de                	mov    %ebx,%esi
    6834:	89 c1                	mov    %eax,%ecx
    6836:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    6838:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    683e:	ba 80 c3 00 00       	mov    $0xc380,%edx
    6843:	b9 23 00 00 00       	mov    $0x23,%ecx
    6848:	89 c7                	mov    %eax,%edi
    684a:	89 d6                	mov    %edx,%esi
    684c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    684e:	89 f2                	mov    %esi,%edx
    6850:	89 f8                	mov    %edi,%eax
    6852:	0f b7 0a             	movzwl (%edx),%ecx
    6855:	66 89 08             	mov    %cx,(%eax)
    6858:	8d 40 02             	lea    0x2(%eax),%eax
    685b:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    685e:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    6864:	bb 40 c4 00 00       	mov    $0xc440,%ebx
    6869:	ba fe 00 00 00       	mov    $0xfe,%edx
    686e:	8b 0b                	mov    (%ebx),%ecx
    6870:	89 08                	mov    %ecx,(%eax)
    6872:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    6876:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    687a:	8d 78 04             	lea    0x4(%eax),%edi
    687d:	83 e7 fc             	and    $0xfffffffc,%edi
    6880:	29 f8                	sub    %edi,%eax
    6882:	29 c3                	sub    %eax,%ebx
    6884:	01 c2                	add    %eax,%edx
    6886:	83 e2 fc             	and    $0xfffffffc,%edx
    6889:	89 d0                	mov    %edx,%eax
    688b:	c1 e8 02             	shr    $0x2,%eax
    688e:	89 de                	mov    %ebx,%esi
    6890:	89 c1                	mov    %eax,%ecx
    6892:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    6894:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    689a:	ba 40 c5 00 00       	mov    $0xc540,%edx
    689f:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    68a4:	89 c7                	mov    %eax,%edi
    68a6:	89 d6                	mov    %edx,%esi
    68a8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    68aa:	89 f2                	mov    %esi,%edx
    68ac:	89 f8                	mov    %edi,%eax
    68ae:	0f b7 0a             	movzwl (%edx),%ecx
    68b1:	66 89 08             	mov    %cx,(%eax)
    68b4:	8d 40 02             	lea    0x2(%eax),%eax
    68b7:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    68ba:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    68c0:	bb 40 c6 00 00       	mov    $0xc640,%ebx
    68c5:	ba fe 00 00 00       	mov    $0xfe,%edx
    68ca:	8b 0b                	mov    (%ebx),%ecx
    68cc:	89 08                	mov    %ecx,(%eax)
    68ce:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    68d2:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    68d6:	8d 78 04             	lea    0x4(%eax),%edi
    68d9:	83 e7 fc             	and    $0xfffffffc,%edi
    68dc:	29 f8                	sub    %edi,%eax
    68de:	29 c3                	sub    %eax,%ebx
    68e0:	01 c2                	add    %eax,%edx
    68e2:	83 e2 fc             	and    $0xfffffffc,%edx
    68e5:	89 d0                	mov    %edx,%eax
    68e7:	c1 e8 02             	shr    $0x2,%eax
    68ea:	89 de                	mov    %ebx,%esi
    68ec:	89 c1                	mov    %eax,%ecx
    68ee:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    68f0:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    68f6:	ba 40 c7 00 00       	mov    $0xc740,%edx
    68fb:	b9 ff 00 00 00       	mov    $0xff,%ecx
    6900:	89 c7                	mov    %eax,%edi
    6902:	89 d6                	mov    %edx,%esi
    6904:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6906:	89 f2                	mov    %esi,%edx
    6908:	89 f8                	mov    %edi,%eax
    690a:	0f b7 0a             	movzwl (%edx),%ecx
    690d:	66 89 08             	mov    %cx,(%eax)
    6910:	8d 40 02             	lea    0x2(%eax),%eax
    6913:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    6916:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    691c:	bb 40 cb 00 00       	mov    $0xcb40,%ebx
    6921:	ba fe 03 00 00       	mov    $0x3fe,%edx
    6926:	8b 0b                	mov    (%ebx),%ecx
    6928:	89 08                	mov    %ecx,(%eax)
    692a:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    692e:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    6932:	8d 78 04             	lea    0x4(%eax),%edi
    6935:	83 e7 fc             	and    $0xfffffffc,%edi
    6938:	29 f8                	sub    %edi,%eax
    693a:	29 c3                	sub    %eax,%ebx
    693c:	01 c2                	add    %eax,%edx
    693e:	83 e2 fc             	and    $0xfffffffc,%edx
    6941:	89 d0                	mov    %edx,%eax
    6943:	c1 e8 02             	shr    $0x2,%eax
    6946:	89 de                	mov    %ebx,%esi
    6948:	89 c1                	mov    %eax,%ecx
    694a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    694c:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6952:	ba 40 cf 00 00       	mov    $0xcf40,%edx
    6957:	b9 ff 00 00 00       	mov    $0xff,%ecx
    695c:	89 c7                	mov    %eax,%edi
    695e:	89 d6                	mov    %edx,%esi
    6960:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6962:	89 f2                	mov    %esi,%edx
    6964:	89 f8                	mov    %edi,%eax
    6966:	0f b7 0a             	movzwl (%edx),%ecx
    6969:	66 89 08             	mov    %cx,(%eax)
    696c:	8d 40 02             	lea    0x2(%eax),%eax
    696f:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    6972:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6978:	bb 40 d3 00 00       	mov    $0xd340,%ebx
    697d:	ba 00 01 00 00       	mov    $0x100,%edx
    6982:	89 c7                	mov    %eax,%edi
    6984:	89 de                	mov    %ebx,%esi
    6986:	89 d1                	mov    %edx,%ecx
    6988:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    698a:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    6991:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    6998:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    699f:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    69a6:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    69ad:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    69b4:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    69bb:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    69c2:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    69c9:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    69d0:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    69d7:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    69de:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    69e5:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    69ec:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    69f3:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    69fa:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    6a01:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    6a08:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    6a0f:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    6a16:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    6a1d:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    6a24:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    6a2b:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    6a32:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    6a39:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    6a40:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    6a47:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    6a4e:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    6a55:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    6a5c:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    6a63:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    6a6a:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    6a71:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    6a78:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    6a7f:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    6a86:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    6a8d:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    6a94:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    6a9b:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    6aa2:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    6aa9:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    6ab0:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    6ab7:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    6abe:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    6ac5:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    6acc:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    6ad3:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    6ada:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    6ae1:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    6ae8:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    6aef:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    6af6:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    6afd:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    6b04:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    6b0b:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    6b12:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    6b19:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    6b20:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    6b27:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    6b2e:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    6b35:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    6b3c:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    6b43:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    6b4a:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    6b51:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    6b58:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    6b5f:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    6b66:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    6b6d:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    6b74:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    6b7b:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    6b82:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    6b89:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    6b90:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    6b97:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    6b9e:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    6ba5:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    6bac:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    6bb3:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    6bba:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    6bc1:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    6bc8:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    6bcf:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    6bd6:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    6bdd:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    6be4:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    6beb:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    6bf2:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    6bf9:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    6c00:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    6c07:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    6c0e:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    6c15:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    6c1c:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    6c23:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    6c2a:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    6c31:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    6c38:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    6c3f:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    6c46:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    6c4d:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    6c54:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    6c5b:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    6c62:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    6c69:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    6c70:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    6c77:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    6c7e:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    6c85:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    6c8c:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    6c93:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    6c9a:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    6ca1:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    6ca8:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    6caf:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    6cb6:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    6cbd:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    6cc4:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    6ccb:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    6cd2:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    6cd9:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    6ce0:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    6ce7:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    6cee:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    6cf5:	30 00 
    6cf7:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    6cfe:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    6d05:	00 00 00 
    6d08:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    6d0f:	00 00 00 
    6d12:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    6d19:	00 00 00 
    6d1c:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    6d23:	00 00 00 
    6d26:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    6d2d:	ff ff ff 
    6d30:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    6d37:	00 00 00 
    6d3a:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    6d41:	00 00 00 
    6d44:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    6d4b:	00 00 00 
    6d4e:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    6d55:	00 00 00 
    6d58:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    6d5f:	31 00 
    6d61:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    6d68:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    6d6f:	00 00 00 
    6d72:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    6d79:	00 00 00 
    6d7c:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    6d83:	00 00 00 
    6d86:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    6d8d:	00 00 00 
    6d90:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    6d97:	ff ff ff 
    6d9a:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    6da1:	00 00 00 
    6da4:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    6dab:	00 00 00 
    6dae:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    6db1:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    6db7:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    6dbe:	00 00 00 
    6dc1:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    6dc8:	32 00 
    6dca:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    6dd1:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    6dd8:	00 00 00 
    6ddb:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    6de2:	00 00 00 
    6de5:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    6dec:	00 00 00 
    6def:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    6df6:	00 00 00 
    6df9:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    6e00:	ff ff ff 
    6e03:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    6e0a:	00 00 00 
    6e0d:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    6e14:	00 00 00 
    6e17:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    6e1a:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    6e20:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    6e27:	00 00 00 
    6e2a:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    6e31:	33 00 
    6e33:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    6e3a:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    6e41:	00 00 00 
    6e44:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    6e4b:	00 00 00 
    6e4e:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    6e55:	00 00 00 
    6e58:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    6e5f:	00 00 00 
    6e62:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    6e69:	ff ff ff 
    6e6c:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    6e73:	00 00 00 
    6e76:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    6e7d:	00 00 00 
    6e80:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    6e83:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    6e89:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    6e90:	00 00 00 
    6e93:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    6e9a:	34 00 
    6e9c:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    6ea3:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    6eaa:	00 00 00 
    6ead:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    6eb4:	00 00 00 
    6eb7:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    6ebe:	00 00 00 
    6ec1:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    6ec8:	00 00 00 
    6ecb:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    6ed2:	ff ff ff 
    6ed5:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    6edc:	00 00 00 
    6edf:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    6ee6:	00 00 00 
    6ee9:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    6ef0:	00 00 00 
    6ef3:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    6efa:	00 00 00 
    6efd:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    6f04:	35 00 
    6f06:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    6f0d:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    6f14:	00 00 00 
    6f17:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    6f1e:	00 00 00 
    6f21:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    6f28:	00 00 00 
    6f2b:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    6f32:	00 00 00 
    6f35:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    6f3c:	ff ff ff 
    6f3f:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    6f46:	00 00 00 
    6f49:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    6f50:	00 00 00 
    6f53:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    6f59:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    6f5f:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    6f66:	00 00 00 
    6f69:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    6f70:	36 00 
    6f72:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    6f79:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    6f80:	00 00 00 
    6f83:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    6f8a:	00 00 00 
    6f8d:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    6f94:	00 00 00 
    6f97:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    6f9e:	00 00 00 
    6fa1:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    6fa8:	ff ff ff 
    6fab:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    6fb2:	00 00 00 
    6fb5:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    6fbc:	00 00 00 
    6fbf:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    6fc5:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    6fcb:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    6fd2:	00 00 00 
    6fd5:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    6fdc:	37 00 
    6fde:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    6fe5:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    6fec:	00 00 00 
    6fef:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    6ff6:	00 00 00 
    6ff9:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    7000:	00 00 00 
    7003:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    700a:	00 00 00 
    700d:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    7014:	ff ff ff 
    7017:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    701e:	00 00 00 
    7021:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    7028:	00 00 00 
    702b:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    7031:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    7037:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    703e:	00 00 00 
    7041:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    7048:	38 00 
    704a:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    7051:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    7058:	00 00 00 
    705b:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    7062:	00 00 00 
    7065:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    706c:	00 00 00 
    706f:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    7076:	00 00 00 
    7079:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    7080:	ff ff ff 
    7083:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    708a:	00 00 00 
    708d:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    7094:	00 00 00 
    7097:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    709d:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    70a3:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    70aa:	00 00 00 
    70ad:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    70b4:	39 00 
    70b6:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    70bd:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    70c4:	00 00 00 
    70c7:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    70ce:	00 00 00 
    70d1:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    70d8:	00 00 00 
    70db:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    70e2:	00 00 00 
    70e5:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    70ec:	ff ff ff 
    70ef:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    70f6:	00 00 00 
    70f9:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    7100:	00 00 00 
    7103:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    7109:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    710f:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    7116:	00 00 00 
    7119:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    7120:	31 30 
    7122:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    7129:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    7130:	00 00 00 
    7133:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    713a:	00 00 00 
    713d:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    7144:	00 00 00 
    7147:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    714e:	00 00 00 
    7151:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    7158:	ff ff ff 
    715b:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    7162:	00 00 00 
    7165:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    716c:	00 00 00 
    716f:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    7175:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    717b:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    7182:	00 00 00 
    7185:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    718c:	31 31 
    718e:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    7195:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    719c:	00 00 00 
    719f:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    71a6:	00 00 00 
    71a9:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    71b0:	00 00 00 
    71b3:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    71ba:	00 00 00 
    71bd:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    71c4:	ff ff ff 
    71c7:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    71ce:	00 00 00 
    71d1:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    71d8:	00 00 00 
    71db:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    71e1:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    71e7:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    71ee:	00 00 00 
    71f1:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    71f8:	31 32 
    71fa:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    7201:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    7208:	00 00 00 
    720b:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    7212:	00 00 00 
    7215:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    721c:	00 00 00 
    721f:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    7226:	00 00 00 
    7229:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    7230:	ff ff ff 
    7233:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    723a:	00 00 00 
    723d:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    7244:	00 00 00 
    7247:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    724d:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    7253:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    725a:	00 00 00 
    725d:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    7264:	31 33 
    7266:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    726d:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    7274:	00 00 00 
    7277:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    727e:	00 00 00 
    7281:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    7288:	00 00 00 
    728b:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    7292:	00 00 00 
    7295:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    729c:	ff ff ff 
    729f:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    72a6:	00 00 00 
    72a9:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    72b0:	00 00 00 
    72b3:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    72b9:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    72bf:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    72c6:	01 00 00 
    72c9:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    72d0:	31 34 
    72d2:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    72d9:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    72e0:	00 00 00 
    72e3:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    72ea:	00 00 00 
    72ed:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    72f4:	00 00 00 
    72f7:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    72fe:	00 00 00 
    7301:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    7308:	ff ff ff 
    730b:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    7312:	00 00 00 
    7315:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    731c:	00 00 00 
    731f:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    7326:	00 00 00 
    7329:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    7330:	00 00 00 
    7333:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    733a:	31 35 
    733c:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    7343:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    734a:	00 00 00 
    734d:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    7354:	00 00 00 
    7357:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    735e:	00 00 00 
    7361:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    7368:	00 00 00 
    736b:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    7372:	ff ff ff 
    7375:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    737c:	00 00 00 
    737f:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    7386:	00 00 00 
    7389:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    738f:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    7395:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    739c:	01 00 00 
    739f:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    73a6:	31 36 
    73a8:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    73af:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    73b6:	00 00 00 
    73b9:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    73c0:	00 00 00 
    73c3:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    73ca:	00 00 00 
    73cd:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    73d4:	00 00 00 
    73d7:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    73de:	ff ff ff 
    73e1:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    73e8:	00 00 00 
    73eb:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    73f2:	00 00 00 
    73f5:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    73fb:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    7401:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    7408:	01 00 00 
    740b:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    7412:	31 37 
    7414:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    741b:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    7422:	00 00 00 
    7425:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    742c:	00 00 00 
    742f:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    7436:	00 00 00 
    7439:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    7440:	00 00 00 
    7443:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    744a:	00 00 00 
    744d:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    7454:	00 00 00 
    7457:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    745e:	00 00 00 
    7461:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7467:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    746d:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    7474:	01 00 00 
    7477:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    747e:	31 38 
    7480:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    7487:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    748e:	00 00 00 
    7491:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    7498:	00 00 00 
    749b:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    74a2:	00 00 00 
    74a5:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    74ac:	00 00 00 
    74af:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    74b6:	00 00 00 
    74b9:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    74c0:	00 00 00 
    74c3:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    74ca:	00 00 00 
    74cd:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    74d3:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    74d9:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    74e0:	01 00 00 
    74e3:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    74ea:	31 39 
    74ec:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    74f3:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    74fa:	00 00 00 
    74fd:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    7504:	00 00 00 
    7507:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    750e:	00 00 00 
    7511:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    7518:	00 00 00 
    751b:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    7522:	00 00 00 
    7525:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    752c:	00 00 00 
    752f:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    7536:	00 00 00 
    7539:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    753f:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    7545:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    754c:	01 00 00 
    754f:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    7556:	32 30 
    7558:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    755f:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    7566:	00 00 00 
    7569:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    7570:	00 00 00 
    7573:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    757a:	00 00 00 
    757d:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    7584:	00 00 00 
    7587:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    758e:	00 00 00 
    7591:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    7598:	00 00 00 
    759b:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    75a2:	00 00 00 
    75a5:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    75ab:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    75b1:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    75b8:	01 00 00 
    75bb:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    75c2:	32 31 
    75c4:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    75cb:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    75d2:	00 00 00 
    75d5:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    75dc:	00 00 00 
    75df:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    75e6:	00 00 00 
    75e9:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    75f0:	00 00 00 
    75f3:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    75fa:	00 00 00 
    75fd:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    7604:	00 00 00 
    7607:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    760e:	00 00 00 
    7611:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7617:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    761d:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    7624:	01 00 00 
    7627:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    762e:	32 32 
    7630:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    7637:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    763e:	00 00 00 
    7641:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    7648:	00 00 00 
    764b:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    7652:	00 00 00 
    7655:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    765c:	03 00 00 
    765f:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    7666:	00 00 00 
    7669:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    7670:	00 00 00 
    7673:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    767a:	00 00 00 
    767d:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7683:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    7689:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    7690:	01 00 00 
    7693:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    769a:	32 33 
    769c:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    76a3:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    76aa:	00 00 00 
    76ad:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    76b4:	00 00 00 
    76b7:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    76be:	00 00 00 
    76c1:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    76c8:	1f 00 00 
    76cb:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    76d2:	00 00 00 
    76d5:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    76dc:	00 00 00 
    76df:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    76e6:	00 00 00 
    76e9:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    76ef:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    76f5:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    76fc:	01 00 00 
    76ff:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    7706:	32 34 
    7708:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    770f:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    7716:	00 00 00 
    7719:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    7720:	00 00 00 
    7723:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    772a:	00 00 00 
    772d:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    7734:	00 00 00 
    7737:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    773e:	ff ff ff 
    7741:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    7748:	00 00 00 
    774b:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    7752:	00 00 00 
    7755:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    775b:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    7761:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    7768:	02 00 00 
    776b:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    7772:	32 35 
    7774:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    777b:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    7782:	00 00 00 
    7785:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    778c:	00 00 00 
    778f:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    7796:	00 00 00 
    7799:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    77a0:	00 00 00 
    77a3:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    77aa:	00 00 00 
    77ad:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    77b4:	00 00 00 
    77b7:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    77be:	00 00 00 
    77c1:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    77c7:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    77cd:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    77d4:	02 00 00 
    77d7:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    77de:	32 36 
    77e0:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    77e7:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    77ee:	00 00 00 
    77f1:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    77f8:	00 00 00 
    77fb:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    7802:	00 00 00 
    7805:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    780c:	00 00 00 
    780f:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    7816:	00 00 00 
    7819:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    7820:	00 00 00 
    7823:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    782a:	00 00 00 
    782d:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7833:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    7839:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    7840:	02 00 00 
    7843:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    784a:	32 37 
    784c:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    7853:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    785a:	00 00 00 
    785d:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    7864:	00 00 00 
    7867:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    786e:	00 00 00 
    7871:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    7878:	00 00 00 
    787b:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    7882:	00 00 00 
    7885:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    788c:	00 00 00 
    788f:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    7896:	00 00 00 
    7899:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    789f:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    78a5:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    78ac:	02 00 00 
    78af:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    78b6:	32 38 
    78b8:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    78bf:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    78c6:	00 00 00 
    78c9:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    78d0:	00 00 00 
    78d3:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    78da:	00 00 00 
    78dd:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    78e4:	00 00 00 
    78e7:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    78ee:	00 00 00 
    78f1:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    78f8:	00 00 00 
    78fb:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    7902:	00 00 00 
    7905:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    790b:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    7911:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    7918:	02 00 00 
    791b:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    7922:	32 39 
    7924:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    792b:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    7932:	00 00 00 
    7935:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    793c:	00 00 00 
    793f:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    7946:	00 00 00 
    7949:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    7950:	01 00 00 
    7953:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    795a:	00 00 00 
    795d:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    7964:	00 00 00 
    7967:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    796e:	00 00 00 
    7971:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7977:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    797d:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    7984:	02 00 00 
    7987:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    798e:	33 30 
    7990:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    7997:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    799e:	00 00 00 
    79a1:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    79a8:	00 00 00 
    79ab:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    79b2:	00 00 00 
    79b5:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    79bc:	07 00 00 
    79bf:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    79c6:	00 00 00 
    79c9:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    79d0:	00 00 00 
    79d3:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    79da:	00 00 00 
    79dd:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    79e3:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    79e9:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    79f0:	02 00 00 
    79f3:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    79fa:	33 31 
    79fc:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    7a03:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    7a0a:	00 00 00 
    7a0d:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    7a14:	00 00 00 
    7a17:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    7a1e:	00 00 00 
    7a21:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    7a28:	1f 00 00 
    7a2b:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    7a32:	00 00 00 
    7a35:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    7a3c:	00 00 00 
    7a3f:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    7a46:	00 00 00 
    7a49:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7a4f:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    7a55:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    7a5c:	02 00 00 
    7a5f:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    7a66:	33 32 
    7a68:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    7a6f:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    7a76:	00 00 00 
    7a79:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    7a80:	00 00 00 
    7a83:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    7a8a:	00 00 00 
    7a8d:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    7a94:	00 00 00 
    7a97:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    7a9e:	ff ff ff 
    7aa1:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    7aa8:	00 00 00 
    7aab:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    7ab2:	00 00 00 
    7ab5:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    7abb:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    7ac1:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    7ac8:	00 00 00 
    7acb:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    7ad2:	33 33 
    7ad4:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    7adb:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    7ae2:	00 00 00 
    7ae5:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    7aec:	00 00 00 
    7aef:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    7af6:	00 00 00 
    7af9:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    7b00:	00 00 00 
    7b03:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    7b0a:	ff ff ff 
    7b0d:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    7b14:	00 00 00 
    7b17:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    7b1e:	00 00 00 
    7b21:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    7b27:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    7b2d:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    7b34:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    7b37:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    7b3d:	5b                   	pop    %ebx
    7b3e:	5e                   	pop    %esi
    7b3f:	5f                   	pop    %edi
    7b40:	5d                   	pop    %ebp
    7b41:	c3                   	ret    

00007b42 <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    7b42:	55                   	push   %ebp
    7b43:	89 e5                	mov    %esp,%ebp
    7b45:	83 ec 18             	sub    $0x18,%esp
  HUFFBITS level;
  int point = 0;
    7b48:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    7b4f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    7b56:	a1 90 03 01 00       	mov    0x10390,%eax
    7b5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    7b5e:	8b 45 08             	mov    0x8(%ebp),%eax
    7b61:	8b 40 20             	mov    0x20(%eax),%eax
    7b64:	85 c0                	test   %eax,%eax
    7b66:	75 0a                	jne    7b72 <huffman_decoder+0x30>
    7b68:	b8 02 00 00 00       	mov    $0x2,%eax
    7b6d:	e9 15 03 00 00       	jmp    7e87 <huffman_decoder+0x345>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    7b72:	8b 45 08             	mov    0x8(%ebp),%eax
    7b75:	8b 40 24             	mov    0x24(%eax),%eax
    7b78:	85 c0                	test   %eax,%eax
    7b7a:	75 1d                	jne    7b99 <huffman_decoder+0x57>
  {  *x = *y = 0;
    7b7c:	8b 45 10             	mov    0x10(%ebp),%eax
    7b7f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    7b85:	8b 45 10             	mov    0x10(%ebp),%eax
    7b88:	8b 10                	mov    (%eax),%edx
    7b8a:	8b 45 0c             	mov    0xc(%ebp),%eax
    7b8d:	89 10                	mov    %edx,(%eax)
     return 0;
    7b8f:	b8 00 00 00 00       	mov    $0x0,%eax
    7b94:	e9 ee 02 00 00       	jmp    7e87 <huffman_decoder+0x345>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    7b99:	8b 45 08             	mov    0x8(%ebp),%eax
    7b9c:	8b 40 20             	mov    0x20(%eax),%eax
    7b9f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7ba2:	01 d2                	add    %edx,%edx
    7ba4:	01 d0                	add    %edx,%eax
    7ba6:	0f b6 00             	movzbl (%eax),%eax
    7ba9:	84 c0                	test   %al,%al
    7bab:	75 46                	jne    7bf3 <huffman_decoder+0xb1>
      *x = h->val[point][1] >> 4;
    7bad:	8b 45 08             	mov    0x8(%ebp),%eax
    7bb0:	8b 40 20             	mov    0x20(%eax),%eax
    7bb3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7bb6:	01 d2                	add    %edx,%edx
    7bb8:	01 d0                	add    %edx,%eax
    7bba:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7bbe:	c0 e8 04             	shr    $0x4,%al
    7bc1:	0f b6 d0             	movzbl %al,%edx
    7bc4:	8b 45 0c             	mov    0xc(%ebp),%eax
    7bc7:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    7bc9:	8b 45 08             	mov    0x8(%ebp),%eax
    7bcc:	8b 40 20             	mov    0x20(%eax),%eax
    7bcf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7bd2:	01 d2                	add    %edx,%edx
    7bd4:	01 d0                	add    %edx,%eax
    7bd6:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7bda:	0f b6 c0             	movzbl %al,%eax
    7bdd:	83 e0 0f             	and    $0xf,%eax
    7be0:	89 c2                	mov    %eax,%edx
    7be2:	8b 45 10             	mov    0x10(%ebp),%eax
    7be5:	89 10                	mov    %edx,(%eax)

      error = 0;
    7be7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    7bee:	e9 af 00 00 00       	jmp    7ca2 <huffman_decoder+0x160>
    } 
    if (hget1bit()) {
    7bf3:	e8 4d e7 ff ff       	call   6345 <hget1bit>
    7bf8:	85 c0                	test   %eax,%eax
    7bfa:	74 47                	je     7c43 <huffman_decoder+0x101>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    7bfc:	eb 17                	jmp    7c15 <huffman_decoder+0xd3>
    7bfe:	8b 45 08             	mov    0x8(%ebp),%eax
    7c01:	8b 40 20             	mov    0x20(%eax),%eax
    7c04:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c07:	01 d2                	add    %edx,%edx
    7c09:	01 d0                	add    %edx,%eax
    7c0b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7c0f:	0f b6 c0             	movzbl %al,%eax
    7c12:	01 45 f0             	add    %eax,-0x10(%ebp)
    7c15:	8b 45 08             	mov    0x8(%ebp),%eax
    7c18:	8b 40 20             	mov    0x20(%eax),%eax
    7c1b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c1e:	01 d2                	add    %edx,%edx
    7c20:	01 d0                	add    %edx,%eax
    7c22:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7c26:	3c f9                	cmp    $0xf9,%al
    7c28:	77 d4                	ja     7bfe <huffman_decoder+0xbc>
      point += h->val[point][1];
    7c2a:	8b 45 08             	mov    0x8(%ebp),%eax
    7c2d:	8b 40 20             	mov    0x20(%eax),%eax
    7c30:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c33:	01 d2                	add    %edx,%edx
    7c35:	01 d0                	add    %edx,%eax
    7c37:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7c3b:	0f b6 c0             	movzbl %al,%eax
    7c3e:	01 45 f0             	add    %eax,-0x10(%ebp)
    7c41:	eb 42                	jmp    7c85 <huffman_decoder+0x143>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    7c43:	eb 16                	jmp    7c5b <huffman_decoder+0x119>
    7c45:	8b 45 08             	mov    0x8(%ebp),%eax
    7c48:	8b 40 20             	mov    0x20(%eax),%eax
    7c4b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c4e:	01 d2                	add    %edx,%edx
    7c50:	01 d0                	add    %edx,%eax
    7c52:	0f b6 00             	movzbl (%eax),%eax
    7c55:	0f b6 c0             	movzbl %al,%eax
    7c58:	01 45 f0             	add    %eax,-0x10(%ebp)
    7c5b:	8b 45 08             	mov    0x8(%ebp),%eax
    7c5e:	8b 40 20             	mov    0x20(%eax),%eax
    7c61:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c64:	01 d2                	add    %edx,%edx
    7c66:	01 d0                	add    %edx,%eax
    7c68:	0f b6 00             	movzbl (%eax),%eax
    7c6b:	3c f9                	cmp    $0xf9,%al
    7c6d:	77 d6                	ja     7c45 <huffman_decoder+0x103>
      point += h->val[point][0];
    7c6f:	8b 45 08             	mov    0x8(%ebp),%eax
    7c72:	8b 40 20             	mov    0x20(%eax),%eax
    7c75:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c78:	01 d2                	add    %edx,%edx
    7c7a:	01 d0                	add    %edx,%eax
    7c7c:	0f b6 00             	movzbl (%eax),%eax
    7c7f:	0f b6 c0             	movzbl %al,%eax
    7c82:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    7c85:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    7c88:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7c8c:	0f 85 07 ff ff ff    	jne    7b99 <huffman_decoder+0x57>
    7c92:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c95:	a1 e4 42 01 00       	mov    0x142e4,%eax
    7c9a:	39 c2                	cmp    %eax,%edx
    7c9c:	0f 82 f7 fe ff ff    	jb     7b99 <huffman_decoder+0x57>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    7ca2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    7ca6:	74 24                	je     7ccc <huffman_decoder+0x18a>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    7ca8:	8b 45 08             	mov    0x8(%ebp),%eax
    7cab:	8b 40 04             	mov    0x4(%eax),%eax
    7cae:	83 e8 01             	sub    $0x1,%eax
    7cb1:	01 c0                	add    %eax,%eax
    7cb3:	89 c2                	mov    %eax,%edx
    7cb5:	8b 45 0c             	mov    0xc(%ebp),%eax
    7cb8:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    7cba:	8b 45 08             	mov    0x8(%ebp),%eax
    7cbd:	8b 40 08             	mov    0x8(%eax),%eax
    7cc0:	83 e8 01             	sub    $0x1,%eax
    7cc3:	01 c0                	add    %eax,%eax
    7cc5:	89 c2                	mov    %eax,%edx
    7cc7:	8b 45 10             	mov    0x10(%ebp),%eax
    7cca:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    7ccc:	8b 45 08             	mov    0x8(%ebp),%eax
    7ccf:	0f b6 00             	movzbl (%eax),%eax
    7cd2:	3c 33                	cmp    $0x33,%al
    7cd4:	0f 85 ec 00 00 00    	jne    7dc6 <huffman_decoder+0x284>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    7cda:	8b 45 08             	mov    0x8(%ebp),%eax
    7cdd:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7ce1:	3c 32                	cmp    $0x32,%al
    7ce3:	74 0f                	je     7cf4 <huffman_decoder+0x1b2>
    7ce5:	8b 45 08             	mov    0x8(%ebp),%eax
    7ce8:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7cec:	3c 33                	cmp    $0x33,%al
    7cee:	0f 85 d2 00 00 00    	jne    7dc6 <huffman_decoder+0x284>
     *v = (*y>>3) & 1;
    7cf4:	8b 45 10             	mov    0x10(%ebp),%eax
    7cf7:	8b 00                	mov    (%eax),%eax
    7cf9:	c1 f8 03             	sar    $0x3,%eax
    7cfc:	83 e0 01             	and    $0x1,%eax
    7cff:	89 c2                	mov    %eax,%edx
    7d01:	8b 45 14             	mov    0x14(%ebp),%eax
    7d04:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    7d06:	8b 45 10             	mov    0x10(%ebp),%eax
    7d09:	8b 00                	mov    (%eax),%eax
    7d0b:	c1 f8 02             	sar    $0x2,%eax
    7d0e:	83 e0 01             	and    $0x1,%eax
    7d11:	89 c2                	mov    %eax,%edx
    7d13:	8b 45 18             	mov    0x18(%ebp),%eax
    7d16:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    7d18:	8b 45 10             	mov    0x10(%ebp),%eax
    7d1b:	8b 00                	mov    (%eax),%eax
    7d1d:	d1 f8                	sar    %eax
    7d1f:	83 e0 01             	and    $0x1,%eax
    7d22:	89 c2                	mov    %eax,%edx
    7d24:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d27:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    7d29:	8b 45 10             	mov    0x10(%ebp),%eax
    7d2c:	8b 00                	mov    (%eax),%eax
    7d2e:	83 e0 01             	and    $0x1,%eax
    7d31:	89 c2                	mov    %eax,%edx
    7d33:	8b 45 10             	mov    0x10(%ebp),%eax
    7d36:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    7d38:	8b 45 14             	mov    0x14(%ebp),%eax
    7d3b:	8b 00                	mov    (%eax),%eax
    7d3d:	85 c0                	test   %eax,%eax
    7d3f:	74 18                	je     7d59 <huffman_decoder+0x217>
        if (hget1bit() == 1) *v = -*v;
    7d41:	e8 ff e5 ff ff       	call   6345 <hget1bit>
    7d46:	83 f8 01             	cmp    $0x1,%eax
    7d49:	75 0e                	jne    7d59 <huffman_decoder+0x217>
    7d4b:	8b 45 14             	mov    0x14(%ebp),%eax
    7d4e:	8b 00                	mov    (%eax),%eax
    7d50:	f7 d8                	neg    %eax
    7d52:	89 c2                	mov    %eax,%edx
    7d54:	8b 45 14             	mov    0x14(%ebp),%eax
    7d57:	89 10                	mov    %edx,(%eax)
     if (*w)
    7d59:	8b 45 18             	mov    0x18(%ebp),%eax
    7d5c:	8b 00                	mov    (%eax),%eax
    7d5e:	85 c0                	test   %eax,%eax
    7d60:	74 18                	je     7d7a <huffman_decoder+0x238>
        if (hget1bit() == 1) *w = -*w;
    7d62:	e8 de e5 ff ff       	call   6345 <hget1bit>
    7d67:	83 f8 01             	cmp    $0x1,%eax
    7d6a:	75 0e                	jne    7d7a <huffman_decoder+0x238>
    7d6c:	8b 45 18             	mov    0x18(%ebp),%eax
    7d6f:	8b 00                	mov    (%eax),%eax
    7d71:	f7 d8                	neg    %eax
    7d73:	89 c2                	mov    %eax,%edx
    7d75:	8b 45 18             	mov    0x18(%ebp),%eax
    7d78:	89 10                	mov    %edx,(%eax)
     if (*x)
    7d7a:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d7d:	8b 00                	mov    (%eax),%eax
    7d7f:	85 c0                	test   %eax,%eax
    7d81:	74 18                	je     7d9b <huffman_decoder+0x259>
        if (hget1bit() == 1) *x = -*x;
    7d83:	e8 bd e5 ff ff       	call   6345 <hget1bit>
    7d88:	83 f8 01             	cmp    $0x1,%eax
    7d8b:	75 0e                	jne    7d9b <huffman_decoder+0x259>
    7d8d:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d90:	8b 00                	mov    (%eax),%eax
    7d92:	f7 d8                	neg    %eax
    7d94:	89 c2                	mov    %eax,%edx
    7d96:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d99:	89 10                	mov    %edx,(%eax)
     if (*y)
    7d9b:	8b 45 10             	mov    0x10(%ebp),%eax
    7d9e:	8b 00                	mov    (%eax),%eax
    7da0:	85 c0                	test   %eax,%eax
    7da2:	74 1d                	je     7dc1 <huffman_decoder+0x27f>
        if (hget1bit() == 1) *y = -*y;
    7da4:	e8 9c e5 ff ff       	call   6345 <hget1bit>
    7da9:	83 f8 01             	cmp    $0x1,%eax
    7dac:	75 13                	jne    7dc1 <huffman_decoder+0x27f>
    7dae:	8b 45 10             	mov    0x10(%ebp),%eax
    7db1:	8b 00                	mov    (%eax),%eax
    7db3:	f7 d8                	neg    %eax
    7db5:	89 c2                	mov    %eax,%edx
    7db7:	8b 45 10             	mov    0x10(%ebp),%eax
    7dba:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    7dbc:	e9 c3 00 00 00       	jmp    7e84 <huffman_decoder+0x342>
    7dc1:	e9 be 00 00 00       	jmp    7e84 <huffman_decoder+0x342>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    7dc6:	8b 45 08             	mov    0x8(%ebp),%eax
    7dc9:	8b 40 0c             	mov    0xc(%eax),%eax
    7dcc:	85 c0                	test   %eax,%eax
    7dce:	74 34                	je     7e04 <huffman_decoder+0x2c2>
       if ((h->xlen-1) == *x) 
    7dd0:	8b 45 08             	mov    0x8(%ebp),%eax
    7dd3:	8b 40 04             	mov    0x4(%eax),%eax
    7dd6:	8d 50 ff             	lea    -0x1(%eax),%edx
    7dd9:	8b 45 0c             	mov    0xc(%ebp),%eax
    7ddc:	8b 00                	mov    (%eax),%eax
    7dde:	39 c2                	cmp    %eax,%edx
    7de0:	75 22                	jne    7e04 <huffman_decoder+0x2c2>
         *x += hgetbits(h->linbits);
    7de2:	8b 45 08             	mov    0x8(%ebp),%eax
    7de5:	8b 40 0c             	mov    0xc(%eax),%eax
    7de8:	83 ec 0c             	sub    $0xc,%esp
    7deb:	50                   	push   %eax
    7dec:	e8 3c e5 ff ff       	call   632d <hgetbits>
    7df1:	83 c4 10             	add    $0x10,%esp
    7df4:	89 c2                	mov    %eax,%edx
    7df6:	8b 45 0c             	mov    0xc(%ebp),%eax
    7df9:	8b 00                	mov    (%eax),%eax
    7dfb:	01 d0                	add    %edx,%eax
    7dfd:	89 c2                	mov    %eax,%edx
    7dff:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e02:	89 10                	mov    %edx,(%eax)
     if (*x)
    7e04:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e07:	8b 00                	mov    (%eax),%eax
    7e09:	85 c0                	test   %eax,%eax
    7e0b:	74 18                	je     7e25 <huffman_decoder+0x2e3>
        if (hget1bit() == 1) *x = -*x;
    7e0d:	e8 33 e5 ff ff       	call   6345 <hget1bit>
    7e12:	83 f8 01             	cmp    $0x1,%eax
    7e15:	75 0e                	jne    7e25 <huffman_decoder+0x2e3>
    7e17:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e1a:	8b 00                	mov    (%eax),%eax
    7e1c:	f7 d8                	neg    %eax
    7e1e:	89 c2                	mov    %eax,%edx
    7e20:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e23:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    7e25:	8b 45 08             	mov    0x8(%ebp),%eax
    7e28:	8b 40 0c             	mov    0xc(%eax),%eax
    7e2b:	85 c0                	test   %eax,%eax
    7e2d:	74 34                	je     7e63 <huffman_decoder+0x321>
       if ((h->ylen-1) == *y)
    7e2f:	8b 45 08             	mov    0x8(%ebp),%eax
    7e32:	8b 40 08             	mov    0x8(%eax),%eax
    7e35:	8d 50 ff             	lea    -0x1(%eax),%edx
    7e38:	8b 45 10             	mov    0x10(%ebp),%eax
    7e3b:	8b 00                	mov    (%eax),%eax
    7e3d:	39 c2                	cmp    %eax,%edx
    7e3f:	75 22                	jne    7e63 <huffman_decoder+0x321>
         *y += hgetbits(h->linbits);
    7e41:	8b 45 08             	mov    0x8(%ebp),%eax
    7e44:	8b 40 0c             	mov    0xc(%eax),%eax
    7e47:	83 ec 0c             	sub    $0xc,%esp
    7e4a:	50                   	push   %eax
    7e4b:	e8 dd e4 ff ff       	call   632d <hgetbits>
    7e50:	83 c4 10             	add    $0x10,%esp
    7e53:	89 c2                	mov    %eax,%edx
    7e55:	8b 45 10             	mov    0x10(%ebp),%eax
    7e58:	8b 00                	mov    (%eax),%eax
    7e5a:	01 d0                	add    %edx,%eax
    7e5c:	89 c2                	mov    %eax,%edx
    7e5e:	8b 45 10             	mov    0x10(%ebp),%eax
    7e61:	89 10                	mov    %edx,(%eax)
     if (*y)
    7e63:	8b 45 10             	mov    0x10(%ebp),%eax
    7e66:	8b 00                	mov    (%eax),%eax
    7e68:	85 c0                	test   %eax,%eax
    7e6a:	74 18                	je     7e84 <huffman_decoder+0x342>
        if (hget1bit() == 1) *y = -*y;
    7e6c:	e8 d4 e4 ff ff       	call   6345 <hget1bit>
    7e71:	83 f8 01             	cmp    $0x1,%eax
    7e74:	75 0e                	jne    7e84 <huffman_decoder+0x342>
    7e76:	8b 45 10             	mov    0x10(%ebp),%eax
    7e79:	8b 00                	mov    (%eax),%eax
    7e7b:	f7 d8                	neg    %eax
    7e7d:	89 c2                	mov    %eax,%edx
    7e7f:	8b 45 10             	mov    0x10(%ebp),%eax
    7e82:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    7e84:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    7e87:	c9                   	leave  
    7e88:	c3                   	ret    

00007e89 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    7e89:	55                   	push   %ebp
    7e8a:	89 e5                	mov    %esp,%ebp
    7e8c:	83 ec 18             	sub    $0x18,%esp
    layer *hdr = fr_ps->header;
    7e8f:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e92:	8b 00                	mov    (%eax),%eax
    7e94:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    7e97:	83 ec 0c             	sub    $0xc,%esp
    7e9a:	ff 75 08             	pushl  0x8(%ebp)
    7e9d:	e8 19 e0 ff ff       	call   5ebb <get1bit>
    7ea2:	83 c4 10             	add    $0x10,%esp
    7ea5:	89 c2                	mov    %eax,%edx
    7ea7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7eaa:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    7eac:	83 ec 08             	sub    $0x8,%esp
    7eaf:	6a 02                	push   $0x2
    7eb1:	ff 75 08             	pushl  0x8(%ebp)
    7eb4:	e8 16 e1 ff ff       	call   5fcf <getbits>
    7eb9:	83 c4 10             	add    $0x10,%esp
    7ebc:	ba 04 00 00 00       	mov    $0x4,%edx
    7ec1:	29 c2                	sub    %eax,%edx
    7ec3:	89 d0                	mov    %edx,%eax
    7ec5:	89 c2                	mov    %eax,%edx
    7ec7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7eca:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    7ecd:	83 ec 0c             	sub    $0xc,%esp
    7ed0:	ff 75 08             	pushl  0x8(%ebp)
    7ed3:	e8 e3 df ff ff       	call   5ebb <get1bit>
    7ed8:	83 c4 10             	add    $0x10,%esp
    7edb:	85 c0                	test   %eax,%eax
    7edd:	0f 94 c0             	sete   %al
    7ee0:	0f b6 d0             	movzbl %al,%edx
    7ee3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ee6:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    7ee9:	83 ec 08             	sub    $0x8,%esp
    7eec:	6a 04                	push   $0x4
    7eee:	ff 75 08             	pushl  0x8(%ebp)
    7ef1:	e8 d9 e0 ff ff       	call   5fcf <getbits>
    7ef6:	83 c4 10             	add    $0x10,%esp
    7ef9:	89 c2                	mov    %eax,%edx
    7efb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7efe:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    7f01:	83 ec 08             	sub    $0x8,%esp
    7f04:	6a 02                	push   $0x2
    7f06:	ff 75 08             	pushl  0x8(%ebp)
    7f09:	e8 c1 e0 ff ff       	call   5fcf <getbits>
    7f0e:	83 c4 10             	add    $0x10,%esp
    7f11:	89 c2                	mov    %eax,%edx
    7f13:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f16:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    7f19:	83 ec 0c             	sub    $0xc,%esp
    7f1c:	ff 75 08             	pushl  0x8(%ebp)
    7f1f:	e8 97 df ff ff       	call   5ebb <get1bit>
    7f24:	83 c4 10             	add    $0x10,%esp
    7f27:	89 c2                	mov    %eax,%edx
    7f29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f2c:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    7f2f:	83 ec 0c             	sub    $0xc,%esp
    7f32:	ff 75 08             	pushl  0x8(%ebp)
    7f35:	e8 81 df ff ff       	call   5ebb <get1bit>
    7f3a:	83 c4 10             	add    $0x10,%esp
    7f3d:	89 c2                	mov    %eax,%edx
    7f3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f42:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    7f45:	83 ec 08             	sub    $0x8,%esp
    7f48:	6a 02                	push   $0x2
    7f4a:	ff 75 08             	pushl  0x8(%ebp)
    7f4d:	e8 7d e0 ff ff       	call   5fcf <getbits>
    7f52:	83 c4 10             	add    $0x10,%esp
    7f55:	89 c2                	mov    %eax,%edx
    7f57:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f5a:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    7f5d:	83 ec 08             	sub    $0x8,%esp
    7f60:	6a 02                	push   $0x2
    7f62:	ff 75 08             	pushl  0x8(%ebp)
    7f65:	e8 65 e0 ff ff       	call   5fcf <getbits>
    7f6a:	83 c4 10             	add    $0x10,%esp
    7f6d:	89 c2                	mov    %eax,%edx
    7f6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f72:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    7f75:	83 ec 0c             	sub    $0xc,%esp
    7f78:	ff 75 08             	pushl  0x8(%ebp)
    7f7b:	e8 3b df ff ff       	call   5ebb <get1bit>
    7f80:	83 c4 10             	add    $0x10,%esp
    7f83:	89 c2                	mov    %eax,%edx
    7f85:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f88:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    7f8b:	83 ec 0c             	sub    $0xc,%esp
    7f8e:	ff 75 08             	pushl  0x8(%ebp)
    7f91:	e8 25 df ff ff       	call   5ebb <get1bit>
    7f96:	83 c4 10             	add    $0x10,%esp
    7f99:	89 c2                	mov    %eax,%edx
    7f9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f9e:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    7fa1:	83 ec 08             	sub    $0x8,%esp
    7fa4:	6a 02                	push   $0x2
    7fa6:	ff 75 08             	pushl  0x8(%ebp)
    7fa9:	e8 21 e0 ff ff       	call   5fcf <getbits>
    7fae:	83 c4 10             	add    $0x10,%esp
    7fb1:	89 c2                	mov    %eax,%edx
    7fb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fb6:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    7fb9:	c9                   	leave  
    7fba:	c3                   	ret    

00007fbb <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    7fbb:	55                   	push   %ebp
    7fbc:	89 e5                	mov    %esp,%ebp
    7fbe:	56                   	push   %esi
    7fbf:	53                   	push   %ebx
    7fc0:	83 ec 10             	sub    $0x10,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    7fc3:	8b 45 10             	mov    0x10(%ebp),%eax
    7fc6:	8b 40 08             	mov    0x8(%eax),%eax
    7fc9:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    7fcc:	83 ec 08             	sub    $0x8,%esp
    7fcf:	6a 09                	push   $0x9
    7fd1:	ff 75 08             	pushl  0x8(%ebp)
    7fd4:	e8 f6 df ff ff       	call   5fcf <getbits>
    7fd9:	83 c4 10             	add    $0x10,%esp
    7fdc:	89 c2                	mov    %eax,%edx
    7fde:	8b 45 0c             	mov    0xc(%ebp),%eax
    7fe1:	89 10                	mov    %edx,(%eax)
	if (stereo == 1)
    7fe3:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    7fe7:	75 1a                	jne    8003 <III_get_side_info+0x48>
		si->private_bits = getbits(bs,5);
    7fe9:	83 ec 08             	sub    $0x8,%esp
    7fec:	6a 05                	push   $0x5
    7fee:	ff 75 08             	pushl  0x8(%ebp)
    7ff1:	e8 d9 df ff ff       	call   5fcf <getbits>
    7ff6:	83 c4 10             	add    $0x10,%esp
    7ff9:	89 c2                	mov    %eax,%edx
    7ffb:	8b 45 0c             	mov    0xc(%ebp),%eax
    7ffe:	89 50 04             	mov    %edx,0x4(%eax)
    8001:	eb 18                	jmp    801b <III_get_side_info+0x60>
	else
		si->private_bits = getbits(bs,3);
    8003:	83 ec 08             	sub    $0x8,%esp
    8006:	6a 03                	push   $0x3
    8008:	ff 75 08             	pushl  0x8(%ebp)
    800b:	e8 bf df ff ff       	call   5fcf <getbits>
    8010:	83 c4 10             	add    $0x10,%esp
    8013:	89 c2                	mov    %eax,%edx
    8015:	8b 45 0c             	mov    0xc(%ebp),%eax
    8018:	89 50 04             	mov    %edx,0x4(%eax)

	for (ch=0; ch<stereo; ch++)
    801b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8022:	eb 40                	jmp    8064 <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    8024:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    802b:	eb 2d                	jmp    805a <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    802d:	83 ec 0c             	sub    $0xc,%esp
    8030:	ff 75 08             	pushl  0x8(%ebp)
    8033:	e8 83 de ff ff       	call   5ebb <get1bit>
    8038:	83 c4 10             	add    $0x10,%esp
    803b:	89 c3                	mov    %eax,%ebx
    803d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8040:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8043:	89 d0                	mov    %edx,%eax
    8045:	c1 e0 02             	shl    $0x2,%eax
    8048:	01 d0                	add    %edx,%eax
    804a:	c1 e0 03             	shl    $0x3,%eax
    804d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8050:	01 d0                	add    %edx,%eax
    8052:	89 5c 81 08          	mov    %ebx,0x8(%ecx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    8056:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    805a:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    805e:	7e cd                	jle    802d <III_get_side_info+0x72>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    8060:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8064:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8067:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    806a:	7c b8                	jl     8024 <III_get_side_info+0x69>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    806c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8073:	e9 cb 05 00 00       	jmp    8643 <III_get_side_info+0x688>
		for (ch=0; ch<stereo; ch++) {
    8078:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    807f:	e9 af 05 00 00       	jmp    8633 <III_get_side_info+0x678>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    8084:	83 ec 08             	sub    $0x8,%esp
    8087:	6a 0c                	push   $0xc
    8089:	ff 75 08             	pushl  0x8(%ebp)
    808c:	e8 3e df ff ff       	call   5fcf <getbits>
    8091:	83 c4 10             	add    $0x10,%esp
    8094:	89 c6                	mov    %eax,%esi
    8096:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8099:	8b 45 f0             	mov    -0x10(%ebp),%eax
    809c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    809f:	89 c2                	mov    %eax,%edx
    80a1:	c1 e2 03             	shl    $0x3,%edx
    80a4:	01 c2                	add    %eax,%edx
    80a6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    80ad:	89 c2                	mov    %eax,%edx
    80af:	89 c8                	mov    %ecx,%eax
    80b1:	c1 e0 02             	shl    $0x2,%eax
    80b4:	01 c8                	add    %ecx,%eax
    80b6:	c1 e0 05             	shl    $0x5,%eax
    80b9:	01 d0                	add    %edx,%eax
    80bb:	01 d8                	add    %ebx,%eax
    80bd:	83 c0 10             	add    $0x10,%eax
    80c0:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    80c3:	83 ec 08             	sub    $0x8,%esp
    80c6:	6a 09                	push   $0x9
    80c8:	ff 75 08             	pushl  0x8(%ebp)
    80cb:	e8 ff de ff ff       	call   5fcf <getbits>
    80d0:	83 c4 10             	add    $0x10,%esp
    80d3:	89 c6                	mov    %eax,%esi
    80d5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    80d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    80db:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    80de:	89 c2                	mov    %eax,%edx
    80e0:	c1 e2 03             	shl    $0x3,%edx
    80e3:	01 c2                	add    %eax,%edx
    80e5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    80ec:	89 c2                	mov    %eax,%edx
    80ee:	89 c8                	mov    %ecx,%eax
    80f0:	c1 e0 02             	shl    $0x2,%eax
    80f3:	01 c8                	add    %ecx,%eax
    80f5:	c1 e0 05             	shl    $0x5,%eax
    80f8:	01 d0                	add    %edx,%eax
    80fa:	01 d8                	add    %ebx,%eax
    80fc:	83 c0 10             	add    $0x10,%eax
    80ff:	89 70 0c             	mov    %esi,0xc(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    8102:	83 ec 08             	sub    $0x8,%esp
    8105:	6a 08                	push   $0x8
    8107:	ff 75 08             	pushl  0x8(%ebp)
    810a:	e8 c0 de ff ff       	call   5fcf <getbits>
    810f:	83 c4 10             	add    $0x10,%esp
    8112:	89 c6                	mov    %eax,%esi
    8114:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8117:	8b 45 f0             	mov    -0x10(%ebp),%eax
    811a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    811d:	89 c2                	mov    %eax,%edx
    811f:	c1 e2 03             	shl    $0x3,%edx
    8122:	01 c2                	add    %eax,%edx
    8124:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    812b:	89 c2                	mov    %eax,%edx
    812d:	89 c8                	mov    %ecx,%eax
    812f:	c1 e0 02             	shl    $0x2,%eax
    8132:	01 c8                	add    %ecx,%eax
    8134:	c1 e0 05             	shl    $0x5,%eax
    8137:	01 d0                	add    %edx,%eax
    8139:	01 d8                	add    %ebx,%eax
    813b:	83 c0 10             	add    $0x10,%eax
    813e:	89 70 10             	mov    %esi,0x10(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    8141:	83 ec 08             	sub    $0x8,%esp
    8144:	6a 04                	push   $0x4
    8146:	ff 75 08             	pushl  0x8(%ebp)
    8149:	e8 81 de ff ff       	call   5fcf <getbits>
    814e:	83 c4 10             	add    $0x10,%esp
    8151:	89 c6                	mov    %eax,%esi
    8153:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8156:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8159:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    815c:	89 c2                	mov    %eax,%edx
    815e:	c1 e2 03             	shl    $0x3,%edx
    8161:	01 c2                	add    %eax,%edx
    8163:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    816a:	89 c2                	mov    %eax,%edx
    816c:	89 c8                	mov    %ecx,%eax
    816e:	c1 e0 02             	shl    $0x2,%eax
    8171:	01 c8                	add    %ecx,%eax
    8173:	c1 e0 05             	shl    $0x5,%eax
    8176:	01 d0                	add    %edx,%eax
    8178:	01 d8                	add    %ebx,%eax
    817a:	83 c0 10             	add    $0x10,%eax
    817d:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    8180:	83 ec 0c             	sub    $0xc,%esp
    8183:	ff 75 08             	pushl  0x8(%ebp)
    8186:	e8 30 dd ff ff       	call   5ebb <get1bit>
    818b:	83 c4 10             	add    $0x10,%esp
    818e:	89 c6                	mov    %eax,%esi
    8190:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8193:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8196:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8199:	89 c2                	mov    %eax,%edx
    819b:	c1 e2 03             	shl    $0x3,%edx
    819e:	01 c2                	add    %eax,%edx
    81a0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    81a7:	89 c2                	mov    %eax,%edx
    81a9:	89 c8                	mov    %ecx,%eax
    81ab:	c1 e0 02             	shl    $0x2,%eax
    81ae:	01 c8                	add    %ecx,%eax
    81b0:	c1 e0 05             	shl    $0x5,%eax
    81b3:	01 d0                	add    %edx,%eax
    81b5:	01 d8                	add    %ebx,%eax
    81b7:	83 c0 20             	add    $0x20,%eax
    81ba:	89 70 08             	mov    %esi,0x8(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    81bd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    81c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    81c3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    81c6:	89 c2                	mov    %eax,%edx
    81c8:	c1 e2 03             	shl    $0x3,%edx
    81cb:	01 c2                	add    %eax,%edx
    81cd:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    81d4:	89 c2                	mov    %eax,%edx
    81d6:	89 c8                	mov    %ecx,%eax
    81d8:	c1 e0 02             	shl    $0x2,%eax
    81db:	01 c8                	add    %ecx,%eax
    81dd:	c1 e0 05             	shl    $0x5,%eax
    81e0:	01 d0                	add    %edx,%eax
    81e2:	01 d8                	add    %ebx,%eax
    81e4:	83 c0 20             	add    $0x20,%eax
    81e7:	8b 40 08             	mov    0x8(%eax),%eax
    81ea:	85 c0                	test   %eax,%eax
    81ec:	0f 84 85 02 00 00    	je     8477 <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    81f2:	83 ec 08             	sub    $0x8,%esp
    81f5:	6a 02                	push   $0x2
    81f7:	ff 75 08             	pushl  0x8(%ebp)
    81fa:	e8 d0 dd ff ff       	call   5fcf <getbits>
    81ff:	83 c4 10             	add    $0x10,%esp
    8202:	89 c6                	mov    %eax,%esi
    8204:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8207:	8b 45 f0             	mov    -0x10(%ebp),%eax
    820a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
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
    822b:	83 c0 20             	add    $0x20,%eax
    822e:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    8231:	83 ec 0c             	sub    $0xc,%esp
    8234:	ff 75 08             	pushl  0x8(%ebp)
    8237:	e8 7f dc ff ff       	call   5ebb <get1bit>
    823c:	83 c4 10             	add    $0x10,%esp
    823f:	89 c6                	mov    %eax,%esi
    8241:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8244:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8247:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    824a:	89 c2                	mov    %eax,%edx
    824c:	c1 e2 03             	shl    $0x3,%edx
    824f:	01 c2                	add    %eax,%edx
    8251:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8258:	89 c2                	mov    %eax,%edx
    825a:	89 c8                	mov    %ecx,%eax
    825c:	c1 e0 02             	shl    $0x2,%eax
    825f:	01 c8                	add    %ecx,%eax
    8261:	c1 e0 05             	shl    $0x5,%eax
    8264:	01 d0                	add    %edx,%eax
    8266:	01 d8                	add    %ebx,%eax
    8268:	83 c0 20             	add    $0x20,%eax
    826b:	89 70 10             	mov    %esi,0x10(%eax)
				for (i=0; i<2; i++)
    826e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8275:	eb 43                	jmp    82ba <III_get_side_info+0x2ff>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    8277:	83 ec 08             	sub    $0x8,%esp
    827a:	6a 05                	push   $0x5
    827c:	ff 75 08             	pushl  0x8(%ebp)
    827f:	e8 4b dd ff ff       	call   5fcf <getbits>
    8284:	83 c4 10             	add    $0x10,%esp
    8287:	89 c6                	mov    %eax,%esi
    8289:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    828c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    828f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8292:	89 c2                	mov    %eax,%edx
    8294:	c1 e2 03             	shl    $0x3,%edx
    8297:	01 c2                	add    %eax,%edx
    8299:	8d 04 12             	lea    (%edx,%edx,1),%eax
    829c:	89 c2                	mov    %eax,%edx
    829e:	89 c8                	mov    %ecx,%eax
    82a0:	c1 e0 02             	shl    $0x2,%eax
    82a3:	01 c8                	add    %ecx,%eax
    82a5:	c1 e0 03             	shl    $0x3,%eax
    82a8:	01 c2                	add    %eax,%edx
    82aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    82ad:	01 d0                	add    %edx,%eax
    82af:	83 c0 08             	add    $0x8,%eax
    82b2:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    82b6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    82ba:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    82be:	7e b7                	jle    8277 <III_get_side_info+0x2bc>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    82c0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    82c7:	eb 43                	jmp    830c <III_get_side_info+0x351>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    82c9:	83 ec 08             	sub    $0x8,%esp
    82cc:	6a 03                	push   $0x3
    82ce:	ff 75 08             	pushl  0x8(%ebp)
    82d1:	e8 f9 dc ff ff       	call   5fcf <getbits>
    82d6:	83 c4 10             	add    $0x10,%esp
    82d9:	89 c6                	mov    %eax,%esi
    82db:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    82de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    82e1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    82e4:	89 c2                	mov    %eax,%edx
    82e6:	c1 e2 03             	shl    $0x3,%edx
    82e9:	01 c2                	add    %eax,%edx
    82eb:	8d 04 12             	lea    (%edx,%edx,1),%eax
    82ee:	89 c2                	mov    %eax,%edx
    82f0:	89 c8                	mov    %ecx,%eax
    82f2:	c1 e0 02             	shl    $0x2,%eax
    82f5:	01 c8                	add    %ecx,%eax
    82f7:	c1 e0 03             	shl    $0x3,%eax
    82fa:	01 c2                	add    %eax,%edx
    82fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    82ff:	01 d0                	add    %edx,%eax
    8301:	83 c0 0c             	add    $0xc,%eax
    8304:	89 74 83 10          	mov    %esi,0x10(%ebx,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    8308:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    830c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8310:	7e b7                	jle    82c9 <III_get_side_info+0x30e>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    8312:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8315:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8318:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    831b:	89 c2                	mov    %eax,%edx
    831d:	c1 e2 03             	shl    $0x3,%edx
    8320:	01 c2                	add    %eax,%edx
    8322:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8329:	89 c2                	mov    %eax,%edx
    832b:	89 c8                	mov    %ecx,%eax
    832d:	c1 e0 02             	shl    $0x2,%eax
    8330:	01 c8                	add    %ecx,%eax
    8332:	c1 e0 05             	shl    $0x5,%eax
    8335:	01 d0                	add    %edx,%eax
    8337:	01 d8                	add    %ebx,%eax
    8339:	83 c0 20             	add    $0x20,%eax
    833c:	8b 40 0c             	mov    0xc(%eax),%eax
    833f:	85 c0                	test   %eax,%eax
    8341:	75 05                	jne    8348 <III_get_side_info+0x38d>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    8343:	e8 74 cc ff ff       	call   4fbc <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    8348:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    834b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    834e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8351:	89 c2                	mov    %eax,%edx
    8353:	c1 e2 03             	shl    $0x3,%edx
    8356:	01 c2                	add    %eax,%edx
    8358:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    835f:	89 c2                	mov    %eax,%edx
    8361:	89 c8                	mov    %ecx,%eax
    8363:	c1 e0 02             	shl    $0x2,%eax
    8366:	01 c8                	add    %ecx,%eax
    8368:	c1 e0 05             	shl    $0x5,%eax
    836b:	01 d0                	add    %edx,%eax
    836d:	01 d8                	add    %ebx,%eax
    836f:	83 c0 20             	add    $0x20,%eax
    8372:	8b 40 0c             	mov    0xc(%eax),%eax
    8375:	83 f8 02             	cmp    $0x2,%eax
    8378:	75 64                	jne    83de <III_get_side_info+0x423>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    837a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    837d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8380:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8383:	89 c2                	mov    %eax,%edx
    8385:	c1 e2 03             	shl    $0x3,%edx
    8388:	01 c2                	add    %eax,%edx
    838a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8391:	89 c2                	mov    %eax,%edx
    8393:	89 c8                	mov    %ecx,%eax
    8395:	c1 e0 02             	shl    $0x2,%eax
    8398:	01 c8                	add    %ecx,%eax
    839a:	c1 e0 05             	shl    $0x5,%eax
    839d:	01 d0                	add    %edx,%eax
    839f:	01 d8                	add    %ebx,%eax
    83a1:	83 c0 20             	add    $0x20,%eax
    83a4:	8b 40 10             	mov    0x10(%eax),%eax
    83a7:	85 c0                	test   %eax,%eax
    83a9:	75 33                	jne    83de <III_get_side_info+0x423>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    83ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    83ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    83b1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    83b4:	89 c2                	mov    %eax,%edx
    83b6:	c1 e2 03             	shl    $0x3,%edx
    83b9:	01 c2                	add    %eax,%edx
    83bb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    83c2:	89 c2                	mov    %eax,%edx
    83c4:	89 c8                	mov    %ecx,%eax
    83c6:	c1 e0 02             	shl    $0x2,%eax
    83c9:	01 c8                	add    %ecx,%eax
    83cb:	c1 e0 05             	shl    $0x5,%eax
    83ce:	01 d0                	add    %edx,%eax
    83d0:	01 d8                	add    %ebx,%eax
    83d2:	83 c0 40             	add    $0x40,%eax
    83d5:	c7 40 0c 08 00 00 00 	movl   $0x8,0xc(%eax)
    83dc:	eb 31                	jmp    840f <III_get_side_info+0x454>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    83de:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    83e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    83e4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    83e7:	89 c2                	mov    %eax,%edx
    83e9:	c1 e2 03             	shl    $0x3,%edx
    83ec:	01 c2                	add    %eax,%edx
    83ee:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    83f5:	89 c2                	mov    %eax,%edx
    83f7:	89 c8                	mov    %ecx,%eax
    83f9:	c1 e0 02             	shl    $0x2,%eax
    83fc:	01 c8                	add    %ecx,%eax
    83fe:	c1 e0 05             	shl    $0x5,%eax
    8401:	01 d0                	add    %edx,%eax
    8403:	01 d8                	add    %ebx,%eax
    8405:	83 c0 40             	add    $0x40,%eax
    8408:	c7 40 0c 07 00 00 00 	movl   $0x7,0xc(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    840f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8412:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8415:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8418:	89 c2                	mov    %eax,%edx
    841a:	c1 e2 03             	shl    $0x3,%edx
    841d:	01 c2                	add    %eax,%edx
    841f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8426:	89 c2                	mov    %eax,%edx
    8428:	89 c8                	mov    %ecx,%eax
    842a:	c1 e0 02             	shl    $0x2,%eax
    842d:	01 c8                	add    %ecx,%eax
    842f:	c1 e0 05             	shl    $0x5,%eax
    8432:	01 d0                	add    %edx,%eax
    8434:	01 d8                	add    %ebx,%eax
    8436:	83 c0 40             	add    $0x40,%eax
    8439:	8b 40 0c             	mov    0xc(%eax),%eax
    843c:	ba 14 00 00 00       	mov    $0x14,%edx
    8441:	89 d3                	mov    %edx,%ebx
    8443:	29 c3                	sub    %eax,%ebx
    8445:	8b 75 0c             	mov    0xc(%ebp),%esi
    8448:	8b 45 f0             	mov    -0x10(%ebp),%eax
    844b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    844e:	89 c2                	mov    %eax,%edx
    8450:	c1 e2 03             	shl    $0x3,%edx
    8453:	01 c2                	add    %eax,%edx
    8455:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    845c:	89 c2                	mov    %eax,%edx
    845e:	89 c8                	mov    %ecx,%eax
    8460:	c1 e0 02             	shl    $0x2,%eax
    8463:	01 c8                	add    %ecx,%eax
    8465:	c1 e0 05             	shl    $0x5,%eax
    8468:	01 d0                	add    %edx,%eax
    846a:	01 f0                	add    %esi,%eax
    846c:	83 c0 40             	add    $0x40,%eax
    846f:	89 58 10             	mov    %ebx,0x10(%eax)
    8472:	e9 01 01 00 00       	jmp    8578 <III_get_side_info+0x5bd>
			}
			else {
				for (i=0; i<3; i++)
    8477:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    847e:	eb 43                	jmp    84c3 <III_get_side_info+0x508>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    8480:	83 ec 08             	sub    $0x8,%esp
    8483:	6a 05                	push   $0x5
    8485:	ff 75 08             	pushl  0x8(%ebp)
    8488:	e8 42 db ff ff       	call   5fcf <getbits>
    848d:	83 c4 10             	add    $0x10,%esp
    8490:	89 c6                	mov    %eax,%esi
    8492:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8495:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8498:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    849b:	89 c2                	mov    %eax,%edx
    849d:	c1 e2 03             	shl    $0x3,%edx
    84a0:	01 c2                	add    %eax,%edx
    84a2:	8d 04 12             	lea    (%edx,%edx,1),%eax
    84a5:	89 c2                	mov    %eax,%edx
    84a7:	89 c8                	mov    %ecx,%eax
    84a9:	c1 e0 02             	shl    $0x2,%eax
    84ac:	01 c8                	add    %ecx,%eax
    84ae:	c1 e0 03             	shl    $0x3,%eax
    84b1:	01 c2                	add    %eax,%edx
    84b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    84b6:	01 d0                	add    %edx,%eax
    84b8:	83 c0 08             	add    $0x8,%eax
    84bb:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    84bf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    84c3:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    84c7:	7e b7                	jle    8480 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    84c9:	83 ec 08             	sub    $0x8,%esp
    84cc:	6a 04                	push   $0x4
    84ce:	ff 75 08             	pushl  0x8(%ebp)
    84d1:	e8 f9 da ff ff       	call   5fcf <getbits>
    84d6:	83 c4 10             	add    $0x10,%esp
    84d9:	89 c6                	mov    %eax,%esi
    84db:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    84de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84e1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    84e4:	89 c2                	mov    %eax,%edx
    84e6:	c1 e2 03             	shl    $0x3,%edx
    84e9:	01 c2                	add    %eax,%edx
    84eb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    84f2:	89 c2                	mov    %eax,%edx
    84f4:	89 c8                	mov    %ecx,%eax
    84f6:	c1 e0 02             	shl    $0x2,%eax
    84f9:	01 c8                	add    %ecx,%eax
    84fb:	c1 e0 05             	shl    $0x5,%eax
    84fe:	01 d0                	add    %edx,%eax
    8500:	01 d8                	add    %ebx,%eax
    8502:	83 c0 40             	add    $0x40,%eax
    8505:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    8508:	83 ec 08             	sub    $0x8,%esp
    850b:	6a 03                	push   $0x3
    850d:	ff 75 08             	pushl  0x8(%ebp)
    8510:	e8 ba da ff ff       	call   5fcf <getbits>
    8515:	83 c4 10             	add    $0x10,%esp
    8518:	89 c6                	mov    %eax,%esi
    851a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    851d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8520:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8523:	89 c2                	mov    %eax,%edx
    8525:	c1 e2 03             	shl    $0x3,%edx
    8528:	01 c2                	add    %eax,%edx
    852a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8531:	89 c2                	mov    %eax,%edx
    8533:	89 c8                	mov    %ecx,%eax
    8535:	c1 e0 02             	shl    $0x2,%eax
    8538:	01 c8                	add    %ecx,%eax
    853a:	c1 e0 05             	shl    $0x5,%eax
    853d:	01 d0                	add    %edx,%eax
    853f:	01 d8                	add    %ebx,%eax
    8541:	83 c0 40             	add    $0x40,%eax
    8544:	89 70 10             	mov    %esi,0x10(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    8547:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    854a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    854d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8550:	89 c2                	mov    %eax,%edx
    8552:	c1 e2 03             	shl    $0x3,%edx
    8555:	01 c2                	add    %eax,%edx
    8557:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    855e:	89 c2                	mov    %eax,%edx
    8560:	89 c8                	mov    %ecx,%eax
    8562:	c1 e0 02             	shl    $0x2,%eax
    8565:	01 c8                	add    %ecx,%eax
    8567:	c1 e0 05             	shl    $0x5,%eax
    856a:	01 d0                	add    %edx,%eax
    856c:	01 d8                	add    %ebx,%eax
    856e:	83 c0 20             	add    $0x20,%eax
    8571:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    8578:	83 ec 0c             	sub    $0xc,%esp
    857b:	ff 75 08             	pushl  0x8(%ebp)
    857e:	e8 38 d9 ff ff       	call   5ebb <get1bit>
    8583:	83 c4 10             	add    $0x10,%esp
    8586:	89 c6                	mov    %eax,%esi
    8588:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    858b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    858e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8591:	89 c2                	mov    %eax,%edx
    8593:	c1 e2 03             	shl    $0x3,%edx
    8596:	01 c2                	add    %eax,%edx
    8598:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    859f:	89 c2                	mov    %eax,%edx
    85a1:	89 c8                	mov    %ecx,%eax
    85a3:	c1 e0 02             	shl    $0x2,%eax
    85a6:	01 c8                	add    %ecx,%eax
    85a8:	c1 e0 05             	shl    $0x5,%eax
    85ab:	01 d0                	add    %edx,%eax
    85ad:	01 d8                	add    %ebx,%eax
    85af:	83 c0 40             	add    $0x40,%eax
    85b2:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    85b5:	83 ec 0c             	sub    $0xc,%esp
    85b8:	ff 75 08             	pushl  0x8(%ebp)
    85bb:	e8 fb d8 ff ff       	call   5ebb <get1bit>
    85c0:	83 c4 10             	add    $0x10,%esp
    85c3:	89 c6                	mov    %eax,%esi
    85c5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    85c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    85cb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    85ce:	89 c2                	mov    %eax,%edx
    85d0:	c1 e2 03             	shl    $0x3,%edx
    85d3:	01 c2                	add    %eax,%edx
    85d5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    85dc:	89 c2                	mov    %eax,%edx
    85de:	89 c8                	mov    %ecx,%eax
    85e0:	c1 e0 02             	shl    $0x2,%eax
    85e3:	01 c8                	add    %ecx,%eax
    85e5:	c1 e0 05             	shl    $0x5,%eax
    85e8:	01 d0                	add    %edx,%eax
    85ea:	01 d8                	add    %ebx,%eax
    85ec:	83 c0 50             	add    $0x50,%eax
    85ef:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    85f2:	83 ec 0c             	sub    $0xc,%esp
    85f5:	ff 75 08             	pushl  0x8(%ebp)
    85f8:	e8 be d8 ff ff       	call   5ebb <get1bit>
    85fd:	83 c4 10             	add    $0x10,%esp
    8600:	89 c6                	mov    %eax,%esi
    8602:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8605:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8608:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    860b:	89 c2                	mov    %eax,%edx
    860d:	c1 e2 03             	shl    $0x3,%edx
    8610:	01 c2                	add    %eax,%edx
    8612:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8619:	89 c2                	mov    %eax,%edx
    861b:	89 c8                	mov    %ecx,%eax
    861d:	c1 e0 02             	shl    $0x2,%eax
    8620:	01 c8                	add    %ecx,%eax
    8622:	c1 e0 05             	shl    $0x5,%eax
    8625:	01 d0                	add    %edx,%eax
    8627:	01 d8                	add    %ebx,%eax
    8629:	83 c0 50             	add    $0x50,%eax
    862c:	89 70 0c             	mov    %esi,0xc(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    862f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8633:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8636:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8639:	0f 8c 45 fa ff ff    	jl     8084 <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    863f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8643:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8647:	0f 8e 2b fa ff ff    	jle    8078 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    864d:	8d 65 f8             	lea    -0x8(%ebp),%esp
    8650:	5b                   	pop    %ebx
    8651:	5e                   	pop    %esi
    8652:	5d                   	pop    %ebp
    8653:	c3                   	ret    

00008654 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    8654:	55                   	push   %ebp
    8655:	89 e5                	mov    %esp,%ebp
    8657:	56                   	push   %esi
    8658:	53                   	push   %ebx
    8659:	83 ec 10             	sub    $0x10,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    865c:	8b 45 10             	mov    0x10(%ebp),%eax
    865f:	89 c2                	mov    %eax,%edx
    8661:	c1 e2 03             	shl    $0x3,%edx
    8664:	01 c2                	add    %eax,%edx
    8666:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    866d:	89 c2                	mov    %eax,%edx
    866f:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8672:	89 c8                	mov    %ecx,%eax
    8674:	c1 e0 02             	shl    $0x2,%eax
    8677:	01 c8                	add    %ecx,%eax
    8679:	c1 e0 05             	shl    $0x5,%eax
    867c:	01 d0                	add    %edx,%eax
    867e:	8d 50 10             	lea    0x10(%eax),%edx
    8681:	8b 45 0c             	mov    0xc(%ebp),%eax
    8684:	01 d0                	add    %edx,%eax
    8686:	83 c0 08             	add    $0x8,%eax
    8689:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    868c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    868f:	8b 40 10             	mov    0x10(%eax),%eax
    8692:	85 c0                	test   %eax,%eax
    8694:	0f 84 93 02 00 00    	je     892d <III_get_scale_factors+0x2d9>
    869a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    869d:	8b 40 14             	mov    0x14(%eax),%eax
    86a0:	83 f8 02             	cmp    $0x2,%eax
    86a3:	0f 85 84 02 00 00    	jne    892d <III_get_scale_factors+0x2d9>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    86a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    86ac:	8b 40 18             	mov    0x18(%eax),%eax
    86af:	85 c0                	test   %eax,%eax
    86b1:	0f 84 7c 01 00 00    	je     8833 <III_get_scale_factors+0x1df>
			for (sfb = 0; sfb < 8; sfb++)
    86b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    86be:	eb 3b                	jmp    86fb <III_get_scale_factors+0xa7>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    86c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    86c3:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    86c6:	8b 04 85 00 04 01 00 	mov    0x10400(,%eax,4),%eax
    86cd:	83 ec 0c             	sub    $0xc,%esp
    86d0:	50                   	push   %eax
    86d1:	e8 57 dc ff ff       	call   632d <hgetbits>
    86d6:	83 c4 10             	add    $0x10,%esp
    86d9:	89 c3                	mov    %eax,%ebx
    86db:	8b 4d 08             	mov    0x8(%ebp),%ecx
    86de:	8b 45 14             	mov    0x14(%ebp),%eax
    86e1:	89 c2                	mov    %eax,%edx
    86e3:	8d 04 12             	lea    (%edx,%edx,1),%eax
    86e6:	89 c2                	mov    %eax,%edx
    86e8:	89 d0                	mov    %edx,%eax
    86ea:	c1 e0 05             	shl    $0x5,%eax
    86ed:	29 d0                	sub    %edx,%eax
    86ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
    86f2:	01 d0                	add    %edx,%eax
    86f4:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    86f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    86fb:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    86ff:	7e bf                	jle    86c0 <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    8701:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    8708:	eb 60                	jmp    876a <III_get_scale_factors+0x116>
				for (window=0; window<3; window++)
    870a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8711:	eb 4d                	jmp    8760 <III_get_scale_factors+0x10c>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    8713:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8716:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    8719:	8b 04 85 00 04 01 00 	mov    0x10400(,%eax,4),%eax
    8720:	83 ec 0c             	sub    $0xc,%esp
    8723:	50                   	push   %eax
    8724:	e8 04 dc ff ff       	call   632d <hgetbits>
    8729:	83 c4 10             	add    $0x10,%esp
    872c:	89 c6                	mov    %eax,%esi
    872e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8731:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8734:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8737:	89 d0                	mov    %edx,%eax
    8739:	01 c0                	add    %eax,%eax
    873b:	01 d0                	add    %edx,%eax
    873d:	c1 e0 02             	shl    $0x2,%eax
    8740:	01 d0                	add    %edx,%eax
    8742:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    8745:	89 d1                	mov    %edx,%ecx
    8747:	89 ca                	mov    %ecx,%edx
    8749:	c1 e2 05             	shl    $0x5,%edx
    874c:	29 ca                	sub    %ecx,%edx
    874e:	01 c2                	add    %eax,%edx
    8750:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8753:	01 d0                	add    %edx,%eax
    8755:	83 c0 14             	add    $0x14,%eax
    8758:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    875c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8760:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8764:	7e ad                	jle    8713 <III_get_scale_factors+0xbf>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    8766:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    876a:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    876e:	7e 9a                	jle    870a <III_get_scale_factors+0xb6>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    8770:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    8777:	eb 63                	jmp    87dc <III_get_scale_factors+0x188>
				for (window=0; window<3; window++)
    8779:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8780:	eb 50                	jmp    87d2 <III_get_scale_factors+0x17e>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    8782:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8785:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    8788:	83 c0 10             	add    $0x10,%eax
    878b:	8b 04 85 00 04 01 00 	mov    0x10400(,%eax,4),%eax
    8792:	83 ec 0c             	sub    $0xc,%esp
    8795:	50                   	push   %eax
    8796:	e8 92 db ff ff       	call   632d <hgetbits>
    879b:	83 c4 10             	add    $0x10,%esp
    879e:	89 c6                	mov    %eax,%esi
    87a0:	8b 5d 08             	mov    0x8(%ebp),%ebx
    87a3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    87a6:	8b 4d 14             	mov    0x14(%ebp),%ecx
    87a9:	89 d0                	mov    %edx,%eax
    87ab:	01 c0                	add    %eax,%eax
    87ad:	01 d0                	add    %edx,%eax
    87af:	c1 e0 02             	shl    $0x2,%eax
    87b2:	01 d0                	add    %edx,%eax
    87b4:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    87b7:	89 d1                	mov    %edx,%ecx
    87b9:	89 ca                	mov    %ecx,%edx
    87bb:	c1 e2 05             	shl    $0x5,%edx
    87be:	29 ca                	sub    %ecx,%edx
    87c0:	01 c2                	add    %eax,%edx
    87c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87c5:	01 d0                	add    %edx,%eax
    87c7:	83 c0 14             	add    $0x14,%eax
    87ca:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    87ce:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    87d2:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    87d6:	7e aa                	jle    8782 <III_get_scale_factors+0x12e>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    87d8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    87dc:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    87e0:	7e 97                	jle    8779 <III_get_scale_factors+0x125>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    87e2:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    87e9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    87f0:	eb 36                	jmp    8828 <III_get_scale_factors+0x1d4>
				(*scalefac)[ch].s[window][sfb] = 0;
    87f2:	8b 5d 08             	mov    0x8(%ebp),%ebx
    87f5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    87f8:	8b 4d 14             	mov    0x14(%ebp),%ecx
    87fb:	89 d0                	mov    %edx,%eax
    87fd:	01 c0                	add    %eax,%eax
    87ff:	01 d0                	add    %edx,%eax
    8801:	c1 e0 02             	shl    $0x2,%eax
    8804:	01 d0                	add    %edx,%eax
    8806:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    8809:	89 d1                	mov    %edx,%ecx
    880b:	89 ca                	mov    %ecx,%edx
    880d:	c1 e2 05             	shl    $0x5,%edx
    8810:	29 ca                	sub    %ecx,%edx
    8812:	01 c2                	add    %eax,%edx
    8814:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8817:	01 d0                	add    %edx,%eax
    8819:	83 c0 14             	add    $0x14,%eax
    881c:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    8823:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    8824:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8828:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    882c:	7e c4                	jle    87f2 <III_get_scale_factors+0x19e>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    882e:	e9 bf 01 00 00       	jmp    89f2 <III_get_scale_factors+0x39e>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    8833:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    883a:	e9 93 00 00 00       	jmp    88d2 <III_get_scale_factors+0x27e>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    883f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8842:	83 c0 04             	add    $0x4,%eax
    8845:	8b 04 85 c4 03 01 00 	mov    0x103c4(,%eax,4),%eax
    884c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    884f:	eb 68                	jmp    88b9 <III_get_scale_factors+0x265>
					for (window=0; window<3; window++)
    8851:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8858:	eb 55                	jmp    88af <III_get_scale_factors+0x25b>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    885a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    885d:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    8860:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8863:	c1 e2 04             	shl    $0x4,%edx
    8866:	01 d0                	add    %edx,%eax
    8868:	8b 04 85 00 04 01 00 	mov    0x10400(,%eax,4),%eax
    886f:	83 ec 0c             	sub    $0xc,%esp
    8872:	50                   	push   %eax
    8873:	e8 b5 da ff ff       	call   632d <hgetbits>
    8878:	83 c4 10             	add    $0x10,%esp
    887b:	89 c6                	mov    %eax,%esi
    887d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8880:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8883:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8886:	89 d0                	mov    %edx,%eax
    8888:	01 c0                	add    %eax,%eax
    888a:	01 d0                	add    %edx,%eax
    888c:	c1 e0 02             	shl    $0x2,%eax
    888f:	01 d0                	add    %edx,%eax
    8891:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    8894:	89 d1                	mov    %edx,%ecx
    8896:	89 ca                	mov    %ecx,%edx
    8898:	c1 e2 05             	shl    $0x5,%edx
    889b:	29 ca                	sub    %ecx,%edx
    889d:	01 c2                	add    %eax,%edx
    889f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88a2:	01 d0                	add    %edx,%eax
    88a4:	83 c0 14             	add    $0x14,%eax
    88a7:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    88ab:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    88af:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    88b3:	7e a5                	jle    885a <III_get_scale_factors+0x206>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    88b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    88b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    88bc:	83 c0 01             	add    $0x1,%eax
    88bf:	83 c0 04             	add    $0x4,%eax
    88c2:	8b 04 85 c4 03 01 00 	mov    0x103c4(,%eax,4),%eax
    88c9:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    88cc:	7f 83                	jg     8851 <III_get_scale_factors+0x1fd>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    88ce:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    88d2:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    88d6:	0f 8e 63 ff ff ff    	jle    883f <III_get_scale_factors+0x1eb>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    88dc:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    88e3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    88ea:	eb 36                	jmp    8922 <III_get_scale_factors+0x2ce>
					(*scalefac)[ch].s[window][sfb] = 0;
    88ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
    88ef:	8b 55 ec             	mov    -0x14(%ebp),%edx
    88f2:	8b 4d 14             	mov    0x14(%ebp),%ecx
    88f5:	89 d0                	mov    %edx,%eax
    88f7:	01 c0                	add    %eax,%eax
    88f9:	01 d0                	add    %edx,%eax
    88fb:	c1 e0 02             	shl    $0x2,%eax
    88fe:	01 d0                	add    %edx,%eax
    8900:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    8903:	89 d1                	mov    %edx,%ecx
    8905:	89 ca                	mov    %ecx,%edx
    8907:	c1 e2 05             	shl    $0x5,%edx
    890a:	29 ca                	sub    %ecx,%edx
    890c:	01 c2                	add    %eax,%edx
    890e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8911:	01 d0                	add    %edx,%eax
    8913:	83 c0 14             	add    $0x14,%eax
    8916:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    891d:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    891e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8922:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8926:	7e c4                	jle    88ec <III_get_scale_factors+0x298>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    8928:	e9 c5 00 00 00       	jmp    89f2 <III_get_scale_factors+0x39e>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    892d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8934:	e9 92 00 00 00       	jmp    89cb <III_get_scale_factors+0x377>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    8939:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    893c:	8b 55 14             	mov    0x14(%ebp),%edx
    893f:	89 d0                	mov    %edx,%eax
    8941:	c1 e0 02             	shl    $0x2,%eax
    8944:	01 d0                	add    %edx,%eax
    8946:	c1 e0 03             	shl    $0x3,%eax
    8949:	8b 55 f0             	mov    -0x10(%ebp),%edx
    894c:	01 d0                	add    %edx,%eax
    894e:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    8952:	85 c0                	test   %eax,%eax
    8954:	74 06                	je     895c <III_get_scale_factors+0x308>
    8956:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    895a:	75 6b                	jne    89c7 <III_get_scale_factors+0x373>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    895c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    895f:	8b 04 85 c0 03 01 00 	mov    0x103c0(,%eax,4),%eax
    8966:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8969:	eb 4a                	jmp    89b5 <III_get_scale_factors+0x361>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    896b:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    896f:	0f 9f c0             	setg   %al
    8972:	0f b6 d0             	movzbl %al,%edx
    8975:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8978:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    897b:	c1 e2 04             	shl    $0x4,%edx
    897e:	01 d0                	add    %edx,%eax
    8980:	8b 04 85 00 04 01 00 	mov    0x10400(,%eax,4),%eax
    8987:	83 ec 0c             	sub    $0xc,%esp
    898a:	50                   	push   %eax
    898b:	e8 9d d9 ff ff       	call   632d <hgetbits>
    8990:	83 c4 10             	add    $0x10,%esp
    8993:	89 c3                	mov    %eax,%ebx
    8995:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8998:	8b 45 14             	mov    0x14(%ebp),%eax
    899b:	89 c2                	mov    %eax,%edx
    899d:	8d 04 12             	lea    (%edx,%edx,1),%eax
    89a0:	89 c2                	mov    %eax,%edx
    89a2:	89 d0                	mov    %edx,%eax
    89a4:	c1 e0 05             	shl    $0x5,%eax
    89a7:	29 d0                	sub    %edx,%eax
    89a9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    89ac:	01 d0                	add    %edx,%eax
    89ae:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    89b1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    89b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    89b8:	83 c0 01             	add    $0x1,%eax
    89bb:	8b 04 85 c0 03 01 00 	mov    0x103c0(,%eax,4),%eax
    89c2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    89c5:	7f a4                	jg     896b <III_get_scale_factors+0x317>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    89c7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    89cb:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    89cf:	0f 8e 64 ff ff ff    	jle    8939 <III_get_scale_factors+0x2e5>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    89d5:	8b 55 08             	mov    0x8(%ebp),%edx
    89d8:	8b 45 14             	mov    0x14(%ebp),%eax
    89db:	c1 e0 03             	shl    $0x3,%eax
    89de:	89 c1                	mov    %eax,%ecx
    89e0:	c1 e1 05             	shl    $0x5,%ecx
    89e3:	29 c1                	sub    %eax,%ecx
    89e5:	89 c8                	mov    %ecx,%eax
    89e7:	83 c0 58             	add    $0x58,%eax
    89ea:	01 d0                	add    %edx,%eax
    89ec:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    89f2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    89f5:	5b                   	pop    %ebx
    89f6:	5e                   	pop    %esi
    89f7:	5d                   	pop    %ebp
    89f8:	c3                   	ret    

000089f9 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    89f9:	55                   	push   %ebp
    89fa:	89 e5                	mov    %esp,%ebp
    89fc:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    89ff:	a1 80 07 01 00       	mov    0x10780,%eax
    8a04:	85 c0                	test   %eax,%eax
    8a06:	74 02                	je     8a0a <initialize_huffman+0x11>
    8a08:	eb 0f                	jmp    8a19 <initialize_huffman+0x20>
	read_decoder_table();
    8a0a:	e8 7b d9 ff ff       	call   638a <read_decoder_table>
	huffman_initialized = TRUE;
    8a0f:	c7 05 80 07 01 00 01 	movl   $0x1,0x10780
    8a16:	00 00 00 
}
    8a19:	c9                   	leave  
    8a1a:	c3                   	ret    

00008a1b <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    8a1b:	55                   	push   %ebp
    8a1c:	89 e5                	mov    %esp,%ebp
    8a1e:	57                   	push   %edi
    8a1f:	56                   	push   %esi
    8a20:	53                   	push   %ebx
    8a21:	83 ec 2c             	sub    $0x2c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    8a24:	e8 d0 ff ff ff       	call   89f9 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    8a29:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8a2c:	8b 45 14             	mov    0x14(%ebp),%eax
    8a2f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8a32:	89 c2                	mov    %eax,%edx
    8a34:	c1 e2 03             	shl    $0x3,%edx
    8a37:	01 c2                	add    %eax,%edx
    8a39:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8a40:	89 c2                	mov    %eax,%edx
    8a42:	89 c8                	mov    %ecx,%eax
    8a44:	c1 e0 02             	shl    $0x2,%eax
    8a47:	01 c8                	add    %ecx,%eax
    8a49:	c1 e0 05             	shl    $0x5,%eax
    8a4c:	01 d0                	add    %edx,%eax
    8a4e:	01 d8                	add    %ebx,%eax
    8a50:	83 c0 20             	add    $0x20,%eax
    8a53:	8b 40 08             	mov    0x8(%eax),%eax
    8a56:	85 c0                	test   %eax,%eax
    8a58:	74 45                	je     8a9f <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    8a5a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8a5d:	8b 45 14             	mov    0x14(%ebp),%eax
    8a60:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8a63:	89 c2                	mov    %eax,%edx
    8a65:	c1 e2 03             	shl    $0x3,%edx
    8a68:	01 c2                	add    %eax,%edx
    8a6a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8a71:	89 c2                	mov    %eax,%edx
    8a73:	89 c8                	mov    %ecx,%eax
    8a75:	c1 e0 02             	shl    $0x2,%eax
    8a78:	01 c8                	add    %ecx,%eax
    8a7a:	c1 e0 05             	shl    $0x5,%eax
    8a7d:	01 d0                	add    %edx,%eax
    8a7f:	01 d8                	add    %ebx,%eax
    8a81:	83 c0 20             	add    $0x20,%eax
    8a84:	8b 40 0c             	mov    0xc(%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    8a87:	83 f8 02             	cmp    $0x2,%eax
    8a8a:	75 13                	jne    8a9f <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    8a8c:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    8a93:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    8a9a:	e9 cf 00 00 00       	jmp    8b6e <III_hufman_decode+0x153>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8a9f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8aa2:	8b 00                	mov    (%eax),%eax
    8aa4:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    8aa7:	8b 75 0c             	mov    0xc(%ebp),%esi
    8aaa:	8b 45 14             	mov    0x14(%ebp),%eax
    8aad:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8ab0:	89 c2                	mov    %eax,%edx
    8ab2:	c1 e2 03             	shl    $0x3,%edx
    8ab5:	01 c2                	add    %eax,%edx
    8ab7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8abe:	89 c2                	mov    %eax,%edx
    8ac0:	89 d8                	mov    %ebx,%eax
    8ac2:	c1 e0 02             	shl    $0x2,%eax
    8ac5:	01 d8                	add    %ebx,%eax
    8ac7:	c1 e0 05             	shl    $0x5,%eax
    8aca:	01 d0                	add    %edx,%eax
    8acc:	01 f0                	add    %esi,%eax
    8ace:	83 c0 40             	add    $0x40,%eax
    8ad1:	8b 40 0c             	mov    0xc(%eax),%eax
    8ad4:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8ad7:	89 c8                	mov    %ecx,%eax
    8ad9:	c1 e0 03             	shl    $0x3,%eax
    8adc:	01 c8                	add    %ecx,%eax
    8ade:	c1 e0 02             	shl    $0x2,%eax
    8ae1:	01 c8                	add    %ecx,%eax
    8ae3:	01 d0                	add    %edx,%eax
    8ae5:	8b 04 85 80 04 01 00 	mov    0x10480(,%eax,4),%eax
    8aec:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8aef:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8af2:	8b 00                	mov    (%eax),%eax
    8af4:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    8af7:	8b 75 0c             	mov    0xc(%ebp),%esi
    8afa:	8b 45 14             	mov    0x14(%ebp),%eax
    8afd:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8b00:	89 c2                	mov    %eax,%edx
    8b02:	c1 e2 03             	shl    $0x3,%edx
    8b05:	01 c2                	add    %eax,%edx
    8b07:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8b0e:	89 c2                	mov    %eax,%edx
    8b10:	89 d8                	mov    %ebx,%eax
    8b12:	c1 e0 02             	shl    $0x2,%eax
    8b15:	01 d8                	add    %ebx,%eax
    8b17:	c1 e0 05             	shl    $0x5,%eax
    8b1a:	01 d0                	add    %edx,%eax
    8b1c:	01 f0                	add    %esi,%eax
    8b1e:	83 c0 40             	add    $0x40,%eax
    8b21:	8b 70 0c             	mov    0xc(%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    8b24:	8b 7d 0c             	mov    0xc(%ebp),%edi
    8b27:	8b 45 14             	mov    0x14(%ebp),%eax
    8b2a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8b2d:	89 c2                	mov    %eax,%edx
    8b2f:	c1 e2 03             	shl    $0x3,%edx
    8b32:	01 c2                	add    %eax,%edx
    8b34:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8b3b:	89 c2                	mov    %eax,%edx
    8b3d:	89 d8                	mov    %ebx,%eax
    8b3f:	c1 e0 02             	shl    $0x2,%eax
    8b42:	01 d8                	add    %ebx,%eax
    8b44:	c1 e0 05             	shl    $0x5,%eax
    8b47:	01 d0                	add    %edx,%eax
    8b49:	01 f8                	add    %edi,%eax
    8b4b:	83 c0 40             	add    $0x40,%eax
    8b4e:	8b 40 10             	mov    0x10(%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    8b51:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    8b53:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8b56:	89 c8                	mov    %ecx,%eax
    8b58:	c1 e0 03             	shl    $0x3,%eax
    8b5b:	01 c8                	add    %ecx,%eax
    8b5d:	c1 e0 02             	shl    $0x2,%eax
    8b60:	01 c8                	add    %ecx,%eax
    8b62:	01 d0                	add    %edx,%eax
    8b64:	8b 04 85 80 04 01 00 	mov    0x10480(,%eax,4),%eax
    8b6b:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    8b6e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    8b75:	e9 a6 01 00 00       	jmp    8d20 <III_hufman_decode+0x305>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    8b7a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8b7d:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8b80:	7d 44                	jge    8bc6 <III_hufman_decode+0x1ab>
    8b82:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8b85:	8b 45 14             	mov    0x14(%ebp),%eax
    8b88:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8b8b:	89 c2                	mov    %eax,%edx
    8b8d:	c1 e2 03             	shl    $0x3,%edx
    8b90:	01 c2                	add    %eax,%edx
    8b92:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8b99:	89 c2                	mov    %eax,%edx
    8b9b:	89 c8                	mov    %ecx,%eax
    8b9d:	c1 e0 02             	shl    $0x2,%eax
    8ba0:	01 c8                	add    %ecx,%eax
    8ba2:	c1 e0 05             	shl    $0x5,%eax
    8ba5:	01 d0                	add    %edx,%eax
    8ba7:	01 d8                	add    %ebx,%eax
    8ba9:	83 c0 20             	add    $0x20,%eax
    8bac:	8b 50 14             	mov    0x14(%eax),%edx
    8baf:	89 d0                	mov    %edx,%eax
    8bb1:	c1 e0 02             	shl    $0x2,%eax
    8bb4:	01 d0                	add    %edx,%eax
    8bb6:	c1 e0 03             	shl    $0x3,%eax
    8bb9:	05 c0 42 01 00       	add    $0x142c0,%eax
    8bbe:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8bc1:	e9 88 00 00 00       	jmp    8c4e <III_hufman_decode+0x233>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    8bc6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8bc9:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    8bcc:	7d 41                	jge    8c0f <III_hufman_decode+0x1f4>
    8bce:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8bd1:	8b 45 14             	mov    0x14(%ebp),%eax
    8bd4:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8bd7:	89 c2                	mov    %eax,%edx
    8bd9:	c1 e2 03             	shl    $0x3,%edx
    8bdc:	01 c2                	add    %eax,%edx
    8bde:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8be5:	89 c2                	mov    %eax,%edx
    8be7:	89 c8                	mov    %ecx,%eax
    8be9:	c1 e0 02             	shl    $0x2,%eax
    8bec:	01 c8                	add    %ecx,%eax
    8bee:	c1 e0 05             	shl    $0x5,%eax
    8bf1:	01 d0                	add    %edx,%eax
    8bf3:	01 d8                	add    %ebx,%eax
    8bf5:	83 c0 24             	add    $0x24,%eax
    8bf8:	8b 50 14             	mov    0x14(%eax),%edx
    8bfb:	89 d0                	mov    %edx,%eax
    8bfd:	c1 e0 02             	shl    $0x2,%eax
    8c00:	01 d0                	add    %edx,%eax
    8c02:	c1 e0 03             	shl    $0x3,%eax
    8c05:	05 c0 42 01 00       	add    $0x142c0,%eax
    8c0a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8c0d:	eb 3f                	jmp    8c4e <III_hufman_decode+0x233>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    8c0f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8c12:	8b 45 14             	mov    0x14(%ebp),%eax
    8c15:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8c18:	89 c2                	mov    %eax,%edx
    8c1a:	c1 e2 03             	shl    $0x3,%edx
    8c1d:	01 c2                	add    %eax,%edx
    8c1f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c26:	89 c2                	mov    %eax,%edx
    8c28:	89 c8                	mov    %ecx,%eax
    8c2a:	c1 e0 02             	shl    $0x2,%eax
    8c2d:	01 c8                	add    %ecx,%eax
    8c2f:	c1 e0 05             	shl    $0x5,%eax
    8c32:	01 d0                	add    %edx,%eax
    8c34:	01 d8                	add    %ebx,%eax
    8c36:	83 c0 28             	add    $0x28,%eax
    8c39:	8b 50 14             	mov    0x14(%eax),%edx
    8c3c:	89 d0                	mov    %edx,%eax
    8c3e:	c1 e0 02             	shl    $0x2,%eax
    8c41:	01 d0                	add    %edx,%eax
    8c43:	c1 e0 03             	shl    $0x3,%eax
    8c46:	05 c0 42 01 00       	add    $0x142c0,%eax
    8c4b:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    8c4e:	83 ec 0c             	sub    $0xc,%esp
    8c51:	8d 45 c8             	lea    -0x38(%ebp),%eax
    8c54:	50                   	push   %eax
    8c55:	8d 45 cc             	lea    -0x34(%ebp),%eax
    8c58:	50                   	push   %eax
    8c59:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8c5c:	50                   	push   %eax
    8c5d:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    8c60:	50                   	push   %eax
    8c61:	ff 75 e0             	pushl  -0x20(%ebp)
    8c64:	e8 d9 ee ff ff       	call   7b42 <huffman_decoder>
    8c69:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = x;
    8c6c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8c6f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8c74:	89 c8                	mov    %ecx,%eax
    8c76:	f7 ea                	imul   %edx
    8c78:	c1 fa 02             	sar    $0x2,%edx
    8c7b:	89 c8                	mov    %ecx,%eax
    8c7d:	c1 f8 1f             	sar    $0x1f,%eax
    8c80:	29 c2                	sub    %eax,%edx
    8c82:	89 d0                	mov    %edx,%eax
    8c84:	89 c2                	mov    %eax,%edx
    8c86:	89 d0                	mov    %edx,%eax
    8c88:	c1 e0 03             	shl    $0x3,%eax
    8c8b:	01 d0                	add    %edx,%eax
    8c8d:	c1 e0 03             	shl    $0x3,%eax
    8c90:	89 c2                	mov    %eax,%edx
    8c92:	8b 45 08             	mov    0x8(%ebp),%eax
    8c95:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8c98:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8c9b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ca0:	89 c8                	mov    %ecx,%eax
    8ca2:	f7 ea                	imul   %edx
    8ca4:	c1 fa 02             	sar    $0x2,%edx
    8ca7:	89 c8                	mov    %ecx,%eax
    8ca9:	c1 f8 1f             	sar    $0x1f,%eax
    8cac:	29 c2                	sub    %eax,%edx
    8cae:	89 d0                	mov    %edx,%eax
    8cb0:	c1 e0 03             	shl    $0x3,%eax
    8cb3:	01 d0                	add    %edx,%eax
    8cb5:	01 c0                	add    %eax,%eax
    8cb7:	29 c1                	sub    %eax,%ecx
    8cb9:	89 ca                	mov    %ecx,%edx
    8cbb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8cbe:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    8cc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8cc4:	8d 48 01             	lea    0x1(%eax),%ecx
    8cc7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ccc:	89 c8                	mov    %ecx,%eax
    8cce:	f7 ea                	imul   %edx
    8cd0:	c1 fa 02             	sar    $0x2,%edx
    8cd3:	89 c8                	mov    %ecx,%eax
    8cd5:	c1 f8 1f             	sar    $0x1f,%eax
    8cd8:	29 c2                	sub    %eax,%edx
    8cda:	89 d0                	mov    %edx,%eax
    8cdc:	89 c2                	mov    %eax,%edx
    8cde:	89 d0                	mov    %edx,%eax
    8ce0:	c1 e0 03             	shl    $0x3,%eax
    8ce3:	01 d0                	add    %edx,%eax
    8ce5:	c1 e0 03             	shl    $0x3,%eax
    8ce8:	89 c2                	mov    %eax,%edx
    8cea:	8b 45 08             	mov    0x8(%ebp),%eax
    8ced:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8cf0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8cf3:	8d 48 01             	lea    0x1(%eax),%ecx
    8cf6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8cfb:	89 c8                	mov    %ecx,%eax
    8cfd:	f7 ea                	imul   %edx
    8cff:	c1 fa 02             	sar    $0x2,%edx
    8d02:	89 c8                	mov    %ecx,%eax
    8d04:	c1 f8 1f             	sar    $0x1f,%eax
    8d07:	29 c2                	sub    %eax,%edx
    8d09:	89 d0                	mov    %edx,%eax
    8d0b:	c1 e0 03             	shl    $0x3,%eax
    8d0e:	01 d0                	add    %edx,%eax
    8d10:	01 c0                	add    %eax,%eax
    8d12:	29 c1                	sub    %eax,%ecx
    8d14:	89 ca                	mov    %ecx,%edx
    8d16:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8d19:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    8d1c:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    8d20:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    8d23:	8b 75 0c             	mov    0xc(%ebp),%esi
    8d26:	8b 45 14             	mov    0x14(%ebp),%eax
    8d29:	8b 4d 10             	mov    0x10(%ebp),%ecx
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
    8d4a:	83 c0 10             	add    $0x10,%eax
    8d4d:	8b 40 0c             	mov    0xc(%eax),%eax
    8d50:	01 c0                	add    %eax,%eax
    8d52:	39 c3                	cmp    %eax,%ebx
    8d54:	0f 82 20 fe ff ff    	jb     8b7a <III_hufman_decode+0x15f>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    8d5a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8d5d:	8b 45 14             	mov    0x14(%ebp),%eax
    8d60:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8d63:	89 c2                	mov    %eax,%edx
    8d65:	c1 e2 03             	shl    $0x3,%edx
    8d68:	01 c2                	add    %eax,%edx
    8d6a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8d71:	89 c2                	mov    %eax,%edx
    8d73:	89 c8                	mov    %ecx,%eax
    8d75:	c1 e0 02             	shl    $0x2,%eax
    8d78:	01 c8                	add    %ecx,%eax
    8d7a:	c1 e0 05             	shl    $0x5,%eax
    8d7d:	01 d0                	add    %edx,%eax
    8d7f:	01 d8                	add    %ebx,%eax
    8d81:	83 c0 50             	add    $0x50,%eax
    8d84:	8b 40 0c             	mov    0xc(%eax),%eax
    8d87:	8d 50 20             	lea    0x20(%eax),%edx
    8d8a:	89 d0                	mov    %edx,%eax
    8d8c:	c1 e0 02             	shl    $0x2,%eax
    8d8f:	01 d0                	add    %edx,%eax
    8d91:	c1 e0 03             	shl    $0x3,%eax
    8d94:	05 c0 42 01 00       	add    $0x142c0,%eax
    8d99:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    8d9c:	e9 88 01 00 00       	jmp    8f29 <III_hufman_decode+0x50e>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    8da1:	83 ec 0c             	sub    $0xc,%esp
    8da4:	8d 45 c8             	lea    -0x38(%ebp),%eax
    8da7:	50                   	push   %eax
    8da8:	8d 45 cc             	lea    -0x34(%ebp),%eax
    8dab:	50                   	push   %eax
    8dac:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8daf:	50                   	push   %eax
    8db0:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    8db3:	50                   	push   %eax
    8db4:	ff 75 e0             	pushl  -0x20(%ebp)
    8db7:	e8 86 ed ff ff       	call   7b42 <huffman_decoder>
    8dbc:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = v;
    8dbf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8dc2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8dc7:	89 c8                	mov    %ecx,%eax
    8dc9:	f7 ea                	imul   %edx
    8dcb:	c1 fa 02             	sar    $0x2,%edx
    8dce:	89 c8                	mov    %ecx,%eax
    8dd0:	c1 f8 1f             	sar    $0x1f,%eax
    8dd3:	29 c2                	sub    %eax,%edx
    8dd5:	89 d0                	mov    %edx,%eax
    8dd7:	89 c2                	mov    %eax,%edx
    8dd9:	89 d0                	mov    %edx,%eax
    8ddb:	c1 e0 03             	shl    $0x3,%eax
    8dde:	01 d0                	add    %edx,%eax
    8de0:	c1 e0 03             	shl    $0x3,%eax
    8de3:	89 c2                	mov    %eax,%edx
    8de5:	8b 45 08             	mov    0x8(%ebp),%eax
    8de8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8deb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8dee:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8df3:	89 c8                	mov    %ecx,%eax
    8df5:	f7 ea                	imul   %edx
    8df7:	c1 fa 02             	sar    $0x2,%edx
    8dfa:	89 c8                	mov    %ecx,%eax
    8dfc:	c1 f8 1f             	sar    $0x1f,%eax
    8dff:	29 c2                	sub    %eax,%edx
    8e01:	89 d0                	mov    %edx,%eax
    8e03:	c1 e0 03             	shl    $0x3,%eax
    8e06:	01 d0                	add    %edx,%eax
    8e08:	01 c0                	add    %eax,%eax
    8e0a:	29 c1                	sub    %eax,%ecx
    8e0c:	89 ca                	mov    %ecx,%edx
    8e0e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    8e11:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    8e14:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8e17:	8d 48 01             	lea    0x1(%eax),%ecx
    8e1a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8e1f:	89 c8                	mov    %ecx,%eax
    8e21:	f7 ea                	imul   %edx
    8e23:	c1 fa 02             	sar    $0x2,%edx
    8e26:	89 c8                	mov    %ecx,%eax
    8e28:	c1 f8 1f             	sar    $0x1f,%eax
    8e2b:	29 c2                	sub    %eax,%edx
    8e2d:	89 d0                	mov    %edx,%eax
    8e2f:	89 c2                	mov    %eax,%edx
    8e31:	89 d0                	mov    %edx,%eax
    8e33:	c1 e0 03             	shl    $0x3,%eax
    8e36:	01 d0                	add    %edx,%eax
    8e38:	c1 e0 03             	shl    $0x3,%eax
    8e3b:	89 c2                	mov    %eax,%edx
    8e3d:	8b 45 08             	mov    0x8(%ebp),%eax
    8e40:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8e43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8e46:	8d 48 01             	lea    0x1(%eax),%ecx
    8e49:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8e4e:	89 c8                	mov    %ecx,%eax
    8e50:	f7 ea                	imul   %edx
    8e52:	c1 fa 02             	sar    $0x2,%edx
    8e55:	89 c8                	mov    %ecx,%eax
    8e57:	c1 f8 1f             	sar    $0x1f,%eax
    8e5a:	29 c2                	sub    %eax,%edx
    8e5c:	89 d0                	mov    %edx,%eax
    8e5e:	c1 e0 03             	shl    $0x3,%eax
    8e61:	01 d0                	add    %edx,%eax
    8e63:	01 c0                	add    %eax,%eax
    8e65:	29 c1                	sub    %eax,%ecx
    8e67:	89 ca                	mov    %ecx,%edx
    8e69:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8e6c:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    8e6f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8e72:	8d 48 02             	lea    0x2(%eax),%ecx
    8e75:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8e7a:	89 c8                	mov    %ecx,%eax
    8e7c:	f7 ea                	imul   %edx
    8e7e:	c1 fa 02             	sar    $0x2,%edx
    8e81:	89 c8                	mov    %ecx,%eax
    8e83:	c1 f8 1f             	sar    $0x1f,%eax
    8e86:	29 c2                	sub    %eax,%edx
    8e88:	89 d0                	mov    %edx,%eax
    8e8a:	89 c2                	mov    %eax,%edx
    8e8c:	89 d0                	mov    %edx,%eax
    8e8e:	c1 e0 03             	shl    $0x3,%eax
    8e91:	01 d0                	add    %edx,%eax
    8e93:	c1 e0 03             	shl    $0x3,%eax
    8e96:	89 c2                	mov    %eax,%edx
    8e98:	8b 45 08             	mov    0x8(%ebp),%eax
    8e9b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8e9e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8ea1:	8d 48 02             	lea    0x2(%eax),%ecx
    8ea4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ea9:	89 c8                	mov    %ecx,%eax
    8eab:	f7 ea                	imul   %edx
    8ead:	c1 fa 02             	sar    $0x2,%edx
    8eb0:	89 c8                	mov    %ecx,%eax
    8eb2:	c1 f8 1f             	sar    $0x1f,%eax
    8eb5:	29 c2                	sub    %eax,%edx
    8eb7:	89 d0                	mov    %edx,%eax
    8eb9:	c1 e0 03             	shl    $0x3,%eax
    8ebc:	01 d0                	add    %edx,%eax
    8ebe:	01 c0                	add    %eax,%eax
    8ec0:	29 c1                	sub    %eax,%ecx
    8ec2:	89 ca                	mov    %ecx,%edx
    8ec4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8ec7:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    8eca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8ecd:	8d 48 03             	lea    0x3(%eax),%ecx
    8ed0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ed5:	89 c8                	mov    %ecx,%eax
    8ed7:	f7 ea                	imul   %edx
    8ed9:	c1 fa 02             	sar    $0x2,%edx
    8edc:	89 c8                	mov    %ecx,%eax
    8ede:	c1 f8 1f             	sar    $0x1f,%eax
    8ee1:	29 c2                	sub    %eax,%edx
    8ee3:	89 d0                	mov    %edx,%eax
    8ee5:	89 c2                	mov    %eax,%edx
    8ee7:	89 d0                	mov    %edx,%eax
    8ee9:	c1 e0 03             	shl    $0x3,%eax
    8eec:	01 d0                	add    %edx,%eax
    8eee:	c1 e0 03             	shl    $0x3,%eax
    8ef1:	89 c2                	mov    %eax,%edx
    8ef3:	8b 45 08             	mov    0x8(%ebp),%eax
    8ef6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8ef9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8efc:	8d 48 03             	lea    0x3(%eax),%ecx
    8eff:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8f04:	89 c8                	mov    %ecx,%eax
    8f06:	f7 ea                	imul   %edx
    8f08:	c1 fa 02             	sar    $0x2,%edx
    8f0b:	89 c8                	mov    %ecx,%eax
    8f0d:	c1 f8 1f             	sar    $0x1f,%eax
    8f10:	29 c2                	sub    %eax,%edx
    8f12:	89 d0                	mov    %edx,%eax
    8f14:	c1 e0 03             	shl    $0x3,%eax
    8f17:	01 d0                	add    %edx,%eax
    8f19:	01 c0                	add    %eax,%eax
    8f1b:	29 c1                	sub    %eax,%ecx
    8f1d:	89 ca                	mov    %ecx,%edx
    8f1f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8f22:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    8f25:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    8f29:	e8 e8 d3 ff ff       	call   6316 <hsstell>
    8f2e:	89 c6                	mov    %eax,%esi
    8f30:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8f33:	8b 45 14             	mov    0x14(%ebp),%eax
    8f36:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8f39:	89 c2                	mov    %eax,%edx
    8f3b:	c1 e2 03             	shl    $0x3,%edx
    8f3e:	01 c2                	add    %eax,%edx
    8f40:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8f47:	89 c2                	mov    %eax,%edx
    8f49:	89 c8                	mov    %ecx,%eax
    8f4b:	c1 e0 02             	shl    $0x2,%eax
    8f4e:	01 c8                	add    %ecx,%eax
    8f50:	c1 e0 05             	shl    $0x5,%eax
    8f53:	01 d0                	add    %edx,%eax
    8f55:	01 d8                	add    %ebx,%eax
    8f57:	83 c0 10             	add    $0x10,%eax
    8f5a:	8b 50 08             	mov    0x8(%eax),%edx
    8f5d:	8b 45 18             	mov    0x18(%ebp),%eax
    8f60:	01 d0                	add    %edx,%eax
    8f62:	39 c6                	cmp    %eax,%esi
    8f64:	73 0d                	jae    8f73 <III_hufman_decode+0x558>
    8f66:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    8f6d:	0f 8e 2e fe ff ff    	jle    8da1 <III_hufman_decode+0x386>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    8f73:	e8 9e d3 ff ff       	call   6316 <hsstell>
    8f78:	89 c6                	mov    %eax,%esi
    8f7a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8f7d:	8b 45 14             	mov    0x14(%ebp),%eax
    8f80:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8f83:	89 c2                	mov    %eax,%edx
    8f85:	c1 e2 03             	shl    $0x3,%edx
    8f88:	01 c2                	add    %eax,%edx
    8f8a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8f91:	89 c2                	mov    %eax,%edx
    8f93:	89 c8                	mov    %ecx,%eax
    8f95:	c1 e0 02             	shl    $0x2,%eax
    8f98:	01 c8                	add    %ecx,%eax
    8f9a:	c1 e0 05             	shl    $0x5,%eax
    8f9d:	01 d0                	add    %edx,%eax
    8f9f:	01 d8                	add    %ebx,%eax
    8fa1:	83 c0 10             	add    $0x10,%eax
    8fa4:	8b 50 08             	mov    0x8(%eax),%edx
    8fa7:	8b 45 18             	mov    0x18(%ebp),%eax
    8faa:	01 d0                	add    %edx,%eax
    8fac:	39 c6                	cmp    %eax,%esi
    8fae:	76 4f                	jbe    8fff <III_hufman_decode+0x5e4>
   {  i -=4;
    8fb0:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    8fb4:	e8 5d d3 ff ff       	call   6316 <hsstell>
    8fb9:	89 c2                	mov    %eax,%edx
    8fbb:	8b 45 18             	mov    0x18(%ebp),%eax
    8fbe:	89 d6                	mov    %edx,%esi
    8fc0:	29 c6                	sub    %eax,%esi
    8fc2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8fc5:	8b 45 14             	mov    0x14(%ebp),%eax
    8fc8:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8fcb:	89 c2                	mov    %eax,%edx
    8fcd:	c1 e2 03             	shl    $0x3,%edx
    8fd0:	01 c2                	add    %eax,%edx
    8fd2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8fd9:	89 c2                	mov    %eax,%edx
    8fdb:	89 c8                	mov    %ecx,%eax
    8fdd:	c1 e0 02             	shl    $0x2,%eax
    8fe0:	01 c8                	add    %ecx,%eax
    8fe2:	c1 e0 05             	shl    $0x5,%eax
    8fe5:	01 d0                	add    %edx,%eax
    8fe7:	01 d8                	add    %ebx,%eax
    8fe9:	83 c0 10             	add    $0x10,%eax
    8fec:	8b 40 08             	mov    0x8(%eax),%eax
    8fef:	29 c6                	sub    %eax,%esi
    8ff1:	89 f0                	mov    %esi,%eax
    8ff3:	83 ec 0c             	sub    $0xc,%esp
    8ff6:	50                   	push   %eax
    8ff7:	e8 5e d3 ff ff       	call   635a <rewindNbits>
    8ffc:	83 c4 10             	add    $0x10,%esp
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    8fff:	e8 12 d3 ff ff       	call   6316 <hsstell>
    9004:	89 c6                	mov    %eax,%esi
    9006:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9009:	8b 45 14             	mov    0x14(%ebp),%eax
    900c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    900f:	89 c2                	mov    %eax,%edx
    9011:	c1 e2 03             	shl    $0x3,%edx
    9014:	01 c2                	add    %eax,%edx
    9016:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    901d:	89 c2                	mov    %eax,%edx
    901f:	89 c8                	mov    %ecx,%eax
    9021:	c1 e0 02             	shl    $0x2,%eax
    9024:	01 c8                	add    %ecx,%eax
    9026:	c1 e0 05             	shl    $0x5,%eax
    9029:	01 d0                	add    %edx,%eax
    902b:	01 d8                	add    %ebx,%eax
    902d:	83 c0 10             	add    $0x10,%eax
    9030:	8b 50 08             	mov    0x8(%eax),%edx
    9033:	8b 45 18             	mov    0x18(%ebp),%eax
    9036:	01 d0                	add    %edx,%eax
    9038:	39 c6                	cmp    %eax,%esi
    903a:	73 48                	jae    9084 <III_hufman_decode+0x669>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    903c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    903f:	8b 45 14             	mov    0x14(%ebp),%eax
    9042:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9045:	89 c2                	mov    %eax,%edx
    9047:	c1 e2 03             	shl    $0x3,%edx
    904a:	01 c2                	add    %eax,%edx
    904c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9053:	89 c2                	mov    %eax,%edx
    9055:	89 c8                	mov    %ecx,%eax
    9057:	c1 e0 02             	shl    $0x2,%eax
    905a:	01 c8                	add    %ecx,%eax
    905c:	c1 e0 05             	shl    $0x5,%eax
    905f:	01 d0                	add    %edx,%eax
    9061:	01 d8                	add    %ebx,%eax
    9063:	83 c0 10             	add    $0x10,%eax
    9066:	8b 50 08             	mov    0x8(%eax),%edx
    9069:	8b 45 18             	mov    0x18(%ebp),%eax
    906c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    906f:	e8 a2 d2 ff ff       	call   6316 <hsstell>
    9074:	29 c3                	sub    %eax,%ebx
    9076:	89 d8                	mov    %ebx,%eax
    9078:	83 ec 0c             	sub    $0xc,%esp
    907b:	50                   	push   %eax
    907c:	e8 ac d2 ff ff       	call   632d <hgetbits>
    9081:	83 c4 10             	add    $0x10,%esp

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    9084:	eb 5a                	jmp    90e0 <III_hufman_decode+0x6c5>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    9086:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9089:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    908e:	89 c8                	mov    %ecx,%eax
    9090:	f7 ea                	imul   %edx
    9092:	c1 fa 02             	sar    $0x2,%edx
    9095:	89 c8                	mov    %ecx,%eax
    9097:	c1 f8 1f             	sar    $0x1f,%eax
    909a:	29 c2                	sub    %eax,%edx
    909c:	89 d0                	mov    %edx,%eax
    909e:	89 c2                	mov    %eax,%edx
    90a0:	89 d0                	mov    %edx,%eax
    90a2:	c1 e0 03             	shl    $0x3,%eax
    90a5:	01 d0                	add    %edx,%eax
    90a7:	c1 e0 03             	shl    $0x3,%eax
    90aa:	89 c2                	mov    %eax,%edx
    90ac:	8b 45 08             	mov    0x8(%ebp),%eax
    90af:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    90b2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    90b5:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    90ba:	89 c8                	mov    %ecx,%eax
    90bc:	f7 ea                	imul   %edx
    90be:	c1 fa 02             	sar    $0x2,%edx
    90c1:	89 c8                	mov    %ecx,%eax
    90c3:	c1 f8 1f             	sar    $0x1f,%eax
    90c6:	29 c2                	sub    %eax,%edx
    90c8:	89 d0                	mov    %edx,%eax
    90ca:	c1 e0 03             	shl    $0x3,%eax
    90cd:	01 d0                	add    %edx,%eax
    90cf:	01 c0                	add    %eax,%eax
    90d1:	29 c1                	sub    %eax,%ecx
    90d3:	89 ca                	mov    %ecx,%edx
    90d5:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    90dc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    90e0:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    90e7:	7e 9d                	jle    9086 <III_hufman_decode+0x66b>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    90e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    90ec:	5b                   	pop    %ebx
    90ed:	5e                   	pop    %esi
    90ee:	5f                   	pop    %edi
    90ef:	5d                   	pop    %ebp
    90f0:	c3                   	ret    

000090f1 <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    90f1:	55                   	push   %ebp
    90f2:	89 e5                	mov    %esp,%ebp
    90f4:	53                   	push   %ebx
    90f5:	83 ec 34             	sub    $0x34,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    90f8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    90ff:	8b 45 1c             	mov    0x1c(%ebp),%eax
    9102:	8b 00                	mov    (%eax),%eax
    9104:	8b 40 10             	mov    0x10(%eax),%eax
    9107:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    910a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    9111:	8b 45 14             	mov    0x14(%ebp),%eax
    9114:	8b 40 10             	mov    0x10(%eax),%eax
    9117:	85 c0                	test   %eax,%eax
    9119:	74 6a                	je     9185 <III_dequantize_sample+0x94>
    911b:	8b 45 14             	mov    0x14(%ebp),%eax
    911e:	8b 40 14             	mov    0x14(%eax),%eax
    9121:	83 f8 02             	cmp    $0x2,%eax
    9124:	75 5f                	jne    9185 <III_dequantize_sample+0x94>
		if (gr_info->mixed_block_flag)
    9126:	8b 45 14             	mov    0x14(%ebp),%eax
    9129:	8b 40 18             	mov    0x18(%eax),%eax
    912c:	85 c0                	test   %eax,%eax
    912e:	74 18                	je     9148 <III_dequantize_sample+0x57>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    9130:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9133:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9139:	83 c0 04             	add    $0x4,%eax
    913c:	05 80 04 01 00       	add    $0x10480,%eax
    9141:	8b 00                	mov    (%eax),%eax
    9143:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    9146:	eb 53                	jmp    919b <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    9148:	8b 45 dc             	mov    -0x24(%ebp),%eax
    914b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9151:	83 c0 54             	add    $0x54,%eax
    9154:	05 80 04 01 00       	add    $0x10480,%eax
    9159:	8b 50 0c             	mov    0xc(%eax),%edx
    915c:	89 d0                	mov    %edx,%eax
    915e:	01 c0                	add    %eax,%eax
    9160:	01 d0                	add    %edx,%eax
    9162:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    9165:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9168:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    916e:	83 c0 54             	add    $0x54,%eax
    9171:	05 80 04 01 00       	add    $0x10480,%eax
    9176:	8b 40 0c             	mov    0xc(%eax),%eax
    9179:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    917c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    9183:	eb 16                	jmp    919b <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    9185:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9188:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    918e:	83 c0 04             	add    $0x4,%eax
    9191:	05 80 04 01 00       	add    $0x10480,%eax
    9196:	8b 00                	mov    (%eax),%eax
    9198:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    919b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    91a2:	e9 8a 06 00 00       	jmp    9831 <III_dequantize_sample+0x740>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    91a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    91ae:	e9 70 06 00 00       	jmp    9823 <III_dequantize_sample+0x732>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    91b3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    91b6:	89 d0                	mov    %edx,%eax
    91b8:	c1 e0 03             	shl    $0x3,%eax
    91bb:	01 d0                	add    %edx,%eax
    91bd:	01 c0                	add    %eax,%eax
    91bf:	89 c2                	mov    %eax,%edx
    91c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    91c4:	01 d0                	add    %edx,%eax
    91c6:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    91c9:	0f 85 a7 02 00 00    	jne    9476 <III_dequantize_sample+0x385>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    91cf:	8b 45 14             	mov    0x14(%ebp),%eax
    91d2:	8b 40 10             	mov    0x10(%eax),%eax
    91d5:	85 c0                	test   %eax,%eax
    91d7:	0f 84 74 02 00 00    	je     9451 <III_dequantize_sample+0x360>
    91dd:	8b 45 14             	mov    0x14(%ebp),%eax
    91e0:	8b 40 14             	mov    0x14(%eax),%eax
    91e3:	83 f8 02             	cmp    $0x2,%eax
    91e6:	0f 85 65 02 00 00    	jne    9451 <III_dequantize_sample+0x360>
					if (gr_info->mixed_block_flag) {
    91ec:	8b 45 14             	mov    0x14(%ebp),%eax
    91ef:	8b 40 18             	mov    0x18(%eax),%eax
    91f2:	85 c0                	test   %eax,%eax
    91f4:	0f 84 b8 01 00 00    	je     93b2 <III_dequantize_sample+0x2c1>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    91fa:	8b 55 f0             	mov    -0x10(%ebp),%edx
    91fd:	89 d0                	mov    %edx,%eax
    91ff:	c1 e0 03             	shl    $0x3,%eax
    9202:	01 d0                	add    %edx,%eax
    9204:	01 c0                	add    %eax,%eax
    9206:	89 c2                	mov    %eax,%edx
    9208:	8b 45 f4             	mov    -0xc(%ebp),%eax
    920b:	01 c2                	add    %eax,%edx
    920d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9210:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9216:	83 c0 20             	add    $0x20,%eax
    9219:	05 80 04 01 00       	add    $0x10480,%eax
    921e:	8b 00                	mov    (%eax),%eax
    9220:	39 c2                	cmp    %eax,%edx
    9222:	0f 85 96 00 00 00    	jne    92be <III_dequantize_sample+0x1cd>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    9228:	8b 45 dc             	mov    -0x24(%ebp),%eax
    922b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9231:	83 c0 60             	add    $0x60,%eax
    9234:	05 80 04 01 00       	add    $0x10480,%eax
    9239:	8b 50 0c             	mov    0xc(%eax),%edx
    923c:	89 d0                	mov    %edx,%eax
    923e:	01 c0                	add    %eax,%eax
    9240:	01 d0                	add    %edx,%eax
    9242:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    9245:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    924c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    924f:	8d 48 01             	lea    0x1(%eax),%ecx
    9252:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9255:	89 d0                	mov    %edx,%eax
    9257:	c1 e0 03             	shl    $0x3,%eax
    925a:	01 d0                	add    %edx,%eax
    925c:	c1 e0 02             	shl    $0x2,%eax
    925f:	01 d0                	add    %edx,%eax
    9261:	01 c8                	add    %ecx,%eax
    9263:	83 c0 14             	add    $0x14,%eax
    9266:	8b 0c 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    926d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9270:	89 d0                	mov    %edx,%eax
    9272:	c1 e0 03             	shl    $0x3,%eax
    9275:	01 d0                	add    %edx,%eax
    9277:	c1 e0 02             	shl    $0x2,%eax
    927a:	01 d0                	add    %edx,%eax
    927c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    927f:	01 d0                	add    %edx,%eax
    9281:	83 c0 14             	add    $0x14,%eax
    9284:	8b 04 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    928b:	29 c1                	sub    %eax,%ecx
    928d:	89 c8                	mov    %ecx,%eax
    928f:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9292:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9295:	89 d0                	mov    %edx,%eax
    9297:	c1 e0 03             	shl    $0x3,%eax
    929a:	01 d0                	add    %edx,%eax
    929c:	c1 e0 02             	shl    $0x2,%eax
    929f:	01 d0                	add    %edx,%eax
    92a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    92a4:	01 d0                	add    %edx,%eax
    92a6:	83 c0 14             	add    $0x14,%eax
    92a9:	8b 14 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%edx
    92b0:	89 d0                	mov    %edx,%eax
    92b2:	01 c0                	add    %eax,%eax
    92b4:	01 d0                	add    %edx,%eax
    92b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    92b9:	e9 91 01 00 00       	jmp    944f <III_dequantize_sample+0x35e>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    92be:	8b 55 f0             	mov    -0x10(%ebp),%edx
    92c1:	89 d0                	mov    %edx,%eax
    92c3:	c1 e0 03             	shl    $0x3,%eax
    92c6:	01 d0                	add    %edx,%eax
    92c8:	01 c0                	add    %eax,%eax
    92ca:	89 c2                	mov    %eax,%edx
    92cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92cf:	01 c2                	add    %eax,%edx
    92d1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    92d4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    92da:	83 c0 20             	add    $0x20,%eax
    92dd:	05 80 04 01 00       	add    $0x10480,%eax
    92e2:	8b 00                	mov    (%eax),%eax
    92e4:	39 c2                	cmp    %eax,%edx
    92e6:	7d 2a                	jge    9312 <III_dequantize_sample+0x221>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    92e8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    92ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
    92ef:	8d 48 01             	lea    0x1(%eax),%ecx
    92f2:	8b 55 dc             	mov    -0x24(%ebp),%edx
    92f5:	89 d0                	mov    %edx,%eax
    92f7:	c1 e0 03             	shl    $0x3,%eax
    92fa:	01 d0                	add    %edx,%eax
    92fc:	c1 e0 02             	shl    $0x2,%eax
    92ff:	01 d0                	add    %edx,%eax
    9301:	01 c8                	add    %ecx,%eax
    9303:	8b 04 85 80 04 01 00 	mov    0x10480(,%eax,4),%eax
    930a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    930d:	e9 3d 01 00 00       	jmp    944f <III_dequantize_sample+0x35e>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    9312:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9316:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9319:	8d 48 01             	lea    0x1(%eax),%ecx
    931c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    931f:	89 d0                	mov    %edx,%eax
    9321:	c1 e0 03             	shl    $0x3,%eax
    9324:	01 d0                	add    %edx,%eax
    9326:	c1 e0 02             	shl    $0x2,%eax
    9329:	01 d0                	add    %edx,%eax
    932b:	01 c8                	add    %ecx,%eax
    932d:	83 c0 14             	add    $0x14,%eax
    9330:	8b 14 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%edx
    9337:	89 d0                	mov    %edx,%eax
    9339:	01 c0                	add    %eax,%eax
    933b:	01 d0                	add    %edx,%eax
    933d:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    9340:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9343:	8d 48 01             	lea    0x1(%eax),%ecx
    9346:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9349:	89 d0                	mov    %edx,%eax
    934b:	c1 e0 03             	shl    $0x3,%eax
    934e:	01 d0                	add    %edx,%eax
    9350:	c1 e0 02             	shl    $0x2,%eax
    9353:	01 d0                	add    %edx,%eax
    9355:	01 c8                	add    %ecx,%eax
    9357:	83 c0 14             	add    $0x14,%eax
    935a:	8b 0c 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    9361:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9364:	89 d0                	mov    %edx,%eax
    9366:	c1 e0 03             	shl    $0x3,%eax
    9369:	01 d0                	add    %edx,%eax
    936b:	c1 e0 02             	shl    $0x2,%eax
    936e:	01 d0                	add    %edx,%eax
    9370:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9373:	01 d0                	add    %edx,%eax
    9375:	83 c0 14             	add    $0x14,%eax
    9378:	8b 04 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    937f:	29 c1                	sub    %eax,%ecx
    9381:	89 c8                	mov    %ecx,%eax
    9383:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9386:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9389:	89 d0                	mov    %edx,%eax
    938b:	c1 e0 03             	shl    $0x3,%eax
    938e:	01 d0                	add    %edx,%eax
    9390:	c1 e0 02             	shl    $0x2,%eax
    9393:	01 d0                	add    %edx,%eax
    9395:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9398:	01 d0                	add    %edx,%eax
    939a:	83 c0 14             	add    $0x14,%eax
    939d:	8b 14 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%edx
    93a4:	89 d0                	mov    %edx,%eax
    93a6:	01 c0                	add    %eax,%eax
    93a8:	01 d0                	add    %edx,%eax
    93aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    93ad:	e9 c4 00 00 00       	jmp    9476 <III_dequantize_sample+0x385>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    93b2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    93b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    93b9:	8d 48 01             	lea    0x1(%eax),%ecx
    93bc:	8b 55 dc             	mov    -0x24(%ebp),%edx
    93bf:	89 d0                	mov    %edx,%eax
    93c1:	c1 e0 03             	shl    $0x3,%eax
    93c4:	01 d0                	add    %edx,%eax
    93c6:	c1 e0 02             	shl    $0x2,%eax
    93c9:	01 d0                	add    %edx,%eax
    93cb:	01 c8                	add    %ecx,%eax
    93cd:	83 c0 14             	add    $0x14,%eax
    93d0:	8b 14 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%edx
    93d7:	89 d0                	mov    %edx,%eax
    93d9:	01 c0                	add    %eax,%eax
    93db:	01 d0                	add    %edx,%eax
    93dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    93e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    93e3:	8d 48 01             	lea    0x1(%eax),%ecx
    93e6:	8b 55 dc             	mov    -0x24(%ebp),%edx
    93e9:	89 d0                	mov    %edx,%eax
    93eb:	c1 e0 03             	shl    $0x3,%eax
    93ee:	01 d0                	add    %edx,%eax
    93f0:	c1 e0 02             	shl    $0x2,%eax
    93f3:	01 d0                	add    %edx,%eax
    93f5:	01 c8                	add    %ecx,%eax
    93f7:	83 c0 14             	add    $0x14,%eax
    93fa:	8b 0c 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    9401:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9404:	89 d0                	mov    %edx,%eax
    9406:	c1 e0 03             	shl    $0x3,%eax
    9409:	01 d0                	add    %edx,%eax
    940b:	c1 e0 02             	shl    $0x2,%eax
    940e:	01 d0                	add    %edx,%eax
    9410:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9413:	01 d0                	add    %edx,%eax
    9415:	83 c0 14             	add    $0x14,%eax
    9418:	8b 04 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    941f:	29 c1                	sub    %eax,%ecx
    9421:	89 c8                	mov    %ecx,%eax
    9423:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9426:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9429:	89 d0                	mov    %edx,%eax
    942b:	c1 e0 03             	shl    $0x3,%eax
    942e:	01 d0                	add    %edx,%eax
    9430:	c1 e0 02             	shl    $0x2,%eax
    9433:	01 d0                	add    %edx,%eax
    9435:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9438:	01 d0                	add    %edx,%eax
    943a:	83 c0 14             	add    $0x14,%eax
    943d:	8b 14 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%edx
    9444:	89 d0                	mov    %edx,%eax
    9446:	01 c0                	add    %eax,%eax
    9448:	01 d0                	add    %edx,%eax
    944a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    944d:	eb 27                	jmp    9476 <III_dequantize_sample+0x385>
    944f:	eb 25                	jmp    9476 <III_dequantize_sample+0x385>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    9451:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9455:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9458:	8d 48 01             	lea    0x1(%eax),%ecx
    945b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    945e:	89 d0                	mov    %edx,%eax
    9460:	c1 e0 03             	shl    $0x3,%eax
    9463:	01 d0                	add    %edx,%eax
    9465:	c1 e0 02             	shl    $0x2,%eax
    9468:	01 d0                	add    %edx,%eax
    946a:	01 c8                	add    %ecx,%eax
    946c:	8b 04 85 80 04 01 00 	mov    0x10480(,%eax,4),%eax
    9473:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    9476:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9479:	89 d0                	mov    %edx,%eax
    947b:	c1 e0 03             	shl    $0x3,%eax
    947e:	01 d0                	add    %edx,%eax
    9480:	c1 e0 04             	shl    $0x4,%eax
    9483:	89 c2                	mov    %eax,%edx
    9485:	8b 45 0c             	mov    0xc(%ebp),%eax
    9488:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    948b:	8b 45 14             	mov    0x14(%ebp),%eax
    948e:	8b 40 08             	mov    0x8(%eax),%eax
    9491:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9494:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    949b:	df 6d c8             	fildll -0x38(%ebp)
    949e:	dd 5d d0             	fstpl  -0x30(%ebp)
    94a1:	dd 45 d0             	fldl   -0x30(%ebp)
    94a4:	dd 05 90 e7 00 00    	fldl   0xe790
    94aa:	de e9                	fsubrp %st,%st(1)
    94ac:	dd 05 98 e7 00 00    	fldl   0xe798
    94b2:	de c9                	fmulp  %st,%st(1)
    94b4:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    94b8:	dd 1c 24             	fstpl  (%esp)
    94bb:	dd 05 a0 e7 00 00    	fldl   0xe7a0
    94c1:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    94c5:	dd 1c 24             	fstpl  (%esp)
    94c8:	e8 96 c1 ff ff       	call   5663 <pow>
    94cd:	83 c4 10             	add    $0x10,%esp
    94d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94d3:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    94d6:	8b 45 14             	mov    0x14(%ebp),%eax
    94d9:	8b 40 10             	mov    0x10(%eax),%eax
    94dc:	85 c0                	test   %eax,%eax
    94de:	0f 84 9c 01 00 00    	je     9680 <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    94e4:	8b 45 14             	mov    0x14(%ebp),%eax
    94e7:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    94ea:	83 f8 02             	cmp    $0x2,%eax
    94ed:	75 0a                	jne    94f9 <III_dequantize_sample+0x408>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    94ef:	8b 45 14             	mov    0x14(%ebp),%eax
    94f2:	8b 40 18             	mov    0x18(%eax),%eax
    94f5:	85 c0                	test   %eax,%eax
    94f7:	74 27                	je     9520 <III_dequantize_sample+0x42f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    94f9:	8b 45 14             	mov    0x14(%ebp),%eax
    94fc:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    94ff:	83 f8 02             	cmp    $0x2,%eax
    9502:	0f 85 78 01 00 00    	jne    9680 <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    9508:	8b 45 14             	mov    0x14(%ebp),%eax
    950b:	8b 40 18             	mov    0x18(%eax),%eax
    950e:	85 c0                	test   %eax,%eax
    9510:	0f 84 6a 01 00 00    	je     9680 <III_dequantize_sample+0x58f>
    9516:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    951a:	0f 8e 60 01 00 00    	jle    9680 <III_dequantize_sample+0x58f>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    9520:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9523:	89 d0                	mov    %edx,%eax
    9525:	c1 e0 03             	shl    $0x3,%eax
    9528:	01 d0                	add    %edx,%eax
    952a:	01 c0                	add    %eax,%eax
    952c:	89 c2                	mov    %eax,%edx
    952e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9531:	01 d0                	add    %edx,%eax
    9533:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    9536:	99                   	cltd   
    9537:	f7 7d e0             	idivl  -0x20(%ebp)
    953a:	89 c2                	mov    %eax,%edx
    953c:	8b 45 14             	mov    0x14(%ebp),%eax
    953f:	83 c2 08             	add    $0x8,%edx
    9542:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    9546:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9549:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    9550:	df 6d c8             	fildll -0x38(%ebp)
    9553:	dd 5d d0             	fstpl  -0x30(%ebp)
    9556:	dd 45 d0             	fldl   -0x30(%ebp)
    9559:	dd 05 a8 e7 00 00    	fldl   0xe7a8
    955f:	de c9                	fmulp  %st,%st(1)
    9561:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9565:	dd 1c 24             	fstpl  (%esp)
    9568:	dd 05 a0 e7 00 00    	fldl   0xe7a0
    956e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9572:	dd 1c 24             	fstpl  (%esp)
    9575:	e8 e9 c0 ff ff       	call   5663 <pow>
    957a:	83 c4 10             	add    $0x10,%esp
    957d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9580:	89 d0                	mov    %edx,%eax
    9582:	c1 e0 03             	shl    $0x3,%eax
    9585:	01 d0                	add    %edx,%eax
    9587:	c1 e0 04             	shl    $0x4,%eax
    958a:	89 c2                	mov    %eax,%edx
    958c:	8b 45 0c             	mov    0xc(%ebp),%eax
    958f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9592:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9595:	89 d0                	mov    %edx,%eax
    9597:	c1 e0 03             	shl    $0x3,%eax
    959a:	01 d0                	add    %edx,%eax
    959c:	c1 e0 04             	shl    $0x4,%eax
    959f:	89 c2                	mov    %eax,%edx
    95a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    95a4:	01 c2                	add    %eax,%edx
    95a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    95a9:	dd 04 c2             	fldl   (%edx,%eax,8)
    95ac:	de c9                	fmulp  %st,%st(1)
    95ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    95b1:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    95b4:	8b 45 14             	mov    0x14(%ebp),%eax
    95b7:	8b 40 40             	mov    0x40(%eax),%eax
    95ba:	89 45 c8             	mov    %eax,-0x38(%ebp)
    95bd:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    95c4:	df 6d c8             	fildll -0x38(%ebp)
    95c7:	dd 5d d0             	fstpl  -0x30(%ebp)
    95ca:	dd 45 d0             	fldl   -0x30(%ebp)
    95cd:	d9 e8                	fld1   
    95cf:	de c1                	faddp  %st,%st(1)
    95d1:	dd 05 b0 e7 00 00    	fldl   0xe7b0
    95d7:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    95d9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    95dc:	89 d0                	mov    %edx,%eax
    95de:	c1 e0 03             	shl    $0x3,%eax
    95e1:	01 d0                	add    %edx,%eax
    95e3:	01 c0                	add    %eax,%eax
    95e5:	89 c2                	mov    %eax,%edx
    95e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    95ea:	01 d0                	add    %edx,%eax
    95ec:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    95ef:	99                   	cltd   
    95f0:	f7 7d e0             	idivl  -0x20(%ebp)
    95f3:	89 c2                	mov    %eax,%edx
    95f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    95f8:	8b 4d 18             	mov    0x18(%ebp),%ecx
    95fb:	89 d0                	mov    %edx,%eax
    95fd:	01 c0                	add    %eax,%eax
    95ff:	01 d0                	add    %edx,%eax
    9601:	c1 e0 02             	shl    $0x2,%eax
    9604:	01 d0                	add    %edx,%eax
    9606:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    9609:	89 d1                	mov    %edx,%ecx
    960b:	89 ca                	mov    %ecx,%edx
    960d:	c1 e2 05             	shl    $0x5,%edx
    9610:	29 ca                	sub    %ecx,%edx
    9612:	01 c2                	add    %eax,%edx
    9614:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9617:	01 d0                	add    %edx,%eax
    9619:	83 c0 14             	add    $0x14,%eax
    961c:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    9620:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9623:	db 45 c8             	fildl  -0x38(%ebp)
    9626:	de c9                	fmulp  %st,%st(1)
    9628:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    962c:	dd 1c 24             	fstpl  (%esp)
    962f:	dd 05 a0 e7 00 00    	fldl   0xe7a0
    9635:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9639:	dd 1c 24             	fstpl  (%esp)
    963c:	e8 22 c0 ff ff       	call   5663 <pow>
    9641:	83 c4 10             	add    $0x10,%esp
    9644:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9647:	89 d0                	mov    %edx,%eax
    9649:	c1 e0 03             	shl    $0x3,%eax
    964c:	01 d0                	add    %edx,%eax
    964e:	c1 e0 04             	shl    $0x4,%eax
    9651:	89 c2                	mov    %eax,%edx
    9653:	8b 45 0c             	mov    0xc(%ebp),%eax
    9656:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9659:	8b 55 f0             	mov    -0x10(%ebp),%edx
    965c:	89 d0                	mov    %edx,%eax
    965e:	c1 e0 03             	shl    $0x3,%eax
    9661:	01 d0                	add    %edx,%eax
    9663:	c1 e0 04             	shl    $0x4,%eax
    9666:	89 c2                	mov    %eax,%edx
    9668:	8b 45 0c             	mov    0xc(%ebp),%eax
    966b:	01 c2                	add    %eax,%edx
    966d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9670:	dd 04 c2             	fldl   (%edx,%eax,8)
    9673:	de c9                	fmulp  %st,%st(1)
    9675:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9678:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    967b:	e9 c0 00 00 00       	jmp    9740 <III_dequantize_sample+0x64f>
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    9680:	8b 45 14             	mov    0x14(%ebp),%eax
    9683:	8b 40 40             	mov    0x40(%eax),%eax
    9686:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9689:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    9690:	df 6d c8             	fildll -0x38(%ebp)
    9693:	dd 5d d0             	fstpl  -0x30(%ebp)
    9696:	dd 45 d0             	fldl   -0x30(%ebp)
    9699:	d9 e8                	fld1   
    969b:	de c1                	faddp  %st,%st(1)
    969d:	dd 05 b0 e7 00 00    	fldl   0xe7b0
    96a3:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    96a5:	8b 4d 10             	mov    0x10(%ebp),%ecx
    96a8:	8b 45 18             	mov    0x18(%ebp),%eax
    96ab:	89 c2                	mov    %eax,%edx
    96ad:	8d 04 12             	lea    (%edx,%edx,1),%eax
    96b0:	89 c2                	mov    %eax,%edx
    96b2:	89 d0                	mov    %edx,%eax
    96b4:	c1 e0 05             	shl    $0x5,%eax
    96b7:	29 d0                	sub    %edx,%eax
    96b9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    96bc:	01 d0                	add    %edx,%eax
    96be:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    96c1:	89 c1                	mov    %eax,%ecx
    96c3:	8b 45 14             	mov    0x14(%ebp),%eax
    96c6:	8b 50 3c             	mov    0x3c(%eax),%edx
    96c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    96cc:	8b 04 85 40 06 01 00 	mov    0x10640(,%eax,4),%eax
    96d3:	0f af c2             	imul   %edx,%eax
    96d6:	01 c8                	add    %ecx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    96d8:	89 45 c8             	mov    %eax,-0x38(%ebp)
    96db:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    96e2:	df 6d c8             	fildll -0x38(%ebp)
    96e5:	dd 5d d0             	fstpl  -0x30(%ebp)
    96e8:	dd 45 d0             	fldl   -0x30(%ebp)
    96eb:	de c9                	fmulp  %st,%st(1)
    96ed:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    96f1:	dd 1c 24             	fstpl  (%esp)
    96f4:	dd 05 a0 e7 00 00    	fldl   0xe7a0
    96fa:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    96fe:	dd 1c 24             	fstpl  (%esp)
    9701:	e8 5d bf ff ff       	call   5663 <pow>
    9706:	83 c4 10             	add    $0x10,%esp
    9709:	8b 55 f0             	mov    -0x10(%ebp),%edx
    970c:	89 d0                	mov    %edx,%eax
    970e:	c1 e0 03             	shl    $0x3,%eax
    9711:	01 d0                	add    %edx,%eax
    9713:	c1 e0 04             	shl    $0x4,%eax
    9716:	89 c2                	mov    %eax,%edx
    9718:	8b 45 0c             	mov    0xc(%ebp),%eax
    971b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    971e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9721:	89 d0                	mov    %edx,%eax
    9723:	c1 e0 03             	shl    $0x3,%eax
    9726:	01 d0                	add    %edx,%eax
    9728:	c1 e0 04             	shl    $0x4,%eax
    972b:	89 c2                	mov    %eax,%edx
    972d:	8b 45 0c             	mov    0xc(%ebp),%eax
    9730:	01 c2                	add    %eax,%edx
    9732:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9735:	dd 04 c2             	fldl   (%edx,%eax,8)
    9738:	de c9                	fmulp  %st,%st(1)
    973a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    973d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    9740:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9743:	89 d0                	mov    %edx,%eax
    9745:	c1 e0 03             	shl    $0x3,%eax
    9748:	01 d0                	add    %edx,%eax
    974a:	c1 e0 03             	shl    $0x3,%eax
    974d:	89 c2                	mov    %eax,%edx
    974f:	8b 45 08             	mov    0x8(%ebp),%eax
    9752:	01 c2                	add    %eax,%edx
    9754:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9757:	8b 04 82             	mov    (%edx,%eax,4),%eax
    975a:	c1 e8 1f             	shr    $0x1f,%eax
    975d:	0f b6 c0             	movzbl %al,%eax
    9760:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    9763:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9766:	89 d0                	mov    %edx,%eax
    9768:	c1 e0 03             	shl    $0x3,%eax
    976b:	01 d0                	add    %edx,%eax
    976d:	c1 e0 03             	shl    $0x3,%eax
    9770:	89 c2                	mov    %eax,%edx
    9772:	8b 45 08             	mov    0x8(%ebp),%eax
    9775:	01 c2                	add    %eax,%edx
    9777:	8b 45 f4             	mov    -0xc(%ebp),%eax
    977a:	8b 04 82             	mov    (%edx,%eax,4),%eax
    977d:	83 ec 0c             	sub    $0xc,%esp
    9780:	50                   	push   %eax
    9781:	e8 c7 bd ff ff       	call   554d <abs>
    9786:	83 c4 10             	add    $0x10,%esp
    9789:	89 45 c8             	mov    %eax,-0x38(%ebp)
    978c:	db 45 c8             	fildl  -0x38(%ebp)
    978f:	dd 05 b8 e7 00 00    	fldl   0xe7b8
    9795:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9799:	dd 1c 24             	fstpl  (%esp)
    979c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    97a0:	dd 1c 24             	fstpl  (%esp)
    97a3:	e8 bb be ff ff       	call   5663 <pow>
    97a8:	83 c4 10             	add    $0x10,%esp
    97ab:	8b 55 f0             	mov    -0x10(%ebp),%edx
    97ae:	89 d0                	mov    %edx,%eax
    97b0:	c1 e0 03             	shl    $0x3,%eax
    97b3:	01 d0                	add    %edx,%eax
    97b5:	c1 e0 04             	shl    $0x4,%eax
    97b8:	89 c2                	mov    %eax,%edx
    97ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    97bd:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    97c0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    97c3:	89 d0                	mov    %edx,%eax
    97c5:	c1 e0 03             	shl    $0x3,%eax
    97c8:	01 d0                	add    %edx,%eax
    97ca:	c1 e0 04             	shl    $0x4,%eax
    97cd:	89 c2                	mov    %eax,%edx
    97cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    97d2:	01 c2                	add    %eax,%edx
    97d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97d7:	dd 04 c2             	fldl   (%edx,%eax,8)
    97da:	de c9                	fmulp  %st,%st(1)
    97dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97df:	dd 1c c1             	fstpl  (%ecx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    97e2:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    97e6:	74 37                	je     981f <III_dequantize_sample+0x72e>
    97e8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    97eb:	89 d0                	mov    %edx,%eax
    97ed:	c1 e0 03             	shl    $0x3,%eax
    97f0:	01 d0                	add    %edx,%eax
    97f2:	c1 e0 04             	shl    $0x4,%eax
    97f5:	89 c2                	mov    %eax,%edx
    97f7:	8b 45 0c             	mov    0xc(%ebp),%eax
    97fa:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    97fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9800:	89 d0                	mov    %edx,%eax
    9802:	c1 e0 03             	shl    $0x3,%eax
    9805:	01 d0                	add    %edx,%eax
    9807:	c1 e0 04             	shl    $0x4,%eax
    980a:	89 c2                	mov    %eax,%edx
    980c:	8b 45 0c             	mov    0xc(%ebp),%eax
    980f:	01 c2                	add    %eax,%edx
    9811:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9814:	dd 04 c2             	fldl   (%edx,%eax,8)
    9817:	d9 e0                	fchs   
    9819:	8b 45 f4             	mov    -0xc(%ebp),%eax
    981c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    981f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9823:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9827:	0f 8e 86 f9 ff ff    	jle    91b3 <III_dequantize_sample+0xc2>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    982d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9831:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    9835:	0f 8e 6c f9 ff ff    	jle    91a7 <III_dequantize_sample+0xb6>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    983b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    983e:	c9                   	leave  
    983f:	c3                   	ret    

00009840 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9840:	55                   	push   %ebp
    9841:	89 e5                	mov    %esp,%ebp
    9843:	57                   	push   %edi
    9844:	56                   	push   %esi
    9845:	53                   	push   %ebx
    9846:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    9849:	8b 45 14             	mov    0x14(%ebp),%eax
    984c:	8b 00                	mov    (%eax),%eax
    984e:	8b 40 10             	mov    0x10(%eax),%eax
    9851:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    9854:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    985b:	eb 33                	jmp    9890 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    985d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9864:	eb 20                	jmp    9886 <III_reorder+0x46>
         ro[sb][ss] = 0;
    9866:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9869:	89 d0                	mov    %edx,%eax
    986b:	c1 e0 03             	shl    $0x3,%eax
    986e:	01 d0                	add    %edx,%eax
    9870:	c1 e0 04             	shl    $0x4,%eax
    9873:	89 c2                	mov    %eax,%edx
    9875:	8b 45 0c             	mov    0xc(%ebp),%eax
    9878:	01 c2                	add    %eax,%edx
    987a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    987d:	d9 ee                	fldz   
    987f:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    9882:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    9886:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    988a:	7e da                	jle    9866 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    988c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9890:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    9894:	7e c7                	jle    985d <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    9896:	8b 45 10             	mov    0x10(%ebp),%eax
    9899:	8b 40 10             	mov    0x10(%eax),%eax
    989c:	85 c0                	test   %eax,%eax
    989e:	0f 84 b8 03 00 00    	je     9c5c <III_reorder+0x41c>
    98a4:	8b 45 10             	mov    0x10(%ebp),%eax
    98a7:	8b 40 14             	mov    0x14(%eax),%eax
    98aa:	83 f8 02             	cmp    $0x2,%eax
    98ad:	0f 85 a9 03 00 00    	jne    9c5c <III_reorder+0x41c>
      if (gr_info->mixed_block_flag) {
    98b3:	8b 45 10             	mov    0x10(%ebp),%eax
    98b6:	8b 40 18             	mov    0x18(%eax),%eax
    98b9:	85 c0                	test   %eax,%eax
    98bb:	0f 84 06 02 00 00    	je     9ac7 <III_reorder+0x287>
         for (sb=0 ; sb < 2 ; sb++)
    98c1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    98c8:	eb 4c                	jmp    9916 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    98ca:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    98d1:	eb 39                	jmp    990c <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    98d3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    98d6:	89 d0                	mov    %edx,%eax
    98d8:	c1 e0 03             	shl    $0x3,%eax
    98db:	01 d0                	add    %edx,%eax
    98dd:	c1 e0 04             	shl    $0x4,%eax
    98e0:	89 c2                	mov    %eax,%edx
    98e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    98e5:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    98e8:	8b 55 e0             	mov    -0x20(%ebp),%edx
    98eb:	89 d0                	mov    %edx,%eax
    98ed:	c1 e0 03             	shl    $0x3,%eax
    98f0:	01 d0                	add    %edx,%eax
    98f2:	c1 e0 04             	shl    $0x4,%eax
    98f5:	89 c2                	mov    %eax,%edx
    98f7:	8b 45 08             	mov    0x8(%ebp),%eax
    98fa:	01 c2                	add    %eax,%edx
    98fc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    98ff:	dd 04 c2             	fldl   (%edx,%eax,8)
    9902:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9905:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    9908:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    990c:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9910:	7e c1                	jle    98d3 <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    9912:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9916:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    991a:	7e ae                	jle    98ca <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    991c:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    9923:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9926:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    992c:	83 c0 5c             	add    $0x5c,%eax
    992f:	05 80 04 01 00       	add    $0x10480,%eax
    9934:	8b 40 0c             	mov    0xc(%eax),%eax
    9937:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    993a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    993d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9943:	83 c0 60             	add    $0x60,%eax
    9946:	05 80 04 01 00       	add    $0x10480,%eax
    994b:	8b 40 0c             	mov    0xc(%eax),%eax
    994e:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9951:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    9954:	e9 5f 01 00 00       	jmp    9ab8 <III_reorder+0x278>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9959:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    9960:	e9 fd 00 00 00       	jmp    9a62 <III_reorder+0x222>
                  for(freq=0;freq<sfb_lines;freq++) {
    9965:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    996c:	e9 e1 00 00 00       	jmp    9a52 <III_reorder+0x212>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    9971:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9974:	89 d0                	mov    %edx,%eax
    9976:	01 c0                	add    %eax,%eax
    9978:	01 c2                	add    %eax,%edx
    997a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    997d:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    9981:	01 c2                	add    %eax,%edx
    9983:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9986:	01 d0                	add    %edx,%eax
    9988:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    998b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    998e:	89 d0                	mov    %edx,%eax
    9990:	01 c0                	add    %eax,%eax
    9992:	01 c2                	add    %eax,%edx
    9994:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9997:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    999a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    999d:	89 d0                	mov    %edx,%eax
    999f:	01 c0                	add    %eax,%eax
    99a1:	01 d0                	add    %edx,%eax
    99a3:	01 c8                	add    %ecx,%eax
    99a5:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    99a8:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    99ab:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    99b0:	89 c8                	mov    %ecx,%eax
    99b2:	f7 ea                	imul   %edx
    99b4:	c1 fa 02             	sar    $0x2,%edx
    99b7:	89 c8                	mov    %ecx,%eax
    99b9:	c1 f8 1f             	sar    $0x1f,%eax
    99bc:	29 c2                	sub    %eax,%edx
    99be:	89 d0                	mov    %edx,%eax
    99c0:	89 c2                	mov    %eax,%edx
    99c2:	89 d0                	mov    %edx,%eax
    99c4:	c1 e0 03             	shl    $0x3,%eax
    99c7:	01 d0                	add    %edx,%eax
    99c9:	c1 e0 04             	shl    $0x4,%eax
    99cc:	89 c2                	mov    %eax,%edx
    99ce:	8b 45 0c             	mov    0xc(%ebp),%eax
    99d1:	8d 34 02             	lea    (%edx,%eax,1),%esi
    99d4:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    99d7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    99dc:	89 d8                	mov    %ebx,%eax
    99de:	f7 ea                	imul   %edx
    99e0:	c1 fa 02             	sar    $0x2,%edx
    99e3:	89 d8                	mov    %ebx,%eax
    99e5:	c1 f8 1f             	sar    $0x1f,%eax
    99e8:	89 d1                	mov    %edx,%ecx
    99ea:	29 c1                	sub    %eax,%ecx
    99ec:	89 c8                	mov    %ecx,%eax
    99ee:	c1 e0 03             	shl    $0x3,%eax
    99f1:	01 c8                	add    %ecx,%eax
    99f3:	01 c0                	add    %eax,%eax
    99f5:	29 c3                	sub    %eax,%ebx
    99f7:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    99f9:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    99fc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a01:	89 d8                	mov    %ebx,%eax
    9a03:	f7 ea                	imul   %edx
    9a05:	c1 fa 02             	sar    $0x2,%edx
    9a08:	89 d8                	mov    %ebx,%eax
    9a0a:	c1 f8 1f             	sar    $0x1f,%eax
    9a0d:	29 c2                	sub    %eax,%edx
    9a0f:	89 d0                	mov    %edx,%eax
    9a11:	89 c2                	mov    %eax,%edx
    9a13:	89 d0                	mov    %edx,%eax
    9a15:	c1 e0 03             	shl    $0x3,%eax
    9a18:	01 d0                	add    %edx,%eax
    9a1a:	c1 e0 04             	shl    $0x4,%eax
    9a1d:	89 c2                	mov    %eax,%edx
    9a1f:	8b 45 08             	mov    0x8(%ebp),%eax
    9a22:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9a25:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9a28:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a2d:	89 d8                	mov    %ebx,%eax
    9a2f:	f7 ea                	imul   %edx
    9a31:	c1 fa 02             	sar    $0x2,%edx
    9a34:	89 d8                	mov    %ebx,%eax
    9a36:	c1 f8 1f             	sar    $0x1f,%eax
    9a39:	29 c2                	sub    %eax,%edx
    9a3b:	89 d0                	mov    %edx,%eax
    9a3d:	c1 e0 03             	shl    $0x3,%eax
    9a40:	01 d0                	add    %edx,%eax
    9a42:	01 c0                	add    %eax,%eax
    9a44:	29 c3                	sub    %eax,%ebx
    9a46:	89 da                	mov    %ebx,%edx
    9a48:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9a4b:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    9a4e:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    9a52:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9a55:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    9a58:	0f 8c 13 ff ff ff    	jl     9971 <III_reorder+0x131>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9a5e:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    9a62:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    9a66:	0f 8e f9 fe ff ff    	jle    9965 <III_reorder+0x125>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    9a6c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9a70:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9a73:	89 d0                	mov    %edx,%eax
    9a75:	c1 e0 03             	shl    $0x3,%eax
    9a78:	01 d0                	add    %edx,%eax
    9a7a:	c1 e0 02             	shl    $0x2,%eax
    9a7d:	01 d0                	add    %edx,%eax
    9a7f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9a82:	01 d0                	add    %edx,%eax
    9a84:	83 c0 14             	add    $0x14,%eax
    9a87:	8b 04 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%eax
    9a8e:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    9a91:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9a94:	8d 48 01             	lea    0x1(%eax),%ecx
    9a97:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9a9a:	89 d0                	mov    %edx,%eax
    9a9c:	c1 e0 03             	shl    $0x3,%eax
    9a9f:	01 d0                	add    %edx,%eax
    9aa1:	c1 e0 02             	shl    $0x2,%eax
    9aa4:	01 d0                	add    %edx,%eax
    9aa6:	01 c8                	add    %ecx,%eax
    9aa8:	83 c0 14             	add    $0x14,%eax
    9aab:	8b 04 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%eax
    9ab2:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9ab5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    9ab8:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    9abc:	0f 8e 97 fe ff ff    	jle    9959 <III_reorder+0x119>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    9ac2:	e9 f0 01 00 00       	jmp    9cb7 <III_reorder+0x477>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    9ac7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9ace:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9ad5:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9ad8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9ade:	83 c0 54             	add    $0x54,%eax
    9ae1:	05 80 04 01 00       	add    $0x10480,%eax
    9ae6:	8b 40 0c             	mov    0xc(%eax),%eax
    9ae9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    9aec:	e9 5f 01 00 00       	jmp    9c50 <III_reorder+0x410>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9af1:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    9af8:	e9 fd 00 00 00       	jmp    9bfa <III_reorder+0x3ba>
                  for(freq=0;freq<sfb_lines;freq++) {
    9afd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    9b04:	e9 e1 00 00 00       	jmp    9bea <III_reorder+0x3aa>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    9b09:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b0c:	89 d0                	mov    %edx,%eax
    9b0e:	01 c0                	add    %eax,%eax
    9b10:	01 c2                	add    %eax,%edx
    9b12:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9b15:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    9b19:	01 c2                	add    %eax,%edx
    9b1b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9b1e:	01 d0                	add    %edx,%eax
    9b20:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    9b23:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b26:	89 d0                	mov    %edx,%eax
    9b28:	01 c0                	add    %eax,%eax
    9b2a:	01 c2                	add    %eax,%edx
    9b2c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9b2f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9b32:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    9b35:	89 d0                	mov    %edx,%eax
    9b37:	01 c0                	add    %eax,%eax
    9b39:	01 d0                	add    %edx,%eax
    9b3b:	01 c8                	add    %ecx,%eax
    9b3d:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9b40:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    9b43:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9b48:	89 c8                	mov    %ecx,%eax
    9b4a:	f7 ea                	imul   %edx
    9b4c:	c1 fa 02             	sar    $0x2,%edx
    9b4f:	89 c8                	mov    %ecx,%eax
    9b51:	c1 f8 1f             	sar    $0x1f,%eax
    9b54:	29 c2                	sub    %eax,%edx
    9b56:	89 d0                	mov    %edx,%eax
    9b58:	89 c2                	mov    %eax,%edx
    9b5a:	89 d0                	mov    %edx,%eax
    9b5c:	c1 e0 03             	shl    $0x3,%eax
    9b5f:	01 d0                	add    %edx,%eax
    9b61:	c1 e0 04             	shl    $0x4,%eax
    9b64:	89 c2                	mov    %eax,%edx
    9b66:	8b 45 0c             	mov    0xc(%ebp),%eax
    9b69:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9b6c:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    9b6f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9b74:	89 d8                	mov    %ebx,%eax
    9b76:	f7 ea                	imul   %edx
    9b78:	c1 fa 02             	sar    $0x2,%edx
    9b7b:	89 d8                	mov    %ebx,%eax
    9b7d:	c1 f8 1f             	sar    $0x1f,%eax
    9b80:	89 d1                	mov    %edx,%ecx
    9b82:	29 c1                	sub    %eax,%ecx
    9b84:	89 c8                	mov    %ecx,%eax
    9b86:	c1 e0 03             	shl    $0x3,%eax
    9b89:	01 c8                	add    %ecx,%eax
    9b8b:	01 c0                	add    %eax,%eax
    9b8d:	29 c3                	sub    %eax,%ebx
    9b8f:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    9b91:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9b94:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9b99:	89 d8                	mov    %ebx,%eax
    9b9b:	f7 ea                	imul   %edx
    9b9d:	c1 fa 02             	sar    $0x2,%edx
    9ba0:	89 d8                	mov    %ebx,%eax
    9ba2:	c1 f8 1f             	sar    $0x1f,%eax
    9ba5:	29 c2                	sub    %eax,%edx
    9ba7:	89 d0                	mov    %edx,%eax
    9ba9:	89 c2                	mov    %eax,%edx
    9bab:	89 d0                	mov    %edx,%eax
    9bad:	c1 e0 03             	shl    $0x3,%eax
    9bb0:	01 d0                	add    %edx,%eax
    9bb2:	c1 e0 04             	shl    $0x4,%eax
    9bb5:	89 c2                	mov    %eax,%edx
    9bb7:	8b 45 08             	mov    0x8(%ebp),%eax
    9bba:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9bbd:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9bc0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9bc5:	89 d8                	mov    %ebx,%eax
    9bc7:	f7 ea                	imul   %edx
    9bc9:	c1 fa 02             	sar    $0x2,%edx
    9bcc:	89 d8                	mov    %ebx,%eax
    9bce:	c1 f8 1f             	sar    $0x1f,%eax
    9bd1:	29 c2                	sub    %eax,%edx
    9bd3:	89 d0                	mov    %edx,%eax
    9bd5:	c1 e0 03             	shl    $0x3,%eax
    9bd8:	01 d0                	add    %edx,%eax
    9bda:	01 c0                	add    %eax,%eax
    9bdc:	29 c3                	sub    %eax,%ebx
    9bde:	89 da                	mov    %ebx,%edx
    9be0:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9be3:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    9be6:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    9bea:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9bed:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    9bf0:	0f 8c 13 ff ff ff    	jl     9b09 <III_reorder+0x2c9>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9bf6:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    9bfa:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    9bfe:	0f 8e f9 fe ff ff    	jle    9afd <III_reorder+0x2bd>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    9c04:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9c08:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9c0b:	89 d0                	mov    %edx,%eax
    9c0d:	c1 e0 03             	shl    $0x3,%eax
    9c10:	01 d0                	add    %edx,%eax
    9c12:	c1 e0 02             	shl    $0x2,%eax
    9c15:	01 d0                	add    %edx,%eax
    9c17:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9c1a:	01 d0                	add    %edx,%eax
    9c1c:	83 c0 14             	add    $0x14,%eax
    9c1f:	8b 04 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%eax
    9c26:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    9c29:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9c2c:	8d 48 01             	lea    0x1(%eax),%ecx
    9c2f:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9c32:	89 d0                	mov    %edx,%eax
    9c34:	c1 e0 03             	shl    $0x3,%eax
    9c37:	01 d0                	add    %edx,%eax
    9c39:	c1 e0 02             	shl    $0x2,%eax
    9c3c:	01 d0                	add    %edx,%eax
    9c3e:	01 c8                	add    %ecx,%eax
    9c40:	83 c0 14             	add    $0x14,%eax
    9c43:	8b 04 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%eax
    9c4a:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9c4d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    9c50:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    9c54:	0f 8e 97 fe ff ff    	jle    9af1 <III_reorder+0x2b1>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    9c5a:	eb 5b                	jmp    9cb7 <III_reorder+0x477>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9c5c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9c63:	eb 4c                	jmp    9cb1 <III_reorder+0x471>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    9c65:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9c6c:	eb 39                	jmp    9ca7 <III_reorder+0x467>
            ro[sb][ss] = xr[sb][ss];
    9c6e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9c71:	89 d0                	mov    %edx,%eax
    9c73:	c1 e0 03             	shl    $0x3,%eax
    9c76:	01 d0                	add    %edx,%eax
    9c78:	c1 e0 04             	shl    $0x4,%eax
    9c7b:	89 c2                	mov    %eax,%edx
    9c7d:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c80:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9c83:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9c86:	89 d0                	mov    %edx,%eax
    9c88:	c1 e0 03             	shl    $0x3,%eax
    9c8b:	01 d0                	add    %edx,%eax
    9c8d:	c1 e0 04             	shl    $0x4,%eax
    9c90:	89 c2                	mov    %eax,%edx
    9c92:	8b 45 08             	mov    0x8(%ebp),%eax
    9c95:	01 c2                	add    %eax,%edx
    9c97:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9c9a:	dd 04 c2             	fldl   (%edx,%eax,8)
    9c9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9ca0:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    9ca3:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    9ca7:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9cab:	7e c1                	jle    9c6e <III_reorder+0x42e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9cad:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9cb1:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    9cb5:	7e ae                	jle    9c65 <III_reorder+0x425>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    9cb7:	83 c4 34             	add    $0x34,%esp
    9cba:	5b                   	pop    %ebx
    9cbb:	5e                   	pop    %esi
    9cbc:	5f                   	pop    %edi
    9cbd:	5d                   	pop    %ebp
    9cbe:	c3                   	ret    

00009cbf <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9cbf:	55                   	push   %ebp
    9cc0:	89 e5                	mov    %esp,%ebp
    9cc2:	56                   	push   %esi
    9cc3:	53                   	push   %ebx
    9cc4:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    9cca:	8b 45 18             	mov    0x18(%ebp),%eax
    9ccd:	8b 00                	mov    (%eax),%eax
    9ccf:	8b 40 10             	mov    0x10(%eax),%eax
    9cd2:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    9cd5:	8b 45 18             	mov    0x18(%ebp),%eax
    9cd8:	8b 40 08             	mov    0x8(%eax),%eax
    9cdb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9cde:	8b 45 18             	mov    0x18(%ebp),%eax
    9ce1:	8b 00                	mov    (%eax),%eax
    9ce3:	8b 40 1c             	mov    0x1c(%eax),%eax
    9ce6:	83 f8 01             	cmp    $0x1,%eax
    9ce9:	75 16                	jne    9d01 <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    9ceb:	8b 45 18             	mov    0x18(%ebp),%eax
    9cee:	8b 00                	mov    (%eax),%eax
    9cf0:	8b 40 20             	mov    0x20(%eax),%eax
    9cf3:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9cf6:	85 c0                	test   %eax,%eax
    9cf8:	74 07                	je     9d01 <III_stereo+0x42>
    9cfa:	b8 01 00 00 00       	mov    $0x1,%eax
    9cff:	eb 05                	jmp    9d06 <III_stereo+0x47>
    9d01:	b8 00 00 00 00       	mov    $0x0,%eax
    9d06:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9d09:	8b 45 18             	mov    0x18(%ebp),%eax
    9d0c:	8b 00                	mov    (%eax),%eax
    9d0e:	8b 40 1c             	mov    0x1c(%eax),%eax
    9d11:	83 f8 01             	cmp    $0x1,%eax
    9d14:	75 16                	jne    9d2c <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    9d16:	8b 45 18             	mov    0x18(%ebp),%eax
    9d19:	8b 00                	mov    (%eax),%eax
    9d1b:	8b 40 20             	mov    0x20(%eax),%eax
    9d1e:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9d21:	85 c0                	test   %eax,%eax
    9d23:	74 07                	je     9d2c <III_stereo+0x6d>
    9d25:	b8 01 00 00 00       	mov    $0x1,%eax
    9d2a:	eb 05                	jmp    9d31 <III_stereo+0x72>
    9d2c:	b8 00 00 00 00       	mov    $0x0,%eax
    9d31:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9d34:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9d3b:	eb 12                	jmp    9d4f <III_stereo+0x90>
      is_pos[i] = 7;
    9d3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d40:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    9d47:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9d4b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9d4f:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    9d56:	7e e5                	jle    9d3d <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    9d58:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    9d5c:	0f 85 65 0a 00 00    	jne    a7c7 <III_stereo+0xb08>
    9d62:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9d66:	0f 84 5b 0a 00 00    	je     a7c7 <III_stereo+0xb08>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    9d6c:	8b 45 14             	mov    0x14(%ebp),%eax
    9d6f:	8b 40 10             	mov    0x10(%eax),%eax
    9d72:	85 c0                	test   %eax,%eax
    9d74:	0f 84 4d 08 00 00    	je     a5c7 <III_stereo+0x908>
    9d7a:	8b 45 14             	mov    0x14(%ebp),%eax
    9d7d:	8b 40 14             	mov    0x14(%eax),%eax
    9d80:	83 f8 02             	cmp    $0x2,%eax
    9d83:	0f 85 3e 08 00 00    	jne    a5c7 <III_stereo+0x908>
      {  if( gr_info->mixed_block_flag )
    9d89:	8b 45 14             	mov    0x14(%ebp),%eax
    9d8c:	8b 40 18             	mov    0x18(%eax),%eax
    9d8f:	85 c0                	test   %eax,%eax
    9d91:	0f 84 f1 04 00 00    	je     a288 <III_stereo+0x5c9>
         {  int max_sfb = 0;
    9d97:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    9d9e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9da5:	e9 32 03 00 00       	jmp    a0dc <III_stereo+0x41d>
            {  int sfbcnt;
               sfbcnt = 2;
    9daa:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    9db1:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9db8:	e9 0f 01 00 00       	jmp    9ecc <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9dbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9dc0:	8d 48 01             	lea    0x1(%eax),%ecx
    9dc3:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9dc6:	89 d0                	mov    %edx,%eax
    9dc8:	c1 e0 03             	shl    $0x3,%eax
    9dcb:	01 d0                	add    %edx,%eax
    9dcd:	c1 e0 02             	shl    $0x2,%eax
    9dd0:	01 d0                	add    %edx,%eax
    9dd2:	01 c8                	add    %ecx,%eax
    9dd4:	83 c0 14             	add    $0x14,%eax
    9dd7:	8b 0c 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%ecx
    9dde:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9de1:	89 d0                	mov    %edx,%eax
    9de3:	c1 e0 03             	shl    $0x3,%eax
    9de6:	01 d0                	add    %edx,%eax
    9de8:	c1 e0 02             	shl    $0x2,%eax
    9deb:	01 d0                	add    %edx,%eax
    9ded:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9df0:	01 d0                	add    %edx,%eax
    9df2:	83 c0 14             	add    $0x14,%eax
    9df5:	8b 04 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%eax
    9dfc:	29 c1                	sub    %eax,%ecx
    9dfe:	89 c8                	mov    %ecx,%eax
    9e00:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    9e03:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9e06:	89 d0                	mov    %edx,%eax
    9e08:	c1 e0 03             	shl    $0x3,%eax
    9e0b:	01 d0                	add    %edx,%eax
    9e0d:	c1 e0 02             	shl    $0x2,%eax
    9e10:	01 d0                	add    %edx,%eax
    9e12:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9e15:	01 d0                	add    %edx,%eax
    9e17:	83 c0 14             	add    $0x14,%eax
    9e1a:	8b 14 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%edx
    9e21:	89 d0                	mov    %edx,%eax
    9e23:	01 c0                	add    %eax,%eax
    9e25:	01 c2                	add    %eax,%edx
    9e27:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e2a:	83 c0 01             	add    $0x1,%eax
    9e2d:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    9e31:	01 d0                	add    %edx,%eax
    9e33:	83 e8 01             	sub    $0x1,%eax
    9e36:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9e39:	e9 80 00 00 00       	jmp    9ebe <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9e3e:	8b 45 08             	mov    0x8(%ebp),%eax
    9e41:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9e47:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9e4a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9e4f:	89 c8                	mov    %ecx,%eax
    9e51:	f7 ea                	imul   %edx
    9e53:	c1 fa 02             	sar    $0x2,%edx
    9e56:	89 c8                	mov    %ecx,%eax
    9e58:	c1 f8 1f             	sar    $0x1f,%eax
    9e5b:	89 d3                	mov    %edx,%ebx
    9e5d:	29 c3                	sub    %eax,%ebx
    9e5f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9e62:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9e67:	89 c8                	mov    %ecx,%eax
    9e69:	f7 ea                	imul   %edx
    9e6b:	c1 fa 02             	sar    $0x2,%edx
    9e6e:	89 c8                	mov    %ecx,%eax
    9e70:	c1 f8 1f             	sar    $0x1f,%eax
    9e73:	29 c2                	sub    %eax,%edx
    9e75:	89 d0                	mov    %edx,%eax
    9e77:	c1 e0 03             	shl    $0x3,%eax
    9e7a:	01 d0                	add    %edx,%eax
    9e7c:	01 c0                	add    %eax,%eax
    9e7e:	29 c1                	sub    %eax,%ecx
    9e80:	89 ca                	mov    %ecx,%edx
    9e82:	89 d8                	mov    %ebx,%eax
    9e84:	c1 e0 03             	shl    $0x3,%eax
    9e87:	01 d8                	add    %ebx,%eax
    9e89:	01 c0                	add    %eax,%eax
    9e8b:	01 d0                	add    %edx,%eax
    9e8d:	dd 04 c6             	fldl   (%esi,%eax,8)
    9e90:	d9 ee                	fldz   
    9e92:	df e9                	fucomip %st(1),%st
    9e94:	7a 0a                	jp     9ea0 <III_stereo+0x1e1>
    9e96:	d9 ee                	fldz   
    9e98:	df e9                	fucomip %st(1),%st
    9e9a:	dd d8                	fstp   %st(0)
    9e9c:	74 18                	je     9eb6 <III_stereo+0x1f7>
    9e9e:	eb 02                	jmp    9ea2 <III_stereo+0x1e3>
    9ea0:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    9ea2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9ea5:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    9ea8:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    9eaf:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    9eb6:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    9eba:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    9ebe:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    9ec2:	0f 8f 76 ff ff ff    	jg     9e3e <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    9ec8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    9ecc:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    9ed0:	0f 8f e7 fe ff ff    	jg     9dbd <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    9ed6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9ed9:	83 c0 01             	add    $0x1,%eax
    9edc:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    9edf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9ee2:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9ee5:	7e 06                	jle    9eed <III_stereo+0x22e>
                  max_sfb = sfb;
    9ee7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9eea:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    9eed:	e9 fa 00 00 00       	jmp    9fec <III_stereo+0x32d>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9ef2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9ef5:	8d 48 01             	lea    0x1(%eax),%ecx
    9ef8:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9efb:	89 d0                	mov    %edx,%eax
    9efd:	c1 e0 03             	shl    $0x3,%eax
    9f00:	01 d0                	add    %edx,%eax
    9f02:	c1 e0 02             	shl    $0x2,%eax
    9f05:	01 d0                	add    %edx,%eax
    9f07:	01 c8                	add    %ecx,%eax
    9f09:	83 c0 14             	add    $0x14,%eax
    9f0c:	8b 0c 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%ecx
    9f13:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9f16:	89 d0                	mov    %edx,%eax
    9f18:	c1 e0 03             	shl    $0x3,%eax
    9f1b:	01 d0                	add    %edx,%eax
    9f1d:	c1 e0 02             	shl    $0x2,%eax
    9f20:	01 d0                	add    %edx,%eax
    9f22:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9f25:	01 d0                	add    %edx,%eax
    9f27:	83 c0 14             	add    $0x14,%eax
    9f2a:	8b 04 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%eax
    9f31:	29 c1                	sub    %eax,%ecx
    9f33:	89 c8                	mov    %ecx,%eax
    9f35:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9f38:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9f3b:	89 d0                	mov    %edx,%eax
    9f3d:	c1 e0 03             	shl    $0x3,%eax
    9f40:	01 d0                	add    %edx,%eax
    9f42:	c1 e0 02             	shl    $0x2,%eax
    9f45:	01 d0                	add    %edx,%eax
    9f47:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9f4a:	01 d0                	add    %edx,%eax
    9f4c:	83 c0 14             	add    $0x14,%eax
    9f4f:	8b 14 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%edx
    9f56:	89 d0                	mov    %edx,%eax
    9f58:	01 c0                	add    %eax,%eax
    9f5a:	01 c2                	add    %eax,%edx
    9f5c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9f5f:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9f63:	01 d0                	add    %edx,%eax
    9f65:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    9f68:	eb 78                	jmp    9fe2 <III_stereo+0x323>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    9f6a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9f6d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9f70:	89 d0                	mov    %edx,%eax
    9f72:	01 c0                	add    %eax,%eax
    9f74:	01 d0                	add    %edx,%eax
    9f76:	c1 e0 02             	shl    $0x2,%eax
    9f79:	01 d0                	add    %edx,%eax
    9f7b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9f7e:	01 d0                	add    %edx,%eax
    9f80:	83 c0 52             	add    $0x52,%eax
    9f83:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    9f87:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f8a:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    9f91:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f94:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9f9b:	83 f8 07             	cmp    $0x7,%eax
    9f9e:	74 3a                	je     9fda <III_stereo+0x31b>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9fa0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9fa3:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9faa:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9fb0:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9fb6:	dd 05 c0 e7 00 00    	fldl   0xe7c0
    9fbc:	de c9                	fmulp  %st,%st(1)
    9fbe:	83 ec 08             	sub    $0x8,%esp
    9fc1:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9fc5:	dd 1c 24             	fstpl  (%esp)
    9fc8:	e8 60 b6 ff ff       	call   562d <tan>
    9fcd:	83 c4 10             	add    $0x10,%esp
    9fd0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9fd3:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    9fda:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    9fde:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9fe2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9fe6:	7f 82                	jg     9f6a <III_stereo+0x2ab>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    9fe8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    9fec:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9ff0:	0f 8e fc fe ff ff    	jle    9ef2 <III_stereo+0x233>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    9ff6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9ff9:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9fff:	83 c0 7c             	add    $0x7c,%eax
    a002:	05 80 04 01 00       	add    $0x10480,%eax
    a007:	8b 50 0c             	mov    0xc(%eax),%edx
    a00a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a00d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a013:	83 c0 78             	add    $0x78,%eax
    a016:	05 80 04 01 00       	add    $0x10480,%eax
    a01b:	8b 40 0c             	mov    0xc(%eax),%eax
    a01e:	29 c2                	sub    %eax,%edx
    a020:	89 d0                	mov    %edx,%eax
    a022:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    a025:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a028:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a02e:	83 c0 78             	add    $0x78,%eax
    a031:	05 80 04 01 00       	add    $0x10480,%eax
    a036:	8b 50 0c             	mov    0xc(%eax),%edx
    a039:	89 d0                	mov    %edx,%eax
    a03b:	01 c0                	add    %eax,%eax
    a03d:	01 c2                	add    %eax,%edx
    a03f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a042:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a046:	01 d0                	add    %edx,%eax
    a048:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    a04b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a04e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a054:	83 e8 80             	sub    $0xffffff80,%eax
    a057:	05 80 04 01 00       	add    $0x10480,%eax
    a05c:	8b 50 0c             	mov    0xc(%eax),%edx
    a05f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a062:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a068:	83 c0 7c             	add    $0x7c,%eax
    a06b:	05 80 04 01 00       	add    $0x10480,%eax
    a070:	8b 40 0c             	mov    0xc(%eax),%eax
    a073:	29 c2                	sub    %eax,%edx
    a075:	89 d0                	mov    %edx,%eax
    a077:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    a07a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a07d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a083:	83 c0 7c             	add    $0x7c,%eax
    a086:	05 80 04 01 00       	add    $0x10480,%eax
    a08b:	8b 50 0c             	mov    0xc(%eax),%edx
    a08e:	89 d0                	mov    %edx,%eax
    a090:	01 c0                	add    %eax,%eax
    a092:	01 c2                	add    %eax,%edx
    a094:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a097:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a09b:	01 d0                	add    %edx,%eax
    a09d:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    a0a0:	eb 30                	jmp    a0d2 <III_stereo+0x413>
               {  is_pos[i] = is_pos[sfb];
    a0a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0a5:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a0ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a0af:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    a0b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0b9:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a0c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a0c3:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    a0ca:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    a0ce:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a0d2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a0d6:	7f ca                	jg     a0a2 <III_stereo+0x3e3>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    a0d8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a0dc:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    a0e0:	0f 8e c4 fc ff ff    	jle    9daa <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    a0e6:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    a0ea:	0f 8f 93 01 00 00    	jg     a283 <III_stereo+0x5c4>
             {  i = 2;
    a0f0:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    a0f7:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    a0fe:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    a105:	eb 63                	jmp    a16a <III_stereo+0x4ab>
                {  if ( xr[1][i][ss] != 0.0 )
    a107:	8b 45 08             	mov    0x8(%ebp),%eax
    a10a:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a110:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a113:	89 d0                	mov    %edx,%eax
    a115:	c1 e0 03             	shl    $0x3,%eax
    a118:	01 d0                	add    %edx,%eax
    a11a:	01 c0                	add    %eax,%eax
    a11c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a11f:	01 d0                	add    %edx,%eax
    a121:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a124:	d9 ee                	fldz   
    a126:	df e9                	fucomip %st(1),%st
    a128:	7a 0a                	jp     a134 <III_stereo+0x475>
    a12a:	d9 ee                	fldz   
    a12c:	df e9                	fucomip %st(1),%st
    a12e:	dd d8                	fstp   %st(0)
    a130:	74 23                	je     a155 <III_stereo+0x496>
    a132:	eb 02                	jmp    a136 <III_stereo+0x477>
    a134:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    a136:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a139:	89 d0                	mov    %edx,%eax
    a13b:	c1 e0 03             	shl    $0x3,%eax
    a13e:	01 d0                	add    %edx,%eax
    a140:	01 c0                	add    %eax,%eax
    a142:	89 c2                	mov    %eax,%edx
    a144:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a147:	01 d0                	add    %edx,%eax
    a149:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    a14c:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    a153:	eb 15                	jmp    a16a <III_stereo+0x4ab>
                   } else
                   {  ss--;
    a155:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    a159:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    a15d:	79 0b                	jns    a16a <III_stereo+0x4ab>
                      {  i--;
    a15f:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    a163:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    a16a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    a16e:	79 97                	jns    a107 <III_stereo+0x448>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    a170:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    a177:	eb 04                	jmp    a17d <III_stereo+0x4be>
                   i++;
    a179:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    a17d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a180:	89 d0                	mov    %edx,%eax
    a182:	c1 e0 03             	shl    $0x3,%eax
    a185:	01 d0                	add    %edx,%eax
    a187:	c1 e0 02             	shl    $0x2,%eax
    a18a:	01 d0                	add    %edx,%eax
    a18c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a18f:	01 d0                	add    %edx,%eax
    a191:	8b 04 85 80 04 01 00 	mov    0x10480(,%eax,4),%eax
    a198:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    a19b:	7e dc                	jle    a179 <III_stereo+0x4ba>
                   i++;
                sfb = i;
    a19d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a1a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    a1a3:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a1a6:	89 d0                	mov    %edx,%eax
    a1a8:	c1 e0 03             	shl    $0x3,%eax
    a1ab:	01 d0                	add    %edx,%eax
    a1ad:	c1 e0 02             	shl    $0x2,%eax
    a1b0:	01 d0                	add    %edx,%eax
    a1b2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a1b5:	01 d0                	add    %edx,%eax
    a1b7:	8b 04 85 80 04 01 00 	mov    0x10480(,%eax,4),%eax
    a1be:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    a1c1:	e9 b3 00 00 00       	jmp    a279 <III_stereo+0x5ba>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    a1c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a1c9:	8d 48 01             	lea    0x1(%eax),%ecx
    a1cc:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a1cf:	89 d0                	mov    %edx,%eax
    a1d1:	c1 e0 03             	shl    $0x3,%eax
    a1d4:	01 d0                	add    %edx,%eax
    a1d6:	c1 e0 02             	shl    $0x2,%eax
    a1d9:	01 d0                	add    %edx,%eax
    a1db:	01 c8                	add    %ecx,%eax
    a1dd:	8b 0c 85 80 04 01 00 	mov    0x10480(,%eax,4),%ecx
    a1e4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a1e7:	89 d0                	mov    %edx,%eax
    a1e9:	c1 e0 03             	shl    $0x3,%eax
    a1ec:	01 d0                	add    %edx,%eax
    a1ee:	c1 e0 02             	shl    $0x2,%eax
    a1f1:	01 d0                	add    %edx,%eax
    a1f3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a1f6:	01 d0                	add    %edx,%eax
    a1f8:	8b 04 85 80 04 01 00 	mov    0x10480(,%eax,4),%eax
    a1ff:	29 c1                	sub    %eax,%ecx
    a201:	89 c8                	mov    %ecx,%eax
    a203:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    a206:	eb 67                	jmp    a26f <III_stereo+0x5b0>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    a208:	8b 45 10             	mov    0x10(%ebp),%eax
    a20b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a20e:	83 c2 3e             	add    $0x3e,%edx
    a211:	8b 14 90             	mov    (%eax,%edx,4),%edx
    a214:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a217:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    a21e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a221:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a228:	83 f8 07             	cmp    $0x7,%eax
    a22b:	74 3a                	je     a267 <III_stereo+0x5a8>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a22d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a230:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a237:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a23d:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a243:	dd 05 c0 e7 00 00    	fldl   0xe7c0
    a249:	de c9                	fmulp  %st,%st(1)
    a24b:	83 ec 08             	sub    $0x8,%esp
    a24e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a252:	dd 1c 24             	fstpl  (%esp)
    a255:	e8 d3 b3 ff ff       	call   562d <tan>
    a25a:	83 c4 10             	add    $0x10,%esp
    a25d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a260:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    a267:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    a26b:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a26f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a273:	7f 93                	jg     a208 <III_stereo+0x549>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    a275:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a279:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    a27d:	0f 8e 43 ff ff ff    	jle    a1c6 <III_stereo+0x507>
    a283:	e9 3a 03 00 00       	jmp    a5c2 <III_stereo+0x903>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    a288:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a28f:	e9 24 03 00 00       	jmp    a5b8 <III_stereo+0x8f9>
            {  int sfbcnt;
               sfbcnt = -1;
    a294:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    a29b:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a2a2:	e9 0f 01 00 00       	jmp    a3b6 <III_stereo+0x6f7>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a2a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a2aa:	8d 48 01             	lea    0x1(%eax),%ecx
    a2ad:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a2b0:	89 d0                	mov    %edx,%eax
    a2b2:	c1 e0 03             	shl    $0x3,%eax
    a2b5:	01 d0                	add    %edx,%eax
    a2b7:	c1 e0 02             	shl    $0x2,%eax
    a2ba:	01 d0                	add    %edx,%eax
    a2bc:	01 c8                	add    %ecx,%eax
    a2be:	83 c0 14             	add    $0x14,%eax
    a2c1:	8b 0c 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%ecx
    a2c8:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a2cb:	89 d0                	mov    %edx,%eax
    a2cd:	c1 e0 03             	shl    $0x3,%eax
    a2d0:	01 d0                	add    %edx,%eax
    a2d2:	c1 e0 02             	shl    $0x2,%eax
    a2d5:	01 d0                	add    %edx,%eax
    a2d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a2da:	01 d0                	add    %edx,%eax
    a2dc:	83 c0 14             	add    $0x14,%eax
    a2df:	8b 04 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%eax
    a2e6:	29 c1                	sub    %eax,%ecx
    a2e8:	89 c8                	mov    %ecx,%eax
    a2ea:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    a2ed:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a2f0:	89 d0                	mov    %edx,%eax
    a2f2:	c1 e0 03             	shl    $0x3,%eax
    a2f5:	01 d0                	add    %edx,%eax
    a2f7:	c1 e0 02             	shl    $0x2,%eax
    a2fa:	01 d0                	add    %edx,%eax
    a2fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a2ff:	01 d0                	add    %edx,%eax
    a301:	83 c0 14             	add    $0x14,%eax
    a304:	8b 14 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%edx
    a30b:	89 d0                	mov    %edx,%eax
    a30d:	01 c0                	add    %eax,%eax
    a30f:	01 c2                	add    %eax,%edx
    a311:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a314:	83 c0 01             	add    $0x1,%eax
    a317:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    a31b:	01 d0                	add    %edx,%eax
    a31d:	83 e8 01             	sub    $0x1,%eax
    a320:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    a323:	e9 80 00 00 00       	jmp    a3a8 <III_stereo+0x6e9>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    a328:	8b 45 08             	mov    0x8(%ebp),%eax
    a32b:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    a331:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a334:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a339:	89 c8                	mov    %ecx,%eax
    a33b:	f7 ea                	imul   %edx
    a33d:	c1 fa 02             	sar    $0x2,%edx
    a340:	89 c8                	mov    %ecx,%eax
    a342:	c1 f8 1f             	sar    $0x1f,%eax
    a345:	89 d3                	mov    %edx,%ebx
    a347:	29 c3                	sub    %eax,%ebx
    a349:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a34c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a351:	89 c8                	mov    %ecx,%eax
    a353:	f7 ea                	imul   %edx
    a355:	c1 fa 02             	sar    $0x2,%edx
    a358:	89 c8                	mov    %ecx,%eax
    a35a:	c1 f8 1f             	sar    $0x1f,%eax
    a35d:	29 c2                	sub    %eax,%edx
    a35f:	89 d0                	mov    %edx,%eax
    a361:	c1 e0 03             	shl    $0x3,%eax
    a364:	01 d0                	add    %edx,%eax
    a366:	01 c0                	add    %eax,%eax
    a368:	29 c1                	sub    %eax,%ecx
    a36a:	89 ca                	mov    %ecx,%edx
    a36c:	89 d8                	mov    %ebx,%eax
    a36e:	c1 e0 03             	shl    $0x3,%eax
    a371:	01 d8                	add    %ebx,%eax
    a373:	01 c0                	add    %eax,%eax
    a375:	01 d0                	add    %edx,%eax
    a377:	dd 04 c6             	fldl   (%esi,%eax,8)
    a37a:	d9 ee                	fldz   
    a37c:	df e9                	fucomip %st(1),%st
    a37e:	7a 0a                	jp     a38a <III_stereo+0x6cb>
    a380:	d9 ee                	fldz   
    a382:	df e9                	fucomip %st(1),%st
    a384:	dd d8                	fstp   %st(0)
    a386:	74 18                	je     a3a0 <III_stereo+0x6e1>
    a388:	eb 02                	jmp    a38c <III_stereo+0x6cd>
    a38a:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    a38c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a38f:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    a392:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    a399:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    a3a0:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    a3a4:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    a3a8:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    a3ac:	0f 8f 76 ff ff ff    	jg     a328 <III_stereo+0x669>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    a3b2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    a3b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    a3ba:	0f 89 e7 fe ff ff    	jns    a2a7 <III_stereo+0x5e8>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    a3c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a3c3:	83 c0 01             	add    $0x1,%eax
    a3c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    a3c9:	e9 fa 00 00 00       	jmp    a4c8 <III_stereo+0x809>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a3ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a3d1:	8d 48 01             	lea    0x1(%eax),%ecx
    a3d4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a3d7:	89 d0                	mov    %edx,%eax
    a3d9:	c1 e0 03             	shl    $0x3,%eax
    a3dc:	01 d0                	add    %edx,%eax
    a3de:	c1 e0 02             	shl    $0x2,%eax
    a3e1:	01 d0                	add    %edx,%eax
    a3e3:	01 c8                	add    %ecx,%eax
    a3e5:	83 c0 14             	add    $0x14,%eax
    a3e8:	8b 0c 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%ecx
    a3ef:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a3f2:	89 d0                	mov    %edx,%eax
    a3f4:	c1 e0 03             	shl    $0x3,%eax
    a3f7:	01 d0                	add    %edx,%eax
    a3f9:	c1 e0 02             	shl    $0x2,%eax
    a3fc:	01 d0                	add    %edx,%eax
    a3fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a401:	01 d0                	add    %edx,%eax
    a403:	83 c0 14             	add    $0x14,%eax
    a406:	8b 04 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%eax
    a40d:	29 c1                	sub    %eax,%ecx
    a40f:	89 c8                	mov    %ecx,%eax
    a411:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    a414:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a417:	89 d0                	mov    %edx,%eax
    a419:	c1 e0 03             	shl    $0x3,%eax
    a41c:	01 d0                	add    %edx,%eax
    a41e:	c1 e0 02             	shl    $0x2,%eax
    a421:	01 d0                	add    %edx,%eax
    a423:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a426:	01 d0                	add    %edx,%eax
    a428:	83 c0 14             	add    $0x14,%eax
    a42b:	8b 14 85 8c 04 01 00 	mov    0x1048c(,%eax,4),%edx
    a432:	89 d0                	mov    %edx,%eax
    a434:	01 c0                	add    %eax,%eax
    a436:	01 c2                	add    %eax,%edx
    a438:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a43b:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a43f:	01 d0                	add    %edx,%eax
    a441:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    a444:	eb 78                	jmp    a4be <III_stereo+0x7ff>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    a446:	8b 4d 10             	mov    0x10(%ebp),%ecx
    a449:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a44c:	89 d0                	mov    %edx,%eax
    a44e:	01 c0                	add    %eax,%eax
    a450:	01 d0                	add    %edx,%eax
    a452:	c1 e0 02             	shl    $0x2,%eax
    a455:	01 d0                	add    %edx,%eax
    a457:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a45a:	01 d0                	add    %edx,%eax
    a45c:	83 c0 52             	add    $0x52,%eax
    a45f:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    a463:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a466:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    a46d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a470:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a477:	83 f8 07             	cmp    $0x7,%eax
    a47a:	74 3a                	je     a4b6 <III_stereo+0x7f7>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a47c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a47f:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a486:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a48c:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a492:	dd 05 c0 e7 00 00    	fldl   0xe7c0
    a498:	de c9                	fmulp  %st,%st(1)
    a49a:	83 ec 08             	sub    $0x8,%esp
    a49d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a4a1:	dd 1c 24             	fstpl  (%esp)
    a4a4:	e8 84 b1 ff ff       	call   562d <tan>
    a4a9:	83 c4 10             	add    $0x10,%esp
    a4ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a4af:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    a4b6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    a4ba:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a4be:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a4c2:	7f 82                	jg     a446 <III_stereo+0x787>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    a4c4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    a4c8:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a4cc:	0f 8e fc fe ff ff    	jle    a3ce <III_stereo+0x70f>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    a4d2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a4d5:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a4db:	83 c0 7c             	add    $0x7c,%eax
    a4de:	05 80 04 01 00       	add    $0x10480,%eax
    a4e3:	8b 50 0c             	mov    0xc(%eax),%edx
    a4e6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a4e9:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a4ef:	83 c0 78             	add    $0x78,%eax
    a4f2:	05 80 04 01 00       	add    $0x10480,%eax
    a4f7:	8b 40 0c             	mov    0xc(%eax),%eax
    a4fa:	29 c2                	sub    %eax,%edx
    a4fc:	89 d0                	mov    %edx,%eax
    a4fe:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    a501:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a504:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a50a:	83 c0 78             	add    $0x78,%eax
    a50d:	05 80 04 01 00       	add    $0x10480,%eax
    a512:	8b 50 0c             	mov    0xc(%eax),%edx
    a515:	89 d0                	mov    %edx,%eax
    a517:	01 c0                	add    %eax,%eax
    a519:	01 c2                	add    %eax,%edx
    a51b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a51e:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a522:	01 d0                	add    %edx,%eax
    a524:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    a527:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a52a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a530:	83 e8 80             	sub    $0xffffff80,%eax
    a533:	05 80 04 01 00       	add    $0x10480,%eax
    a538:	8b 50 0c             	mov    0xc(%eax),%edx
    a53b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a53e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a544:	83 c0 7c             	add    $0x7c,%eax
    a547:	05 80 04 01 00       	add    $0x10480,%eax
    a54c:	8b 40 0c             	mov    0xc(%eax),%eax
    a54f:	29 c2                	sub    %eax,%edx
    a551:	89 d0                	mov    %edx,%eax
    a553:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    a556:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a559:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a55f:	83 c0 7c             	add    $0x7c,%eax
    a562:	05 80 04 01 00       	add    $0x10480,%eax
    a567:	8b 50 0c             	mov    0xc(%eax),%edx
    a56a:	89 d0                	mov    %edx,%eax
    a56c:	01 c0                	add    %eax,%eax
    a56e:	01 c2                	add    %eax,%edx
    a570:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a573:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a577:	01 d0                	add    %edx,%eax
    a579:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    a57c:	eb 30                	jmp    a5ae <III_stereo+0x8ef>
               {  is_pos[i] = is_pos[sfb];
    a57e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a581:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a588:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a58b:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    a592:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a595:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a59c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a59f:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    a5a6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    a5aa:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a5ae:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a5b2:	7f ca                	jg     a57e <III_stereo+0x8bf>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    a5b4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a5b8:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    a5bc:	0f 8e d2 fc ff ff    	jle    a294 <III_stereo+0x5d5>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    a5c2:	e9 00 02 00 00       	jmp    a7c7 <III_stereo+0xb08>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    a5c7:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    a5ce:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    a5d5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    a5dc:	eb 63                	jmp    a641 <III_stereo+0x982>
         {  if ( xr[1][i][ss] != 0.0 )
    a5de:	8b 45 08             	mov    0x8(%ebp),%eax
    a5e1:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a5e7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a5ea:	89 d0                	mov    %edx,%eax
    a5ec:	c1 e0 03             	shl    $0x3,%eax
    a5ef:	01 d0                	add    %edx,%eax
    a5f1:	01 c0                	add    %eax,%eax
    a5f3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a5f6:	01 d0                	add    %edx,%eax
    a5f8:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a5fb:	d9 ee                	fldz   
    a5fd:	df e9                	fucomip %st(1),%st
    a5ff:	7a 0a                	jp     a60b <III_stereo+0x94c>
    a601:	d9 ee                	fldz   
    a603:	df e9                	fucomip %st(1),%st
    a605:	dd d8                	fstp   %st(0)
    a607:	74 23                	je     a62c <III_stereo+0x96d>
    a609:	eb 02                	jmp    a60d <III_stereo+0x94e>
    a60b:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    a60d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a610:	89 d0                	mov    %edx,%eax
    a612:	c1 e0 03             	shl    $0x3,%eax
    a615:	01 d0                	add    %edx,%eax
    a617:	01 c0                	add    %eax,%eax
    a619:	89 c2                	mov    %eax,%edx
    a61b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a61e:	01 d0                	add    %edx,%eax
    a620:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    a623:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    a62a:	eb 15                	jmp    a641 <III_stereo+0x982>
            } else
            {  ss--;
    a62c:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    a630:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    a634:	79 0b                	jns    a641 <III_stereo+0x982>
               {  i--;
    a636:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    a63a:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    a641:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    a645:	79 97                	jns    a5de <III_stereo+0x91f>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    a647:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    a64e:	eb 04                	jmp    a654 <III_stereo+0x995>
            i++;
    a650:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    a654:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a657:	89 d0                	mov    %edx,%eax
    a659:	c1 e0 03             	shl    $0x3,%eax
    a65c:	01 d0                	add    %edx,%eax
    a65e:	c1 e0 02             	shl    $0x2,%eax
    a661:	01 d0                	add    %edx,%eax
    a663:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a666:	01 d0                	add    %edx,%eax
    a668:	8b 04 85 80 04 01 00 	mov    0x10480(,%eax,4),%eax
    a66f:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    a672:	7e dc                	jle    a650 <III_stereo+0x991>
            i++;
         sfb = i;
    a674:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a677:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    a67a:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a67d:	89 d0                	mov    %edx,%eax
    a67f:	c1 e0 03             	shl    $0x3,%eax
    a682:	01 d0                	add    %edx,%eax
    a684:	c1 e0 02             	shl    $0x2,%eax
    a687:	01 d0                	add    %edx,%eax
    a689:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a68c:	01 d0                	add    %edx,%eax
    a68e:	8b 04 85 80 04 01 00 	mov    0x10480(,%eax,4),%eax
    a695:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    a698:	e9 b3 00 00 00       	jmp    a750 <III_stereo+0xa91>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    a69d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a6a0:	8d 48 01             	lea    0x1(%eax),%ecx
    a6a3:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a6a6:	89 d0                	mov    %edx,%eax
    a6a8:	c1 e0 03             	shl    $0x3,%eax
    a6ab:	01 d0                	add    %edx,%eax
    a6ad:	c1 e0 02             	shl    $0x2,%eax
    a6b0:	01 d0                	add    %edx,%eax
    a6b2:	01 c8                	add    %ecx,%eax
    a6b4:	8b 0c 85 80 04 01 00 	mov    0x10480(,%eax,4),%ecx
    a6bb:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a6be:	89 d0                	mov    %edx,%eax
    a6c0:	c1 e0 03             	shl    $0x3,%eax
    a6c3:	01 d0                	add    %edx,%eax
    a6c5:	c1 e0 02             	shl    $0x2,%eax
    a6c8:	01 d0                	add    %edx,%eax
    a6ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a6cd:	01 d0                	add    %edx,%eax
    a6cf:	8b 04 85 80 04 01 00 	mov    0x10480(,%eax,4),%eax
    a6d6:	29 c1                	sub    %eax,%ecx
    a6d8:	89 c8                	mov    %ecx,%eax
    a6da:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    a6dd:	eb 67                	jmp    a746 <III_stereo+0xa87>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    a6df:	8b 45 10             	mov    0x10(%ebp),%eax
    a6e2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a6e5:	83 c2 3e             	add    $0x3e,%edx
    a6e8:	8b 14 90             	mov    (%eax,%edx,4),%edx
    a6eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a6ee:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    a6f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a6f8:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a6ff:	83 f8 07             	cmp    $0x7,%eax
    a702:	74 3a                	je     a73e <III_stereo+0xa7f>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a704:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a707:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a70e:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a714:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a71a:	dd 05 c0 e7 00 00    	fldl   0xe7c0
    a720:	de c9                	fmulp  %st,%st(1)
    a722:	83 ec 08             	sub    $0x8,%esp
    a725:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a729:	dd 1c 24             	fstpl  (%esp)
    a72c:	e8 fc ae ff ff       	call   562d <tan>
    a731:	83 c4 10             	add    $0x10,%esp
    a734:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a737:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    a73e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    a742:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a746:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a74a:	7f 93                	jg     a6df <III_stereo+0xa20>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    a74c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a750:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    a754:	0f 8e 43 ff ff ff    	jle    a69d <III_stereo+0x9de>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    a75a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a75d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a763:	83 c0 50             	add    $0x50,%eax
    a766:	05 80 04 01 00       	add    $0x10480,%eax
    a76b:	8b 00                	mov    (%eax),%eax
    a76d:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a770:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a773:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a779:	83 c0 54             	add    $0x54,%eax
    a77c:	05 80 04 01 00       	add    $0x10480,%eax
    a781:	8b 00                	mov    (%eax),%eax
    a783:	ba 40 02 00 00       	mov    $0x240,%edx
    a788:	29 c2                	sub    %eax,%edx
    a78a:	89 d0                	mov    %edx,%eax
    a78c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    a78f:	eb 30                	jmp    a7c1 <III_stereo+0xb02>
         {  is_pos[i] = is_pos[sfb];
    a791:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a794:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a79b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a79e:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    a7a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a7a8:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a7af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a7b2:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    a7b9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a7bd:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a7c1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a7c5:	7f ca                	jg     a791 <III_stereo+0xad2>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a7c7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a7ce:	eb 55                	jmp    a825 <III_stereo+0xb66>
      for(sb=0;sb<SBLIMIT;sb++)
    a7d0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a7d7:	eb 42                	jmp    a81b <III_stereo+0xb5c>
         for(ss=0;ss<SSLIMIT;ss++)
    a7d9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a7e0:	eb 2f                	jmp    a811 <III_stereo+0xb52>
            lr[ch][sb][ss] = 0;
    a7e2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a7e5:	89 d0                	mov    %edx,%eax
    a7e7:	c1 e0 03             	shl    $0x3,%eax
    a7ea:	01 d0                	add    %edx,%eax
    a7ec:	c1 e0 09             	shl    $0x9,%eax
    a7ef:	89 c2                	mov    %eax,%edx
    a7f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    a7f4:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a7f7:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a7fa:	89 d0                	mov    %edx,%eax
    a7fc:	c1 e0 03             	shl    $0x3,%eax
    a7ff:	01 d0                	add    %edx,%eax
    a801:	01 c0                	add    %eax,%eax
    a803:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a806:	01 d0                	add    %edx,%eax
    a808:	d9 ee                	fldz   
    a80a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    a80d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a811:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a815:	7e cb                	jle    a7e2 <III_stereo+0xb23>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    a817:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a81b:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a81f:	7e b8                	jle    a7d9 <III_stereo+0xb1a>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a821:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a825:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    a829:	7e a5                	jle    a7d0 <III_stereo+0xb11>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    a82b:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    a82f:	0f 85 3b 02 00 00    	jne    aa70 <III_stereo+0xdb1>
      for(sb=0;sb<SBLIMIT;sb++)
    a835:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a83c:	e9 23 02 00 00       	jmp    aa64 <III_stereo+0xda5>
         for(ss=0;ss<SSLIMIT;ss++) {
    a841:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a848:	e9 09 02 00 00       	jmp    aa56 <III_stereo+0xd97>
            i = (sb*18)+ss;
    a84d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a850:	89 d0                	mov    %edx,%eax
    a852:	c1 e0 03             	shl    $0x3,%eax
    a855:	01 d0                	add    %edx,%eax
    a857:	01 c0                	add    %eax,%eax
    a859:	89 c2                	mov    %eax,%edx
    a85b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a85e:	01 d0                	add    %edx,%eax
    a860:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    a863:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a866:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a86d:	83 f8 07             	cmp    $0x7,%eax
    a870:	0f 85 2c 01 00 00    	jne    a9a2 <III_stereo+0xce3>
               if ( ms_stereo ) {
    a876:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    a87a:	0f 84 b5 00 00 00    	je     a935 <III_stereo+0xc76>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    a880:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a883:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a886:	89 d0                	mov    %edx,%eax
    a888:	c1 e0 03             	shl    $0x3,%eax
    a88b:	01 d0                	add    %edx,%eax
    a88d:	01 c0                	add    %eax,%eax
    a88f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a892:	01 d0                	add    %edx,%eax
    a894:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a897:	8b 45 08             	mov    0x8(%ebp),%eax
    a89a:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a8a0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a8a3:	89 d0                	mov    %edx,%eax
    a8a5:	c1 e0 03             	shl    $0x3,%eax
    a8a8:	01 d0                	add    %edx,%eax
    a8aa:	01 c0                	add    %eax,%eax
    a8ac:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a8af:	01 d0                	add    %edx,%eax
    a8b1:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a8b4:	de c1                	faddp  %st,%st(1)
    a8b6:	dd 05 c8 e7 00 00    	fldl   0xe7c8
    a8bc:	de f9                	fdivrp %st,%st(1)
    a8be:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a8c1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a8c4:	89 d0                	mov    %edx,%eax
    a8c6:	c1 e0 03             	shl    $0x3,%eax
    a8c9:	01 d0                	add    %edx,%eax
    a8cb:	01 c0                	add    %eax,%eax
    a8cd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a8d0:	01 d0                	add    %edx,%eax
    a8d2:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    a8d5:	8b 45 0c             	mov    0xc(%ebp),%eax
    a8d8:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a8de:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a8e1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a8e4:	89 d0                	mov    %edx,%eax
    a8e6:	c1 e0 03             	shl    $0x3,%eax
    a8e9:	01 d0                	add    %edx,%eax
    a8eb:	01 c0                	add    %eax,%eax
    a8ed:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a8f0:	01 d0                	add    %edx,%eax
    a8f2:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a8f5:	8b 45 08             	mov    0x8(%ebp),%eax
    a8f8:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a8fe:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a901:	89 d0                	mov    %edx,%eax
    a903:	c1 e0 03             	shl    $0x3,%eax
    a906:	01 d0                	add    %edx,%eax
    a908:	01 c0                	add    %eax,%eax
    a90a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a90d:	01 d0                	add    %edx,%eax
    a90f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a912:	de e9                	fsubrp %st,%st(1)
    a914:	dd 05 c8 e7 00 00    	fldl   0xe7c8
    a91a:	de f9                	fdivrp %st,%st(1)
    a91c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a91f:	89 d0                	mov    %edx,%eax
    a921:	c1 e0 03             	shl    $0x3,%eax
    a924:	01 d0                	add    %edx,%eax
    a926:	01 c0                	add    %eax,%eax
    a928:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a92b:	01 d0                	add    %edx,%eax
    a92d:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    a930:	e9 1d 01 00 00       	jmp    aa52 <III_stereo+0xd93>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    a935:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a938:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a93b:	89 d0                	mov    %edx,%eax
    a93d:	c1 e0 03             	shl    $0x3,%eax
    a940:	01 d0                	add    %edx,%eax
    a942:	01 c0                	add    %eax,%eax
    a944:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a947:	01 d0                	add    %edx,%eax
    a949:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a94c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a94f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a952:	89 d0                	mov    %edx,%eax
    a954:	c1 e0 03             	shl    $0x3,%eax
    a957:	01 d0                	add    %edx,%eax
    a959:	01 c0                	add    %eax,%eax
    a95b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a95e:	01 d0                	add    %edx,%eax
    a960:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    a963:	8b 45 0c             	mov    0xc(%ebp),%eax
    a966:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a96c:	8b 45 08             	mov    0x8(%ebp),%eax
    a96f:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a975:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a978:	89 d0                	mov    %edx,%eax
    a97a:	c1 e0 03             	shl    $0x3,%eax
    a97d:	01 d0                	add    %edx,%eax
    a97f:	01 c0                	add    %eax,%eax
    a981:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a984:	01 d0                	add    %edx,%eax
    a986:	dd 04 c3             	fldl   (%ebx,%eax,8)
    a989:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a98c:	89 d0                	mov    %edx,%eax
    a98e:	c1 e0 03             	shl    $0x3,%eax
    a991:	01 d0                	add    %edx,%eax
    a993:	01 c0                	add    %eax,%eax
    a995:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a998:	01 d0                	add    %edx,%eax
    a99a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    a99d:	e9 b0 00 00 00       	jmp    aa52 <III_stereo+0xd93>
               }
            }
            else if (i_stereo ) {
    a9a2:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    a9a6:	0f 84 94 00 00 00    	je     aa40 <III_stereo+0xd81>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    a9ac:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a9af:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a9b2:	89 d0                	mov    %edx,%eax
    a9b4:	c1 e0 03             	shl    $0x3,%eax
    a9b7:	01 d0                	add    %edx,%eax
    a9b9:	01 c0                	add    %eax,%eax
    a9bb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a9be:	01 d0                	add    %edx,%eax
    a9c0:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a9c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a9c6:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a9cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a9d0:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a9d7:	d9 e8                	fld1   
    a9d9:	de c1                	faddp  %st,%st(1)
    a9db:	de f9                	fdivrp %st,%st(1)
    a9dd:	de c9                	fmulp  %st,%st(1)
    a9df:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a9e2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a9e5:	89 d0                	mov    %edx,%eax
    a9e7:	c1 e0 03             	shl    $0x3,%eax
    a9ea:	01 d0                	add    %edx,%eax
    a9ec:	01 c0                	add    %eax,%eax
    a9ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a9f1:	01 d0                	add    %edx,%eax
    a9f3:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    a9f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    a9f9:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a9ff:	8b 4d 08             	mov    0x8(%ebp),%ecx
    aa02:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa05:	89 d0                	mov    %edx,%eax
    aa07:	c1 e0 03             	shl    $0x3,%eax
    aa0a:	01 d0                	add    %edx,%eax
    aa0c:	01 c0                	add    %eax,%eax
    aa0e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aa11:	01 d0                	add    %edx,%eax
    aa13:	dd 04 c1             	fldl   (%ecx,%eax,8)
    aa16:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa19:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    aa20:	d9 e8                	fld1   
    aa22:	de c1                	faddp  %st,%st(1)
    aa24:	d9 e8                	fld1   
    aa26:	de f1                	fdivp  %st,%st(1)
    aa28:	de c9                	fmulp  %st,%st(1)
    aa2a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa2d:	89 d0                	mov    %edx,%eax
    aa2f:	c1 e0 03             	shl    $0x3,%eax
    aa32:	01 d0                	add    %edx,%eax
    aa34:	01 c0                	add    %eax,%eax
    aa36:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aa39:	01 d0                	add    %edx,%eax
    aa3b:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    aa3e:	eb 12                	jmp    aa52 <III_stereo+0xd93>
            }
            else {
               printf(0,"Error in streo processing\n");
    aa40:	83 ec 08             	sub    $0x8,%esp
    aa43:	68 40 d7 00 00       	push   $0xd740
    aa48:	6a 00                	push   $0x0
    aa4a:	e8 4a a7 ff ff       	call   5199 <printf>
    aa4f:	83 c4 10             	add    $0x10,%esp
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    aa52:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    aa56:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    aa5a:	0f 8e ed fd ff ff    	jle    a84d <III_stereo+0xb8e>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    aa60:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    aa64:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    aa68:	0f 8e d3 fd ff ff    	jle    a841 <III_stereo+0xb82>
    aa6e:	eb 54                	jmp    aac4 <III_stereo+0xe05>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    aa70:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    aa77:	eb 45                	jmp    aabe <III_stereo+0xdff>
         for(ss=0;ss<SSLIMIT;ss++)
    aa79:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    aa80:	eb 32                	jmp    aab4 <III_stereo+0xdf5>
            lr[0][sb][ss] = xr[0][sb][ss];
    aa82:	8b 4d 08             	mov    0x8(%ebp),%ecx
    aa85:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa88:	89 d0                	mov    %edx,%eax
    aa8a:	c1 e0 03             	shl    $0x3,%eax
    aa8d:	01 d0                	add    %edx,%eax
    aa8f:	01 c0                	add    %eax,%eax
    aa91:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aa94:	01 d0                	add    %edx,%eax
    aa96:	dd 04 c1             	fldl   (%ecx,%eax,8)
    aa99:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    aa9c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa9f:	89 d0                	mov    %edx,%eax
    aaa1:	c1 e0 03             	shl    $0x3,%eax
    aaa4:	01 d0                	add    %edx,%eax
    aaa6:	01 c0                	add    %eax,%eax
    aaa8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aaab:	01 d0                	add    %edx,%eax
    aaad:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    aab0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    aab4:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    aab8:	7e c8                	jle    aa82 <III_stereo+0xdc3>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    aaba:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    aabe:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    aac2:	7e b5                	jle    aa79 <III_stereo+0xdba>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    aac4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    aac7:	5b                   	pop    %ebx
    aac8:	5e                   	pop    %esi
    aac9:	5d                   	pop    %ebp
    aaca:	c3                   	ret    

0000aacb <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    aacb:	55                   	push   %ebp
    aacc:	89 e5                	mov    %esp,%ebp
    aace:	83 ec 38             	sub    $0x38,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    aad1:	a1 00 07 01 00       	mov    0x10700,%eax
    aad6:	85 c0                	test   %eax,%eax
    aad8:	74 72                	je     ab4c <III_antialias+0x81>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    aada:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    aae1:	eb 59                	jmp    ab3c <III_antialias+0x71>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    aae3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    aae6:	dd 04 c5 c0 06 01 00 	fldl   0x106c0(,%eax,8)
    aaed:	8b 45 e8             	mov    -0x18(%ebp),%eax
    aaf0:	dd 04 c5 c0 06 01 00 	fldl   0x106c0(,%eax,8)
    aaf7:	de c9                	fmulp  %st,%st(1)
    aaf9:	d9 e8                	fld1   
    aafb:	de c1                	faddp  %st,%st(1)
    aafd:	83 ec 08             	sub    $0x8,%esp
    ab00:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    ab04:	dd 1c 24             	fstpl  (%esp)
    ab07:	e8 e4 ac ff ff       	call   57f0 <sqrt>
    ab0c:	83 c4 10             	add    $0x10,%esp
    ab0f:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    ab12:	d9 e8                	fld1   
    ab14:	dc 75 e0             	fdivl  -0x20(%ebp)
    ab17:	8b 45 e8             	mov    -0x18(%ebp),%eax
    ab1a:	dd 1c c5 c0 07 01 00 	fstpl  0x107c0(,%eax,8)
         ca[i] = Ci[i]/sq;
    ab21:	8b 45 e8             	mov    -0x18(%ebp),%eax
    ab24:	dd 04 c5 c0 06 01 00 	fldl   0x106c0(,%eax,8)
    ab2b:	dc 75 e0             	fdivl  -0x20(%ebp)
    ab2e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    ab31:	dd 1c c5 00 08 01 00 	fstpl  0x10800(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    ab38:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    ab3c:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    ab40:	7e a1                	jle    aae3 <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    ab42:	c7 05 00 07 01 00 00 	movl   $0x0,0x10700
    ab49:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    ab4c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    ab53:	eb 4c                	jmp    aba1 <III_antialias+0xd6>
       for(ss=0;ss<SSLIMIT;ss++)
    ab55:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ab5c:	eb 39                	jmp    ab97 <III_antialias+0xcc>
          hybridIn[sb][ss] = xr[sb][ss];
    ab5e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ab61:	89 d0                	mov    %edx,%eax
    ab63:	c1 e0 03             	shl    $0x3,%eax
    ab66:	01 d0                	add    %edx,%eax
    ab68:	c1 e0 04             	shl    $0x4,%eax
    ab6b:	89 c2                	mov    %eax,%edx
    ab6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    ab70:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    ab73:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ab76:	89 d0                	mov    %edx,%eax
    ab78:	c1 e0 03             	shl    $0x3,%eax
    ab7b:	01 d0                	add    %edx,%eax
    ab7d:	c1 e0 04             	shl    $0x4,%eax
    ab80:	89 c2                	mov    %eax,%edx
    ab82:	8b 45 08             	mov    0x8(%ebp),%eax
    ab85:	01 c2                	add    %eax,%edx
    ab87:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab8a:	dd 04 c2             	fldl   (%edx,%eax,8)
    ab8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab90:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    ab93:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ab97:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    ab9b:	7e c1                	jle    ab5e <III_antialias+0x93>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    ab9d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    aba1:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    aba5:	7e ae                	jle    ab55 <III_antialias+0x8a>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    aba7:	8b 45 10             	mov    0x10(%ebp),%eax
    abaa:	8b 40 10             	mov    0x10(%eax),%eax
    abad:	85 c0                	test   %eax,%eax
    abaf:	74 1a                	je     abcb <III_antialias+0x100>
    abb1:	8b 45 10             	mov    0x10(%ebp),%eax
    abb4:	8b 40 14             	mov    0x14(%eax),%eax
    abb7:	83 f8 02             	cmp    $0x2,%eax
    abba:	75 0f                	jne    abcb <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    abbc:	8b 45 10             	mov    0x10(%ebp),%eax
    abbf:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    abc2:	85 c0                	test   %eax,%eax
    abc4:	75 05                	jne    abcb <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    abc6:	e9 1c 01 00 00       	jmp    ace7 <III_antialias+0x21c>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    abcb:	8b 45 10             	mov    0x10(%ebp),%eax
    abce:	8b 40 10             	mov    0x10(%eax),%eax
    abd1:	85 c0                	test   %eax,%eax
    abd3:	74 1e                	je     abf3 <III_antialias+0x128>
    abd5:	8b 45 10             	mov    0x10(%ebp),%eax
    abd8:	8b 40 18             	mov    0x18(%eax),%eax
    abdb:	85 c0                	test   %eax,%eax
    abdd:	74 14                	je     abf3 <III_antialias+0x128>
     (gr_info->block_type == 2))
    abdf:	8b 45 10             	mov    0x10(%ebp),%eax
    abe2:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    abe5:	83 f8 02             	cmp    $0x2,%eax
    abe8:	75 09                	jne    abf3 <III_antialias+0x128>
     (gr_info->block_type == 2))
      sblim = 1;
    abea:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    abf1:	eb 07                	jmp    abfa <III_antialias+0x12f>
   else
      sblim = SBLIMIT-1;
    abf3:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    abfa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    ac01:	e9 d5 00 00 00       	jmp    acdb <III_antialias+0x210>
      for(ss=0;ss<8;ss++) {
    ac06:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ac0d:	e9 bb 00 00 00       	jmp    accd <III_antialias+0x202>
         bu = xr[sb][17-ss];
    ac12:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ac15:	89 d0                	mov    %edx,%eax
    ac17:	c1 e0 03             	shl    $0x3,%eax
    ac1a:	01 d0                	add    %edx,%eax
    ac1c:	c1 e0 04             	shl    $0x4,%eax
    ac1f:	89 c2                	mov    %eax,%edx
    ac21:	8b 45 08             	mov    0x8(%ebp),%eax
    ac24:	01 c2                	add    %eax,%edx
    ac26:	b8 11 00 00 00       	mov    $0x11,%eax
    ac2b:	2b 45 f4             	sub    -0xc(%ebp),%eax
    ac2e:	dd 04 c2             	fldl   (%edx,%eax,8)
    ac31:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    ac34:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ac37:	8d 50 01             	lea    0x1(%eax),%edx
    ac3a:	89 d0                	mov    %edx,%eax
    ac3c:	c1 e0 03             	shl    $0x3,%eax
    ac3f:	01 d0                	add    %edx,%eax
    ac41:	c1 e0 04             	shl    $0x4,%eax
    ac44:	89 c2                	mov    %eax,%edx
    ac46:	8b 45 08             	mov    0x8(%ebp),%eax
    ac49:	01 c2                	add    %eax,%edx
    ac4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac4e:	dd 04 c2             	fldl   (%edx,%eax,8)
    ac51:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    ac54:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ac57:	89 d0                	mov    %edx,%eax
    ac59:	c1 e0 03             	shl    $0x3,%eax
    ac5c:	01 d0                	add    %edx,%eax
    ac5e:	c1 e0 04             	shl    $0x4,%eax
    ac61:	89 c2                	mov    %eax,%edx
    ac63:	8b 45 0c             	mov    0xc(%ebp),%eax
    ac66:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    ac69:	b8 11 00 00 00       	mov    $0x11,%eax
    ac6e:	2b 45 f4             	sub    -0xc(%ebp),%eax
    ac71:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ac74:	dd 04 d5 c0 07 01 00 	fldl   0x107c0(,%edx,8)
    ac7b:	dc 4d d8             	fmull  -0x28(%ebp)
    ac7e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ac81:	dd 04 d5 00 08 01 00 	fldl   0x10800(,%edx,8)
    ac88:	dc 4d d0             	fmull  -0x30(%ebp)
    ac8b:	de e9                	fsubrp %st,%st(1)
    ac8d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    ac90:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ac93:	8d 50 01             	lea    0x1(%eax),%edx
    ac96:	89 d0                	mov    %edx,%eax
    ac98:	c1 e0 03             	shl    $0x3,%eax
    ac9b:	01 d0                	add    %edx,%eax
    ac9d:	c1 e0 04             	shl    $0x4,%eax
    aca0:	89 c2                	mov    %eax,%edx
    aca2:	8b 45 0c             	mov    0xc(%ebp),%eax
    aca5:	01 c2                	add    %eax,%edx
    aca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    acaa:	dd 04 c5 c0 07 01 00 	fldl   0x107c0(,%eax,8)
    acb1:	dc 4d d0             	fmull  -0x30(%ebp)
    acb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    acb7:	dd 04 c5 00 08 01 00 	fldl   0x10800(,%eax,8)
    acbe:	dc 4d d8             	fmull  -0x28(%ebp)
    acc1:	de c1                	faddp  %st,%st(1)
    acc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    acc6:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    acc9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    accd:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    acd1:	0f 8e 3b ff ff ff    	jle    ac12 <III_antialias+0x147>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    acd7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    acdb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    acde:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    ace1:	0f 8c 1f ff ff ff    	jl     ac06 <III_antialias+0x13b>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    ace7:	c9                   	leave  
    ace8:	c3                   	ret    

0000ace9 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    ace9:	55                   	push   %ebp
    acea:	89 e5                	mov    %esp,%ebp
    acec:	81 ec 98 00 00 00    	sub    $0x98,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    acf2:	a1 40 08 01 00       	mov    0x10840,%eax
    acf7:	85 c0                	test   %eax,%eax
    acf9:	0f 85 9f 02 00 00    	jne    af9e <inv_mdct+0x2b5>

    /* type 0 */
      for(i=0;i<36;i++)
    acff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ad06:	eb 33                	jmp    ad3b <inv_mdct+0x52>
         win[0][i] = sin( PI/36 *(i+0.5) );
    ad08:	db 45 f4             	fildl  -0xc(%ebp)
    ad0b:	dd 05 d0 e7 00 00    	fldl   0xe7d0
    ad11:	de c1                	faddp  %st,%st(1)
    ad13:	dd 05 d8 e7 00 00    	fldl   0xe7d8
    ad19:	de c9                	fmulp  %st,%st(1)
    ad1b:	83 ec 08             	sub    $0x8,%esp
    ad1e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    ad22:	dd 1c 24             	fstpl  (%esp)
    ad25:	e8 38 a8 ff ff       	call   5562 <sin>
    ad2a:	83 c4 10             	add    $0x10,%esp
    ad2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad30:	dd 1c c5 80 08 01 00 	fstpl  0x10880(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    ad37:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ad3b:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    ad3f:	7e c7                	jle    ad08 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    ad41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ad48:	eb 36                	jmp    ad80 <inv_mdct+0x97>
         win[1][i] = sin( PI/36 *(i+0.5) );
    ad4a:	db 45 f4             	fildl  -0xc(%ebp)
    ad4d:	dd 05 d0 e7 00 00    	fldl   0xe7d0
    ad53:	de c1                	faddp  %st,%st(1)
    ad55:	dd 05 d8 e7 00 00    	fldl   0xe7d8
    ad5b:	de c9                	fmulp  %st,%st(1)
    ad5d:	83 ec 08             	sub    $0x8,%esp
    ad60:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    ad64:	dd 1c 24             	fstpl  (%esp)
    ad67:	e8 f6 a7 ff ff       	call   5562 <sin>
    ad6c:	83 c4 10             	add    $0x10,%esp
    ad6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad72:	83 c0 24             	add    $0x24,%eax
    ad75:	dd 1c c5 80 08 01 00 	fstpl  0x10880(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    ad7c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ad80:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    ad84:	7e c4                	jle    ad4a <inv_mdct+0x61>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    ad86:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    ad8d:	eb 13                	jmp    ada2 <inv_mdct+0xb9>
         win[1][i] = 1.0;
    ad8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad92:	83 c0 24             	add    $0x24,%eax
    ad95:	d9 e8                	fld1   
    ad97:	dd 1c c5 80 08 01 00 	fstpl  0x10880(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    ad9e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ada2:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    ada6:	7e e7                	jle    ad8f <inv_mdct+0xa6>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    ada8:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    adaf:	eb 3e                	jmp    adef <inv_mdct+0x106>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    adb1:	db 45 f4             	fildl  -0xc(%ebp)
    adb4:	dd 05 d0 e7 00 00    	fldl   0xe7d0
    adba:	de c1                	faddp  %st,%st(1)
    adbc:	dd 05 e0 e7 00 00    	fldl   0xe7e0
    adc2:	de e9                	fsubrp %st,%st(1)
    adc4:	dd 05 c0 e7 00 00    	fldl   0xe7c0
    adca:	de c9                	fmulp  %st,%st(1)
    adcc:	83 ec 08             	sub    $0x8,%esp
    adcf:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    add3:	dd 1c 24             	fstpl  (%esp)
    add6:	e8 87 a7 ff ff       	call   5562 <sin>
    addb:	83 c4 10             	add    $0x10,%esp
    adde:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ade1:	83 c0 24             	add    $0x24,%eax
    ade4:	dd 1c c5 80 08 01 00 	fstpl  0x10880(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    adeb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    adef:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    adf3:	7e bc                	jle    adb1 <inv_mdct+0xc8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    adf5:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    adfc:	eb 13                	jmp    ae11 <inv_mdct+0x128>
         win[1][i] = 0.0;
    adfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae01:	83 c0 24             	add    $0x24,%eax
    ae04:	d9 ee                	fldz   
    ae06:	dd 1c c5 80 08 01 00 	fstpl  0x10880(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    ae0d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ae11:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    ae15:	7e e7                	jle    adfe <inv_mdct+0x115>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    ae17:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ae1e:	eb 13                	jmp    ae33 <inv_mdct+0x14a>
         win[3][i] = 0.0;
    ae20:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae23:	83 c0 6c             	add    $0x6c,%eax
    ae26:	d9 ee                	fldz   
    ae28:	dd 1c c5 80 08 01 00 	fstpl  0x10880(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    ae2f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ae33:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    ae37:	7e e7                	jle    ae20 <inv_mdct+0x137>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    ae39:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    ae40:	eb 3e                	jmp    ae80 <inv_mdct+0x197>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    ae42:	db 45 f4             	fildl  -0xc(%ebp)
    ae45:	dd 05 d0 e7 00 00    	fldl   0xe7d0
    ae4b:	de c1                	faddp  %st,%st(1)
    ae4d:	dd 05 e8 e7 00 00    	fldl   0xe7e8
    ae53:	de e9                	fsubrp %st,%st(1)
    ae55:	dd 05 c0 e7 00 00    	fldl   0xe7c0
    ae5b:	de c9                	fmulp  %st,%st(1)
    ae5d:	83 ec 08             	sub    $0x8,%esp
    ae60:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    ae64:	dd 1c 24             	fstpl  (%esp)
    ae67:	e8 f6 a6 ff ff       	call   5562 <sin>
    ae6c:	83 c4 10             	add    $0x10,%esp
    ae6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae72:	83 c0 6c             	add    $0x6c,%eax
    ae75:	dd 1c c5 80 08 01 00 	fstpl  0x10880(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    ae7c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ae80:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    ae84:	7e bc                	jle    ae42 <inv_mdct+0x159>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    ae86:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    ae8d:	eb 13                	jmp    aea2 <inv_mdct+0x1b9>
         win[3][i] =1.0;
    ae8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae92:	83 c0 6c             	add    $0x6c,%eax
    ae95:	d9 e8                	fld1   
    ae97:	dd 1c c5 80 08 01 00 	fstpl  0x10880(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    ae9e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aea2:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    aea6:	7e e7                	jle    ae8f <inv_mdct+0x1a6>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    aea8:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    aeaf:	eb 36                	jmp    aee7 <inv_mdct+0x1fe>
         win[3][i] = sin( PI/36*(i+0.5) );
    aeb1:	db 45 f4             	fildl  -0xc(%ebp)
    aeb4:	dd 05 d0 e7 00 00    	fldl   0xe7d0
    aeba:	de c1                	faddp  %st,%st(1)
    aebc:	dd 05 d8 e7 00 00    	fldl   0xe7d8
    aec2:	de c9                	fmulp  %st,%st(1)
    aec4:	83 ec 08             	sub    $0x8,%esp
    aec7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    aecb:	dd 1c 24             	fstpl  (%esp)
    aece:	e8 8f a6 ff ff       	call   5562 <sin>
    aed3:	83 c4 10             	add    $0x10,%esp
    aed6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aed9:	83 c0 6c             	add    $0x6c,%eax
    aedc:	dd 1c c5 80 08 01 00 	fstpl  0x10880(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    aee3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aee7:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    aeeb:	7e c4                	jle    aeb1 <inv_mdct+0x1c8>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    aeed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    aef4:	eb 36                	jmp    af2c <inv_mdct+0x243>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    aef6:	db 45 f4             	fildl  -0xc(%ebp)
    aef9:	dd 05 d0 e7 00 00    	fldl   0xe7d0
    aeff:	de c1                	faddp  %st,%st(1)
    af01:	dd 05 c0 e7 00 00    	fldl   0xe7c0
    af07:	de c9                	fmulp  %st,%st(1)
    af09:	83 ec 08             	sub    $0x8,%esp
    af0c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    af10:	dd 1c 24             	fstpl  (%esp)
    af13:	e8 4a a6 ff ff       	call   5562 <sin>
    af18:	83 c4 10             	add    $0x10,%esp
    af1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    af1e:	83 c0 48             	add    $0x48,%eax
    af21:	dd 1c c5 80 08 01 00 	fstpl  0x10880(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    af28:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    af2c:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    af30:	7e c4                	jle    aef6 <inv_mdct+0x20d>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    af32:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    af39:	eb 13                	jmp    af4e <inv_mdct+0x265>
         win[2][i] = 0.0 ;
    af3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    af3e:	83 c0 48             	add    $0x48,%eax
    af41:	d9 ee                	fldz   
    af43:	dd 1c c5 80 08 01 00 	fstpl  0x10880(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    af4a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    af4e:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    af52:	7e e7                	jle    af3b <inv_mdct+0x252>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    af54:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    af5b:	eb 2b                	jmp    af88 <inv_mdct+0x29f>
         COS[i] = cos(PI/(2*36) * i);
    af5d:	db 45 f4             	fildl  -0xc(%ebp)
    af60:	dd 05 f0 e7 00 00    	fldl   0xe7f0
    af66:	de c9                	fmulp  %st,%st(1)
    af68:	83 ec 08             	sub    $0x8,%esp
    af6b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    af6f:	dd 1c 24             	fstpl  (%esp)
    af72:	e8 8a a6 ff ff       	call   5601 <cos>
    af77:	83 c4 10             	add    $0x10,%esp
    af7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    af7d:	dd 1c c5 00 0d 01 00 	fstpl  0x10d00(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    af84:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    af88:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    af8f:	7e cc                	jle    af5d <inv_mdct+0x274>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    af91:	a1 40 08 01 00       	mov    0x10840,%eax
    af96:	83 c0 01             	add    $0x1,%eax
    af99:	a3 40 08 01 00       	mov    %eax,0x10840
    }

    for(i=0;i<36;i++)
    af9e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    afa5:	eb 17                	jmp    afbe <inv_mdct+0x2d5>
       out[i]=0;
    afa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    afaa:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    afb1:	8b 45 0c             	mov    0xc(%ebp),%eax
    afb4:	01 d0                	add    %edx,%eax
    afb6:	d9 ee                	fldz   
    afb8:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    afba:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    afbe:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    afc2:	7e e3                	jle    afa7 <inv_mdct+0x2be>
       out[i]=0;

    if(block_type == 2){
    afc4:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    afc8:	0f 85 8f 01 00 00    	jne    b15d <inv_mdct+0x474>
       N=12;
    afce:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    afd5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    afdc:	e9 6d 01 00 00       	jmp    b14e <inv_mdct+0x465>
          for(p= 0;p<N;p++){
    afe1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    afe8:	e9 e9 00 00 00       	jmp    b0d6 <inv_mdct+0x3ed>
             sum = 0.0;
    afed:	d9 ee                	fldz   
    afef:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    aff2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    aff9:	e9 99 00 00 00       	jmp    b097 <inv_mdct+0x3ae>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    affe:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b001:	89 d0                	mov    %edx,%eax
    b003:	01 c0                	add    %eax,%eax
    b005:	01 c2                	add    %eax,%edx
    b007:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b00a:	01 d0                	add    %edx,%eax
    b00c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b013:	8b 45 08             	mov    0x8(%ebp),%eax
    b016:	01 d0                	add    %edx,%eax
    b018:	dd 00                	fldl   (%eax)
    b01a:	dd 9d 70 ff ff ff    	fstpl  -0x90(%ebp)
    b020:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b023:	01 c0                	add    %eax,%eax
    b025:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    b02b:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    b031:	dd 05 f8 e7 00 00    	fldl   0xe7f8
    b037:	de f1                	fdivp  %st,%st(1)
    b039:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b03c:	01 c0                	add    %eax,%eax
    b03e:	8d 50 01             	lea    0x1(%eax),%edx
    b041:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b044:	89 c1                	mov    %eax,%ecx
    b046:	c1 e9 1f             	shr    $0x1f,%ecx
    b049:	01 c8                	add    %ecx,%eax
    b04b:	d1 f8                	sar    %eax
    b04d:	01 d0                	add    %edx,%eax
    b04f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    b055:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    b05b:	de c9                	fmulp  %st,%st(1)
    b05d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b060:	01 c0                	add    %eax,%eax
    b062:	83 c0 01             	add    $0x1,%eax
    b065:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    b06b:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    b071:	de c9                	fmulp  %st,%st(1)
    b073:	83 ec 08             	sub    $0x8,%esp
    b076:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    b07a:	dd 1c 24             	fstpl  (%esp)
    b07d:	e8 7f a5 ff ff       	call   5601 <cos>
    b082:	83 c4 10             	add    $0x10,%esp
    b085:	dc 8d 70 ff ff ff    	fmull  -0x90(%ebp)
    b08b:	dd 45 e0             	fldl   -0x20(%ebp)
    b08e:	de c1                	faddp  %st,%st(1)
    b090:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    b093:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b097:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b09a:	89 c2                	mov    %eax,%edx
    b09c:	c1 ea 1f             	shr    $0x1f,%edx
    b09f:	01 d0                	add    %edx,%eax
    b0a1:	d1 f8                	sar    %eax
    b0a3:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b0a6:	0f 8f 52 ff ff ff    	jg     affe <inv_mdct+0x315>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    b0ac:	8b 55 10             	mov    0x10(%ebp),%edx
    b0af:	89 d0                	mov    %edx,%eax
    b0b1:	c1 e0 03             	shl    $0x3,%eax
    b0b4:	01 d0                	add    %edx,%eax
    b0b6:	c1 e0 02             	shl    $0x2,%eax
    b0b9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    b0bc:	01 d0                	add    %edx,%eax
    b0be:	dd 04 c5 80 08 01 00 	fldl   0x10880(,%eax,8)
    b0c5:	dc 4d e0             	fmull  -0x20(%ebp)
    b0c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b0cb:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    b0d2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b0d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b0d9:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    b0dc:	0f 8c 0b ff ff ff    	jl     afed <inv_mdct+0x304>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    b0e2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b0e9:	eb 57                	jmp    b142 <inv_mdct+0x459>
             out[6*i+p+6] += tmp[p];
    b0eb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b0ee:	89 d0                	mov    %edx,%eax
    b0f0:	01 c0                	add    %eax,%eax
    b0f2:	01 d0                	add    %edx,%eax
    b0f4:	01 c0                	add    %eax,%eax
    b0f6:	89 c2                	mov    %eax,%edx
    b0f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b0fb:	01 d0                	add    %edx,%eax
    b0fd:	83 c0 06             	add    $0x6,%eax
    b100:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b107:	8b 45 0c             	mov    0xc(%ebp),%eax
    b10a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b10d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b110:	89 d0                	mov    %edx,%eax
    b112:	01 c0                	add    %eax,%eax
    b114:	01 d0                	add    %edx,%eax
    b116:	01 c0                	add    %eax,%eax
    b118:	89 c2                	mov    %eax,%edx
    b11a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b11d:	01 d0                	add    %edx,%eax
    b11f:	83 c0 06             	add    $0x6,%eax
    b122:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b129:	8b 45 0c             	mov    0xc(%ebp),%eax
    b12c:	01 d0                	add    %edx,%eax
    b12e:	dd 00                	fldl   (%eax)
    b130:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b133:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    b13a:	de c1                	faddp  %st,%st(1)
    b13c:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    b13e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b142:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b145:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    b148:	7c a1                	jl     b0eb <inv_mdct+0x402>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    b14a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b14e:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    b152:	0f 8e 89 fe ff ff    	jle    afe1 <inv_mdct+0x2f8>
    b158:	e9 da 00 00 00       	jmp    b237 <inv_mdct+0x54e>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    b15d:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    b164:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b16b:	e9 bb 00 00 00       	jmp    b22b <inv_mdct+0x542>
         sum = 0.0;
    b170:	d9 ee                	fldz   
    b172:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    b175:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b17c:	eb 6a                	jmp    b1e8 <inv_mdct+0x4ff>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    b17e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b181:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b188:	8b 45 08             	mov    0x8(%ebp),%eax
    b18b:	01 d0                	add    %edx,%eax
    b18d:	dd 00                	fldl   (%eax)
    b18f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b192:	01 c0                	add    %eax,%eax
    b194:	8d 50 01             	lea    0x1(%eax),%edx
    b197:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b19a:	89 c1                	mov    %eax,%ecx
    b19c:	c1 e9 1f             	shr    $0x1f,%ecx
    b19f:	01 c8                	add    %ecx,%eax
    b1a1:	d1 f8                	sar    %eax
    b1a3:	01 c2                	add    %eax,%edx
    b1a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b1a8:	01 c0                	add    %eax,%eax
    b1aa:	83 c0 01             	add    $0x1,%eax
    b1ad:	89 d1                	mov    %edx,%ecx
    b1af:	0f af c8             	imul   %eax,%ecx
    b1b2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    b1b7:	89 c8                	mov    %ecx,%eax
    b1b9:	f7 ea                	imul   %edx
    b1bb:	c1 fa 05             	sar    $0x5,%edx
    b1be:	89 c8                	mov    %ecx,%eax
    b1c0:	c1 f8 1f             	sar    $0x1f,%eax
    b1c3:	29 c2                	sub    %eax,%edx
    b1c5:	89 d0                	mov    %edx,%eax
    b1c7:	c1 e0 03             	shl    $0x3,%eax
    b1ca:	01 d0                	add    %edx,%eax
    b1cc:	c1 e0 04             	shl    $0x4,%eax
    b1cf:	29 c1                	sub    %eax,%ecx
    b1d1:	89 ca                	mov    %ecx,%edx
    b1d3:	dd 04 d5 00 0d 01 00 	fldl   0x10d00(,%edx,8)
    b1da:	de c9                	fmulp  %st,%st(1)
    b1dc:	dd 45 e0             	fldl   -0x20(%ebp)
    b1df:	de c1                	faddp  %st,%st(1)
    b1e1:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    b1e4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b1e8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b1eb:	89 c2                	mov    %eax,%edx
    b1ed:	c1 ea 1f             	shr    $0x1f,%edx
    b1f0:	01 d0                	add    %edx,%eax
    b1f2:	d1 f8                	sar    %eax
    b1f4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b1f7:	7f 85                	jg     b17e <inv_mdct+0x495>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    b1f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b1fc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b203:	8b 45 0c             	mov    0xc(%ebp),%eax
    b206:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b209:	8b 55 10             	mov    0x10(%ebp),%edx
    b20c:	89 d0                	mov    %edx,%eax
    b20e:	c1 e0 03             	shl    $0x3,%eax
    b211:	01 d0                	add    %edx,%eax
    b213:	c1 e0 02             	shl    $0x2,%eax
    b216:	8b 55 ec             	mov    -0x14(%ebp),%edx
    b219:	01 d0                	add    %edx,%eax
    b21b:	dd 04 c5 80 08 01 00 	fldl   0x10880(,%eax,8)
    b222:	dc 4d e0             	fmull  -0x20(%ebp)
    b225:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    b227:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b22b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b22e:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    b231:	0f 8c 39 ff ff ff    	jl     b170 <inv_mdct+0x487>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    b237:	c9                   	leave  
    b238:	c3                   	ret    

0000b239 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    b239:	55                   	push   %ebp
    b23a:	89 e5                	mov    %esp,%ebp
    b23c:	53                   	push   %ebx
    b23d:	81 ec 44 01 00 00    	sub    $0x144,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    b243:	a1 04 07 01 00       	mov    0x10704,%eax
    b248:	85 c0                	test   %eax,%eax
    b24a:	74 6f                	je     b2bb <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    b24c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b253:	eb 56                	jmp    b2ab <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    b255:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b25c:	eb 43                	jmp    b2a1 <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    b25e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b265:	eb 30                	jmp    b297 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    b267:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b26a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    b26d:	89 c2                	mov    %eax,%edx
    b26f:	c1 e2 03             	shl    $0x3,%edx
    b272:	01 c2                	add    %eax,%edx
    b274:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b277:	89 c2                	mov    %eax,%edx
    b279:	89 c8                	mov    %ecx,%eax
    b27b:	c1 e0 03             	shl    $0x3,%eax
    b27e:	01 c8                	add    %ecx,%eax
    b280:	c1 e0 06             	shl    $0x6,%eax
    b283:	01 c2                	add    %eax,%edx
    b285:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b288:	01 d0                	add    %edx,%eax
    b28a:	d9 ee                	fldz   
    b28c:	dd 1c c5 80 11 01 00 	fstpl  0x11180(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    b293:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b297:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    b29b:	7e ca                	jle    b267 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    b29d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b2a1:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    b2a5:	7e b7                	jle    b25e <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    b2a7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b2ab:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    b2af:	7e a4                	jle    b255 <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    b2b1:	c7 05 04 07 01 00 00 	movl   $0x0,0x10704
    b2b8:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b2bb:	8b 45 18             	mov    0x18(%ebp),%eax
    b2be:	8b 40 10             	mov    0x10(%eax),%eax
    b2c1:	85 c0                	test   %eax,%eax
    b2c3:	74 10                	je     b2d5 <III_hybrid+0x9c>
    b2c5:	8b 45 18             	mov    0x18(%ebp),%eax
    b2c8:	8b 40 18             	mov    0x18(%eax),%eax
    b2cb:	85 c0                	test   %eax,%eax
    b2cd:	74 06                	je     b2d5 <III_hybrid+0x9c>
    b2cf:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    b2d3:	7e 08                	jle    b2dd <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    b2d5:	8b 45 18             	mov    0x18(%ebp),%eax
    b2d8:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b2db:	eb 05                	jmp    b2e2 <III_hybrid+0xa9>
    b2dd:	b8 00 00 00 00       	mov    $0x0,%eax
    b2e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    b2e5:	83 ec 04             	sub    $0x4,%esp
    b2e8:	ff 75 e4             	pushl  -0x1c(%ebp)
    b2eb:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    b2f1:	50                   	push   %eax
    b2f2:	ff 75 08             	pushl  0x8(%ebp)
    b2f5:	e8 ef f9 ff ff       	call   ace9 <inv_mdct>
    b2fa:	83 c4 10             	add    $0x10,%esp

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    b2fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b304:	e9 83 00 00 00       	jmp    b38c <III_hybrid+0x153>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    b309:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b30c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b313:	8b 45 0c             	mov    0xc(%ebp),%eax
    b316:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    b319:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b31c:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    b323:	8b 45 10             	mov    0x10(%ebp),%eax
    b326:	8b 4d 14             	mov    0x14(%ebp),%ecx
    b329:	89 c2                	mov    %eax,%edx
    b32b:	c1 e2 03             	shl    $0x3,%edx
    b32e:	01 c2                	add    %eax,%edx
    b330:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b333:	89 c2                	mov    %eax,%edx
    b335:	89 c8                	mov    %ecx,%eax
    b337:	c1 e0 03             	shl    $0x3,%eax
    b33a:	01 c8                	add    %ecx,%eax
    b33c:	c1 e0 06             	shl    $0x6,%eax
    b33f:	01 c2                	add    %eax,%edx
    b341:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b344:	01 d0                	add    %edx,%eax
    b346:	dd 04 c5 80 11 01 00 	fldl   0x11180(,%eax,8)
    b34d:	de c1                	faddp  %st,%st(1)
    b34f:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    b351:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b354:	83 c0 12             	add    $0x12,%eax
    b357:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    b35e:	8b 45 10             	mov    0x10(%ebp),%eax
    b361:	8b 4d 14             	mov    0x14(%ebp),%ecx
    b364:	89 c2                	mov    %eax,%edx
    b366:	c1 e2 03             	shl    $0x3,%edx
    b369:	01 c2                	add    %eax,%edx
    b36b:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b36e:	89 c2                	mov    %eax,%edx
    b370:	89 c8                	mov    %ecx,%eax
    b372:	c1 e0 03             	shl    $0x3,%eax
    b375:	01 c8                	add    %ecx,%eax
    b377:	c1 e0 06             	shl    $0x6,%eax
    b37a:	01 c2                	add    %eax,%edx
    b37c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b37f:	01 d0                	add    %edx,%eax
    b381:	dd 1c c5 80 11 01 00 	fstpl  0x11180(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    b388:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b38c:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b390:	0f 8e 73 ff ff ff    	jle    b309 <III_hybrid+0xd0>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    b396:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    b399:	c9                   	leave  
    b39a:	c3                   	ret    

0000b39b <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    b39b:	55                   	push   %ebp
    b39c:	89 e5                	mov    %esp,%ebp
    b39e:	57                   	push   %edi
    b39f:	56                   	push   %esi
    b3a0:	53                   	push   %ebx
    b3a1:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    b3a4:	be 00 00 00 00       	mov    $0x0,%esi
    b3a9:	e9 1a 01 00 00       	jmp    b4c8 <create_syn_filter+0x12d>
		for (k=0; k<32; k++) {
    b3ae:	bb 00 00 00 00       	mov    $0x0,%ebx
    b3b3:	e9 04 01 00 00       	jmp    b4bc <create_syn_filter+0x121>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    b3b8:	89 f0                	mov    %esi,%eax
    b3ba:	c1 e0 08             	shl    $0x8,%eax
    b3bd:	89 c2                	mov    %eax,%edx
    b3bf:	8b 45 08             	mov    0x8(%ebp),%eax
    b3c2:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    b3c5:	89 75 dc             	mov    %esi,-0x24(%ebp)
    b3c8:	db 45 dc             	fildl  -0x24(%ebp)
    b3cb:	dd 05 00 e8 00 00    	fldl   0xe800
    b3d1:	de c9                	fmulp  %st,%st(1)
    b3d3:	dd 05 08 e8 00 00    	fldl   0xe808
    b3d9:	de c1                	faddp  %st,%st(1)
    b3db:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    b3de:	83 c0 01             	add    $0x1,%eax
    b3e1:	89 45 dc             	mov    %eax,-0x24(%ebp)
    b3e4:	db 45 dc             	fildl  -0x24(%ebp)
    b3e7:	de c9                	fmulp  %st,%st(1)
    b3e9:	83 ec 08             	sub    $0x8,%esp
    b3ec:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    b3f0:	dd 1c 24             	fstpl  (%esp)
    b3f3:	e8 09 a2 ff ff       	call   5601 <cos>
    b3f8:	83 c4 10             	add    $0x10,%esp
    b3fb:	dd 05 10 e8 00 00    	fldl   0xe810
    b401:	de c9                	fmulp  %st,%st(1)
    b403:	dd 1c df             	fstpl  (%edi,%ebx,8)
    b406:	dd 04 df             	fldl   (%edi,%ebx,8)
    b409:	d9 ee                	fldz   
    b40b:	d9 c9                	fxch   %st(1)
    b40d:	df e9                	fucomip %st(1),%st
    b40f:	dd d8                	fstp   %st(0)
    b411:	72 41                	jb     b454 <create_syn_filter+0xb9>
				filter[i][k] = (int)(filter[i][k]+0.5);
    b413:	89 f0                	mov    %esi,%eax
    b415:	c1 e0 08             	shl    $0x8,%eax
    b418:	89 c2                	mov    %eax,%edx
    b41a:	8b 45 08             	mov    0x8(%ebp),%eax
    b41d:	01 c2                	add    %eax,%edx
    b41f:	89 f0                	mov    %esi,%eax
    b421:	c1 e0 08             	shl    $0x8,%eax
    b424:	89 c1                	mov    %eax,%ecx
    b426:	8b 45 08             	mov    0x8(%ebp),%eax
    b429:	01 c8                	add    %ecx,%eax
    b42b:	dd 04 d8             	fldl   (%eax,%ebx,8)
    b42e:	dd 05 d0 e7 00 00    	fldl   0xe7d0
    b434:	de c1                	faddp  %st,%st(1)
    b436:	d9 7d e6             	fnstcw -0x1a(%ebp)
    b439:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    b43d:	b4 0c                	mov    $0xc,%ah
    b43f:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    b443:	d9 6d e4             	fldcw  -0x1c(%ebp)
    b446:	db 5d dc             	fistpl -0x24(%ebp)
    b449:	d9 6d e6             	fldcw  -0x1a(%ebp)
    b44c:	db 45 dc             	fildl  -0x24(%ebp)
    b44f:	dd 1c da             	fstpl  (%edx,%ebx,8)
    b452:	eb 3f                	jmp    b493 <create_syn_filter+0xf8>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    b454:	89 f0                	mov    %esi,%eax
    b456:	c1 e0 08             	shl    $0x8,%eax
    b459:	89 c2                	mov    %eax,%edx
    b45b:	8b 45 08             	mov    0x8(%ebp),%eax
    b45e:	01 c2                	add    %eax,%edx
    b460:	89 f0                	mov    %esi,%eax
    b462:	c1 e0 08             	shl    $0x8,%eax
    b465:	89 c1                	mov    %eax,%ecx
    b467:	8b 45 08             	mov    0x8(%ebp),%eax
    b46a:	01 c8                	add    %ecx,%eax
    b46c:	dd 04 d8             	fldl   (%eax,%ebx,8)
    b46f:	dd 05 d0 e7 00 00    	fldl   0xe7d0
    b475:	de e9                	fsubrp %st,%st(1)
    b477:	d9 7d e6             	fnstcw -0x1a(%ebp)
    b47a:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    b47e:	b4 0c                	mov    $0xc,%ah
    b480:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    b484:	d9 6d e4             	fldcw  -0x1c(%ebp)
    b487:	db 5d dc             	fistpl -0x24(%ebp)
    b48a:	d9 6d e6             	fldcw  -0x1a(%ebp)
    b48d:	db 45 dc             	fildl  -0x24(%ebp)
    b490:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    b493:	89 f0                	mov    %esi,%eax
    b495:	c1 e0 08             	shl    $0x8,%eax
    b498:	89 c2                	mov    %eax,%edx
    b49a:	8b 45 08             	mov    0x8(%ebp),%eax
    b49d:	01 d0                	add    %edx,%eax
    b49f:	89 f2                	mov    %esi,%edx
    b4a1:	89 d1                	mov    %edx,%ecx
    b4a3:	c1 e1 08             	shl    $0x8,%ecx
    b4a6:	8b 55 08             	mov    0x8(%ebp),%edx
    b4a9:	01 ca                	add    %ecx,%edx
    b4ab:	dd 04 da             	fldl   (%edx,%ebx,8)
    b4ae:	dd 05 18 e8 00 00    	fldl   0xe818
    b4b4:	de c9                	fmulp  %st,%st(1)
    b4b6:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    b4b9:	83 c3 01             	add    $0x1,%ebx
    b4bc:	83 fb 1f             	cmp    $0x1f,%ebx
    b4bf:	0f 8e f3 fe ff ff    	jle    b3b8 <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    b4c5:	83 c6 01             	add    $0x1,%esi
    b4c8:	83 fe 3f             	cmp    $0x3f,%esi
    b4cb:	0f 8e dd fe ff ff    	jle    b3ae <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    b4d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    b4d4:	5b                   	pop    %ebx
    b4d5:	5e                   	pop    %esi
    b4d6:	5f                   	pop    %edi
    b4d7:	5d                   	pop    %ebp
    b4d8:	c3                   	ret    

0000b4d9 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    b4d9:	55                   	push   %ebp
    b4da:	89 e5                	mov    %esp,%ebp
    b4dc:	57                   	push   %edi
    b4dd:	56                   	push   %esi
    b4de:	53                   	push   %ebx
    b4df:	81 ec 04 10 00 00    	sub    $0x1004,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    b4e5:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    b4eb:	bb 80 d7 00 00       	mov    $0xd780,%ebx
    b4f0:	ba 00 04 00 00       	mov    $0x400,%edx
    b4f5:	89 c7                	mov    %eax,%edi
    b4f7:	89 de                	mov    %ebx,%esi
    b4f9:	89 d1                	mov    %edx,%ecx
    b4fb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    b4fd:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    b503:	89 45 08             	mov    %eax,0x8(%ebp)
}
    b506:	81 c4 04 10 00 00    	add    $0x1004,%esp
    b50c:	5b                   	pop    %ebx
    b50d:	5e                   	pop    %esi
    b50e:	5f                   	pop    %edi
    b50f:	5d                   	pop    %ebp
    b510:	c3                   	ret    

0000b511 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    b511:	55                   	push   %ebp
    b512:	89 e5                	mov    %esp,%ebp
    b514:	57                   	push   %edi
    b515:	56                   	push   %esi
    b516:	53                   	push   %ebx
    b517:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    b51a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    b521:	a1 08 07 01 00       	mov    0x10708,%eax
    b526:	85 c0                	test   %eax,%eax
    b528:	74 7a                	je     b5a4 <SubBandSynthesis+0x93>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    b52a:	83 ec 08             	sub    $0x8,%esp
    b52d:	68 80 e7 00 00       	push   $0xe780
    b532:	68 00 40 00 00       	push   $0x4000
    b537:	e8 af a7 ff ff       	call   5ceb <mem_alloc>
    b53c:	83 c4 10             	add    $0x10,%esp
    b53f:	a3 80 35 01 00       	mov    %eax,0x13580
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    b544:	83 ec 08             	sub    $0x8,%esp
    b547:	68 83 e7 00 00       	push   $0xe783
    b54c:	68 00 40 00 00       	push   $0x4000
    b551:	e8 95 a7 ff ff       	call   5ceb <mem_alloc>
    b556:	83 c4 10             	add    $0x10,%esp
    b559:	a3 84 35 01 00       	mov    %eax,0x13584
		create_syn_filter(*filter);
    b55e:	a1 84 35 01 00       	mov    0x13584,%eax
    b563:	83 ec 0c             	sub    $0xc,%esp
    b566:	50                   	push   %eax
    b567:	e8 2f fe ff ff       	call   b39b <create_syn_filter>
    b56c:	83 c4 10             	add    $0x10,%esp
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    b56f:	83 ec 08             	sub    $0x8,%esp
    b572:	68 86 e7 00 00       	push   $0xe786
    b577:	68 00 10 00 00       	push   $0x1000
    b57c:	e8 6a a7 ff ff       	call   5ceb <mem_alloc>
    b581:	83 c4 10             	add    $0x10,%esp
    b584:	a3 88 35 01 00       	mov    %eax,0x13588
		read_syn_window(window);
    b589:	a1 88 35 01 00       	mov    0x13588,%eax
    b58e:	83 ec 0c             	sub    $0xc,%esp
    b591:	50                   	push   %eax
    b592:	e8 42 ff ff ff       	call   b4d9 <read_syn_window>
    b597:	83 c4 10             	add    $0x10,%esp
		init = 0;
    b59a:	c7 05 08 07 01 00 00 	movl   $0x0,0x10708
    b5a1:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    b5a4:	8b 45 0c             	mov    0xc(%ebp),%eax
    b5a7:	8b 04 85 0c 07 01 00 	mov    0x1070c(,%eax,4),%eax
    b5ae:	83 e8 40             	sub    $0x40,%eax
    b5b1:	25 ff 03 00 00       	and    $0x3ff,%eax
    b5b6:	89 c2                	mov    %eax,%edx
    b5b8:	8b 45 0c             	mov    0xc(%ebp),%eax
    b5bb:	89 14 85 0c 07 01 00 	mov    %edx,0x1070c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    b5c2:	8b 15 80 35 01 00    	mov    0x13580,%edx
    b5c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    b5cb:	8b 04 85 0c 07 01 00 	mov    0x1070c(,%eax,4),%eax
    b5d2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b5d5:	c1 e1 0a             	shl    $0xa,%ecx
    b5d8:	01 c8                	add    %ecx,%eax
    b5da:	c1 e0 03             	shl    $0x3,%eax
    b5dd:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    b5e0:	bb 00 00 00 00       	mov    $0x0,%ebx
    b5e5:	eb 40                	jmp    b627 <SubBandSynthesis+0x116>
		sum = 0;
    b5e7:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    b5e9:	be 00 00 00 00       	mov    $0x0,%esi
    b5ee:	eb 26                	jmp    b616 <SubBandSynthesis+0x105>
			sum += bandPtr[k] * (*filter)[i][k];
    b5f0:	89 f0                	mov    %esi,%eax
    b5f2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b5f9:	8b 45 08             	mov    0x8(%ebp),%eax
    b5fc:	01 d0                	add    %edx,%eax
    b5fe:	dd 00                	fldl   (%eax)
    b600:	a1 84 35 01 00       	mov    0x13584,%eax
    b605:	89 da                	mov    %ebx,%edx
    b607:	c1 e2 05             	shl    $0x5,%edx
    b60a:	01 f2                	add    %esi,%edx
    b60c:	dd 04 d0             	fldl   (%eax,%edx,8)
    b60f:	de c9                	fmulp  %st,%st(1)
    b611:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    b613:	83 c6 01             	add    $0x1,%esi
    b616:	83 fe 1f             	cmp    $0x1f,%esi
    b619:	7e d5                	jle    b5f0 <SubBandSynthesis+0xdf>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    b61b:	89 d8                	mov    %ebx,%eax
    b61d:	c1 e0 03             	shl    $0x3,%eax
    b620:	01 f8                	add    %edi,%eax
    b622:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    b624:	83 c3 01             	add    $0x1,%ebx
    b627:	83 fb 3f             	cmp    $0x3f,%ebx
    b62a:	7e bb                	jle    b5e7 <SubBandSynthesis+0xd6>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    b62c:	bf 00 00 00 00       	mov    $0x0,%edi
    b631:	e9 c7 00 00 00       	jmp    b6fd <SubBandSynthesis+0x1ec>
		sum = 0;
    b636:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    b638:	bb 00 00 00 00       	mov    $0x0,%ebx
    b63d:	eb 4c                	jmp    b68b <SubBandSynthesis+0x17a>
			k = j + (i<<5);
    b63f:	89 d8                	mov    %ebx,%eax
    b641:	c1 e0 05             	shl    $0x5,%eax
    b644:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b647:	a1 88 35 01 00       	mov    0x13588,%eax
    b64c:	89 f2                	mov    %esi,%edx
    b64e:	c1 e2 03             	shl    $0x3,%edx
    b651:	01 d0                	add    %edx,%eax
    b653:	dd 00                	fldl   (%eax)
    b655:	a1 80 35 01 00       	mov    0x13580,%eax
    b65a:	8d 53 01             	lea    0x1(%ebx),%edx
    b65d:	d1 fa                	sar    %edx
    b65f:	c1 e2 06             	shl    $0x6,%edx
    b662:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    b665:	8b 55 0c             	mov    0xc(%ebp),%edx
    b668:	8b 14 95 0c 07 01 00 	mov    0x1070c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b66f:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    b671:	89 d1                	mov    %edx,%ecx
    b673:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b679:	8b 55 0c             	mov    0xc(%ebp),%edx
    b67c:	c1 e2 0a             	shl    $0xa,%edx
    b67f:	01 ca                	add    %ecx,%edx
    b681:	dd 04 d0             	fldl   (%eax,%edx,8)
    b684:	de c9                	fmulp  %st,%st(1)
    b686:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    b688:	83 c3 01             	add    $0x1,%ebx
    b68b:	83 fb 0f             	cmp    $0xf,%ebx
    b68e:	7e af                	jle    b63f <SubBandSynthesis+0x12e>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    b690:	dd 05 20 e8 00 00    	fldl   0xe820
    b696:	de c9                	fmulp  %st,%st(1)
    b698:	d9 7d d6             	fnstcw -0x2a(%ebp)
    b69b:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    b69f:	b4 0c                	mov    $0xc,%ah
    b6a1:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    b6a5:	d9 6d d4             	fldcw  -0x2c(%ebp)
    b6a8:	db 5d e0             	fistpl -0x20(%ebp)
    b6ab:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    b6ae:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    b6b5:	7e 15                	jle    b6cc <SubBandSynthesis+0x1bb>
    b6b7:	89 f8                	mov    %edi,%eax
    b6b9:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b6bc:	8b 45 10             	mov    0x10(%ebp),%eax
    b6bf:	01 d0                	add    %edx,%eax
    b6c1:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    b6c6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b6ca:	eb 2e                	jmp    b6fa <SubBandSynthesis+0x1e9>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    b6cc:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    b6d3:	7d 15                	jge    b6ea <SubBandSynthesis+0x1d9>
    b6d5:	89 f8                	mov    %edi,%eax
    b6d7:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b6da:	8b 45 10             	mov    0x10(%ebp),%eax
    b6dd:	01 d0                	add    %edx,%eax
    b6df:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    b6e4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b6e8:	eb 10                	jmp    b6fa <SubBandSynthesis+0x1e9>
			else                           samples[j] = foo;
    b6ea:	89 f8                	mov    %edi,%eax
    b6ec:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b6ef:	8b 45 10             	mov    0x10(%ebp),%eax
    b6f2:	01 d0                	add    %edx,%eax
    b6f4:	8b 55 e0             	mov    -0x20(%ebp),%edx
    b6f7:	66 89 10             	mov    %dx,(%eax)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    b6fa:	83 c7 01             	add    $0x1,%edi
    b6fd:	83 ff 1f             	cmp    $0x1f,%edi
    b700:	0f 8e 30 ff ff ff    	jle    b636 <SubBandSynthesis+0x125>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    b706:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    b709:	8d 65 f4             	lea    -0xc(%ebp),%esp
    b70c:	5b                   	pop    %ebx
    b70d:	5e                   	pop    %esi
    b70e:	5f                   	pop    %edi
    b70f:	5d                   	pop    %ebp
    b710:	c3                   	ret    

0000b711 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    b711:	55                   	push   %ebp
    b712:	89 e5                	mov    %esp,%ebp
    b714:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    b717:	8b 45 10             	mov    0x10(%ebp),%eax
    b71a:	8b 40 08             	mov    0x8(%eax),%eax
    b71d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    b720:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    b727:	eb 75                	jmp    b79e <out_fifo+0x8d>
    b729:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    b730:	eb 62                	jmp    b794 <out_fifo+0x83>
            (*psampFrames)++;
    b732:	8b 45 14             	mov    0x14(%ebp),%eax
    b735:	8b 00                	mov    (%eax),%eax
    b737:	8d 50 01             	lea    0x1(%eax),%edx
    b73a:	8b 45 14             	mov    0x14(%ebp),%eax
    b73d:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    b73f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b746:	eb 40                	jmp    b788 <out_fifo+0x77>
                if (!(k%1600) && k) {
    b748:	8b 0d 8c 35 01 00    	mov    0x1358c,%ecx
    b74e:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    b753:	89 c8                	mov    %ecx,%eax
    b755:	f7 ea                	imul   %edx
    b757:	c1 fa 09             	sar    $0x9,%edx
    b75a:	89 c8                	mov    %ecx,%eax
    b75c:	c1 f8 1f             	sar    $0x1f,%eax
    b75f:	29 c2                	sub    %eax,%edx
    b761:	89 d0                	mov    %edx,%eax
    b763:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    b769:	29 c1                	sub    %eax,%ecx
    b76b:	89 c8                	mov    %ecx,%eax
    b76d:	85 c0                	test   %eax,%eax
    b76f:	75 13                	jne    b784 <out_fifo+0x73>
    b771:	a1 8c 35 01 00       	mov    0x1358c,%eax
    b776:	85 c0                	test   %eax,%eax
    b778:	74 0a                	je     b784 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    b77a:	c7 05 8c 35 01 00 00 	movl   $0x0,0x1358c
    b781:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    b784:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b788:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b78b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b78e:	7c b8                	jl     b748 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    b790:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    b794:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    b798:	7e 98                	jle    b732 <out_fifo+0x21>
    b79a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    b79e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    b7a1:	3b 45 0c             	cmp    0xc(%ebp),%eax
    b7a4:	7c 83                	jl     b729 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    b7a6:	c9                   	leave  
    b7a7:	c3                   	ret    

0000b7a8 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    b7a8:	55                   	push   %ebp
    b7a9:	89 e5                	mov    %esp,%ebp
    b7ab:	83 ec 08             	sub    $0x8,%esp
    *old_crc = getbits(bs, 16);
    b7ae:	83 ec 08             	sub    $0x8,%esp
    b7b1:	6a 10                	push   $0x10
    b7b3:	ff 75 08             	pushl  0x8(%ebp)
    b7b6:	e8 14 a8 ff ff       	call   5fcf <getbits>
    b7bb:	83 c4 10             	add    $0x10,%esp
    b7be:	89 c2                	mov    %eax,%edx
    b7c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    b7c3:	89 10                	mov    %edx,(%eax)
}
    b7c5:	c9                   	leave  
    b7c6:	c3                   	ret    

0000b7c7 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    b7c7:	55                   	push   %ebp
    b7c8:	89 e5                	mov    %esp,%ebp
    b7ca:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b7cd:	8b 45 08             	mov    0x8(%ebp),%eax
    b7d0:	8b 40 0c             	mov    0xc(%eax),%eax
    b7d3:	83 c0 1e             	add    $0x1e,%eax
    b7d6:	8b 14 85 00 02 01 00 	mov    0x10200(,%eax,4),%edx
    b7dd:	89 d0                	mov    %edx,%eax
    b7df:	c1 e0 03             	shl    $0x3,%eax
    b7e2:	01 d0                	add    %edx,%eax
    b7e4:	c1 e0 04             	shl    $0x4,%eax
    b7e7:	89 45 e8             	mov    %eax,-0x18(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
    b7ea:	db 45 e8             	fildl  -0x18(%ebp)
    b7ed:	8b 45 08             	mov    0x8(%ebp),%eax
    b7f0:	8b 40 10             	mov    0x10(%eax),%eax
    b7f3:	dd 04 c5 c0 02 01 00 	fldl   0x102c0(,%eax,8)
    b7fa:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b7fc:	d9 7d ee             	fnstcw -0x12(%ebp)
    b7ff:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
    b803:	b4 0c                	mov    $0xc,%ah
    b805:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    b809:	d9 6d ec             	fldcw  -0x14(%ebp)
    b80c:	db 5d fc             	fistpl -0x4(%ebp)
    b80f:	d9 6d ee             	fldcw  -0x12(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    b812:	8b 45 08             	mov    0x8(%ebp),%eax
    b815:	8b 40 14             	mov    0x14(%eax),%eax
    b818:	85 c0                	test   %eax,%eax
    b81a:	74 04                	je     b820 <main_data_slots+0x59>
    b81c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    b820:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    b824:	8b 45 08             	mov    0x8(%ebp),%eax
    b827:	8b 40 08             	mov    0x8(%eax),%eax
    b82a:	85 c0                	test   %eax,%eax
    b82c:	74 04                	je     b832 <main_data_slots+0x6b>
		nSlots -= 2;
    b82e:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    b832:	8b 45 10             	mov    0x10(%ebp),%eax
    b835:	83 f8 01             	cmp    $0x1,%eax
    b838:	75 06                	jne    b840 <main_data_slots+0x79>
		nSlots -= 17;
    b83a:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    b83e:	eb 04                	jmp    b844 <main_data_slots+0x7d>
	else
		nSlots -=32;
    b840:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    b844:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    b847:	c9                   	leave  
    b848:	c3                   	ret    
