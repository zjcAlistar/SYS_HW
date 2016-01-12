
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
      7c:	05 ec 3b 01 00       	add    $0x13bec,%eax
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
      8e:	c7 05 00 3c 01 00 00 	movl   $0x0,0x13c00
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
      c6:	e8 7c 47 00 00       	call   4847 <initRect>
      cb:	83 ec 04             	sub    $0x4,%esp
      ce:	c7 44 24 18 9a 17 00 	movl   $0x179a,0x18(%esp)
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
      fa:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
     101:	e8 2d 48 00 00       	call   4933 <createClickable>
				- (BUTTON_HEIGHT + 3), 100, BUTTON_HEIGHT), MSG_LPRESS, h_searchbox);
	if (isSearching == 0) {
     106:	a1 c0 33 01 00       	mov    0x133c0,%eax
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
     137:	a1 e0 3b 01 00       	mov    0x13be0,%eax
     13c:	89 04 24             	mov    %eax,(%esp)
     13f:	a1 e4 3b 01 00       	mov    0x13be4,%eax
     144:	89 44 24 04          	mov    %eax,0x4(%esp)
     148:	a1 e8 3b 01 00       	mov    0x13be8,%eax
     14d:	89 44 24 08          	mov    %eax,0x8(%esp)
     151:	e8 a7 32 00 00       	call   33fd <fill_rect>
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
     180:	a1 e0 3b 01 00       	mov    0x13be0,%eax
     185:	89 04 24             	mov    %eax,(%esp)
     188:	a1 e4 3b 01 00       	mov    0x13be4,%eax
     18d:	89 44 24 04          	mov    %eax,0x4(%esp)
     191:	a1 e8 3b 01 00       	mov    0x13be8,%eax
     196:	89 44 24 08          	mov    %eax,0x8(%esp)
     19a:	e8 5e 32 00 00       	call   33fd <fill_rect>
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
     1a8:	a1 e0 3b 01 00       	mov    0x13be0,%eax
     1ad:	89 04 24             	mov    %eax,(%esp)
     1b0:	a1 e4 3b 01 00       	mov    0x13be4,%eax
     1b5:	89 44 24 04          	mov    %eax,0x4(%esp)
     1b9:	a1 e8 3b 01 00       	mov    0x13be8,%eax
     1be:	89 44 24 08          	mov    %eax,0x8(%esp)
     1c2:	e8 2d 0c 00 00       	call   df4 <updateFileList>
	struct fileItem *head;
	head = fileItemList;
     1c7:	a1 cc 05 01 00       	mov    0x105cc,%eax
     1cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int tempItemCounter = 0;
     1cf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    struct fileItem *first; /*为原链表剩下用于直接插入排序的节点头指针*/  
    struct fileItem *t; /*临时指针变量：插入节点*/  
    struct fileItem *p; /*临时指针变量*/  
    struct fileItem *q; /*临时指针变量*/  
  
    first = head->next; /*原链表剩下用于直接插入排序的节点链表：可根据图12来理解。*/  
     1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1d9:	8b 40 2c             	mov    0x2c(%eax),%eax
     1dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
    head->next = 0; /*只含有一个节点的链表的有序链表：可根据图11来理解。*/  
     1df:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1e2:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  
    while (first != 0) /*遍历剩下无序的链表*/  
     1e9:	e9 b8 00 00 00       	jmp    2a6 <fileSortByName+0x105>
    {
    	tempItemCounter++;
     1ee:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
        /*注意：这里for语句就是体现直接插入排序思想的地方*/  
        if (flag_fileSort == 0) {
     1f2:	a1 c8 05 01 00       	mov    0x105c8,%eax
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
     231:	e8 30 4d 00 00       	call   4f66 <strcmp>
     236:	85 c0                	test   %eax,%eax
     238:	78 cf                	js     209 <fileSortByName+0x68>
     23a:	eb 3f                	jmp    27b <fileSortByName+0xda>
	        {

	        } /*无序节点在有序链表中找插入的位置*/  
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
     272:	e8 ef 4c 00 00       	call   4f66 <strcmp>
     277:	85 c0                	test   %eax,%eax
     279:	7f cf                	jg     24a <fileSortByName+0xa9>
	        } /*无序节点在有序链表中找插入的位置*/  
        }
      
    /*退出for循环，就是找到了插入的位置*/  
    /*注意：按道理来说，这句话可以放到下面注释了的那个位置也应该对的，但是就是不能。原因：你若理解了上面的第3条，就知道了。*/  
        first = first->next; /*无序链表中的节点离开，以便它插入到有序链表中。*/   
     27b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     27e:	8b 40 2c             	mov    0x2c(%eax),%eax
     281:	89 45 ec             	mov    %eax,-0x14(%ebp)
    
        if (q == head) /*插在第一个节点之前*/  
     284:	8b 45 e0             	mov    -0x20(%ebp),%eax
     287:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     28a:	75 08                	jne    294 <fileSortByName+0xf3>
        {  
            head = t;  
     28c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     28f:	89 45 f4             	mov    %eax,-0xc(%ebp)
     292:	eb 09                	jmp    29d <fileSortByName+0xfc>
        }  
        else /*p是q的前驱*/  
        {  
            p->next = t;  
     294:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     297:	8b 55 e8             	mov    -0x18(%ebp),%edx
     29a:	89 50 2c             	mov    %edx,0x2c(%eax)
        }  
        t->next = q; /*完成插入动作*/  
     29d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     2a0:	8b 55 e0             	mov    -0x20(%ebp),%edx
     2a3:	89 50 2c             	mov    %edx,0x2c(%eax)
    struct fileItem *q; /*临时指针变量*/  
  
    first = head->next; /*原链表剩下用于直接插入排序的节点链表：可根据图12来理解。*/  
    head->next = 0; /*只含有一个节点的链表的有序链表：可根据图11来理解。*/  
  
    while (first != 0) /*遍历剩下无序的链表*/  
     2a6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     2aa:	0f 85 3e ff ff ff    	jne    1ee <fileSortByName+0x4d>
        }  
        t->next = q; /*完成插入动作*/  
        /*first = first->next;*/  
    }  

    if (flag_fileSort)
     2b0:	a1 c8 05 01 00       	mov    0x105c8,%eax
     2b5:	85 c0                	test   %eax,%eax
     2b7:	74 0c                	je     2c5 <fileSortByName+0x124>
    	flag_fileSort = 0;
     2b9:	c7 05 c8 05 01 00 00 	movl   $0x0,0x105c8
     2c0:	00 00 00 
     2c3:	eb 0a                	jmp    2cf <fileSortByName+0x12e>
    else
    	flag_fileSort = 1;
     2c5:	c7 05 c8 05 01 00 01 	movl   $0x1,0x105c8
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
     2ea:	a1 e0 3b 01 00       	mov    0x13be0,%eax
     2ef:	89 44 24 04          	mov    %eax,0x4(%esp)
     2f3:	a1 e4 3b 01 00       	mov    0x13be4,%eax
     2f8:	89 44 24 08          	mov    %eax,0x8(%esp)
     2fc:	a1 e8 3b 01 00       	mov    0x13be8,%eax
     301:	89 44 24 0c          	mov    %eax,0xc(%esp)
     305:	89 14 24             	mov    %edx,(%esp)
     308:	e8 d6 0f 00 00       	call   12e3 <getPos>
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
     33a:	a3 cc 05 01 00       	mov    %eax,0x105cc
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
     352:	e8 f6 52 00 00       	call   564d <malloc>
     357:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
     35a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
     361:	e8 e7 52 00 00       	call   564d <malloc>
     366:	8b 55 f4             	mov    -0xc(%ebp),%edx
     369:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
     36c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     36f:	8b 40 14             	mov    0x14(%eax),%eax
     372:	8b 55 1c             	mov    0x1c(%ebp),%edx
     375:	89 54 24 04          	mov    %edx,0x4(%esp)
     379:	89 04 24             	mov    %eax,(%esp)
     37c:	e8 b5 4b 00 00       	call   4f36 <strcpy>
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
     3a1:	8b 15 d0 05 01 00    	mov    0x105d0,%edx
     3a7:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     3aa:	8d 45 d8             	lea    -0x28(%ebp),%eax
     3ad:	89 54 24 10          	mov    %edx,0x10(%esp)
     3b1:	8b 15 e0 3b 01 00    	mov    0x13be0,%edx
     3b7:	89 54 24 04          	mov    %edx,0x4(%esp)
     3bb:	8b 15 e4 3b 01 00    	mov    0x13be4,%edx
     3c1:	89 54 24 08          	mov    %edx,0x8(%esp)
     3c5:	8b 15 e8 3b 01 00    	mov    0x13be8,%edx
     3cb:	89 54 24 0c          	mov    %edx,0xc(%esp)
     3cf:	89 04 24             	mov    %eax,(%esp)
     3d2:	e8 0c 0f 00 00       	call   12e3 <getPos>
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
     3f2:	8b 15 cc 05 01 00    	mov    0x105cc,%edx
     3f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3fb:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
     3fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
     401:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
     408:	8b 45 f4             	mov    -0xc(%ebp),%eax
     40b:	a3 cc 05 01 00       	mov    %eax,0x105cc
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
     41b:	a1 cc 05 01 00       	mov    0x105cc,%eax
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
     43d:	e8 d2 50 00 00       	call   5514 <free>
		free(temp);
     442:	8b 45 f0             	mov    -0x10(%ebp),%eax
     445:	89 04 24             	mov    %eax,(%esp)
     448:	e8 c7 50 00 00       	call   5514 <free>
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
     453:	c7 05 cc 05 01 00 00 	movl   $0x0,0x105cc
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
     46b:	e8 35 4b 00 00       	call   4fa5 <strlen>
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
     4ff:	c7 05 d0 05 01 00 00 	movl   $0x0,0x105d0
     506:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     509:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     510:	00 
     511:	8b 45 08             	mov    0x8(%ebp),%eax
     514:	89 04 24             	mov    %eax,(%esp)
     517:	e8 9d 4c 00 00       	call   51b9 <open>
     51c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     51f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     523:	79 20                	jns    545 <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     525:	8b 45 08             	mov    0x8(%ebp),%eax
     528:	89 44 24 08          	mov    %eax,0x8(%esp)
     52c:	c7 44 24 04 e0 b9 00 	movl   $0xb9e0,0x4(%esp)
     533:	00 
     534:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     53b:	e8 21 4e 00 00       	call   5361 <printf>
		return;
     540:	e9 8f 02 00 00       	jmp    7d4 <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     545:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     54b:	89 44 24 04          	mov    %eax,0x4(%esp)
     54f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     552:	89 04 24             	mov    %eax,(%esp)
     555:	e8 77 4c 00 00       	call   51d1 <fstat>
     55a:	85 c0                	test   %eax,%eax
     55c:	79 2b                	jns    589 <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     55e:	8b 45 08             	mov    0x8(%ebp),%eax
     561:	89 44 24 08          	mov    %eax,0x8(%esp)
     565:	c7 44 24 04 f4 b9 00 	movl   $0xb9f4,0x4(%esp)
     56c:	00 
     56d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     574:	e8 e8 4d 00 00       	call   5361 <printf>
		close(fd);
     579:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     57c:	89 04 24             	mov    %eax,(%esp)
     57f:	e8 1d 4c 00 00       	call   51a1 <close>
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
     5d0:	c7 44 24 04 08 ba 00 	movl   $0xba08,0x4(%esp)
     5d7:	00 
     5d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5df:	e8 7d 4d 00 00       	call   5361 <printf>
		break;
     5e4:	e9 e0 01 00 00       	jmp    7c9 <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     5e9:	8b 45 08             	mov    0x8(%ebp),%eax
     5ec:	89 04 24             	mov    %eax,(%esp)
     5ef:	e8 b1 49 00 00       	call   4fa5 <strlen>
     5f4:	83 c0 10             	add    $0x10,%eax
     5f7:	3d 00 02 00 00       	cmp    $0x200,%eax
     5fc:	76 19                	jbe    617 <list+0x124>
			printf(1, "ls: path too long\n");
     5fe:	c7 44 24 04 15 ba 00 	movl   $0xba15,0x4(%esp)
     605:	00 
     606:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     60d:	e8 4f 4d 00 00       	call   5361 <printf>
			break;
     612:	e9 b2 01 00 00       	jmp    7c9 <list+0x2d6>
		}
		strcpy(buf, path);
     617:	8b 45 08             	mov    0x8(%ebp),%eax
     61a:	89 44 24 04          	mov    %eax,0x4(%esp)
     61e:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     624:	89 04 24             	mov    %eax,(%esp)
     627:	e8 0a 49 00 00       	call   4f36 <strcpy>
		p = buf + strlen(buf);
     62c:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     632:	89 04 24             	mov    %eax,(%esp)
     635:	e8 6b 49 00 00       	call   4fa5 <strlen>
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
     682:	e8 ad 4a 00 00       	call   5134 <memmove>
			p[DIRSIZ] = 0;
     687:	8b 45 e0             	mov    -0x20(%ebp),%eax
     68a:	83 c0 0e             	add    $0xe,%eax
     68d:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     690:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     696:	89 44 24 04          	mov    %eax,0x4(%esp)
     69a:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     6a0:	89 04 24             	mov    %eax,(%esp)
     6a3:	e8 f1 49 00 00       	call   5099 <stat>
     6a8:	85 c0                	test   %eax,%eax
     6aa:	79 23                	jns    6cf <list+0x1dc>
				printf(1, "ls: cannot stat %s\n", buf);
     6ac:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     6b2:	89 44 24 08          	mov    %eax,0x8(%esp)
     6b6:	c7 44 24 04 f4 b9 00 	movl   $0xb9f4,0x4(%esp)
     6bd:	00 
     6be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6c5:	e8 97 4c 00 00       	call   5361 <printf>
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
     6fb:	8b 15 d0 05 01 00    	mov    0x105d0,%edx
     701:	8d 45 d0             	lea    -0x30(%ebp),%eax
     704:	89 54 24 10          	mov    %edx,0x10(%esp)
     708:	8b 15 e0 3b 01 00    	mov    0x13be0,%edx
     70e:	89 54 24 04          	mov    %edx,0x4(%esp)
     712:	8b 15 e4 3b 01 00    	mov    0x13be4,%edx
     718:	89 54 24 08          	mov    %edx,0x8(%esp)
     71c:	8b 15 e8 3b 01 00    	mov    0x13be8,%edx
     722:	89 54 24 0c          	mov    %edx,0xc(%esp)
     726:	89 04 24             	mov    %eax,(%esp)
     729:	e8 b5 0b 00 00       	call   12e3 <getPos>
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
     795:	a1 d0 05 01 00       	mov    0x105d0,%eax
     79a:	83 c0 01             	add    $0x1,%eax
     79d:	a3 d0 05 01 00       	mov    %eax,0x105d0
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
     7ba:	e8 d2 49 00 00       	call   5191 <read>
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
     7cf:	e8 cd 49 00 00       	call   51a1 <close>
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
     7e7:	75 08                	jne    7f1 <drawItem+0x15>
		nameColor = 0x0;
     7e9:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     7ef:	eb 49                	jmp    83a <drawItem+0x5e>
	else 
	{
		nameColor = 0xFFFF;
     7f1:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     7f7:	8b 45 38             	mov    0x38(%ebp),%eax
     7fa:	89 c3                	mov    %eax,%ebx
     7fc:	8b 45 34             	mov    0x34(%ebp),%eax
     7ff:	89 c1                	mov    %eax,%ecx
     801:	8b 45 30             	mov    0x30(%ebp),%eax
     804:	89 c2                	mov    %eax,%edx
     806:	8b 45 2c             	mov    0x2c(%ebp),%eax
     809:	c7 44 24 1c 10 21 00 	movl   $0x2110,0x1c(%esp)
     810:	00 
     811:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     815:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     819:	89 54 24 10          	mov    %edx,0x10(%esp)
     81d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     821:	8b 45 08             	mov    0x8(%ebp),%eax
     824:	89 04 24             	mov    %eax,(%esp)
     827:	8b 45 0c             	mov    0xc(%ebp),%eax
     82a:	89 44 24 04          	mov    %eax,0x4(%esp)
     82e:	8b 45 10             	mov    0x10(%ebp),%eax
     831:	89 44 24 08          	mov    %eax,0x8(%esp)
     835:	e8 c3 2b 00 00       	call   33fd <fill_rect>
	}
	if (style == ICON_STYLE) {
     83a:	a1 c4 fc 00 00       	mov    0xfcc4,%eax
     83f:	83 f8 01             	cmp    $0x1,%eax
     842:	0f 85 13 01 00 00    	jne    95b <drawItem+0x17f>
		switch (st.type) {
     848:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     84c:	98                   	cwtl   
     84d:	83 f8 01             	cmp    $0x1,%eax
     850:	74 53                	je     8a5 <drawItem+0xc9>
     852:	83 f8 02             	cmp    $0x2,%eax
     855:	0f 85 93 00 00 00    	jne    8ee <drawItem+0x112>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     85b:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     85e:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     861:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     864:	83 c0 19             	add    $0x19,%eax
     867:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     86b:	89 44 24 18          	mov    %eax,0x18(%esp)
     86f:	a1 08 fd 00 00       	mov    0xfd08,%eax
     874:	89 44 24 0c          	mov    %eax,0xc(%esp)
     878:	a1 0c fd 00 00       	mov    0xfd0c,%eax
     87d:	89 44 24 10          	mov    %eax,0x10(%esp)
     881:	a1 10 fd 00 00       	mov    0xfd10,%eax
     886:	89 44 24 14          	mov    %eax,0x14(%esp)
     88a:	8b 45 08             	mov    0x8(%ebp),%eax
     88d:	89 04 24             	mov    %eax,(%esp)
     890:	8b 45 0c             	mov    0xc(%ebp),%eax
     893:	89 44 24 04          	mov    %eax,0x4(%esp)
     897:	8b 45 10             	mov    0x10(%ebp),%eax
     89a:	89 44 24 08          	mov    %eax,0x8(%esp)
     89e:	e8 f9 31 00 00       	call   3a9c <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     8a3:	eb 49                	jmp    8ee <drawItem+0x112>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     8a5:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     8a8:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     8ab:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     8ae:	83 c0 19             	add    $0x19,%eax
     8b1:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     8b5:	89 44 24 18          	mov    %eax,0x18(%esp)
     8b9:	a1 70 fd 00 00       	mov    0xfd70,%eax
     8be:	89 44 24 0c          	mov    %eax,0xc(%esp)
     8c2:	a1 74 fd 00 00       	mov    0xfd74,%eax
     8c7:	89 44 24 10          	mov    %eax,0x10(%esp)
     8cb:	a1 78 fd 00 00       	mov    0xfd78,%eax
     8d0:	89 44 24 14          	mov    %eax,0x14(%esp)
     8d4:	8b 45 08             	mov    0x8(%ebp),%eax
     8d7:	89 04 24             	mov    %eax,(%esp)
     8da:	8b 45 0c             	mov    0xc(%ebp),%eax
     8dd:	89 44 24 04          	mov    %eax,0x4(%esp)
     8e1:	8b 45 10             	mov    0x10(%ebp),%eax
     8e4:	89 44 24 08          	mov    %eax,0x8(%esp)
     8e8:	e8 af 31 00 00       	call   3a9c <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     8ed:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     8ee:	8b 45 14             	mov    0x14(%ebp),%eax
     8f1:	89 04 24             	mov    %eax,(%esp)
     8f4:	e8 ac 46 00 00       	call   4fa5 <strlen>
     8f9:	89 c2                	mov    %eax,%edx
     8fb:	b8 00 00 00 00       	mov    $0x0,%eax
     900:	29 d0                	sub    %edx,%eax
     902:	c1 e0 02             	shl    $0x2,%eax
     905:	83 c0 30             	add    $0x30,%eax
     908:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     90b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     90f:	79 07                	jns    918 <drawItem+0x13c>
			indent = 0;
     911:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     918:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     91b:	8d 48 46             	lea    0x46(%eax),%ecx
     91e:	8b 55 2c             	mov    0x2c(%ebp),%edx
     921:	8b 45 f0             	mov    -0x10(%ebp),%eax
     924:	01 c2                	add    %eax,%edx
     926:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     92a:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     92e:	89 54 24 14          	mov    %edx,0x14(%esp)
     932:	89 44 24 10          	mov    %eax,0x10(%esp)
     936:	8b 45 14             	mov    0x14(%ebp),%eax
     939:	89 44 24 0c          	mov    %eax,0xc(%esp)
     93d:	8b 45 08             	mov    0x8(%ebp),%eax
     940:	89 04 24             	mov    %eax,(%esp)
     943:	8b 45 0c             	mov    0xc(%ebp),%eax
     946:	89 44 24 04          	mov    %eax,0x4(%esp)
     94a:	8b 45 10             	mov    0x10(%ebp),%eax
     94d:	89 44 24 08          	mov    %eax,0x8(%esp)
     951:	e8 86 30 00 00       	call   39dc <puts_str>
     956:	e9 33 01 00 00       	jmp    a8e <drawItem+0x2b2>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     95b:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     95f:	98                   	cwtl   
     960:	83 f8 01             	cmp    $0x1,%eax
     963:	0f 84 a0 00 00 00    	je     a09 <drawItem+0x22d>
     969:	83 f8 02             	cmp    $0x2,%eax
     96c:	0f 85 e0 00 00 00    	jne    a52 <drawItem+0x276>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     972:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     975:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     978:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     97b:	83 c0 08             	add    $0x8,%eax
     97e:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     982:	89 44 24 18          	mov    %eax,0x18(%esp)
     986:	a1 3c fd 00 00       	mov    0xfd3c,%eax
     98b:	89 44 24 0c          	mov    %eax,0xc(%esp)
     98f:	a1 40 fd 00 00       	mov    0xfd40,%eax
     994:	89 44 24 10          	mov    %eax,0x10(%esp)
     998:	a1 44 fd 00 00       	mov    0xfd44,%eax
     99d:	89 44 24 14          	mov    %eax,0x14(%esp)
     9a1:	8b 45 08             	mov    0x8(%ebp),%eax
     9a4:	89 04 24             	mov    %eax,(%esp)
     9a7:	8b 45 0c             	mov    0xc(%ebp),%eax
     9aa:	89 44 24 04          	mov    %eax,0x4(%esp)
     9ae:	8b 45 10             	mov    0x10(%ebp),%eax
     9b1:	89 44 24 08          	mov    %eax,0x8(%esp)
     9b5:	e8 e2 30 00 00       	call   3a9c <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     9ba:	8b 45 28             	mov    0x28(%ebp),%eax
     9bd:	89 04 24             	mov    %eax,(%esp)
     9c0:	e8 cf 00 00 00       	call   a94 <sizeFormat>
     9c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     9c8:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     9cb:	8d 48 03             	lea    0x3(%eax),%ecx
     9ce:	8b 45 2c             	mov    0x2c(%ebp),%eax
     9d1:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     9d7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     9db:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     9df:	89 54 24 14          	mov    %edx,0x14(%esp)
     9e3:	89 44 24 10          	mov    %eax,0x10(%esp)
     9e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
     9ea:	89 44 24 0c          	mov    %eax,0xc(%esp)
     9ee:	8b 45 08             	mov    0x8(%ebp),%eax
     9f1:	89 04 24             	mov    %eax,(%esp)
     9f4:	8b 45 0c             	mov    0xc(%ebp),%eax
     9f7:	89 44 24 04          	mov    %eax,0x4(%esp)
     9fb:	8b 45 10             	mov    0x10(%ebp),%eax
     9fe:	89 44 24 08          	mov    %eax,0x8(%esp)
     a02:	e8 d5 2f 00 00       	call   39dc <puts_str>
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     a07:	eb 49                	jmp    a52 <drawItem+0x276>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     a09:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     a0c:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     a0f:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     a12:	83 c0 08             	add    $0x8,%eax
     a15:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     a19:	89 44 24 18          	mov    %eax,0x18(%esp)
     a1d:	a1 a4 fd 00 00       	mov    0xfda4,%eax
     a22:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a26:	a1 a8 fd 00 00       	mov    0xfda8,%eax
     a2b:	89 44 24 10          	mov    %eax,0x10(%esp)
     a2f:	a1 ac fd 00 00       	mov    0xfdac,%eax
     a34:	89 44 24 14          	mov    %eax,0x14(%esp)
     a38:	8b 45 08             	mov    0x8(%ebp),%eax
     a3b:	89 04 24             	mov    %eax,(%esp)
     a3e:	8b 45 0c             	mov    0xc(%ebp),%eax
     a41:	89 44 24 04          	mov    %eax,0x4(%esp)
     a45:	8b 45 10             	mov    0x10(%ebp),%eax
     a48:	89 44 24 08          	mov    %eax,0x8(%esp)
     a4c:	e8 4b 30 00 00       	call   3a9c <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     a51:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     a52:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     a55:	8d 48 03             	lea    0x3(%eax),%ecx
     a58:	8b 45 2c             	mov    0x2c(%ebp),%eax
     a5b:	8d 50 28             	lea    0x28(%eax),%edx
     a5e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     a62:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     a66:	89 54 24 14          	mov    %edx,0x14(%esp)
     a6a:	89 44 24 10          	mov    %eax,0x10(%esp)
     a6e:	8b 45 14             	mov    0x14(%ebp),%eax
     a71:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a75:	8b 45 08             	mov    0x8(%ebp),%eax
     a78:	89 04 24             	mov    %eax,(%esp)
     a7b:	8b 45 0c             	mov    0xc(%ebp),%eax
     a7e:	89 44 24 04          	mov    %eax,0x4(%esp)
     a82:	8b 45 10             	mov    0x10(%ebp),%eax
     a85:	89 44 24 08          	mov    %eax,0x8(%esp)
     a89:	e8 4e 2f 00 00       	call   39dc <puts_str>
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     a8e:	83 c4 34             	add    $0x34,%esp
     a91:	5b                   	pop    %ebx
     a92:	5d                   	pop    %ebp
     a93:	c3                   	ret    

00000a94 <sizeFormat>:

char *sizeFormat(uint size){
     a94:	55                   	push   %ebp
     a95:	89 e5                	mov    %esp,%ebp
     a97:	53                   	push   %ebx
     a98:	83 ec 24             	sub    $0x24,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     a9b:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     aa2:	e8 a6 4b 00 00       	call   564d <malloc>
     aa7:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     aaa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400) 
     ab1:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     ab8:	0f 86 8b 00 00 00    	jbe    b49 <sizeFormat+0xb5>
	{
		size = size / (0x400);
     abe:	8b 45 08             	mov    0x8(%ebp),%eax
     ac1:	c1 e8 0a             	shr    $0xa,%eax
     ac4:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aca:	8d 50 01             	lea    0x1(%eax),%edx
     acd:	89 55 f4             	mov    %edx,-0xc(%ebp)
     ad0:	89 c2                	mov    %eax,%edx
     ad2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ad5:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     ad8:	8b 4d 08             	mov    0x8(%ebp),%ecx
     adb:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     ae0:	89 c8                	mov    %ecx,%eax
     ae2:	f7 e2                	mul    %edx
     ae4:	c1 ea 03             	shr    $0x3,%edx
     ae7:	89 d0                	mov    %edx,%eax
     ae9:	c1 e0 02             	shl    $0x2,%eax
     aec:	01 d0                	add    %edx,%eax
     aee:	01 c0                	add    %eax,%eax
     af0:	29 c1                	sub    %eax,%ecx
     af2:	89 ca                	mov    %ecx,%edx
     af4:	89 d0                	mov    %edx,%eax
     af6:	83 c0 30             	add    $0x30,%eax
     af9:	88 03                	mov    %al,(%ebx)
			size /= 10;
     afb:	8b 45 08             	mov    0x8(%ebp),%eax
     afe:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     b03:	f7 e2                	mul    %edx
     b05:	89 d0                	mov    %edx,%eax
     b07:	c1 e8 03             	shr    $0x3,%eax
     b0a:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     b0d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     b11:	75 b4                	jne    ac7 <sizeFormat+0x33>
		result[n++] = 'K';
     b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b16:	8d 50 01             	lea    0x1(%eax),%edx
     b19:	89 55 f4             	mov    %edx,-0xc(%ebp)
     b1c:	89 c2                	mov    %eax,%edx
     b1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b21:	01 d0                	add    %edx,%eax
     b23:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     b26:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b29:	8d 50 01             	lea    0x1(%eax),%edx
     b2c:	89 55 f4             	mov    %edx,-0xc(%ebp)
     b2f:	89 c2                	mov    %eax,%edx
     b31:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b34:	01 d0                	add    %edx,%eax
     b36:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     b39:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b3f:	01 d0                	add    %edx,%eax
     b41:	c6 00 00             	movb   $0x0,(%eax)
     b44:	e9 a3 00 00 00       	jmp    bec <sizeFormat+0x158>
	}
	else 
	{
		do{
			result[n++] = (size % 10) + '0';
     b49:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b4c:	8d 50 01             	lea    0x1(%eax),%edx
     b4f:	89 55 f4             	mov    %edx,-0xc(%ebp)
     b52:	89 c2                	mov    %eax,%edx
     b54:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b57:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     b5a:	8b 4d 08             	mov    0x8(%ebp),%ecx
     b5d:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     b62:	89 c8                	mov    %ecx,%eax
     b64:	f7 e2                	mul    %edx
     b66:	c1 ea 03             	shr    $0x3,%edx
     b69:	89 d0                	mov    %edx,%eax
     b6b:	c1 e0 02             	shl    $0x2,%eax
     b6e:	01 d0                	add    %edx,%eax
     b70:	01 c0                	add    %eax,%eax
     b72:	29 c1                	sub    %eax,%ecx
     b74:	89 ca                	mov    %ecx,%edx
     b76:	89 d0                	mov    %edx,%eax
     b78:	83 c0 30             	add    $0x30,%eax
     b7b:	88 03                	mov    %al,(%ebx)
			size /= 10;
     b7d:	8b 45 08             	mov    0x8(%ebp),%eax
     b80:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     b85:	f7 e2                	mul    %edx
     b87:	89 d0                	mov    %edx,%eax
     b89:	c1 e8 03             	shr    $0x3,%eax
     b8c:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     b8f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     b93:	75 b4                	jne    b49 <sizeFormat+0xb5>
		result[n++] = 'b';
     b95:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b98:	8d 50 01             	lea    0x1(%eax),%edx
     b9b:	89 55 f4             	mov    %edx,-0xc(%ebp)
     b9e:	89 c2                	mov    %eax,%edx
     ba0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ba3:	01 d0                	add    %edx,%eax
     ba5:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     ba8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bab:	8d 50 01             	lea    0x1(%eax),%edx
     bae:	89 55 f4             	mov    %edx,-0xc(%ebp)
     bb1:	89 c2                	mov    %eax,%edx
     bb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bb6:	01 d0                	add    %edx,%eax
     bb8:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     bbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bbe:	8d 50 01             	lea    0x1(%eax),%edx
     bc1:	89 55 f4             	mov    %edx,-0xc(%ebp)
     bc4:	89 c2                	mov    %eax,%edx
     bc6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bc9:	01 d0                	add    %edx,%eax
     bcb:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     bce:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bd1:	8d 50 01             	lea    0x1(%eax),%edx
     bd4:	89 55 f4             	mov    %edx,-0xc(%ebp)
     bd7:	89 c2                	mov    %eax,%edx
     bd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bdc:	01 d0                	add    %edx,%eax
     bde:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     be1:	8b 55 f4             	mov    -0xc(%ebp),%edx
     be4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     be7:	01 d0                	add    %edx,%eax
     be9:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     bec:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     bef:	83 c4 24             	add    $0x24,%esp
     bf2:	5b                   	pop    %ebx
     bf3:	5d                   	pop    %ebp
     bf4:	c3                   	ret    

00000bf5 <drawFinderWnd>:
		8 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "paste.bmp",
		9 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }  };

void drawFinderWnd(Context context) {
     bf5:	55                   	push   %ebp
     bf6:	89 e5                	mov    %esp,%ebp
     bf8:	83 ec 28             	sub    $0x28,%esp
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     bfb:	8b 45 0c             	mov    0xc(%ebp),%eax
     bfe:	83 e8 01             	sub    $0x1,%eax
     c01:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     c08:	00 
     c09:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     c10:	00 
     c11:	89 44 24 14          	mov    %eax,0x14(%esp)
     c15:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     c1c:	00 
     c1d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     c24:	00 
     c25:	8b 45 08             	mov    0x8(%ebp),%eax
     c28:	89 04 24             	mov    %eax,(%esp)
     c2b:	8b 45 0c             	mov    0xc(%ebp),%eax
     c2e:	89 44 24 04          	mov    %eax,0x4(%esp)
     c32:	8b 45 10             	mov    0x10(%ebp),%eax
     c35:	89 44 24 08          	mov    %eax,0x8(%esp)
     c39:	e8 34 2f 00 00       	call   3b72 <draw_line>
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     c3e:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     c41:	8d 48 ff             	lea    -0x1(%eax),%ecx
     c44:	8b 45 0c             	mov    0xc(%ebp),%eax
     c47:	8d 50 ff             	lea    -0x1(%eax),%edx
     c4a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c4d:	83 e8 01             	sub    $0x1,%eax
     c50:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     c57:	00 
     c58:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     c5c:	89 54 24 14          	mov    %edx,0x14(%esp)
     c60:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     c67:	00 
     c68:	89 44 24 0c          	mov    %eax,0xc(%esp)
     c6c:	8b 45 08             	mov    0x8(%ebp),%eax
     c6f:	89 04 24             	mov    %eax,(%esp)
     c72:	8b 45 0c             	mov    0xc(%ebp),%eax
     c75:	89 44 24 04          	mov    %eax,0x4(%esp)
     c79:	8b 45 10             	mov    0x10(%ebp),%eax
     c7c:	89 44 24 08          	mov    %eax,0x8(%esp)
     c80:	e8 ed 2e 00 00       	call   3b72 <draw_line>
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     c85:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     c88:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     c8b:	8b 45 0c             	mov    0xc(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     c8e:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     c91:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     c94:	83 e8 01             	sub    $0x1,%eax
     c97:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     c9e:	00 
     c9f:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     ca3:	89 54 24 14          	mov    %edx,0x14(%esp)
     ca7:	89 44 24 10          	mov    %eax,0x10(%esp)
     cab:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     cb2:	00 
     cb3:	8b 45 08             	mov    0x8(%ebp),%eax
     cb6:	89 04 24             	mov    %eax,(%esp)
     cb9:	8b 45 0c             	mov    0xc(%ebp),%eax
     cbc:	89 44 24 04          	mov    %eax,0x4(%esp)
     cc0:	8b 45 10             	mov    0x10(%ebp),%eax
     cc3:	89 44 24 08          	mov    %eax,0x8(%esp)
     cc7:	e8 a6 2e 00 00       	call   3b72 <draw_line>
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     ccc:	8b 45 10             	mov    0x10(%ebp),%eax
     ccf:	83 e8 01             	sub    $0x1,%eax
     cd2:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     cd9:	00 
     cda:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     ce1:	00 
     ce2:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
     ce9:	00 
     cea:	89 44 24 10          	mov    %eax,0x10(%esp)
     cee:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     cf5:	00 
     cf6:	8b 45 08             	mov    0x8(%ebp),%eax
     cf9:	89 04 24             	mov    %eax,(%esp)
     cfc:	8b 45 0c             	mov    0xc(%ebp),%eax
     cff:	89 44 24 04          	mov    %eax,0x4(%esp)
     d03:	8b 45 10             	mov    0x10(%ebp),%eax
     d06:	89 44 24 08          	mov    %eax,0x8(%esp)
     d0a:	e8 63 2e 00 00       	call   3b72 <draw_line>
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     d0f:	8b 45 0c             	mov    0xc(%ebp),%eax
     d12:	83 e8 02             	sub    $0x2,%eax
     d15:	c7 44 24 1c 18 c6 00 	movl   $0xc618,0x1c(%esp)
     d1c:	00 
     d1d:	c7 44 24 18 46 00 00 	movl   $0x46,0x18(%esp)
     d24:	00 
     d25:	89 44 24 14          	mov    %eax,0x14(%esp)
     d29:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     d30:	00 
     d31:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     d38:	00 
     d39:	8b 45 08             	mov    0x8(%ebp),%eax
     d3c:	89 04 24             	mov    %eax,(%esp)
     d3f:	8b 45 0c             	mov    0xc(%ebp),%eax
     d42:	89 44 24 04          	mov    %eax,0x4(%esp)
     d46:	8b 45 10             	mov    0x10(%ebp),%eax
     d49:	89 44 24 08          	mov    %eax,0x8(%esp)
     d4d:	e8 ab 26 00 00       	call   33fd <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     d52:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     d59:	00 
     d5a:	c7 44 24 14 2c 01 00 	movl   $0x12c,0x14(%esp)
     d61:	00 
     d62:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     d69:	00 
     d6a:	c7 44 24 0c 28 ba 00 	movl   $0xba28,0xc(%esp)
     d71:	00 
     d72:	8b 45 08             	mov    0x8(%ebp),%eax
     d75:	89 04 24             	mov    %eax,(%esp)
     d78:	8b 45 0c             	mov    0xc(%ebp),%eax
     d7b:	89 44 24 04          	mov    %eax,0x4(%esp)
     d7f:	8b 45 10             	mov    0x10(%ebp),%eax
     d82:	89 44 24 08          	mov    %eax,0x8(%esp)
     d86:	e8 51 2c 00 00       	call   39dc <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     d8b:	c7 44 24 10 0d 00 00 	movl   $0xd,0x10(%esp)
     d92:	00 
     d93:	c7 44 24 0c c0 fd 00 	movl   $0xfdc0,0xc(%esp)
     d9a:	00 
     d9b:	8b 45 08             	mov    0x8(%ebp),%eax
     d9e:	89 04 24             	mov    %eax,(%esp)
     da1:	8b 45 0c             	mov    0xc(%ebp),%eax
     da4:	89 44 24 04          	mov    %eax,0x4(%esp)
     da8:	8b 45 10             	mov    0x10(%ebp),%eax
     dab:	89 44 24 08          	mov    %eax,0x8(%esp)
     daf:	e8 99 31 00 00       	call   3f4d <draw_iconlist>
	draw_searchbox();
     db4:	e8 e1 f2 ff ff       	call   9a <draw_searchbox>
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     db9:	c7 44 24 18 28 00 00 	movl   $0x28,0x18(%esp)
     dc0:	00 
     dc1:	c7 44 24 14 a4 01 00 	movl   $0x1a4,0x14(%esp)
     dc8:	00 
     dc9:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     dd0:	00 
     dd1:	c7 44 24 0c ec 3b 01 	movl   $0x13bec,0xc(%esp)
     dd8:	00 
     dd9:	8b 45 08             	mov    0x8(%ebp),%eax
     ddc:	89 04 24             	mov    %eax,(%esp)
     ddf:	8b 45 0c             	mov    0xc(%ebp),%eax
     de2:	89 44 24 04          	mov    %eax,0x4(%esp)
     de6:	8b 45 10             	mov    0x10(%ebp),%eax
     de9:	89 44 24 08          	mov    %eax,0x8(%esp)
     ded:	e8 ea 2b 00 00       	call   39dc <puts_str>
				- (BUTTON_HEIGHT + 3) + 5);


}
     df2:	c9                   	leave  
     df3:	c3                   	ret    

00000df4 <updateFileList>:

void updateFileList(Context context) {
     df4:	55                   	push   %ebp
     df5:	89 e5                	mov    %esp,%ebp
     df7:	53                   	push   %ebx
     df8:	83 ec 44             	sub    $0x44,%esp
	struct fileItem *p, *q;
	int tempItemCounter = 0;
     dfb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	freeFileItemList();
     e02:	e8 0e f6 ff ff       	call   415 <freeFileItemList>
	list(".");
     e07:	c7 04 24 2f ba 00 00 	movl   $0xba2f,(%esp)
     e0e:	e8 e0 f6 ff ff       	call   4f3 <list>
	if (keyContent.length <= 0)
     e13:	a1 00 3c 01 00       	mov    0x13c00,%eax
     e18:	85 c0                	test   %eax,%eax
     e1a:	7f 05                	jg     e21 <updateFileList+0x2d>
		return;
     e1c:	e9 1d 01 00 00       	jmp    f3e <updateFileList+0x14a>
	p = fileItemList;
     e21:	a1 cc 05 01 00       	mov    0x105cc,%eax
     e26:	89 45 f4             	mov    %eax,-0xc(%ebp)
	q = 0;
     e29:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	while(p != 0) {
     e30:	e9 9d 00 00 00       	jmp    ed2 <updateFileList+0xde>
		if(!strstr(p->name, keyContent.content)) {
     e35:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e38:	8b 40 14             	mov    0x14(%eax),%eax
     e3b:	c7 44 24 04 ec 3b 01 	movl   $0x13bec,0x4(%esp)
     e42:	00 
     e43:	89 04 24             	mov    %eax,(%esp)
     e46:	e8 b5 f1 ff ff       	call   0 <strstr>
     e4b:	85 c0                	test   %eax,%eax
     e4d:	75 70                	jne    ebf <updateFileList+0xcb>
			if(q == 0) {
     e4f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     e53:	75 30                	jne    e85 <updateFileList+0x91>
				fileItemList = fileItemList->next;
     e55:	a1 cc 05 01 00       	mov    0x105cc,%eax
     e5a:	8b 40 2c             	mov    0x2c(%eax),%eax
     e5d:	a3 cc 05 01 00       	mov    %eax,0x105cc
				free(p->name);
     e62:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e65:	8b 40 14             	mov    0x14(%eax),%eax
     e68:	89 04 24             	mov    %eax,(%esp)
     e6b:	e8 a4 46 00 00       	call   5514 <free>
				free(p);
     e70:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e73:	89 04 24             	mov    %eax,(%esp)
     e76:	e8 99 46 00 00       	call   5514 <free>
				p = fileItemList;
     e7b:	a1 cc 05 01 00       	mov    0x105cc,%eax
     e80:	89 45 f4             	mov    %eax,-0xc(%ebp)
     e83:	eb 4d                	jmp    ed2 <updateFileList+0xde>
			}
			else {
				q->next = p->next;
     e85:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e88:	8b 50 2c             	mov    0x2c(%eax),%edx
     e8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e8e:	89 50 2c             	mov    %edx,0x2c(%eax)
				p->next = 0;
     e91:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e94:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
				free(p->name);
     e9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e9e:	8b 40 14             	mov    0x14(%eax),%eax
     ea1:	89 04 24             	mov    %eax,(%esp)
     ea4:	e8 6b 46 00 00       	call   5514 <free>
				free(p);
     ea9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eac:	89 04 24             	mov    %eax,(%esp)
     eaf:	e8 60 46 00 00       	call   5514 <free>
				p = q->next;
     eb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     eb7:	8b 40 2c             	mov    0x2c(%eax),%eax
     eba:	89 45 f4             	mov    %eax,-0xc(%ebp)
     ebd:	eb 13                	jmp    ed2 <updateFileList+0xde>
			}
		}
		else {
			tempItemCounter++;
     ebf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
			q = p;
     ec3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ec6:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p = p->next;
     ec9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ecc:	8b 40 2c             	mov    0x2c(%eax),%eax
     ecf:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list(".");
	if (keyContent.length <= 0)
		return;
	p = fileItemList;
	q = 0;
	while(p != 0) {
     ed2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ed6:	0f 85 59 ff ff ff    	jne    e35 <updateFileList+0x41>
			tempItemCounter++;
			q = p;
			p = p->next;
		}
	}
	p = fileItemList;
     edc:	a1 cc 05 01 00       	mov    0x105cc,%eax
     ee1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0) {
     ee4:	eb 52                	jmp    f38 <updateFileList+0x144>
		p->pos = getPos(context, --tempItemCounter);
     ee6:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
     eea:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     eed:	8d 45 d8             	lea    -0x28(%ebp),%eax
     ef0:	8b 55 ec             	mov    -0x14(%ebp),%edx
     ef3:	89 54 24 10          	mov    %edx,0x10(%esp)
     ef7:	8b 55 08             	mov    0x8(%ebp),%edx
     efa:	89 54 24 04          	mov    %edx,0x4(%esp)
     efe:	8b 55 0c             	mov    0xc(%ebp),%edx
     f01:	89 54 24 08          	mov    %edx,0x8(%esp)
     f05:	8b 55 10             	mov    0x10(%ebp),%edx
     f08:	89 54 24 0c          	mov    %edx,0xc(%esp)
     f0c:	89 04 24             	mov    %eax,(%esp)
     f0f:	e8 cf 03 00 00       	call   12e3 <getPos>
     f14:	83 ec 04             	sub    $0x4,%esp
     f17:	8b 45 d8             	mov    -0x28(%ebp),%eax
     f1a:	89 43 18             	mov    %eax,0x18(%ebx)
     f1d:	8b 45 dc             	mov    -0x24(%ebp),%eax
     f20:	89 43 1c             	mov    %eax,0x1c(%ebx)
     f23:	8b 45 e0             	mov    -0x20(%ebp),%eax
     f26:	89 43 20             	mov    %eax,0x20(%ebx)
     f29:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f2c:	89 43 24             	mov    %eax,0x24(%ebx)
		p = p->next;
     f2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f32:	8b 40 2c             	mov    0x2c(%eax),%eax
     f35:	89 45 f4             	mov    %eax,-0xc(%ebp)
			q = p;
			p = p->next;
		}
	}
	p = fileItemList;
	while(p != 0) {
     f38:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     f3c:	75 a8                	jne    ee6 <updateFileList+0xf2>
		p->pos = getPos(context, --tempItemCounter);
		p = p->next;
	}
}
     f3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f41:	c9                   	leave  
     f42:	c3                   	ret    

00000f43 <drawFinderContent>:

void drawFinderContent(Context context) {
     f43:	55                   	push   %ebp
     f44:	89 e5                	mov    %esp,%ebp
     f46:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p;
	//int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     f49:	c7 45 f0 46 00 00 00 	movl   $0x46,-0x10(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     f50:	a1 c4 fc 00 00       	mov    0xfcc4,%eax
     f55:	83 f8 02             	cmp    $0x2,%eax
     f58:	75 04                	jne    f5e <drawFinderContent+0x1b>
     f5a:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     f5e:	8b 45 10             	mov    0x10(%ebp),%eax
     f61:	83 e8 48             	sub    $0x48,%eax
	//int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     f64:	89 c1                	mov    %eax,%ecx
     f66:	8b 45 0c             	mov    0xc(%ebp),%eax
     f69:	83 e8 02             	sub    $0x2,%eax
     f6c:	89 c2                	mov    %eax,%edx
     f6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f71:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     f78:	00 
     f79:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     f7d:	89 54 24 14          	mov    %edx,0x14(%esp)
     f81:	89 44 24 10          	mov    %eax,0x10(%esp)
     f85:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     f8c:	00 
     f8d:	8b 45 08             	mov    0x8(%ebp),%eax
     f90:	89 04 24             	mov    %eax,(%esp)
     f93:	8b 45 0c             	mov    0xc(%ebp),%eax
     f96:	89 44 24 04          	mov    %eax,0x4(%esp)
     f9a:	8b 45 10             	mov    0x10(%ebp),%eax
     f9d:	89 44 24 08          	mov    %eax,0x8(%esp)
     fa1:	e8 57 24 00 00       	call   33fd <fill_rect>
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     fa6:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     fa9:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     fac:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     faf:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     fb2:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     fb5:	83 e8 01             	sub    $0x1,%eax
     fb8:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     fbf:	00 
     fc0:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     fc4:	89 54 24 14          	mov    %edx,0x14(%esp)
     fc8:	89 44 24 10          	mov    %eax,0x10(%esp)
     fcc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     fd3:	00 
     fd4:	8b 45 08             	mov    0x8(%ebp),%eax
     fd7:	89 04 24             	mov    %eax,(%esp)
     fda:	8b 45 0c             	mov    0xc(%ebp),%eax
     fdd:	89 44 24 04          	mov    %eax,0x4(%esp)
     fe1:	8b 45 10             	mov    0x10(%ebp),%eax
     fe4:	89 44 24 08          	mov    %eax,0x8(%esp)
     fe8:	e8 85 2b 00 00       	call   3b72 <draw_line>
//	q = 0;
	// if (keyContent.length == 0) {
	// 	printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
     fed:	a1 cc 05 01 00       	mov    0x105cc,%eax
     ff2:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while (p != 0) {
     ff5:	eb 7a                	jmp    1071 <drawFinderContent+0x12e>
			//printf(0, "draw item\n");
			drawItem(context, p->name, p->st, p->pos, p->chosen);
     ff7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ffa:	8b 40 28             	mov    0x28(%eax),%eax
     ffd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1000:	8b 52 14             	mov    0x14(%edx),%edx
    1003:	89 44 24 34          	mov    %eax,0x34(%esp)
    1007:	8b 45 f4             	mov    -0xc(%ebp),%eax
    100a:	8b 48 18             	mov    0x18(%eax),%ecx
    100d:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    1011:	8b 48 1c             	mov    0x1c(%eax),%ecx
    1014:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    1018:	8b 48 20             	mov    0x20(%eax),%ecx
    101b:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    101f:	8b 40 24             	mov    0x24(%eax),%eax
    1022:	89 44 24 30          	mov    %eax,0x30(%esp)
    1026:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1029:	8b 08                	mov    (%eax),%ecx
    102b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    102f:	8b 48 04             	mov    0x4(%eax),%ecx
    1032:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1036:	8b 48 08             	mov    0x8(%eax),%ecx
    1039:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    103d:	8b 48 0c             	mov    0xc(%eax),%ecx
    1040:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    1044:	8b 40 10             	mov    0x10(%eax),%eax
    1047:	89 44 24 20          	mov    %eax,0x20(%esp)
    104b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    104f:	8b 45 08             	mov    0x8(%ebp),%eax
    1052:	89 04 24             	mov    %eax,(%esp)
    1055:	8b 45 0c             	mov    0xc(%ebp),%eax
    1058:	89 44 24 04          	mov    %eax,0x4(%esp)
    105c:	8b 45 10             	mov    0x10(%ebp),%eax
    105f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1063:	e8 74 f7 ff ff       	call   7dc <drawItem>
			p = p->next;
    1068:	8b 45 f4             	mov    -0xc(%ebp),%eax
    106b:	8b 40 2c             	mov    0x2c(%eax),%eax
    106e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// if (keyContent.length == 0) {
	// 	printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
		while (p != 0) {
    1071:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1075:	75 80                	jne    ff7 <drawFinderContent+0xb4>
	// 		p = p->next;
			
	// 	}
	// }

	if (style == LIST_STYLE)
    1077:	a1 c4 fc 00 00       	mov    0xfcc4,%eax
    107c:	83 f8 02             	cmp    $0x2,%eax
    107f:	0f 85 39 01 00 00    	jne    11be <drawFinderContent+0x27b>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
    1085:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
    108c:	00 
    108d:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    1094:	00 
    1095:	c7 44 24 14 26 00 00 	movl   $0x26,0x14(%esp)
    109c:	00 
    109d:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
    10a4:	00 
    10a5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    10ac:	00 
    10ad:	8b 45 08             	mov    0x8(%ebp),%eax
    10b0:	89 04 24             	mov    %eax,(%esp)
    10b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    10b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    10ba:	8b 45 10             	mov    0x10(%ebp),%eax
    10bd:	89 44 24 08          	mov    %eax,0x8(%esp)
    10c1:	e8 37 23 00 00       	call   33fd <fill_rect>
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
    10c6:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
    10cd:	00 
    10ce:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    10d5:	00 
    10d6:	c7 44 24 14 9f 00 00 	movl   $0x9f,0x14(%esp)
    10dd:	00 
    10de:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
    10e5:	00 
    10e6:	c7 44 24 0c 28 00 00 	movl   $0x28,0xc(%esp)
    10ed:	00 
    10ee:	8b 45 08             	mov    0x8(%ebp),%eax
    10f1:	89 04 24             	mov    %eax,(%esp)
    10f4:	8b 45 0c             	mov    0xc(%ebp),%eax
    10f7:	89 44 24 04          	mov    %eax,0x4(%esp)
    10fb:	8b 45 10             	mov    0x10(%ebp),%eax
    10fe:	89 44 24 08          	mov    %eax,0x8(%esp)
    1102:	e8 f6 22 00 00       	call   33fd <fill_rect>
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
    1107:	8b 45 0c             	mov    0xc(%ebp),%eax
    110a:	2d c9 00 00 00       	sub    $0xc9,%eax
    110f:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
    1116:	00 
    1117:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    111e:	00 
    111f:	89 44 24 14          	mov    %eax,0x14(%esp)
    1123:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
    112a:	00 
    112b:	c7 44 24 0c c8 00 00 	movl   $0xc8,0xc(%esp)
    1132:	00 
    1133:	8b 45 08             	mov    0x8(%ebp),%eax
    1136:	89 04 24             	mov    %eax,(%esp)
    1139:	8b 45 0c             	mov    0xc(%ebp),%eax
    113c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1140:	8b 45 10             	mov    0x10(%ebp),%eax
    1143:	89 44 24 08          	mov    %eax,0x8(%esp)
    1147:	e8 b1 22 00 00       	call   33fd <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
    114c:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
    1153:	00 
    1154:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
    115b:	00 
    115c:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1163:	00 
    1164:	c7 44 24 0c 31 ba 00 	movl   $0xba31,0xc(%esp)
    116b:	00 
    116c:	8b 45 08             	mov    0x8(%ebp),%eax
    116f:	89 04 24             	mov    %eax,(%esp)
    1172:	8b 45 0c             	mov    0xc(%ebp),%eax
    1175:	89 44 24 04          	mov    %eax,0x4(%esp)
    1179:	8b 45 10             	mov    0x10(%ebp),%eax
    117c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1180:	e8 57 28 00 00       	call   39dc <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
    1185:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
    118c:	00 
    118d:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
    1194:	00 
    1195:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    119c:	00 
    119d:	c7 44 24 0c 36 ba 00 	movl   $0xba36,0xc(%esp)
    11a4:	00 
    11a5:	8b 45 08             	mov    0x8(%ebp),%eax
    11a8:	89 04 24             	mov    %eax,(%esp)
    11ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ae:	89 44 24 04          	mov    %eax,0x4(%esp)
    11b2:	8b 45 10             	mov    0x10(%ebp),%eax
    11b5:	89 44 24 08          	mov    %eax,0x8(%esp)
    11b9:	e8 1e 28 00 00       	call   39dc <puts_str>
		}
}
    11be:	c9                   	leave  
    11bf:	c3                   	ret    

000011c0 <int2str>:

char * int2str(int i)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	53                   	push   %ebx
    11c4:	83 ec 24             	sub    $0x24,%esp
	int j;
	int n = 0;
    11c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
    11ce:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    11d5:	e8 73 44 00 00       	call   564d <malloc>
    11da:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
    11dd:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    11e4:	e8 64 44 00 00       	call   564d <malloc>
    11e9:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
    11ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11ef:	8d 50 01             	lea    0x1(%eax),%edx
    11f2:	89 55 f0             	mov    %edx,-0x10(%ebp)
    11f5:	89 c2                	mov    %eax,%edx
    11f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    11fa:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    11fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1200:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1205:	89 c8                	mov    %ecx,%eax
    1207:	f7 ea                	imul   %edx
    1209:	c1 fa 02             	sar    $0x2,%edx
    120c:	89 c8                	mov    %ecx,%eax
    120e:	c1 f8 1f             	sar    $0x1f,%eax
    1211:	29 c2                	sub    %eax,%edx
    1213:	89 d0                	mov    %edx,%eax
    1215:	c1 e0 02             	shl    $0x2,%eax
    1218:	01 d0                	add    %edx,%eax
    121a:	01 c0                	add    %eax,%eax
    121c:	29 c1                	sub    %eax,%ecx
    121e:	89 ca                	mov    %ecx,%edx
    1220:	89 d0                	mov    %edx,%eax
    1222:	83 c0 30             	add    $0x30,%eax
    1225:	88 03                	mov    %al,(%ebx)
		i /= 10;
    1227:	8b 4d 08             	mov    0x8(%ebp),%ecx
    122a:	ba 67 66 66 66       	mov    $0x66666667,%edx
    122f:	89 c8                	mov    %ecx,%eax
    1231:	f7 ea                	imul   %edx
    1233:	c1 fa 02             	sar    $0x2,%edx
    1236:	89 c8                	mov    %ecx,%eax
    1238:	c1 f8 1f             	sar    $0x1f,%eax
    123b:	29 c2                	sub    %eax,%edx
    123d:	89 d0                	mov    %edx,%eax
    123f:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
    1242:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1246:	75 a4                	jne    11ec <int2str+0x2c>
	result[n] = 0;
    1248:	8b 55 f0             	mov    -0x10(%ebp),%edx
    124b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    124e:	01 d0                	add    %edx,%eax
    1250:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
    1253:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    125a:	eb 21                	jmp    127d <int2str+0xbd>
	{
		temp[j] = result[n-1-j];
    125c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    125f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1262:	01 c2                	add    %eax,%edx
    1264:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1267:	83 e8 01             	sub    $0x1,%eax
    126a:	2b 45 f4             	sub    -0xc(%ebp),%eax
    126d:	89 c1                	mov    %eax,%ecx
    126f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1272:	01 c8                	add    %ecx,%eax
    1274:	0f b6 00             	movzbl (%eax),%eax
    1277:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
    1279:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    127d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1280:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    1283:	7c d7                	jl     125c <int2str+0x9c>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
    1285:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1288:	8b 45 e8             	mov    -0x18(%ebp),%eax
    128b:	01 d0                	add    %edx,%eax
    128d:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
    1290:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1293:	89 04 24             	mov    %eax,(%esp)
    1296:	e8 79 42 00 00       	call   5514 <free>
	return temp;
    129b:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
    129e:	83 c4 24             	add    $0x24,%esp
    12a1:	5b                   	pop    %ebx
    12a2:	5d                   	pop    %ebp
    12a3:	c3                   	ret    

000012a4 <printItemList>:

void printItemList() {
    12a4:	55                   	push   %ebp
    12a5:	89 e5                	mov    %esp,%ebp
    12a7:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p;
	p = fileItemList;
    12aa:	a1 cc 05 01 00       	mov    0x105cc,%eax
    12af:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    12b2:	eb 27                	jmp    12db <printItemList+0x37>
		printf(0, "%s\n", p->name);
    12b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12b7:	8b 40 14             	mov    0x14(%eax),%eax
    12ba:	89 44 24 08          	mov    %eax,0x8(%esp)
    12be:	c7 44 24 04 3b ba 00 	movl   $0xba3b,0x4(%esp)
    12c5:	00 
    12c6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    12cd:	e8 8f 40 00 00       	call   5361 <printf>
		p = p->next;
    12d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12d5:	8b 40 2c             	mov    0x2c(%eax),%eax
    12d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
    12db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12df:	75 d3                	jne    12b4 <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
    12e1:	c9                   	leave  
    12e2:	c3                   	ret    

000012e3 <getPos>:

Rect getPos(Context context, int n) {
    12e3:	55                   	push   %ebp
    12e4:	89 e5                	mov    %esp,%ebp
    12e6:	83 ec 48             	sub    $0x48,%esp
	if (style == ICON_STYLE) {
    12e9:	a1 c4 fc 00 00       	mov    0xfcc4,%eax
    12ee:	83 f8 01             	cmp    $0x1,%eax
    12f1:	0f 85 80 00 00 00    	jne    1377 <getPos+0x94>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
    12f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    12fa:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
    12ff:	89 c8                	mov    %ecx,%eax
    1301:	f7 ea                	imul   %edx
    1303:	c1 fa 06             	sar    $0x6,%edx
    1306:	89 c8                	mov    %ecx,%eax
    1308:	c1 f8 1f             	sar    $0x1f,%eax
    130b:	29 c2                	sub    %eax,%edx
    130d:	89 d0                	mov    %edx,%eax
    130f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
    1312:	8b 45 18             	mov    0x18(%ebp),%eax
    1315:	99                   	cltd   
    1316:	f7 7d f4             	idivl  -0xc(%ebp)
    1319:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
    131c:	8b 45 18             	mov    0x18(%ebp),%eax
    131f:	99                   	cltd   
    1320:	f7 7d f4             	idivl  -0xc(%ebp)
    1323:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
    1326:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1329:	6b c0 73             	imul   $0x73,%eax,%eax
    132c:	83 c0 5a             	add    $0x5a,%eax
    132f:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
    1332:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1335:	01 c0                	add    %eax,%eax
    1337:	89 c2                	mov    %eax,%edx
    1339:	c1 e2 06             	shl    $0x6,%edx
    133c:	01 d0                	add    %edx,%eax
    133e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top + scrollOffset, ICON_ITEM_WIDTH,
    1341:	8b 15 c0 05 01 00    	mov    0x105c0,%edx
    1347:	8b 45 e8             	mov    -0x18(%ebp),%eax
    134a:	01 c2                	add    %eax,%edx
    134c:	8b 45 08             	mov    0x8(%ebp),%eax
    134f:	c7 44 24 10 5f 00 00 	movl   $0x5f,0x10(%esp)
    1356:	00 
    1357:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
    135e:	00 
    135f:	89 54 24 08          	mov    %edx,0x8(%esp)
    1363:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1366:	89 54 24 04          	mov    %edx,0x4(%esp)
    136a:	89 04 24             	mov    %eax,(%esp)
    136d:	e8 d5 34 00 00       	call   4847 <initRect>
    1372:	83 ec 04             	sub    $0x4,%esp
    1375:	eb 3d                	jmp    13b4 <getPos+0xd1>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP) + scrollOffset, context.width,
    1377:	8b 4d 10             	mov    0x10(%ebp),%ecx
    137a:	8b 55 18             	mov    0x18(%ebp),%edx
    137d:	89 d0                	mov    %edx,%eax
    137f:	c1 e0 05             	shl    $0x5,%eax
    1382:	29 d0                	sub    %edx,%eax
    1384:	8d 50 62             	lea    0x62(%eax),%edx
    1387:	a1 c0 05 01 00       	mov    0x105c0,%eax
    138c:	01 c2                	add    %eax,%edx
    138e:	8b 45 08             	mov    0x8(%ebp),%eax
    1391:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    1398:	00 
    1399:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    139d:	89 54 24 08          	mov    %edx,0x8(%esp)
    13a1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    13a8:	00 
    13a9:	89 04 24             	mov    %eax,(%esp)
    13ac:	e8 96 34 00 00       	call   4847 <initRect>
    13b1:	83 ec 04             	sub    $0x4,%esp
				LIST_ITEM_HEIGHT);
	}
}
    13b4:	8b 45 08             	mov    0x8(%ebp),%eax
    13b7:	c9                   	leave  
    13b8:	c2 04 00             	ret    $0x4

000013bb <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
    13bb:	55                   	push   %ebp
    13bc:	89 e5                	mov    %esp,%ebp
    13be:	83 ec 28             	sub    $0x28,%esp
	if (style == ICON_STYLE) {
    13c1:	a1 c4 fc 00 00       	mov    0xfcc4,%eax
    13c6:	83 f8 01             	cmp    $0x1,%eax
    13c9:	75 0d                	jne    13d8 <addItemEvent+0x1d>
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
    13cb:	8b 45 28             	mov    0x28(%ebp),%eax
    13ce:	83 f8 45             	cmp    $0x45,%eax
    13d1:	7f 12                	jg     13e5 <addItemEvent+0x2a>
			return;
    13d3:	e9 e0 00 00 00       	jmp    14b8 <addItemEvent+0xfd>
	} else {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
    13d8:	8b 45 28             	mov    0x28(%ebp),%eax
    13db:	83 f8 61             	cmp    $0x61,%eax
    13de:	7f 05                	jg     13e5 <addItemEvent+0x2a>
			return;
    13e0:	e9 d3 00 00 00       	jmp    14b8 <addItemEvent+0xfd>
	}
	switch (item.st.type) {
    13e5:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    13e9:	98                   	cwtl   
    13ea:	83 f8 01             	cmp    $0x1,%eax
    13ed:	74 45                	je     1434 <addItemEvent+0x79>
    13ef:	83 f8 02             	cmp    $0x2,%eax
    13f2:	0f 85 ac 00 00 00    	jne    14a4 <addItemEvent+0xe9>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    13f8:	c7 44 24 18 47 29 00 	movl   $0x2947,0x18(%esp)
    13ff:	00 
    1400:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    1407:	00 
    1408:	8b 45 24             	mov    0x24(%ebp),%eax
    140b:	89 44 24 04          	mov    %eax,0x4(%esp)
    140f:	8b 45 28             	mov    0x28(%ebp),%eax
    1412:	89 44 24 08          	mov    %eax,0x8(%esp)
    1416:	8b 45 2c             	mov    0x2c(%ebp),%eax
    1419:	89 44 24 0c          	mov    %eax,0xc(%esp)
    141d:	8b 45 30             	mov    0x30(%ebp),%eax
    1420:	89 44 24 10          	mov    %eax,0x10(%esp)
    1424:	8b 45 08             	mov    0x8(%ebp),%eax
    1427:	89 04 24             	mov    %eax,(%esp)
    142a:	e8 04 35 00 00       	call   4933 <createClickable>
		break;
    142f:	e9 84 00 00 00       	jmp    14b8 <addItemEvent+0xfd>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    1434:	c7 44 24 18 47 29 00 	movl   $0x2947,0x18(%esp)
    143b:	00 
    143c:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    1443:	00 
    1444:	8b 45 24             	mov    0x24(%ebp),%eax
    1447:	89 44 24 04          	mov    %eax,0x4(%esp)
    144b:	8b 45 28             	mov    0x28(%ebp),%eax
    144e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1452:	8b 45 2c             	mov    0x2c(%ebp),%eax
    1455:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1459:	8b 45 30             	mov    0x30(%ebp),%eax
    145c:	89 44 24 10          	mov    %eax,0x10(%esp)
    1460:	8b 45 08             	mov    0x8(%ebp),%eax
    1463:	89 04 24             	mov    %eax,(%esp)
    1466:	e8 c8 34 00 00       	call   4933 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
    146b:	c7 44 24 18 b2 1c 00 	movl   $0x1cb2,0x18(%esp)
    1472:	00 
    1473:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%esp)
    147a:	00 
    147b:	8b 45 24             	mov    0x24(%ebp),%eax
    147e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1482:	8b 45 28             	mov    0x28(%ebp),%eax
    1485:	89 44 24 08          	mov    %eax,0x8(%esp)
    1489:	8b 45 2c             	mov    0x2c(%ebp),%eax
    148c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1490:	8b 45 30             	mov    0x30(%ebp),%eax
    1493:	89 44 24 10          	mov    %eax,0x10(%esp)
    1497:	8b 45 08             	mov    0x8(%ebp),%eax
    149a:	89 04 24             	mov    %eax,(%esp)
    149d:	e8 91 34 00 00       	call   4933 <createClickable>
		break;
    14a2:	eb 14                	jmp    14b8 <addItemEvent+0xfd>
	default:
		printf(0, "unknown file type!");
    14a4:	c7 44 24 04 3f ba 00 	movl   $0xba3f,0x4(%esp)
    14ab:	00 
    14ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    14b3:	e8 a9 3e 00 00       	call   5361 <printf>
	}
}
    14b8:	c9                   	leave  
    14b9:	c3                   	ret    

000014ba <addListEvent>:

void addListEvent(ClickableManager *cm) {
    14ba:	55                   	push   %ebp
    14bb:	89 e5                	mov    %esp,%ebp
    14bd:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
    14c0:	a1 cc 05 01 00       	mov    0x105cc,%eax
    14c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    14c8:	eb 70                	jmp    153a <addListEvent+0x80>
		temp = p;
    14ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
    14d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14d3:	8b 40 2c             	mov    0x2c(%eax),%eax
    14d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
    14d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14dc:	8b 10                	mov    (%eax),%edx
    14de:	89 54 24 04          	mov    %edx,0x4(%esp)
    14e2:	8b 50 04             	mov    0x4(%eax),%edx
    14e5:	89 54 24 08          	mov    %edx,0x8(%esp)
    14e9:	8b 50 08             	mov    0x8(%eax),%edx
    14ec:	89 54 24 0c          	mov    %edx,0xc(%esp)
    14f0:	8b 50 0c             	mov    0xc(%eax),%edx
    14f3:	89 54 24 10          	mov    %edx,0x10(%esp)
    14f7:	8b 50 10             	mov    0x10(%eax),%edx
    14fa:	89 54 24 14          	mov    %edx,0x14(%esp)
    14fe:	8b 50 14             	mov    0x14(%eax),%edx
    1501:	89 54 24 18          	mov    %edx,0x18(%esp)
    1505:	8b 50 18             	mov    0x18(%eax),%edx
    1508:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    150c:	8b 50 1c             	mov    0x1c(%eax),%edx
    150f:	89 54 24 20          	mov    %edx,0x20(%esp)
    1513:	8b 50 20             	mov    0x20(%eax),%edx
    1516:	89 54 24 24          	mov    %edx,0x24(%esp)
    151a:	8b 50 24             	mov    0x24(%eax),%edx
    151d:	89 54 24 28          	mov    %edx,0x28(%esp)
    1521:	8b 50 28             	mov    0x28(%eax),%edx
    1524:	89 54 24 2c          	mov    %edx,0x2c(%esp)
    1528:	8b 40 2c             	mov    0x2c(%eax),%eax
    152b:	89 44 24 30          	mov    %eax,0x30(%esp)
    152f:	8b 45 08             	mov    0x8(%ebp),%eax
    1532:	89 04 24             	mov    %eax,(%esp)
    1535:	e8 81 fe ff ff       	call   13bb <addItemEvent>
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
    153a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    153e:	75 8a                	jne    14ca <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
    1540:	c9                   	leave  
    1541:	c3                   	ret    

00001542 <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile};

void addWndEvent(ClickableManager *cm) {
    1542:	55                   	push   %ebp
    1543:	89 e5                	mov    %esp,%ebp
    1545:	57                   	push   %edi
    1546:	56                   	push   %esi
    1547:	53                   	push   %ebx
    1548:	83 ec 5c             	sub    $0x5c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
    154b:	c7 45 e0 0d 00 00 00 	movl   $0xd,-0x20(%ebp)
	for (i = 0; i < n; i++) {
    1552:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1559:	e9 96 00 00 00       	jmp    15f4 <addWndEvent+0xb2>
		createClickable(cm,
    155e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1561:	8b 1c 85 80 00 01 00 	mov    0x10080(,%eax,4),%ebx
    1568:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    156b:	6b c0 34             	imul   $0x34,%eax,%eax
    156e:	05 e0 fd 00 00       	add    $0xfde0,%eax
    1573:	8b 78 10             	mov    0x10(%eax),%edi
    1576:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1579:	6b c0 34             	imul   $0x34,%eax,%eax
    157c:	05 e0 fd 00 00       	add    $0xfde0,%eax
    1581:	8b 70 0c             	mov    0xc(%eax),%esi
    1584:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1587:	6b c0 34             	imul   $0x34,%eax,%eax
    158a:	05 e0 fd 00 00       	add    $0xfde0,%eax
    158f:	8b 48 04             	mov    0x4(%eax),%ecx
    1592:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1595:	6b c0 34             	imul   $0x34,%eax,%eax
    1598:	05 e0 fd 00 00       	add    $0xfde0,%eax
    159d:	8b 10                	mov    (%eax),%edx
    159f:	8d 45 c0             	lea    -0x40(%ebp),%eax
    15a2:	89 7c 24 10          	mov    %edi,0x10(%esp)
    15a6:	89 74 24 0c          	mov    %esi,0xc(%esp)
    15aa:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    15ae:	89 54 24 04          	mov    %edx,0x4(%esp)
    15b2:	89 04 24             	mov    %eax,(%esp)
    15b5:	e8 8d 32 00 00       	call   4847 <initRect>
    15ba:	83 ec 04             	sub    $0x4,%esp
    15bd:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    15c1:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    15c8:	00 
    15c9:	8b 45 c0             	mov    -0x40(%ebp),%eax
    15cc:	89 44 24 04          	mov    %eax,0x4(%esp)
    15d0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    15d3:	89 44 24 08          	mov    %eax,0x8(%esp)
    15d7:	8b 45 c8             	mov    -0x38(%ebp),%eax
    15da:	89 44 24 0c          	mov    %eax,0xc(%esp)
    15de:	8b 45 cc             	mov    -0x34(%ebp),%eax
    15e1:	89 44 24 10          	mov    %eax,0x10(%esp)
    15e5:	8b 45 08             	mov    0x8(%ebp),%eax
    15e8:	89 04 24             	mov    %eax,(%esp)
    15eb:	e8 43 33 00 00       	call   4933 <createClickable>
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile};

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
    15f0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    15f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15f7:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    15fa:	0f 8c 5e ff ff ff    	jl     155e <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
	createClickable(cm, initRect(LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT), MSG_LPRESS, h_fileSortByName);
    1600:	8d 45 d0             	lea    -0x30(%ebp),%eax
    1603:	c7 44 24 10 1c 00 00 	movl   $0x1c,0x10(%esp)
    160a:	00 
    160b:	c7 44 24 0c 9f 00 00 	movl   $0x9f,0xc(%esp)
    1612:	00 
    1613:	c7 44 24 08 47 00 00 	movl   $0x47,0x8(%esp)
    161a:	00 
    161b:	c7 44 24 04 28 00 00 	movl   $0x28,0x4(%esp)
    1622:	00 
    1623:	89 04 24             	mov    %eax,(%esp)
    1626:	e8 1c 32 00 00       	call   4847 <initRect>
    162b:	83 ec 04             	sub    $0x4,%esp
    162e:	c7 44 24 18 cd 16 00 	movl   $0x16cd,0x18(%esp)
    1635:	00 
    1636:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    163d:	00 
    163e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1641:	89 44 24 04          	mov    %eax,0x4(%esp)
    1645:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1648:	89 44 24 08          	mov    %eax,0x8(%esp)
    164c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    164f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1653:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1656:	89 44 24 10          	mov    %eax,0x10(%esp)
    165a:	8b 45 08             	mov    0x8(%ebp),%eax
    165d:	89 04 24             	mov    %eax,(%esp)
    1660:	e8 ce 32 00 00       	call   4933 <createClickable>
}
    1665:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1668:	5b                   	pop    %ebx
    1669:	5e                   	pop    %esi
    166a:	5f                   	pop    %edi
    166b:	5d                   	pop    %ebp
    166c:	c3                   	ret    

0000166d <getFileItem>:

struct fileItem * getFileItem(Point point) {
    166d:	55                   	push   %ebp
    166e:	89 e5                	mov    %esp,%ebp
    1670:	83 ec 38             	sub    $0x38,%esp
	struct fileItem *p = fileItemList;
    1673:	a1 cc 05 01 00       	mov    0x105cc,%eax
    1678:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    167b:	eb 43                	jmp    16c0 <getFileItem+0x53>
		if (isIn(point, p->pos)) {
    167d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1680:	8b 50 18             	mov    0x18(%eax),%edx
    1683:	89 54 24 08          	mov    %edx,0x8(%esp)
    1687:	8b 50 1c             	mov    0x1c(%eax),%edx
    168a:	89 54 24 0c          	mov    %edx,0xc(%esp)
    168e:	8b 50 20             	mov    0x20(%eax),%edx
    1691:	89 54 24 10          	mov    %edx,0x10(%esp)
    1695:	8b 40 24             	mov    0x24(%eax),%eax
    1698:	89 44 24 14          	mov    %eax,0x14(%esp)
    169c:	8b 45 08             	mov    0x8(%ebp),%eax
    169f:	8b 55 0c             	mov    0xc(%ebp),%edx
    16a2:	89 04 24             	mov    %eax,(%esp)
    16a5:	89 54 24 04          	mov    %edx,0x4(%esp)
    16a9:	e8 f4 31 00 00       	call   48a2 <isIn>
    16ae:	85 c0                	test   %eax,%eax
    16b0:	74 05                	je     16b7 <getFileItem+0x4a>
			return p;
    16b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16b5:	eb 14                	jmp    16cb <getFileItem+0x5e>
		}
		p = p->next;
    16b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16ba:	8b 40 2c             	mov    0x2c(%eax),%eax
    16bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	createClickable(cm, initRect(LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT), MSG_LPRESS, h_fileSortByName);
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
    16c0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    16c4:	75 b7                	jne    167d <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
    16c6:	b8 00 00 00 00       	mov    $0x0,%eax
}
    16cb:	c9                   	leave  
    16cc:	c3                   	ret    

000016cd <h_fileSortByName>:

void h_fileSortByName(Point p) {
    16cd:	55                   	push   %ebp
    16ce:	89 e5                	mov    %esp,%ebp
    16d0:	83 ec 38             	sub    $0x38,%esp
	printf(0, "askjhdas\n");
    16d3:	c7 44 24 04 52 ba 00 	movl   $0xba52,0x4(%esp)
    16da:	00 
    16db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16e2:	e8 7a 3c 00 00       	call   5361 <printf>
	fileSortByName();
    16e7:	e8 b5 ea ff ff       	call   1a1 <fileSortByName>
	drawFinderContent(context);
    16ec:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    16f1:	89 04 24             	mov    %eax,(%esp)
    16f4:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    16f9:	89 44 24 04          	mov    %eax,0x4(%esp)
    16fd:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    1702:	89 44 24 08          	mov    %eax,0x8(%esp)
    1706:	e8 38 f8 ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    170b:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    1710:	89 04 24             	mov    %eax,(%esp)
    1713:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    1718:	89 44 24 04          	mov    %eax,0x4(%esp)
    171c:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    1721:	89 44 24 08          	mov    %eax,0x8(%esp)
    1725:	e8 cb f4 ff ff       	call   bf5 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    172a:	8d 45 e8             	lea    -0x18(%ebp),%eax
    172d:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1734:	00 
    1735:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    173c:	00 
    173d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1744:	00 
    1745:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    174c:	00 
    174d:	89 04 24             	mov    %eax,(%esp)
    1750:	e8 f2 30 00 00       	call   4847 <initRect>
    1755:	83 ec 04             	sub    $0x4,%esp
    1758:	8b 45 e8             	mov    -0x18(%ebp),%eax
    175b:	89 44 24 04          	mov    %eax,0x4(%esp)
    175f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1762:	89 44 24 08          	mov    %eax,0x8(%esp)
    1766:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1769:	89 44 24 0c          	mov    %eax,0xc(%esp)
    176d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1770:	89 44 24 10          	mov    %eax,0x10(%esp)
    1774:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    177b:	e8 ca 32 00 00       	call   4a4a <deleteClickable>
	addWndEvent(&cm);
    1780:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1787:	e8 b6 fd ff ff       	call   1542 <addWndEvent>
	addListEvent(&cm);
    178c:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1793:	e8 22 fd ff ff       	call   14ba <addListEvent>
}
    1798:	c9                   	leave  
    1799:	c3                   	ret    

0000179a <h_searchbox>:

void h_searchbox(Point p) {
    179a:	55                   	push   %ebp
    179b:	89 e5                	mov    %esp,%ebp
	isSearching = 1;
    179d:	c7 05 c0 33 01 00 01 	movl   $0x1,0x133c0
    17a4:	00 00 00 
}
    17a7:	5d                   	pop    %ebp
    17a8:	c3                   	ret    

000017a9 <scrollList>:

void scrollList(int offset) {
    17a9:	55                   	push   %ebp
    17aa:	89 e5                	mov    %esp,%ebp
    17ac:	83 ec 10             	sub    $0x10,%esp
	struct fileItem *q = fileItemList;
    17af:	a1 cc 05 01 00       	mov    0x105cc,%eax
    17b4:	89 45 fc             	mov    %eax,-0x4(%ebp)
	while (q != 0){
    17b7:	eb 1a                	jmp    17d3 <scrollList+0x2a>
		q->pos.start.y += offset;
    17b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17bc:	8b 50 1c             	mov    0x1c(%eax),%edx
    17bf:	8b 45 08             	mov    0x8(%ebp),%eax
    17c2:	01 c2                	add    %eax,%edx
    17c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17c7:	89 50 1c             	mov    %edx,0x1c(%eax)
		q = q->next;
    17ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17cd:	8b 40 2c             	mov    0x2c(%eax),%eax
    17d0:	89 45 fc             	mov    %eax,-0x4(%ebp)
	isSearching = 1;
}

void scrollList(int offset) {
	struct fileItem *q = fileItemList;
	while (q != 0){
    17d3:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
    17d7:	75 e0                	jne    17b9 <scrollList+0x10>
		q->pos.start.y += offset;
		q = q->next;
	}
	scrollOffset += offset;
    17d9:	8b 15 c0 05 01 00    	mov    0x105c0,%edx
    17df:	8b 45 08             	mov    0x8(%ebp),%eax
    17e2:	01 d0                	add    %edx,%eax
    17e4:	a3 c0 05 01 00       	mov    %eax,0x105c0
}
    17e9:	c9                   	leave  
    17ea:	c3                   	ret    

000017eb <scrollDown>:

void scrollDown() {
    17eb:	55                   	push   %ebp
    17ec:	89 e5                	mov    %esp,%ebp
    17ee:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    17f1:	a1 cc 05 01 00       	mov    0x105cc,%eax
    17f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	printf(0, "have you ever had sex?%d\n%d", fileItemList->pos.start.y, (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    17f9:	a1 cc 05 01 00       	mov    0x105cc,%eax
    17fe:	8b 40 1c             	mov    0x1c(%eax),%eax
    1801:	c7 44 24 0c a4 01 00 	movl   $0x1a4,0xc(%esp)
    1808:	00 
    1809:	89 44 24 08          	mov    %eax,0x8(%esp)
    180d:	c7 44 24 04 5c ba 00 	movl   $0xba5c,0x4(%esp)
    1814:	00 
    1815:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    181c:	e8 40 3b 00 00       	call   5361 <printf>
	if (style == ICON_STYLE){
    1821:	a1 c4 fc 00 00       	mov    0xfcc4,%eax
    1826:	83 f8 01             	cmp    $0x1,%eax
    1829:	75 41                	jne    186c <scrollDown+0x81>
		if(q->pos.start.y > (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)){
    182b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    182e:	8b 40 1c             	mov    0x1c(%eax),%eax
    1831:	3d 63 01 00 00       	cmp    $0x163,%eax
    1836:	7e 73                	jle    18ab <scrollDown+0xc0>
			if(q->pos.start.y > WINDOW_HEIGHT){
    1838:	8b 45 f4             	mov    -0xc(%ebp),%eax
    183b:	8b 40 1c             	mov    0x1c(%eax),%eax
    183e:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1843:	7e 0e                	jle    1853 <scrollDown+0x68>
				scrollList(-SCROLL_UNIT);
    1845:	c7 04 24 e2 ff ff ff 	movl   $0xffffffe2,(%esp)
    184c:	e8 58 ff ff ff       	call   17a9 <scrollList>
    1851:	eb 58                	jmp    18ab <scrollDown+0xc0>
			}
			else{
				scrollList(-(q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)));
    1853:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1856:	8b 40 1c             	mov    0x1c(%eax),%eax
    1859:	ba 63 01 00 00       	mov    $0x163,%edx
    185e:	29 c2                	sub    %eax,%edx
    1860:	89 d0                	mov    %edx,%eax
    1862:	89 04 24             	mov    %eax,(%esp)
    1865:	e8 3f ff ff ff       	call   17a9 <scrollList>
    186a:	eb 3f                	jmp    18ab <scrollDown+0xc0>
			}
		}
	}
	else{
		if(q->pos.start.y > (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)){
    186c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    186f:	8b 40 1c             	mov    0x1c(%eax),%eax
    1872:	3d a4 01 00 00       	cmp    $0x1a4,%eax
    1877:	7e 32                	jle    18ab <scrollDown+0xc0>
			if(q->pos.start.y > WINDOW_HEIGHT){
    1879:	8b 45 f4             	mov    -0xc(%ebp),%eax
    187c:	8b 40 1c             	mov    0x1c(%eax),%eax
    187f:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1884:	7e 0e                	jle    1894 <scrollDown+0xa9>
				scrollList(-SCROLL_UNIT);
    1886:	c7 04 24 e2 ff ff ff 	movl   $0xffffffe2,(%esp)
    188d:	e8 17 ff ff ff       	call   17a9 <scrollList>
    1892:	eb 17                	jmp    18ab <scrollDown+0xc0>
			}
			else{
				scrollList(-(q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)));
    1894:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1897:	8b 40 1c             	mov    0x1c(%eax),%eax
    189a:	ba a4 01 00 00       	mov    $0x1a4,%edx
    189f:	29 c2                	sub    %eax,%edx
    18a1:	89 d0                	mov    %edx,%eax
    18a3:	89 04 24             	mov    %eax,(%esp)
    18a6:	e8 fe fe ff ff       	call   17a9 <scrollList>
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    18ab:	a1 c0 05 01 00       	mov    0x105c0,%eax
    18b0:	89 44 24 08          	mov    %eax,0x8(%esp)
    18b4:	c7 44 24 04 78 ba 00 	movl   $0xba78,0x4(%esp)
    18bb:	00 
    18bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18c3:	e8 99 3a 00 00       	call   5361 <printf>
}
    18c8:	c9                   	leave  
    18c9:	c3                   	ret    

000018ca <h_scrollDown>:

void h_scrollDown(Point p) {
    18ca:	55                   	push   %ebp
    18cb:	89 e5                	mov    %esp,%ebp
    18cd:	83 ec 38             	sub    $0x38,%esp
	scrollDown();
    18d0:	e8 16 ff ff ff       	call   17eb <scrollDown>
//	updateFileList(context);
//	fileSortByName();
	drawFinderContent(context);
    18d5:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    18da:	89 04 24             	mov    %eax,(%esp)
    18dd:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    18e2:	89 44 24 04          	mov    %eax,0x4(%esp)
    18e6:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    18eb:	89 44 24 08          	mov    %eax,0x8(%esp)
    18ef:	e8 4f f6 ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    18f4:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    18f9:	89 04 24             	mov    %eax,(%esp)
    18fc:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    1901:	89 44 24 04          	mov    %eax,0x4(%esp)
    1905:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    190a:	89 44 24 08          	mov    %eax,0x8(%esp)
    190e:	e8 e2 f2 ff ff       	call   bf5 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1913:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1916:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    191d:	00 
    191e:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1925:	00 
    1926:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    192d:	00 
    192e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1935:	00 
    1936:	89 04 24             	mov    %eax,(%esp)
    1939:	e8 09 2f 00 00       	call   4847 <initRect>
    193e:	83 ec 04             	sub    $0x4,%esp
    1941:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1944:	89 44 24 04          	mov    %eax,0x4(%esp)
    1948:	8b 45 ec             	mov    -0x14(%ebp),%eax
    194b:	89 44 24 08          	mov    %eax,0x8(%esp)
    194f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1952:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1956:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1959:	89 44 24 10          	mov    %eax,0x10(%esp)
    195d:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1964:	e8 e1 30 00 00       	call   4a4a <deleteClickable>
	addWndEvent(&cm);
    1969:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1970:	e8 cd fb ff ff       	call   1542 <addWndEvent>
	addListEvent(&cm);
    1975:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    197c:	e8 39 fb ff ff       	call   14ba <addListEvent>
}
    1981:	c9                   	leave  
    1982:	c3                   	ret    

00001983 <scrollUp>:

void scrollUp() {
    1983:	55                   	push   %ebp
    1984:	89 e5                	mov    %esp,%ebp
    1986:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    1989:	a1 cc 05 01 00       	mov    0x105cc,%eax
    198e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p;
	while (q != 0)
    1991:	eb 0f                	jmp    19a2 <scrollUp+0x1f>
	{
		p = q;
    1993:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1996:	89 45 f0             	mov    %eax,-0x10(%ebp)
		q = q->next;
    1999:	8b 45 f4             	mov    -0xc(%ebp),%eax
    199c:	8b 40 2c             	mov    0x2c(%eax),%eax
    199f:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void scrollUp() {
	struct fileItem *q = fileItemList;
	struct fileItem *p;
	while (q != 0)
    19a2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    19a6:	75 eb                	jne    1993 <scrollUp+0x10>
	{
		p = q;
		q = q->next;
	}
	printf(0, "the first file's y is tmd:%d\n", p->pos.start.y);
    19a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19ab:	8b 40 1c             	mov    0x1c(%eax),%eax
    19ae:	89 44 24 08          	mov    %eax,0x8(%esp)
    19b2:	c7 44 24 04 97 ba 00 	movl   $0xba97,0x4(%esp)
    19b9:	00 
    19ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19c1:	e8 9b 39 00 00       	call   5361 <printf>
	printf(0, "have you ever had sex?%d\n", fileItemList->pos.start.y);
    19c6:	a1 cc 05 01 00       	mov    0x105cc,%eax
    19cb:	8b 40 1c             	mov    0x1c(%eax),%eax
    19ce:	89 44 24 08          	mov    %eax,0x8(%esp)
    19d2:	c7 44 24 04 b5 ba 00 	movl   $0xbab5,0x4(%esp)
    19d9:	00 
    19da:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19e1:	e8 7b 39 00 00       	call   5361 <printf>
	if (style == ICON_STYLE){
    19e6:	a1 c4 fc 00 00       	mov    0xfcc4,%eax
    19eb:	83 f8 01             	cmp    $0x1,%eax
    19ee:	75 3d                	jne    1a2d <scrollUp+0xaa>
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)){
    19f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19f3:	8b 40 1c             	mov    0x1c(%eax),%eax
    19f6:	83 f8 45             	cmp    $0x45,%eax
    19f9:	7f 6d                	jg     1a68 <scrollUp+0xe5>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - ICON_ITEM_HEIGHT)){
    19fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19fe:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a01:	83 f8 e7             	cmp    $0xffffffe7,%eax
    1a04:	7d 0e                	jge    1a14 <scrollUp+0x91>
				scrollList(SCROLL_UNIT);
    1a06:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
    1a0d:	e8 97 fd ff ff       	call   17a9 <scrollList>
    1a12:	eb 54                	jmp    1a68 <scrollUp+0xe5>
			}
			else{
				scrollList((TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - p->pos.start.y);
    1a14:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a17:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a1a:	ba 46 00 00 00       	mov    $0x46,%edx
    1a1f:	29 c2                	sub    %eax,%edx
    1a21:	89 d0                	mov    %edx,%eax
    1a23:	89 04 24             	mov    %eax,(%esp)
    1a26:	e8 7e fd ff ff       	call   17a9 <scrollList>
    1a2b:	eb 3b                	jmp    1a68 <scrollUp+0xe5>
			}
		}
	}
	else{
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)){
    1a2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a30:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a33:	83 f8 61             	cmp    $0x61,%eax
    1a36:	7f 30                	jg     1a68 <scrollUp+0xe5>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - LIST_ITEM_HEIGHT)){
    1a38:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a3b:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a3e:	83 f8 43             	cmp    $0x43,%eax
    1a41:	7f 0e                	jg     1a51 <scrollUp+0xce>
				scrollList(SCROLL_UNIT);
    1a43:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
    1a4a:	e8 5a fd ff ff       	call   17a9 <scrollList>
    1a4f:	eb 17                	jmp    1a68 <scrollUp+0xe5>
			}
			else{
				scrollList((TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT) - p->pos.start.y);
    1a51:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a54:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a57:	ba 62 00 00 00       	mov    $0x62,%edx
    1a5c:	29 c2                	sub    %eax,%edx
    1a5e:	89 d0                	mov    %edx,%eax
    1a60:	89 04 24             	mov    %eax,(%esp)
    1a63:	e8 41 fd ff ff       	call   17a9 <scrollList>
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    1a68:	a1 c0 05 01 00       	mov    0x105c0,%eax
    1a6d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a71:	c7 44 24 04 cf ba 00 	movl   $0xbacf,0x4(%esp)
    1a78:	00 
    1a79:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a80:	e8 dc 38 00 00       	call   5361 <printf>
}
    1a85:	c9                   	leave  
    1a86:	c3                   	ret    

00001a87 <h_scrollUp>:

void h_scrollUp(Point p) {
    1a87:	55                   	push   %ebp
    1a88:	89 e5                	mov    %esp,%ebp
    1a8a:	83 ec 38             	sub    $0x38,%esp
	scrollUp();
    1a8d:	e8 f1 fe ff ff       	call   1983 <scrollUp>
//	updateFileList(context);
//	fileSortByName();
	drawFinderContent(context);
    1a92:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    1a97:	89 04 24             	mov    %eax,(%esp)
    1a9a:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    1a9f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1aa3:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    1aa8:	89 44 24 08          	mov    %eax,0x8(%esp)
    1aac:	e8 92 f4 ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    1ab1:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    1ab6:	89 04 24             	mov    %eax,(%esp)
    1ab9:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    1abe:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ac2:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    1ac7:	89 44 24 08          	mov    %eax,0x8(%esp)
    1acb:	e8 25 f1 ff ff       	call   bf5 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1ad0:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1ad3:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1ada:	00 
    1adb:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1ae2:	00 
    1ae3:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1aea:	00 
    1aeb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1af2:	00 
    1af3:	89 04 24             	mov    %eax,(%esp)
    1af6:	e8 4c 2d 00 00       	call   4847 <initRect>
    1afb:	83 ec 04             	sub    $0x4,%esp
    1afe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1b01:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b05:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b08:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b0f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b16:	89 44 24 10          	mov    %eax,0x10(%esp)
    1b1a:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1b21:	e8 24 2f 00 00       	call   4a4a <deleteClickable>
	addWndEvent(&cm);
    1b26:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1b2d:	e8 10 fa ff ff       	call   1542 <addWndEvent>
	addListEvent(&cm);
    1b32:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1b39:	e8 7c f9 ff ff       	call   14ba <addListEvent>
}
    1b3e:	c9                   	leave  
    1b3f:	c3                   	ret    

00001b40 <updatePath>:

void updatePath(char *name) {
    1b40:	55                   	push   %ebp
    1b41:	89 e5                	mov    %esp,%ebp
    1b43:	83 ec 28             	sub    $0x28,%esp
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    1b46:	8b 45 08             	mov    0x8(%ebp),%eax
    1b49:	89 04 24             	mov    %eax,(%esp)
    1b4c:	e8 54 34 00 00       	call   4fa5 <strlen>
    1b51:	89 45 f0             	mov    %eax,-0x10(%ebp)
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    1b54:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    1b58:	0f 85 84 00 00 00    	jne    1be2 <updatePath+0xa2>
    1b5e:	8b 45 08             	mov    0x8(%ebp),%eax
    1b61:	0f b6 00             	movzbl (%eax),%eax
    1b64:	3c 2e                	cmp    $0x2e,%al
    1b66:	75 7a                	jne    1be2 <updatePath+0xa2>
    1b68:	8b 45 08             	mov    0x8(%ebp),%eax
    1b6b:	83 c0 01             	add    $0x1,%eax
    1b6e:	0f b6 00             	movzbl (%eax),%eax
    1b71:	3c 2e                	cmp    $0x2e,%al
    1b73:	75 6d                	jne    1be2 <updatePath+0xa2>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1b75:	c7 04 24 20 3c 01 00 	movl   $0x13c20,(%esp)
    1b7c:	e8 24 34 00 00       	call   4fa5 <strlen>
    1b81:	83 f8 01             	cmp    $0x1,%eax
    1b84:	75 0b                	jne    1b91 <updatePath+0x51>
    1b86:	0f b6 05 20 3c 01 00 	movzbl 0x13c20,%eax
    1b8d:	3c 2f                	cmp    $0x2f,%al
    1b8f:	74 4f                	je     1be0 <updatePath+0xa0>
        {
            int tmpn = strlen(currentPath);
    1b91:	c7 04 24 20 3c 01 00 	movl   $0x13c20,(%esp)
    1b98:	e8 08 34 00 00       	call   4fa5 <strlen>
    1b9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
            currentPath[tmpn - 1] = '\0';
    1ba0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ba3:	83 e8 01             	sub    $0x1,%eax
    1ba6:	c6 80 20 3c 01 00 00 	movb   $0x0,0x13c20(%eax)
            for (i = tmpn - 2; i > 0; i--)
    1bad:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1bb0:	83 e8 02             	sub    $0x2,%eax
    1bb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1bb6:	eb 22                	jmp    1bda <updatePath+0x9a>
            {
                if (currentPath[i] != '/')
    1bb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bbb:	05 20 3c 01 00       	add    $0x13c20,%eax
    1bc0:	0f b6 00             	movzbl (%eax),%eax
    1bc3:	3c 2f                	cmp    $0x2f,%al
    1bc5:	74 11                	je     1bd8 <updatePath+0x98>
                    currentPath[i] = '\0';
    1bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bca:	05 20 3c 01 00       	add    $0x13c20,%eax
    1bcf:	c6 00 00             	movb   $0x0,(%eax)
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
    1bd2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1bd6:	eb 02                	jmp    1bda <updatePath+0x9a>
            {
                if (currentPath[i] != '/')
                    currentPath[i] = '\0';
                else
                    break;
    1bd8:	eb 06                	jmp    1be0 <updatePath+0xa0>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
    1bda:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1bde:	7f d8                	jg     1bb8 <updatePath+0x78>
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1be0:	eb 4e                	jmp    1c30 <updatePath+0xf0>
            }
        }
    }
    else
    {
        int tmpn = strlen(currentPath);
    1be2:	c7 04 24 20 3c 01 00 	movl   $0x13c20,(%esp)
    1be9:	e8 b7 33 00 00       	call   4fa5 <strlen>
    1bee:	89 45 e8             	mov    %eax,-0x18(%ebp)
        strcpy(currentPath + tmpn, name);
    1bf1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1bf4:	8d 90 20 3c 01 00    	lea    0x13c20(%eax),%edx
    1bfa:	8b 45 08             	mov    0x8(%ebp),%eax
    1bfd:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c01:	89 14 24             	mov    %edx,(%esp)
    1c04:	e8 2d 33 00 00       	call   4f36 <strcpy>
        tmpn = strlen(currentPath);
    1c09:	c7 04 24 20 3c 01 00 	movl   $0x13c20,(%esp)
    1c10:	e8 90 33 00 00       	call   4fa5 <strlen>
    1c15:	89 45 e8             	mov    %eax,-0x18(%ebp)
        currentPath[tmpn] = '/';
    1c18:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c1b:	05 20 3c 01 00       	add    $0x13c20,%eax
    1c20:	c6 00 2f             	movb   $0x2f,(%eax)
        currentPath[tmpn + 1] = '\0';
    1c23:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c26:	83 c0 01             	add    $0x1,%eax
    1c29:	c6 80 20 3c 01 00 00 	movb   $0x0,0x13c20(%eax)
    }
}
    1c30:	c9                   	leave  
    1c31:	c3                   	ret    

00001c32 <enterDir>:

// Handlers
void enterDir(char *name) {
    1c32:	55                   	push   %ebp
    1c33:	89 e5                	mov    %esp,%ebp
    1c35:	83 ec 18             	sub    $0x18,%esp
	scrollOffset = 0;
    1c38:	c7 05 c0 05 01 00 00 	movl   $0x0,0x105c0
    1c3f:	00 00 00 
	printf(0, "entering : %s\n", name);
    1c42:	8b 45 08             	mov    0x8(%ebp),%eax
    1c45:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c49:	c7 44 24 04 ec ba 00 	movl   $0xbaec,0x4(%esp)
    1c50:	00 
    1c51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c58:	e8 04 37 00 00       	call   5361 <printf>
	if (chdir(name) < 0)
    1c5d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c60:	89 04 24             	mov    %eax,(%esp)
    1c63:	e8 81 35 00 00       	call   51e9 <chdir>
    1c68:	85 c0                	test   %eax,%eax
    1c6a:	79 1d                	jns    1c89 <enterDir+0x57>
		printf(2, "cannot cd %s\n", name);
    1c6c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c6f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c73:	c7 44 24 04 fb ba 00 	movl   $0xbafb,0x4(%esp)
    1c7a:	00 
    1c7b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1c82:	e8 da 36 00 00       	call   5361 <printf>
    1c87:	eb 0b                	jmp    1c94 <enterDir+0x62>
	else
		updatePath(name);
    1c89:	8b 45 08             	mov    0x8(%ebp),%eax
    1c8c:	89 04 24             	mov    %eax,(%esp)
    1c8f:	e8 ac fe ff ff       	call   1b40 <updatePath>
	printf(0, "currentPath: %s\n", currentPath);
    1c94:	c7 44 24 08 20 3c 01 	movl   $0x13c20,0x8(%esp)
    1c9b:	00 
    1c9c:	c7 44 24 04 09 bb 00 	movl   $0xbb09,0x4(%esp)
    1ca3:	00 
    1ca4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cab:	e8 b1 36 00 00       	call   5361 <printf>
}
    1cb0:	c9                   	leave  
    1cb1:	c3                   	ret    

00001cb2 <h_enterDir>:

void h_enterDir(Point p) {
    1cb2:	55                   	push   %ebp
    1cb3:	89 e5                	mov    %esp,%ebp
    1cb5:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *temp = getFileItem(p);
    1cb8:	8b 45 08             	mov    0x8(%ebp),%eax
    1cbb:	8b 55 0c             	mov    0xc(%ebp),%edx
    1cbe:	89 04 24             	mov    %eax,(%esp)
    1cc1:	89 54 24 04          	mov    %edx,0x4(%esp)
    1cc5:	e8 a3 f9 ff ff       	call   166d <getFileItem>
    1cca:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    1ccd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cd0:	8b 40 14             	mov    0x14(%eax),%eax
    1cd3:	89 04 24             	mov    %eax,(%esp)
    1cd6:	e8 57 ff ff ff       	call   1c32 <enterDir>
	updateFileList(context);
    1cdb:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    1ce0:	89 04 24             	mov    %eax,(%esp)
    1ce3:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    1ce8:	89 44 24 04          	mov    %eax,0x4(%esp)
    1cec:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    1cf1:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cf5:	e8 fa f0 ff ff       	call   df4 <updateFileList>
	drawFinderContent(context);
    1cfa:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    1cff:	89 04 24             	mov    %eax,(%esp)
    1d02:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    1d07:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d0b:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    1d10:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d14:	e8 2a f2 ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    1d19:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    1d1e:	89 04 24             	mov    %eax,(%esp)
    1d21:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    1d26:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d2a:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    1d2f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d33:	e8 bd ee ff ff       	call   bf5 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1d38:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1d3b:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1d42:	00 
    1d43:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1d4a:	00 
    1d4b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1d52:	00 
    1d53:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1d5a:	00 
    1d5b:	89 04 24             	mov    %eax,(%esp)
    1d5e:	e8 e4 2a 00 00       	call   4847 <initRect>
    1d63:	83 ec 04             	sub    $0x4,%esp
    1d66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1d69:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1d70:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d74:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1d77:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1d7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d7e:	89 44 24 10          	mov    %eax,0x10(%esp)
    1d82:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1d89:	e8 bc 2c 00 00       	call   4a4a <deleteClickable>
	addWndEvent(&cm);
    1d8e:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1d95:	e8 a8 f7 ff ff       	call   1542 <addWndEvent>
	addListEvent(&cm);
    1d9a:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1da1:	e8 14 f7 ff ff       	call   14ba <addListEvent>
}
    1da6:	c9                   	leave  
    1da7:	c3                   	ret    

00001da8 <newFile>:

void newFile(char *name) {
    1da8:	55                   	push   %ebp
    1da9:	89 e5                	mov    %esp,%ebp
    1dab:	83 ec 28             	sub    $0x28,%esp
	int fd;
	int n = strlen(name);
    1dae:	8b 45 08             	mov    0x8(%ebp),%eax
    1db1:	89 04 24             	mov    %eax,(%esp)
    1db4:	e8 ec 31 00 00       	call   4fa5 <strlen>
    1db9:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    1dbc:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    1dc3:	eb 60                	jmp    1e25 <newFile+0x7d>
	{
		n = strlen(name);
    1dc5:	8b 45 08             	mov    0x8(%ebp),%eax
    1dc8:	89 04 24             	mov    %eax,(%esp)
    1dcb:	e8 d5 31 00 00       	call   4fa5 <strlen>
    1dd0:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1dd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1dd6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1dd9:	75 09                	jne    1de4 <newFile+0x3c>
		{
			counter = 1;
    1ddb:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1de2:	eb 17                	jmp    1dfb <newFile+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1de4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1de7:	8b 45 08             	mov    0x8(%ebp),%eax
    1dea:	01 d0                	add    %edx,%eax
    1dec:	89 04 24             	mov    %eax,(%esp)
    1def:	e8 f3 32 00 00       	call   50e7 <atoi>
    1df4:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1df7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1dfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1dfe:	89 04 24             	mov    %eax,(%esp)
    1e01:	e8 ba f3 ff ff       	call   11c0 <int2str>
    1e06:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1e09:	8b 55 08             	mov    0x8(%ebp),%edx
    1e0c:	01 ca                	add    %ecx,%edx
    1e0e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e12:	89 14 24             	mov    %edx,(%esp)
    1e15:	e8 1c 31 00 00       	call   4f36 <strcpy>
		close(fd);
    1e1a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e1d:	89 04 24             	mov    %eax,(%esp)
    1e20:	e8 7c 33 00 00       	call   51a1 <close>
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    1e25:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e2c:	00 
    1e2d:	8b 45 08             	mov    0x8(%ebp),%eax
    1e30:	89 04 24             	mov    %eax,(%esp)
    1e33:	e8 81 33 00 00       	call   51b9 <open>
    1e38:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1e3b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1e3f:	7f 84                	jg     1dc5 <newFile+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    1e41:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1e48:	00 
    1e49:	8b 45 08             	mov    0x8(%ebp),%eax
    1e4c:	89 04 24             	mov    %eax,(%esp)
    1e4f:	e8 65 33 00 00       	call   51b9 <open>
    1e54:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1e57:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1e5b:	79 20                	jns    1e7d <newFile+0xd5>
		printf(0, "cat: cannot open %s\n", name);
    1e5d:	8b 45 08             	mov    0x8(%ebp),%eax
    1e60:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e64:	c7 44 24 04 1a bb 00 	movl   $0xbb1a,0x4(%esp)
    1e6b:	00 
    1e6c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e73:	e8 e9 34 00 00       	call   5361 <printf>
		exit();
    1e78:	e8 fc 32 00 00       	call   5179 <exit>
	}
	close(fd);
    1e7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e80:	89 04 24             	mov    %eax,(%esp)
    1e83:	e8 19 33 00 00       	call   51a1 <close>
}
    1e88:	c9                   	leave  
    1e89:	c3                   	ret    

00001e8a <h_newFile>:

void h_newFile(Point p) {
    1e8a:	55                   	push   %ebp
    1e8b:	89 e5                	mov    %esp,%ebp
    1e8d:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "file.txt";
    1e90:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    1e97:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    1e9e:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    1ea5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1eac:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1eb3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    1eba:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1ec1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    1ec8:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1ecb:	89 04 24             	mov    %eax,(%esp)
    1ece:	e8 d5 fe ff ff       	call   1da8 <newFile>
	updateFileList(context);
    1ed3:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    1ed8:	89 04 24             	mov    %eax,(%esp)
    1edb:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    1ee0:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ee4:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    1ee9:	89 44 24 08          	mov    %eax,0x8(%esp)
    1eed:	e8 02 ef ff ff       	call   df4 <updateFileList>
	drawFinderContent(context);
    1ef2:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    1ef7:	89 04 24             	mov    %eax,(%esp)
    1efa:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    1eff:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f03:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    1f08:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f0c:	e8 32 f0 ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    1f11:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    1f16:	89 04 24             	mov    %eax,(%esp)
    1f19:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    1f1e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f22:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    1f27:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f2b:	e8 c5 ec ff ff       	call   bf5 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1f30:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1f33:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1f3a:	00 
    1f3b:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1f42:	00 
    1f43:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1f4a:	00 
    1f4b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1f52:	00 
    1f53:	89 04 24             	mov    %eax,(%esp)
    1f56:	e8 ec 28 00 00       	call   4847 <initRect>
    1f5b:	83 ec 04             	sub    $0x4,%esp
    1f5e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f61:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f65:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1f68:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f6f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1f73:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f76:	89 44 24 10          	mov    %eax,0x10(%esp)
    1f7a:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1f81:	e8 c4 2a 00 00       	call   4a4a <deleteClickable>
	addWndEvent(&cm);
    1f86:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1f8d:	e8 b0 f5 ff ff       	call   1542 <addWndEvent>
	addListEvent(&cm);
    1f92:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    1f99:	e8 1c f5 ff ff       	call   14ba <addListEvent>
}
    1f9e:	c9                   	leave  
    1f9f:	c3                   	ret    

00001fa0 <newFolder>:

void newFolder(char *name) {
    1fa0:	55                   	push   %ebp
    1fa1:	89 e5                	mov    %esp,%ebp
    1fa3:	83 ec 28             	sub    $0x28,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    1fa6:	8b 45 08             	mov    0x8(%ebp),%eax
    1fa9:	89 04 24             	mov    %eax,(%esp)
    1fac:	e8 f4 2f 00 00       	call   4fa5 <strlen>
    1fb1:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    1fb4:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    1fbb:	eb 55                	jmp    2012 <newFolder+0x72>
		n = strlen(name);
    1fbd:	8b 45 08             	mov    0x8(%ebp),%eax
    1fc0:	89 04 24             	mov    %eax,(%esp)
    1fc3:	e8 dd 2f 00 00       	call   4fa5 <strlen>
    1fc8:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1fcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1fce:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1fd1:	75 09                	jne    1fdc <newFolder+0x3c>
		{
			counter = 1;
    1fd3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1fda:	eb 17                	jmp    1ff3 <newFolder+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1fdc:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1fdf:	8b 45 08             	mov    0x8(%ebp),%eax
    1fe2:	01 d0                	add    %edx,%eax
    1fe4:	89 04 24             	mov    %eax,(%esp)
    1fe7:	e8 fb 30 00 00       	call   50e7 <atoi>
    1fec:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1fef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1ff3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ff6:	89 04 24             	mov    %eax,(%esp)
    1ff9:	e8 c2 f1 ff ff       	call   11c0 <int2str>
    1ffe:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    2001:	8b 55 08             	mov    0x8(%ebp),%edx
    2004:	01 ca                	add    %ecx,%edx
    2006:	89 44 24 04          	mov    %eax,0x4(%esp)
    200a:	89 14 24             	mov    %edx,(%esp)
    200d:	e8 24 2f 00 00       	call   4f36 <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    2012:	8b 45 08             	mov    0x8(%ebp),%eax
    2015:	89 04 24             	mov    %eax,(%esp)
    2018:	e8 c4 31 00 00       	call   51e1 <mkdir>
    201d:	85 c0                	test   %eax,%eax
    201f:	78 9c                	js     1fbd <newFolder+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    2021:	c9                   	leave  
    2022:	c3                   	ret    

00002023 <h_newFolder>:

void h_newFolder(Point p) {
    2023:	55                   	push   %ebp
    2024:	89 e5                	mov    %esp,%ebp
    2026:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "newFolder";
    2029:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    2030:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    2037:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    203e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    2045:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    204c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    2053:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    205a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    2061:	8d 45 c8             	lea    -0x38(%ebp),%eax
    2064:	89 04 24             	mov    %eax,(%esp)
    2067:	e8 34 ff ff ff       	call   1fa0 <newFolder>
	printf(0, "new folder!\n");
    206c:	c7 44 24 04 2f bb 00 	movl   $0xbb2f,0x4(%esp)
    2073:	00 
    2074:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    207b:	e8 e1 32 00 00       	call   5361 <printf>
	updateFileList(context);
    2080:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2085:	89 04 24             	mov    %eax,(%esp)
    2088:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    208d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2091:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2096:	89 44 24 08          	mov    %eax,0x8(%esp)
    209a:	e8 55 ed ff ff       	call   df4 <updateFileList>
	printItemList();
    209f:	e8 00 f2 ff ff       	call   12a4 <printItemList>
	drawFinderContent(context);
    20a4:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    20a9:	89 04 24             	mov    %eax,(%esp)
    20ac:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    20b1:	89 44 24 04          	mov    %eax,0x4(%esp)
    20b5:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    20ba:	89 44 24 08          	mov    %eax,0x8(%esp)
    20be:	e8 80 ee ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    20c3:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    20c8:	89 04 24             	mov    %eax,(%esp)
    20cb:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    20d0:	89 44 24 04          	mov    %eax,0x4(%esp)
    20d4:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    20d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    20dd:	e8 13 eb ff ff       	call   bf5 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    20e2:	8d 45 e8             	lea    -0x18(%ebp),%eax
    20e5:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    20ec:	00 
    20ed:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    20f4:	00 
    20f5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    20fc:	00 
    20fd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2104:	00 
    2105:	89 04 24             	mov    %eax,(%esp)
    2108:	e8 3a 27 00 00       	call   4847 <initRect>
    210d:	83 ec 04             	sub    $0x4,%esp
    2110:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2113:	89 44 24 04          	mov    %eax,0x4(%esp)
    2117:	8b 45 ec             	mov    -0x14(%ebp),%eax
    211a:	89 44 24 08          	mov    %eax,0x8(%esp)
    211e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2121:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2125:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2128:	89 44 24 10          	mov    %eax,0x10(%esp)
    212c:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2133:	e8 12 29 00 00       	call   4a4a <deleteClickable>
	addWndEvent(&cm);
    2138:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    213f:	e8 fe f3 ff ff       	call   1542 <addWndEvent>
	addListEvent(&cm);
    2144:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    214b:	e8 6a f3 ff ff       	call   14ba <addListEvent>
}
    2150:	c9                   	leave  
    2151:	c3                   	ret    

00002152 <deleteFile>:

void deleteFile(char *name)
{
    2152:	55                   	push   %ebp
    2153:	89 e5                	mov    %esp,%ebp
    2155:	83 ec 28             	sub    $0x28,%esp
	printf(0, "currently having sex with %s\n", name);
    2158:	8b 45 08             	mov    0x8(%ebp),%eax
    215b:	89 44 24 08          	mov    %eax,0x8(%esp)
    215f:	c7 44 24 04 3c bb 00 	movl   $0xbb3c,0x4(%esp)
    2166:	00 
    2167:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    216e:	e8 ee 31 00 00       	call   5361 <printf>
	if(unlink(name) < 0){
    2173:	8b 45 08             	mov    0x8(%ebp),%eax
    2176:	89 04 24             	mov    %eax,(%esp)
    2179:	e8 4b 30 00 00       	call   51c9 <unlink>
    217e:	85 c0                	test   %eax,%eax
    2180:	0f 89 c9 00 00 00    	jns    224f <deleteFile+0xfd>
		if (chdir(name) < 0){
    2186:	8b 45 08             	mov    0x8(%ebp),%eax
    2189:	89 04 24             	mov    %eax,(%esp)
    218c:	e8 58 30 00 00       	call   51e9 <chdir>
    2191:	85 c0                	test   %eax,%eax
    2193:	79 20                	jns    21b5 <deleteFile+0x63>
			printf(2, "rm: %s failed to delete\n", name);
    2195:	8b 45 08             	mov    0x8(%ebp),%eax
    2198:	89 44 24 08          	mov    %eax,0x8(%esp)
    219c:	c7 44 24 04 5a bb 00 	movl   $0xbb5a,0x4(%esp)
    21a3:	00 
    21a4:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    21ab:	e8 b1 31 00 00       	call   5361 <printf>
    21b0:	e9 9a 00 00 00       	jmp    224f <deleteFile+0xfd>
		}
		else{
			updateFileList(context);
    21b5:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    21ba:	89 04 24             	mov    %eax,(%esp)
    21bd:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    21c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    21c6:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    21cb:	89 44 24 08          	mov    %eax,0x8(%esp)
    21cf:	e8 20 ec ff ff       	call   df4 <updateFileList>
			struct fileItem *p;
			p = fileItemList;
    21d4:	a1 cc 05 01 00       	mov    0x105cc,%eax
    21d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    21dc:	eb 35                	jmp    2213 <deleteFile+0xc1>
				deleteFile(p->name);
    21de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21e1:	8b 40 14             	mov    0x14(%eax),%eax
    21e4:	89 04 24             	mov    %eax,(%esp)
    21e7:	e8 66 ff ff ff       	call   2152 <deleteFile>
				updateFileList(context);
    21ec:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    21f1:	89 04 24             	mov    %eax,(%esp)
    21f4:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    21f9:	89 44 24 04          	mov    %eax,0x4(%esp)
    21fd:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2202:	89 44 24 08          	mov    %eax,0x8(%esp)
    2206:	e8 e9 eb ff ff       	call   df4 <updateFileList>
				p = fileItemList;
    220b:	a1 cc 05 01 00       	mov    0x105cc,%eax
    2210:	89 45 f4             	mov    %eax,-0xc(%ebp)
		}
		else{
			updateFileList(context);
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
    2213:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2217:	75 c5                	jne    21de <deleteFile+0x8c>
				deleteFile(p->name);
				updateFileList(context);
				p = fileItemList;
			}
			chdir("..");
    2219:	c7 04 24 73 bb 00 00 	movl   $0xbb73,(%esp)
    2220:	e8 c4 2f 00 00       	call   51e9 <chdir>
			updateFileList(context);
    2225:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    222a:	89 04 24             	mov    %eax,(%esp)
    222d:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2232:	89 44 24 04          	mov    %eax,0x4(%esp)
    2236:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    223b:	89 44 24 08          	mov    %eax,0x8(%esp)
    223f:	e8 b0 eb ff ff       	call   df4 <updateFileList>
			unlink(name);
    2244:	8b 45 08             	mov    0x8(%ebp),%eax
    2247:	89 04 24             	mov    %eax,(%esp)
    224a:	e8 7a 2f 00 00       	call   51c9 <unlink>
		}
	}
}
    224f:	c9                   	leave  
    2250:	c3                   	ret    

00002251 <h_deleteFile>:
void h_deleteFile(Point p) {
    2251:	55                   	push   %ebp
    2252:	89 e5                	mov    %esp,%ebp
    2254:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *q = fileItemList;
    2257:	a1 cc 05 01 00       	mov    0x105cc,%eax
    225c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    225f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    2266:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2269:	89 45 f0             	mov    %eax,-0x10(%ebp)
    226c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    226f:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    2272:	c7 44 24 04 76 bb 00 	movl   $0xbb76,0x4(%esp)
    2279:	00 
    227a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2281:	e8 db 30 00 00       	call   5361 <printf>
	while (q != 0)
    2286:	e9 8d 00 00 00       	jmp    2318 <h_deleteFile+0xc7>
	{
		printf(0, "hi2\n");
    228b:	c7 44 24 04 7b bb 00 	movl   $0xbb7b,0x4(%esp)
    2292:	00 
    2293:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    229a:	e8 c2 30 00 00       	call   5361 <printf>
		if (q->chosen)
    229f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22a2:	8b 40 28             	mov    0x28(%eax),%eax
    22a5:	85 c0                	test   %eax,%eax
    22a7:	74 66                	je     230f <h_deleteFile+0xbe>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    22a9:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    22b0:	e8 98 33 00 00       	call   564d <malloc>
    22b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    22b8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    22bf:	e8 89 33 00 00       	call   564d <malloc>
    22c4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    22c7:	89 42 14             	mov    %eax,0x14(%edx)
			strcpy(p1->name, q->name);
    22ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22cd:	8b 50 14             	mov    0x14(%eax),%edx
    22d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22d3:	8b 40 14             	mov    0x14(%eax),%eax
    22d6:	89 54 24 04          	mov    %edx,0x4(%esp)
    22da:	89 04 24             	mov    %eax,(%esp)
    22dd:	e8 54 2c 00 00       	call   4f36 <strcpy>
			if(head == 0)
    22e2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    22e6:	75 0e                	jne    22f6 <h_deleteFile+0xa5>
			{
				head = p1;
    22e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
				p2 = p1;
    22ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22f1:	89 45 e8             	mov    %eax,-0x18(%ebp)
    22f4:	eb 0f                	jmp    2305 <h_deleteFile+0xb4>
			} else {
				p2->next = p1;
    22f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    22f9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    22fc:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    22ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2302:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
    2305:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2308:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
		q = q->next;
    230f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2312:	8b 40 2c             	mov    0x2c(%eax),%eax
    2315:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
    2318:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    231c:	0f 85 69 ff ff ff    	jne    228b <h_deleteFile+0x3a>
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
    2322:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2325:	89 45 f0             	mov    %eax,-0x10(%ebp)
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    2328:	c7 44 24 04 80 bb 00 	movl   $0xbb80,0x4(%esp)
    232f:	00 
    2330:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2337:	e8 25 30 00 00       	call   5361 <printf>
	while (p1 != 0)
    233c:	eb 17                	jmp    2355 <h_deleteFile+0x104>
	{
		deleteFile(p1->name);
    233e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2341:	8b 40 14             	mov    0x14(%eax),%eax
    2344:	89 04 24             	mov    %eax,(%esp)
    2347:	e8 06 fe ff ff       	call   2152 <deleteFile>
		p1 = p1->next;
    234c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    234f:	8b 40 2c             	mov    0x2c(%eax),%eax
    2352:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
    2355:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2359:	75 e3                	jne    233e <h_deleteFile+0xed>
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
    235b:	c7 44 24 04 e8 bb 00 	movl   $0xbbe8,0x4(%esp)
    2362:	00 
    2363:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    236a:	e8 f2 2f 00 00       	call   5361 <printf>
	p1 = head;
    236f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2372:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while (p1 != 0) {
    2375:	eb 46                	jmp    23bd <h_deleteFile+0x16c>
		p2 = p1;
    2377:	8b 45 f0             	mov    -0x10(%ebp),%eax
    237a:	89 45 e8             	mov    %eax,-0x18(%ebp)
		printf(0, "freeing %s\n", p2->name);
    237d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2380:	8b 40 14             	mov    0x14(%eax),%eax
    2383:	89 44 24 08          	mov    %eax,0x8(%esp)
    2387:	c7 44 24 04 fe bb 00 	movl   $0xbbfe,0x4(%esp)
    238e:	00 
    238f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2396:	e8 c6 2f 00 00       	call   5361 <printf>
		p1 = p1->next;
    239b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    239e:	8b 40 2c             	mov    0x2c(%eax),%eax
    23a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    23a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    23a7:	8b 40 14             	mov    0x14(%eax),%eax
    23aa:	89 04 24             	mov    %eax,(%esp)
    23ad:	e8 62 31 00 00       	call   5514 <free>
		free(p2);
    23b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    23b5:	89 04 24             	mov    %eax,(%esp)
    23b8:	e8 57 31 00 00       	call   5514 <free>
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
    23bd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    23c1:	75 b4                	jne    2377 <h_deleteFile+0x126>
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
    23c3:	c7 44 24 04 0a bc 00 	movl   $0xbc0a,0x4(%esp)
    23ca:	00 
    23cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23d2:	e8 8a 2f 00 00       	call   5361 <printf>
	updateFileList(context);
    23d7:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    23dc:	89 04 24             	mov    %eax,(%esp)
    23df:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    23e4:	89 44 24 04          	mov    %eax,0x4(%esp)
    23e8:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    23ed:	89 44 24 08          	mov    %eax,0x8(%esp)
    23f1:	e8 fe e9 ff ff       	call   df4 <updateFileList>
	printItemList();
    23f6:	e8 a9 ee ff ff       	call   12a4 <printItemList>
	drawFinderContent(context);
    23fb:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2400:	89 04 24             	mov    %eax,(%esp)
    2403:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2408:	89 44 24 04          	mov    %eax,0x4(%esp)
    240c:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2411:	89 44 24 08          	mov    %eax,0x8(%esp)
    2415:	e8 29 eb ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    241a:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    241f:	89 04 24             	mov    %eax,(%esp)
    2422:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2427:	89 44 24 04          	mov    %eax,0x4(%esp)
    242b:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2430:	89 44 24 08          	mov    %eax,0x8(%esp)
    2434:	e8 bc e7 ff ff       	call   bf5 <drawFinderWnd>
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2439:	8d 45 d8             	lea    -0x28(%ebp),%eax
    243c:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2443:	00 
    2444:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    244b:	00 
    244c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2453:	00 
    2454:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    245b:	00 
    245c:	89 04 24             	mov    %eax,(%esp)
    245f:	e8 e3 23 00 00       	call   4847 <initRect>
    2464:	83 ec 04             	sub    $0x4,%esp
    2467:	8b 45 d8             	mov    -0x28(%ebp),%eax
    246a:	89 44 24 04          	mov    %eax,0x4(%esp)
    246e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2471:	89 44 24 08          	mov    %eax,0x8(%esp)
    2475:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2478:	89 44 24 0c          	mov    %eax,0xc(%esp)
    247c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    247f:	89 44 24 10          	mov    %eax,0x10(%esp)
    2483:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    248a:	e8 bb 25 00 00       	call   4a4a <deleteClickable>
		addWndEvent(&cm);
    248f:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2496:	e8 a7 f0 ff ff       	call   1542 <addWndEvent>
		addListEvent(&cm);
    249b:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    24a2:	e8 13 f0 ff ff       	call   14ba <addListEvent>
}
    24a7:	c9                   	leave  
    24a8:	c3                   	ret    

000024a9 <copyFile>:

void copyFile(){
    24a9:	55                   	push   %ebp
    24aa:	89 e5                	mov    %esp,%ebp
    24ac:	56                   	push   %esi
    24ad:	53                   	push   %ebx
    24ae:	83 ec 20             	sub    $0x20,%esp
	int fd;
	struct fileItem *p = fileItemList;
    24b1:	a1 cc 05 01 00       	mov    0x105cc,%eax
    24b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    24b9:	e9 0f 01 00 00       	jmp    25cd <copyFile+0x124>
		if (p->chosen == 1){
    24be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24c1:	8b 40 28             	mov    0x28(%eax),%eax
    24c4:	83 f8 01             	cmp    $0x1,%eax
    24c7:	0f 85 f7 00 00 00    	jne    25c4 <copyFile+0x11b>
			if(lenOfWaited >= MAX_COPY_SIZE){
    24cd:	a1 34 3d 01 00       	mov    0x13d34,%eax
    24d2:	83 f8 07             	cmp    $0x7,%eax
    24d5:	7e 22                	jle    24f9 <copyFile+0x50>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    24d7:	a1 34 3d 01 00       	mov    0x13d34,%eax
    24dc:	89 44 24 08          	mov    %eax,0x8(%esp)
    24e0:	c7 44 24 04 1c bc 00 	movl   $0xbc1c,0x4(%esp)
    24e7:	00 
    24e8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24ef:	e8 6d 2e 00 00       	call   5361 <printf>
    24f4:	e9 cb 00 00 00       	jmp    25c4 <copyFile+0x11b>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    24f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24fc:	8b 40 14             	mov    0x14(%eax),%eax
    24ff:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2506:	00 
    2507:	89 04 24             	mov    %eax,(%esp)
    250a:	e8 aa 2c 00 00       	call   51b9 <open>
    250f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2512:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2516:	0f 88 8a 00 00 00    	js     25a6 <copyFile+0xfd>
					strcpy(filesWaited[lenOfWaited], currentPath);
    251c:	a1 34 3d 01 00       	mov    0x13d34,%eax
    2521:	c1 e0 08             	shl    $0x8,%eax
    2524:	05 e0 33 01 00       	add    $0x133e0,%eax
    2529:	c7 44 24 04 20 3c 01 	movl   $0x13c20,0x4(%esp)
    2530:	00 
    2531:	89 04 24             	mov    %eax,(%esp)
    2534:	e8 fd 29 00 00       	call   4f36 <strcpy>
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    2539:	8b 45 f4             	mov    -0xc(%ebp),%eax
    253c:	8b 58 14             	mov    0x14(%eax),%ebx
    253f:	a1 34 3d 01 00       	mov    0x13d34,%eax
    2544:	c1 e0 08             	shl    $0x8,%eax
    2547:	8d b0 e0 33 01 00    	lea    0x133e0(%eax),%esi
    254d:	c7 04 24 20 3c 01 00 	movl   $0x13c20,(%esp)
    2554:	e8 4c 2a 00 00       	call   4fa5 <strlen>
    2559:	01 f0                	add    %esi,%eax
    255b:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    255f:	89 04 24             	mov    %eax,(%esp)
    2562:	e8 cf 29 00 00       	call   4f36 <strcpy>
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    2567:	a1 34 3d 01 00       	mov    0x13d34,%eax
    256c:	c1 e0 08             	shl    $0x8,%eax
    256f:	05 e0 33 01 00       	add    $0x133e0,%eax
    2574:	89 44 24 08          	mov    %eax,0x8(%esp)
    2578:	c7 44 24 04 37 bc 00 	movl   $0xbc37,0x4(%esp)
    257f:	00 
    2580:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2587:	e8 d5 2d 00 00       	call   5361 <printf>
					lenOfWaited++;
    258c:	a1 34 3d 01 00       	mov    0x13d34,%eax
    2591:	83 c0 01             	add    $0x1,%eax
    2594:	a3 34 3d 01 00       	mov    %eax,0x13d34
					close(fd);
    2599:	8b 45 f0             	mov    -0x10(%ebp),%eax
    259c:	89 04 24             	mov    %eax,(%esp)
    259f:	e8 fd 2b 00 00       	call   51a1 <close>
    25a4:	eb 1e                	jmp    25c4 <copyFile+0x11b>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    25a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25a9:	8b 40 14             	mov    0x14(%eax),%eax
    25ac:	89 44 24 08          	mov    %eax,0x8(%esp)
    25b0:	c7 44 24 04 4d bc 00 	movl   $0xbc4d,0x4(%esp)
    25b7:	00 
    25b8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25bf:	e8 9d 2d 00 00       	call   5361 <printf>
				}
			}
		}
		p = p->next;
    25c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25c7:	8b 40 2c             	mov    0x2c(%eax),%eax
    25ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    25cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    25d1:	0f 85 e7 fe ff ff    	jne    24be <copyFile+0x15>
				}
			}
		}
		p = p->next;
	}
}
    25d7:	83 c4 20             	add    $0x20,%esp
    25da:	5b                   	pop    %ebx
    25db:	5e                   	pop    %esi
    25dc:	5d                   	pop    %ebp
    25dd:	c3                   	ret    

000025de <h_copyFile>:

void h_copyFile(Point p){
    25de:	55                   	push   %ebp
    25df:	89 e5                	mov    %esp,%ebp
    25e1:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 0;
    25e4:	c7 05 c4 05 01 00 00 	movl   $0x0,0x105c4
    25eb:	00 00 00 
	lenOfWaited = 0;
    25ee:	c7 05 34 3d 01 00 00 	movl   $0x0,0x13d34
    25f5:	00 00 00 
	copyFile();
    25f8:	e8 ac fe ff ff       	call   24a9 <copyFile>
}
    25fd:	c9                   	leave  
    25fe:	c3                   	ret    

000025ff <moveFile>:

void moveFile(){
    25ff:	55                   	push   %ebp
    2600:	89 e5                	mov    %esp,%ebp
    2602:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < lenOfWaited; i++)
    2605:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    260c:	eb 17                	jmp    2625 <moveFile+0x26>
		deleteFile(filesWaited[i]);
    260e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2611:	c1 e0 08             	shl    $0x8,%eax
    2614:	05 e0 33 01 00       	add    $0x133e0,%eax
    2619:	89 04 24             	mov    %eax,(%esp)
    261c:	e8 31 fb ff ff       	call   2152 <deleteFile>
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
    2621:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2625:	a1 34 3d 01 00       	mov    0x13d34,%eax
    262a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    262d:	7c df                	jl     260e <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    262f:	c7 05 34 3d 01 00 00 	movl   $0x0,0x13d34
    2636:	00 00 00 
}
    2639:	c9                   	leave  
    263a:	c3                   	ret    

0000263b <h_cutFile>:

void h_cutFile(Point p){
    263b:	55                   	push   %ebp
    263c:	89 e5                	mov    %esp,%ebp
    263e:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 1;
    2641:	c7 05 c4 05 01 00 01 	movl   $0x1,0x105c4
    2648:	00 00 00 
	lenOfWaited = 0;
    264b:	c7 05 34 3d 01 00 00 	movl   $0x0,0x13d34
    2652:	00 00 00 
	copyFile();
    2655:	e8 4f fe ff ff       	call   24a9 <copyFile>
}
    265a:	c9                   	leave  
    265b:	c3                   	ret    

0000265c <pasteFile>:

void pasteFile(){
    265c:	55                   	push   %ebp
    265d:	89 e5                	mov    %esp,%ebp
    265f:	83 ec 38             	sub    $0x38,%esp
	int file_src, file_dest;
	int i,j;
	char *filename;
	char* buff = (char*)malloc(4096 * sizeof(char));
    2662:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2669:	e8 df 2f 00 00       	call   564d <malloc>
    266e:	89 45 e8             	mov    %eax,-0x18(%ebp)
	memset(buff, 0, 4096);
    2671:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    2678:	00 
    2679:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2680:	00 
    2681:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2684:	89 04 24             	mov    %eax,(%esp)
    2687:	e8 40 29 00 00       	call   4fcc <memset>
    int size = 0;
    268c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i = 0; i < lenOfWaited; i++){
    2693:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    269a:	e9 a6 01 00 00       	jmp    2845 <pasteFile+0x1e9>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    269f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26a2:	c1 e0 08             	shl    $0x8,%eax
    26a5:	05 e0 33 01 00       	add    $0x133e0,%eax
    26aa:	89 44 24 0c          	mov    %eax,0xc(%esp)
    26ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26b1:	89 44 24 08          	mov    %eax,0x8(%esp)
    26b5:	c7 44 24 04 62 bc 00 	movl   $0xbc62,0x4(%esp)
    26bc:	00 
    26bd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26c4:	e8 98 2c 00 00       	call   5361 <printf>
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    26c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26cc:	c1 e0 08             	shl    $0x8,%eax
    26cf:	05 e0 33 01 00       	add    $0x133e0,%eax
    26d4:	89 04 24             	mov    %eax,(%esp)
    26d7:	e8 c9 28 00 00       	call   4fa5 <strlen>
    26dc:	83 e8 01             	sub    $0x1,%eax
    26df:	89 45 f0             	mov    %eax,-0x10(%ebp)
    26e2:	eb 35                	jmp    2719 <pasteFile+0xbd>
        	if (*(filesWaited[i]+j) == '/'){
    26e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26e7:	c1 e0 08             	shl    $0x8,%eax
    26ea:	8d 90 e0 33 01 00    	lea    0x133e0(%eax),%edx
    26f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    26f3:	01 d0                	add    %edx,%eax
    26f5:	0f b6 00             	movzbl (%eax),%eax
    26f8:	3c 2f                	cmp    $0x2f,%al
    26fa:	75 19                	jne    2715 <pasteFile+0xb9>
        		filename = filesWaited[i] + j + 1;
    26fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26ff:	c1 e0 08             	shl    $0x8,%eax
    2702:	8d 90 e0 33 01 00    	lea    0x133e0(%eax),%edx
    2708:	8b 45 f0             	mov    -0x10(%ebp),%eax
    270b:	83 c0 01             	add    $0x1,%eax
    270e:	01 d0                	add    %edx,%eax
    2710:	89 45 ec             	mov    %eax,-0x14(%ebp)
        		break;
    2713:	eb 0a                	jmp    271f <pasteFile+0xc3>
	char* buff = (char*)malloc(4096 * sizeof(char));
	memset(buff, 0, 4096);
    int size = 0;
    for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    2715:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    2719:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    271d:	79 c5                	jns    26e4 <pasteFile+0x88>
        	if (*(filesWaited[i]+j) == '/'){
        		filename = filesWaited[i] + j + 1;
        		break;
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
    271f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2722:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2726:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2729:	89 44 24 08          	mov    %eax,0x8(%esp)
    272d:	c7 44 24 04 7f bc 00 	movl   $0xbc7f,0x4(%esp)
    2734:	00 
    2735:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    273c:	e8 20 2c 00 00       	call   5361 <printf>
        file_src = open(filesWaited[i], O_RDONLY);
    2741:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2744:	c1 e0 08             	shl    $0x8,%eax
    2747:	05 e0 33 01 00       	add    $0x133e0,%eax
    274c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2753:	00 
    2754:	89 04 24             	mov    %eax,(%esp)
    2757:	e8 5d 2a 00 00       	call   51b9 <open>
    275c:	89 45 e0             	mov    %eax,-0x20(%ebp)
		if((file_dest = open(filename, O_RDONLY)) >= 0){
    275f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2766:	00 
    2767:	8b 45 ec             	mov    -0x14(%ebp),%eax
    276a:	89 04 24             	mov    %eax,(%esp)
    276d:	e8 47 2a 00 00       	call   51b9 <open>
    2772:	89 45 dc             	mov    %eax,-0x24(%ebp)
    2775:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    2779:	78 32                	js     27ad <pasteFile+0x151>
			printf(0, "NO.%d file %s already exist\n", i, filename);
    277b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    277e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2782:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2785:	89 44 24 08          	mov    %eax,0x8(%esp)
    2789:	c7 44 24 04 97 bc 00 	movl   $0xbc97,0x4(%esp)
    2790:	00 
    2791:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2798:	e8 c4 2b 00 00       	call   5361 <printf>
			close(file_dest);
    279d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    27a0:	89 04 24             	mov    %eax,(%esp)
    27a3:	e8 f9 29 00 00       	call   51a1 <close>
    27a8:	e9 89 00 00 00       	jmp    2836 <pasteFile+0x1da>
		}
		else{
			file_dest = open(filename, O_CREATE);
    27ad:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    27b4:	00 
    27b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27b8:	89 04 24             	mov    %eax,(%esp)
    27bb:	e8 f9 29 00 00       	call   51b9 <open>
    27c0:	89 45 dc             	mov    %eax,-0x24(%ebp)
			while((size = read(file_src, buff, 4096)) > 0)
    27c3:	eb 19                	jmp    27de <pasteFile+0x182>
                write(file_dest, buff, size);
    27c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    27c8:	89 44 24 08          	mov    %eax,0x8(%esp)
    27cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27cf:	89 44 24 04          	mov    %eax,0x4(%esp)
    27d3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    27d6:	89 04 24             	mov    %eax,(%esp)
    27d9:	e8 bb 29 00 00       	call   5199 <write>
			printf(0, "NO.%d file %s already exist\n", i, filename);
			close(file_dest);
		}
		else{
			file_dest = open(filename, O_CREATE);
			while((size = read(file_src, buff, 4096)) > 0)
    27de:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    27e5:	00 
    27e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27e9:	89 44 24 04          	mov    %eax,0x4(%esp)
    27ed:	8b 45 e0             	mov    -0x20(%ebp),%eax
    27f0:	89 04 24             	mov    %eax,(%esp)
    27f3:	e8 99 29 00 00       	call   5191 <read>
    27f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    27fb:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    27ff:	7f c4                	jg     27c5 <pasteFile+0x169>
                write(file_dest, buff, size);
	        if(size < 0)
    2801:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2805:	79 24                	jns    282b <pasteFile+0x1cf>
	        {
	            //printf(2, "copy file error!!!\r\n");
	            printf(0, "NO.%d file %s error\n", i, filename);
    2807:	8b 45 ec             	mov    -0x14(%ebp),%eax
    280a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    280e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2811:	89 44 24 08          	mov    %eax,0x8(%esp)
    2815:	c7 44 24 04 b4 bc 00 	movl   $0xbcb4,0x4(%esp)
    281c:	00 
    281d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2824:	e8 38 2b 00 00       	call   5361 <printf>
	            return;
    2829:	eb 33                	jmp    285e <pasteFile+0x202>
	        }
	        close(file_dest);
    282b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    282e:	89 04 24             	mov    %eax,(%esp)
    2831:	e8 6b 29 00 00       	call   51a1 <close>
		}
		close(file_src);
    2836:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2839:	89 04 24             	mov    %eax,(%esp)
    283c:	e8 60 29 00 00       	call   51a1 <close>
	int i,j;
	char *filename;
	char* buff = (char*)malloc(4096 * sizeof(char));
	memset(buff, 0, 4096);
    int size = 0;
    for(i = 0; i < lenOfWaited; i++){
    2841:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2845:	a1 34 3d 01 00       	mov    0x13d34,%eax
    284a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    284d:	0f 8c 4c fe ff ff    	jl     269f <pasteFile+0x43>
	        }
	        close(file_dest);
		}
		close(file_src);
	}
    free(buff);
    2853:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2856:	89 04 24             	mov    %eax,(%esp)
    2859:	e8 b6 2c 00 00       	call   5514 <free>
}
    285e:	c9                   	leave  
    285f:	c3                   	ret    

00002860 <h_pasteFile>:

void h_pasteFile(Point p){
    2860:	55                   	push   %ebp
    2861:	89 e5                	mov    %esp,%ebp
    2863:	83 ec 38             	sub    $0x38,%esp
	pasteFile();
    2866:	e8 f1 fd ff ff       	call   265c <pasteFile>
	if(copyOrCut == 1)
    286b:	a1 c4 05 01 00       	mov    0x105c4,%eax
    2870:	83 f8 01             	cmp    $0x1,%eax
    2873:	75 05                	jne    287a <h_pasteFile+0x1a>
		moveFile();
    2875:	e8 85 fd ff ff       	call   25ff <moveFile>
    updateFileList(context);
    287a:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    287f:	89 04 24             	mov    %eax,(%esp)
    2882:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2887:	89 44 24 04          	mov    %eax,0x4(%esp)
    288b:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2890:	89 44 24 08          	mov    %eax,0x8(%esp)
    2894:	e8 5b e5 ff ff       	call   df4 <updateFileList>
	drawFinderContent(context);
    2899:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    289e:	89 04 24             	mov    %eax,(%esp)
    28a1:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    28a6:	89 44 24 04          	mov    %eax,0x4(%esp)
    28aa:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    28af:	89 44 24 08          	mov    %eax,0x8(%esp)
    28b3:	e8 8b e6 ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    28b8:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    28bd:	89 04 24             	mov    %eax,(%esp)
    28c0:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    28c5:	89 44 24 04          	mov    %eax,0x4(%esp)
    28c9:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    28ce:	89 44 24 08          	mov    %eax,0x8(%esp)
    28d2:	e8 1e e3 ff ff       	call   bf5 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    28d7:	8d 45 e8             	lea    -0x18(%ebp),%eax
    28da:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    28e1:	00 
    28e2:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    28e9:	00 
    28ea:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    28f1:	00 
    28f2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    28f9:	00 
    28fa:	89 04 24             	mov    %eax,(%esp)
    28fd:	e8 45 1f 00 00       	call   4847 <initRect>
    2902:	83 ec 04             	sub    $0x4,%esp
    2905:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2908:	89 44 24 04          	mov    %eax,0x4(%esp)
    290c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    290f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2913:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2916:	89 44 24 0c          	mov    %eax,0xc(%esp)
    291a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    291d:	89 44 24 10          	mov    %eax,0x10(%esp)
    2921:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2928:	e8 1d 21 00 00       	call   4a4a <deleteClickable>
	addWndEvent(&cm);
    292d:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2934:	e8 09 ec ff ff       	call   1542 <addWndEvent>
	addListEvent(&cm);
    2939:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2940:	e8 75 eb ff ff       	call   14ba <addListEvent>
}
    2945:	c9                   	leave  
    2946:	c3                   	ret    

00002947 <h_chooseFile>:

void h_chooseFile(Point p) {
    2947:	55                   	push   %ebp
    2948:	89 e5                	mov    %esp,%ebp
    294a:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    294d:	8b 45 08             	mov    0x8(%ebp),%eax
    2950:	8b 55 0c             	mov    0xc(%ebp),%edx
    2953:	89 04 24             	mov    %eax,(%esp)
    2956:	89 54 24 04          	mov    %edx,0x4(%esp)
    295a:	e8 0e ed ff ff       	call   166d <getFileItem>
    295f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    2962:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2965:	8b 40 28             	mov    0x28(%eax),%eax
    2968:	85 c0                	test   %eax,%eax
    296a:	74 20                	je     298c <h_chooseFile+0x45>
	{
		printf(0, "unchooseFile!\n");
    296c:	c7 44 24 04 c9 bc 00 	movl   $0xbcc9,0x4(%esp)
    2973:	00 
    2974:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    297b:	e8 e1 29 00 00       	call   5361 <printf>
		temp->chosen = 0;
    2980:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2983:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    298a:	eb 1e                	jmp    29aa <h_chooseFile+0x63>
	}
	else
	{
		printf(0, "chooseFile!\n");
    298c:	c7 44 24 04 d8 bc 00 	movl   $0xbcd8,0x4(%esp)
    2993:	00 
    2994:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    299b:	e8 c1 29 00 00       	call   5361 <printf>
		temp->chosen = 1;
    29a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29a3:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    29aa:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    29af:	89 04 24             	mov    %eax,(%esp)
    29b2:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    29b7:	89 44 24 04          	mov    %eax,0x4(%esp)
    29bb:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    29c0:	89 44 24 08          	mov    %eax,0x8(%esp)
    29c4:	e8 7a e5 ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    29c9:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    29ce:	89 04 24             	mov    %eax,(%esp)
    29d1:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    29d6:	89 44 24 04          	mov    %eax,0x4(%esp)
    29da:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    29df:	89 44 24 08          	mov    %eax,0x8(%esp)
    29e3:	e8 0d e2 ff ff       	call   bf5 <drawFinderWnd>
}
    29e8:	c9                   	leave  
    29e9:	c3                   	ret    

000029ea <h_closeWnd>:

void h_closeWnd(Point p) {
    29ea:	55                   	push   %ebp
    29eb:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    29ed:	c7 05 c0 fc 00 00 00 	movl   $0x0,0xfcc0
    29f4:	00 00 00 
}
    29f7:	5d                   	pop    %ebp
    29f8:	c3                   	ret    

000029f9 <h_chvm1>:

void h_chvm1(Point p) {
    29f9:	55                   	push   %ebp
    29fa:	89 e5                	mov    %esp,%ebp
    29fc:	83 ec 38             	sub    $0x38,%esp
	style = ICON_STYLE;
    29ff:	c7 05 c4 fc 00 00 01 	movl   $0x1,0xfcc4
    2a06:	00 00 00 
	updateFileList(context);
    2a09:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2a0e:	89 04 24             	mov    %eax,(%esp)
    2a11:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2a16:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a1a:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2a1f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2a23:	e8 cc e3 ff ff       	call   df4 <updateFileList>
		drawFinderContent(context);
    2a28:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2a2d:	89 04 24             	mov    %eax,(%esp)
    2a30:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2a35:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a39:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2a3e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2a42:	e8 fc e4 ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    2a47:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2a4c:	89 04 24             	mov    %eax,(%esp)
    2a4f:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2a54:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a58:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2a5d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2a61:	e8 8f e1 ff ff       	call   bf5 <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2a66:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2a69:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2a70:	00 
    2a71:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2a78:	00 
    2a79:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2a80:	00 
    2a81:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2a88:	00 
    2a89:	89 04 24             	mov    %eax,(%esp)
    2a8c:	e8 b6 1d 00 00       	call   4847 <initRect>
    2a91:	83 ec 04             	sub    $0x4,%esp
    2a94:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a97:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a9e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2aa2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2aa5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2aa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2aac:	89 44 24 10          	mov    %eax,0x10(%esp)
    2ab0:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2ab7:	e8 8e 1f 00 00       	call   4a4a <deleteClickable>
			addWndEvent(&cm);
    2abc:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2ac3:	e8 7a ea ff ff       	call   1542 <addWndEvent>
			addListEvent(&cm);
    2ac8:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2acf:	e8 e6 e9 ff ff       	call   14ba <addListEvent>
}
    2ad4:	c9                   	leave  
    2ad5:	c3                   	ret    

00002ad6 <h_chvm2>:

void h_chvm2(Point p) {
    2ad6:	55                   	push   %ebp
    2ad7:	89 e5                	mov    %esp,%ebp
    2ad9:	83 ec 38             	sub    $0x38,%esp
	style = LIST_STYLE;
    2adc:	c7 05 c4 fc 00 00 02 	movl   $0x2,0xfcc4
    2ae3:	00 00 00 
	updateFileList(context);
    2ae6:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2aeb:	89 04 24             	mov    %eax,(%esp)
    2aee:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2af3:	89 44 24 04          	mov    %eax,0x4(%esp)
    2af7:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2afc:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b00:	e8 ef e2 ff ff       	call   df4 <updateFileList>
		drawFinderContent(context);
    2b05:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2b0a:	89 04 24             	mov    %eax,(%esp)
    2b0d:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2b12:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b16:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2b1b:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b1f:	e8 1f e4 ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    2b24:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2b29:	89 04 24             	mov    %eax,(%esp)
    2b2c:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2b31:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b35:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2b3a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b3e:	e8 b2 e0 ff ff       	call   bf5 <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2b43:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2b46:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2b4d:	00 
    2b4e:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2b55:	00 
    2b56:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2b5d:	00 
    2b5e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b65:	00 
    2b66:	89 04 24             	mov    %eax,(%esp)
    2b69:	e8 d9 1c 00 00       	call   4847 <initRect>
    2b6e:	83 ec 04             	sub    $0x4,%esp
    2b71:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2b74:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b78:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b7b:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b82:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2b86:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b89:	89 44 24 10          	mov    %eax,0x10(%esp)
    2b8d:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2b94:	e8 b1 1e 00 00       	call   4a4a <deleteClickable>
			addWndEvent(&cm);
    2b99:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2ba0:	e8 9d e9 ff ff       	call   1542 <addWndEvent>
			addListEvent(&cm);
    2ba5:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2bac:	e8 09 e9 ff ff       	call   14ba <addListEvent>
}
    2bb1:	c9                   	leave  
    2bb2:	c3                   	ret    

00002bb3 <h_goUp>:

void h_goUp(Point p) {
    2bb3:	55                   	push   %ebp
    2bb4:	89 e5                	mov    %esp,%ebp
    2bb6:	83 ec 38             	sub    $0x38,%esp
	enterDir("..");
    2bb9:	c7 04 24 73 bb 00 00 	movl   $0xbb73,(%esp)
    2bc0:	e8 6d f0 ff ff       	call   1c32 <enterDir>
	updateFileList(context);
    2bc5:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2bca:	89 04 24             	mov    %eax,(%esp)
    2bcd:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2bd2:	89 44 24 04          	mov    %eax,0x4(%esp)
    2bd6:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2bdb:	89 44 24 08          	mov    %eax,0x8(%esp)
    2bdf:	e8 10 e2 ff ff       	call   df4 <updateFileList>
	drawFinderContent(context);
    2be4:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2be9:	89 04 24             	mov    %eax,(%esp)
    2bec:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2bf1:	89 44 24 04          	mov    %eax,0x4(%esp)
    2bf5:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2bfa:	89 44 24 08          	mov    %eax,0x8(%esp)
    2bfe:	e8 40 e3 ff ff       	call   f43 <drawFinderContent>
	drawFinderWnd(context);
    2c03:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2c08:	89 04 24             	mov    %eax,(%esp)
    2c0b:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2c10:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c14:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2c19:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c1d:	e8 d3 df ff ff       	call   bf5 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2c22:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2c25:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2c2c:	00 
    2c2d:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2c34:	00 
    2c35:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2c3c:	00 
    2c3d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2c44:	00 
    2c45:	89 04 24             	mov    %eax,(%esp)
    2c48:	e8 fa 1b 00 00       	call   4847 <initRect>
    2c4d:	83 ec 04             	sub    $0x4,%esp
    2c50:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c53:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c57:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2c5a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c61:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2c65:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c68:	89 44 24 10          	mov    %eax,0x10(%esp)
    2c6c:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2c73:	e8 d2 1d 00 00       	call   4a4a <deleteClickable>
	addWndEvent(&cm);
    2c78:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2c7f:	e8 be e8 ff ff       	call   1542 <addWndEvent>
	addListEvent(&cm);
    2c84:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2c8b:	e8 2a e8 ff ff       	call   14ba <addListEvent>
}
    2c90:	c9                   	leave  
    2c91:	c3                   	ret    

00002c92 <h_empty>:

void h_empty(Point p) {
    2c92:	55                   	push   %ebp
    2c93:	89 e5                	mov    %esp,%ebp

}
    2c95:	5d                   	pop    %ebp
    2c96:	c3                   	ret    

00002c97 <main>:

int main(int argc, char *argv[]) {
    2c97:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    2c9b:	83 e4 f0             	and    $0xfffffff0,%esp
    2c9e:	ff 71 fc             	pushl  -0x4(%ecx)
    2ca1:	55                   	push   %ebp
    2ca2:	89 e5                	mov    %esp,%ebp
    2ca4:	56                   	push   %esi
    2ca5:	53                   	push   %ebx
    2ca6:	51                   	push   %ecx
    2ca7:	81 ec ac 00 00 00    	sub    $0xac,%esp
	struct Msg msg;
	char key;

	Point p;

	init_keyContent();
    2cad:	e8 b8 d3 ff ff       	call   6a <init_keyContent>
	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    2cb2:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    2cb9:	00 
    2cba:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    2cc1:	00 
    2cc2:	c7 04 24 e0 3b 01 00 	movl   $0x13be0,(%esp)
    2cc9:	e8 43 06 00 00       	call   3311 <init_context>
    2cce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    2cd1:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
    2cd7:	8b 15 e0 3b 01 00    	mov    0x13be0,%edx
    2cdd:	89 54 24 04          	mov    %edx,0x4(%esp)
    2ce1:	8b 15 e4 3b 01 00    	mov    0x13be4,%edx
    2ce7:	89 54 24 08          	mov    %edx,0x8(%esp)
    2ceb:	8b 15 e8 3b 01 00    	mov    0x13be8,%edx
    2cf1:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2cf5:	89 04 24             	mov    %eax,(%esp)
    2cf8:	e8 e8 1b 00 00       	call   48e5 <initClickManager>
    2cfd:	83 ec 04             	sub    $0x4,%esp
    2d00:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
    2d06:	a3 20 3d 01 00       	mov    %eax,0x13d20
    2d0b:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
    2d11:	a3 24 3d 01 00       	mov    %eax,0x13d24
    2d16:	8b 45 80             	mov    -0x80(%ebp),%eax
    2d19:	a3 28 3d 01 00       	mov    %eax,0x13d28
    2d1e:	8b 45 84             	mov    -0x7c(%ebp),%eax
    2d21:	a3 2c 3d 01 00       	mov    %eax,0x13d2c
    2d26:	8b 45 88             	mov    -0x78(%ebp),%eax
    2d29:	a3 30 3d 01 00       	mov    %eax,0x13d30
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    2d2e:	c7 44 24 04 0d 00 00 	movl   $0xd,0x4(%esp)
    2d35:	00 
    2d36:	c7 04 24 c0 fd 00 00 	movl   $0xfdc0,(%esp)
    2d3d:	e8 c9 11 00 00       	call   3f0b <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    2d42:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    2d49:	00 
    2d4a:	c7 04 24 e0 fc 00 00 	movl   $0xfce0,(%esp)
    2d51:	e8 b5 11 00 00       	call   3f0b <load_iconlist>
	//testHandlers();
	strcpy(currentPath, "/");
    2d56:	c7 44 24 04 e5 bc 00 	movl   $0xbce5,0x4(%esp)
    2d5d:	00 
    2d5e:	c7 04 24 20 3c 01 00 	movl   $0x13c20,(%esp)
    2d65:	e8 cc 21 00 00       	call   4f36 <strcpy>
	mkdir("userfolder");
    2d6a:	c7 04 24 e7 bc 00 00 	movl   $0xbce7,(%esp)
    2d71:	e8 6b 24 00 00       	call   51e1 <mkdir>
	enterDir("userfolder");
    2d76:	c7 04 24 e7 bc 00 00 	movl   $0xbce7,(%esp)
    2d7d:	e8 b0 ee ff ff       	call   1c32 <enterDir>
	updateFileList(context);
    2d82:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2d87:	89 04 24             	mov    %eax,(%esp)
    2d8a:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2d8f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d93:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2d98:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d9c:	e8 53 e0 ff ff       	call   df4 <updateFileList>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2da1:	8d 45 c0             	lea    -0x40(%ebp),%eax
    2da4:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2dab:	00 
    2dac:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2db3:	00 
    2db4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2dbb:	00 
    2dbc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2dc3:	00 
    2dc4:	89 04 24             	mov    %eax,(%esp)
    2dc7:	e8 7b 1a 00 00       	call   4847 <initRect>
    2dcc:	83 ec 04             	sub    $0x4,%esp
    2dcf:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2dd2:	89 44 24 04          	mov    %eax,0x4(%esp)
    2dd6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    2dd9:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ddd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2de0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2de4:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2de7:	89 44 24 10          	mov    %eax,0x10(%esp)
    2deb:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2df2:	e8 53 1c 00 00       	call   4a4a <deleteClickable>
	addWndEvent(&cm);
    2df7:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2dfe:	e8 3f e7 ff ff       	call   1542 <addWndEvent>
	addListEvent(&cm);
    2e03:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    2e0a:	e8 ab e6 ff ff       	call   14ba <addListEvent>
	lenOfWaited = 0;
    2e0f:	c7 05 34 3d 01 00 00 	movl   $0x0,0x13d34
    2e16:	00 00 00 
	while (isRun) {
    2e19:	e9 c3 03 00 00       	jmp    31e1 <main+0x54a>
		getMsg(&msg);
    2e1e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    2e21:	89 04 24             	mov    %eax,(%esp)
    2e24:	e8 f0 23 00 00       	call   5219 <getMsg>
		switch (msg.msg_type) {
    2e29:	8b 45 a8             	mov    -0x58(%ebp),%eax
    2e2c:	83 f8 08             	cmp    $0x8,%eax
    2e2f:	0f 87 ab 03 00 00    	ja     31e0 <main+0x549>
    2e35:	8b 04 85 f4 bc 00 00 	mov    0xbcf4(,%eax,4),%eax
    2e3c:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2e3e:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    2e41:	8b 55 ac             	mov    -0x54(%ebp),%edx
    2e44:	8d 45 a0             	lea    -0x60(%ebp),%eax
    2e47:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2e4b:	89 54 24 04          	mov    %edx,0x4(%esp)
    2e4f:	89 04 24             	mov    %eax,(%esp)
    2e52:	e8 c9 19 00 00       	call   4820 <initPoint>
    2e57:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    2e5a:	8b 0d 24 3d 01 00    	mov    0x13d24,%ecx
    2e60:	8b 45 a0             	mov    -0x60(%ebp),%eax
    2e63:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    2e66:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e6a:	89 54 24 08          	mov    %edx,0x8(%esp)
    2e6e:	89 0c 24             	mov    %ecx,(%esp)
    2e71:	e8 b4 1c 00 00       	call   4b2a <executeHandler>
    2e76:	85 c0                	test   %eax,%eax
    2e78:	74 19                	je     2e93 <main+0x1fc>
				updateWindow(winid, context.addr);
    2e7a:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2e7f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e83:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e86:	89 04 24             	mov    %eax,(%esp)
    2e89:	e8 a3 23 00 00       	call   5231 <updateWindow>
			}
			break;
    2e8e:	e9 4e 03 00 00       	jmp    31e1 <main+0x54a>
    2e93:	e9 49 03 00 00       	jmp    31e1 <main+0x54a>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    2e98:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2e9d:	89 04 24             	mov    %eax,(%esp)
    2ea0:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2ea5:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ea9:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2eae:	89 44 24 08          	mov    %eax,0x8(%esp)
    2eb2:	e8 8c e0 ff ff       	call   f43 <drawFinderContent>
			drawFinderWnd(context);
    2eb7:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2ebc:	89 04 24             	mov    %eax,(%esp)
    2ebf:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2ec4:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ec8:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2ecd:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ed1:	e8 1f dd ff ff       	call   bf5 <drawFinderWnd>
			updateWindow(winid, context.addr);
    2ed6:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2edb:	89 44 24 04          	mov    %eax,0x4(%esp)
    2edf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ee2:	89 04 24             	mov    %eax,(%esp)
    2ee5:	e8 47 23 00 00       	call   5231 <updateWindow>
			break;
    2eea:	e9 f2 02 00 00       	jmp    31e1 <main+0x54a>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    2eef:	8b 75 b8             	mov    -0x48(%ebp),%esi
    2ef2:	8b 5d b4             	mov    -0x4c(%ebp),%ebx
    2ef5:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    2ef8:	8b 55 ac             	mov    -0x54(%ebp),%edx
    2efb:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2f00:	89 74 24 14          	mov    %esi,0x14(%esp)
    2f04:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    2f08:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    2f0c:	89 54 24 08          	mov    %edx,0x8(%esp)
    2f10:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f14:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2f17:	89 04 24             	mov    %eax,(%esp)
    2f1a:	e8 1a 23 00 00       	call   5239 <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    2f1f:	e9 bd 02 00 00       	jmp    31e1 <main+0x54a>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2f24:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    2f27:	8b 55 ac             	mov    -0x54(%ebp),%edx
    2f2a:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    2f30:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2f34:	89 54 24 04          	mov    %edx,0x4(%esp)
    2f38:	89 04 24             	mov    %eax,(%esp)
    2f3b:	e8 e0 18 00 00       	call   4820 <initPoint>
    2f40:	83 ec 04             	sub    $0x4,%esp
    2f43:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    2f49:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
    2f4f:	89 45 a0             	mov    %eax,-0x60(%ebp)
    2f52:	89 55 a4             	mov    %edx,-0x5c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			// if (executeHandler(cm.left_click, p)) {
			// 	updateWindow(winid, context.addr);
			// }
			executeHandler(cm.left_click, p);
    2f55:	8b 0d 20 3d 01 00    	mov    0x13d20,%ecx
    2f5b:	8b 45 a0             	mov    -0x60(%ebp),%eax
    2f5e:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    2f61:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f65:	89 54 24 08          	mov    %edx,0x8(%esp)
    2f69:	89 0c 24             	mov    %ecx,(%esp)
    2f6c:	e8 b9 1b 00 00       	call   4b2a <executeHandler>
			draw_searchbox();
    2f71:	e8 24 d1 ff ff       	call   9a <draw_searchbox>
			puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
    2f76:	c7 44 24 18 28 00 00 	movl   $0x28,0x18(%esp)
    2f7d:	00 
    2f7e:	c7 44 24 14 a4 01 00 	movl   $0x1a4,0x14(%esp)
    2f85:	00 
    2f86:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2f8d:	00 
    2f8e:	c7 44 24 0c ec 3b 01 	movl   $0x13bec,0xc(%esp)
    2f95:	00 
    2f96:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2f9b:	89 04 24             	mov    %eax,(%esp)
    2f9e:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    2fa3:	89 44 24 04          	mov    %eax,0x4(%esp)
    2fa7:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    2fac:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fb0:	e8 27 0a 00 00       	call   39dc <puts_str>
				- (BUTTON_HEIGHT + 3) + 5);
			updateWindow(winid, context.addr);
    2fb5:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    2fba:	89 44 24 04          	mov    %eax,0x4(%esp)
    2fbe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2fc1:	89 04 24             	mov    %eax,(%esp)
    2fc4:	e8 68 22 00 00       	call   5231 <updateWindow>
			break;
    2fc9:	e9 13 02 00 00       	jmp    31e1 <main+0x54a>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2fce:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    2fd1:	8b 55 ac             	mov    -0x54(%ebp),%edx
    2fd4:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    2fda:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2fde:	89 54 24 04          	mov    %edx,0x4(%esp)
    2fe2:	89 04 24             	mov    %eax,(%esp)
    2fe5:	e8 36 18 00 00       	call   4820 <initPoint>
    2fea:	83 ec 04             	sub    $0x4,%esp
    2fed:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    2ff3:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
    2ff9:	89 45 a0             	mov    %eax,-0x60(%ebp)
    2ffc:	89 55 a4             	mov    %edx,-0x5c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    2fff:	8b 0d 28 3d 01 00    	mov    0x13d28,%ecx
    3005:	8b 45 a0             	mov    -0x60(%ebp),%eax
    3008:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    300b:	89 44 24 04          	mov    %eax,0x4(%esp)
    300f:	89 54 24 08          	mov    %edx,0x8(%esp)
    3013:	89 0c 24             	mov    %ecx,(%esp)
    3016:	e8 0f 1b 00 00       	call   4b2a <executeHandler>
    301b:	85 c0                	test   %eax,%eax
    301d:	74 19                	je     3038 <main+0x3a1>
				updateWindow(winid, context.addr);
    301f:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    3024:	89 44 24 04          	mov    %eax,0x4(%esp)
    3028:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    302b:	89 04 24             	mov    %eax,(%esp)
    302e:	e8 fe 21 00 00       	call   5231 <updateWindow>
			}
			break;
    3033:	e9 a9 01 00 00       	jmp    31e1 <main+0x54a>
    3038:	e9 a4 01 00 00       	jmp    31e1 <main+0x54a>
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
    303d:	0f b6 45 ac          	movzbl -0x54(%ebp),%eax
    3041:	88 45 e3             	mov    %al,-0x1d(%ebp)
			if (isSearching) {
    3044:	a1 c0 33 01 00       	mov    0x133c0,%eax
    3049:	85 c0                	test   %eax,%eax
    304b:	0f 84 8d 01 00 00    	je     31de <main+0x547>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
    3051:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    3055:	74 2a                	je     3081 <main+0x3ea>
    3057:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    305b:	74 24                	je     3081 <main+0x3ea>
    305d:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    3061:	7e 06                	jle    3069 <main+0x3d2>
    3063:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    3067:	7e 18                	jle    3081 <main+0x3ea>
    3069:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    306d:	7e 06                	jle    3075 <main+0x3de>
    306f:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    3073:	7e 0c                	jle    3081 <main+0x3ea>
    3075:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    3079:	7e 50                	jle    30cb <main+0x434>
    307b:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    307f:	7f 4a                	jg     30cb <main+0x434>
    3081:	a1 00 3c 01 00       	mov    0x13c00,%eax
    3086:	83 f8 13             	cmp    $0x13,%eax
    3089:	7f 40                	jg     30cb <main+0x434>
					keyContent.content[keyContent.length++] = key;
    308b:	a1 00 3c 01 00       	mov    0x13c00,%eax
    3090:	8d 50 01             	lea    0x1(%eax),%edx
    3093:	89 15 00 3c 01 00    	mov    %edx,0x13c00
    3099:	0f b6 55 e3          	movzbl -0x1d(%ebp),%edx
    309d:	88 90 ec 3b 01 00    	mov    %dl,0x13bec(%eax)
					scrollOffset = 0;
    30a3:	c7 05 c0 05 01 00 00 	movl   $0x0,0x105c0
    30aa:	00 00 00 
					printf(0, "%s\n", keyContent.content);
    30ad:	c7 44 24 08 ec 3b 01 	movl   $0x13bec,0x8(%esp)
    30b4:	00 
    30b5:	c7 44 24 04 3b ba 00 	movl   $0xba3b,0x4(%esp)
    30bc:	00 
    30bd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30c4:	e8 98 22 00 00       	call   5361 <printf>
    30c9:	eb 32                	jmp    30fd <main+0x466>
				}
				else if (key == 8 && keyContent.length > 0) {
    30cb:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    30cf:	75 2c                	jne    30fd <main+0x466>
    30d1:	a1 00 3c 01 00       	mov    0x13c00,%eax
    30d6:	85 c0                	test   %eax,%eax
    30d8:	7e 23                	jle    30fd <main+0x466>
					keyContent.content[--keyContent.length] = 0;
    30da:	a1 00 3c 01 00       	mov    0x13c00,%eax
    30df:	83 e8 01             	sub    $0x1,%eax
    30e2:	a3 00 3c 01 00       	mov    %eax,0x13c00
    30e7:	a1 00 3c 01 00       	mov    0x13c00,%eax
    30ec:	c6 80 ec 3b 01 00 00 	movb   $0x0,0x13bec(%eax)
					scrollOffset = 0;
    30f3:	c7 05 c0 05 01 00 00 	movl   $0x0,0x105c0
    30fa:	00 00 00 
				}
				deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    30fd:	8d 45 d0             	lea    -0x30(%ebp),%eax
    3100:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    3107:	00 
    3108:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    310f:	00 
    3110:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3117:	00 
    3118:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    311f:	00 
    3120:	89 04 24             	mov    %eax,(%esp)
    3123:	e8 1f 17 00 00       	call   4847 <initRect>
    3128:	83 ec 04             	sub    $0x4,%esp
    312b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    312e:	89 44 24 04          	mov    %eax,0x4(%esp)
    3132:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3135:	89 44 24 08          	mov    %eax,0x8(%esp)
    3139:	8b 45 d8             	mov    -0x28(%ebp),%eax
    313c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3140:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3143:	89 44 24 10          	mov    %eax,0x10(%esp)
    3147:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    314e:	e8 f7 18 00 00       	call   4a4a <deleteClickable>
				addWndEvent(&cm);
    3153:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    315a:	e8 e3 e3 ff ff       	call   1542 <addWndEvent>
				updateFileList(context);
    315f:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    3164:	89 04 24             	mov    %eax,(%esp)
    3167:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    316c:	89 44 24 04          	mov    %eax,0x4(%esp)
    3170:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    3175:	89 44 24 08          	mov    %eax,0x8(%esp)
    3179:	e8 76 dc ff ff       	call   df4 <updateFileList>
				addListEvent(&cm);
    317e:	c7 04 24 20 3d 01 00 	movl   $0x13d20,(%esp)
    3185:	e8 30 e3 ff ff       	call   14ba <addListEvent>
				drawFinderContent(context);
    318a:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    318f:	89 04 24             	mov    %eax,(%esp)
    3192:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    3197:	89 44 24 04          	mov    %eax,0x4(%esp)
    319b:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    31a0:	89 44 24 08          	mov    %eax,0x8(%esp)
    31a4:	e8 9a dd ff ff       	call   f43 <drawFinderContent>
				drawFinderWnd(context);
    31a9:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    31ae:	89 04 24             	mov    %eax,(%esp)
    31b1:	a1 e4 3b 01 00       	mov    0x13be4,%eax
    31b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    31ba:	a1 e8 3b 01 00       	mov    0x13be8,%eax
    31bf:	89 44 24 08          	mov    %eax,0x8(%esp)
    31c3:	e8 2d da ff ff       	call   bf5 <drawFinderWnd>
				updateWindow(winid, context.addr);
    31c8:	a1 e0 3b 01 00       	mov    0x13be0,%eax
    31cd:	89 44 24 04          	mov    %eax,0x4(%esp)
    31d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    31d4:	89 04 24             	mov    %eax,(%esp)
    31d7:	e8 55 20 00 00       	call   5231 <updateWindow>
			}
			break;
    31dc:	eb 03                	jmp    31e1 <main+0x54a>
    31de:	eb 01                	jmp    31e1 <main+0x54a>
		default:
			break;
    31e0:	90                   	nop
	updateFileList(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    31e1:	a1 c0 fc 00 00       	mov    0xfcc0,%eax
    31e6:	85 c0                	test   %eax,%eax
    31e8:	0f 85 30 fc ff ff    	jne    2e1e <main+0x187>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    31ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    31f1:	89 44 24 04          	mov    %eax,0x4(%esp)
    31f5:	c7 04 24 e0 3b 01 00 	movl   $0x13be0,(%esp)
    31fc:	e8 93 01 00 00       	call   3394 <free_context>
	exit();
    3201:	e8 73 1f 00 00       	call   5179 <exit>

00003206 <testHandlers>:
}

void testHandlers() {
    3206:	55                   	push   %ebp
    3207:	89 e5                	mov    %esp,%ebp
    3209:	83 ec 18             	sub    $0x18,%esp

	list(".");
    320c:	c7 04 24 2f ba 00 00 	movl   $0xba2f,(%esp)
    3213:	e8 db d2 ff ff       	call   4f3 <list>
	printf(0, "original list:\n");
    3218:	c7 44 24 04 18 bd 00 	movl   $0xbd18,0x4(%esp)
    321f:	00 
    3220:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3227:	e8 35 21 00 00       	call   5361 <printf>
	printItemList();
    322c:	e8 73 e0 ff ff       	call   12a4 <printItemList>
	printf(0, "\n");
    3231:	c7 44 24 04 28 bd 00 	movl   $0xbd28,0x4(%esp)
    3238:	00 
    3239:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3240:	e8 1c 21 00 00       	call   5361 <printf>
	printf(0, "new a folder:\n");
    3245:	c7 44 24 04 2a bd 00 	movl   $0xbd2a,0x4(%esp)
    324c:	00 
    324d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3254:	e8 08 21 00 00       	call   5361 <printf>
	newFolder("newfolder");
    3259:	c7 04 24 39 bd 00 00 	movl   $0xbd39,(%esp)
    3260:	e8 3b ed ff ff       	call   1fa0 <newFolder>
	freeFileItemList();
    3265:	e8 ab d1 ff ff       	call   415 <freeFileItemList>
	list(".");
    326a:	c7 04 24 2f ba 00 00 	movl   $0xba2f,(%esp)
    3271:	e8 7d d2 ff ff       	call   4f3 <list>
	printItemList();
    3276:	e8 29 e0 ff ff       	call   12a4 <printItemList>
	printf(0, "\n");
    327b:	c7 44 24 04 28 bd 00 	movl   $0xbd28,0x4(%esp)
    3282:	00 
    3283:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    328a:	e8 d2 20 00 00       	call   5361 <printf>
	printf(0, "enter new folder:\n");
    328f:	c7 44 24 04 43 bd 00 	movl   $0xbd43,0x4(%esp)
    3296:	00 
    3297:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    329e:	e8 be 20 00 00       	call   5361 <printf>
	enterDir("newfolder");
    32a3:	c7 04 24 39 bd 00 00 	movl   $0xbd39,(%esp)
    32aa:	e8 83 e9 ff ff       	call   1c32 <enterDir>
	freeFileItemList();
    32af:	e8 61 d1 ff ff       	call   415 <freeFileItemList>
	list(".");
    32b4:	c7 04 24 2f ba 00 00 	movl   $0xba2f,(%esp)
    32bb:	e8 33 d2 ff ff       	call   4f3 <list>
	printItemList();
    32c0:	e8 df df ff ff       	call   12a4 <printItemList>
	printf(0, "\n");
    32c5:	c7 44 24 04 28 bd 00 	movl   $0xbd28,0x4(%esp)
    32cc:	00 
    32cd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32d4:	e8 88 20 00 00       	call   5361 <printf>
	printf(0, "new a file:\n");
    32d9:	c7 44 24 04 56 bd 00 	movl   $0xbd56,0x4(%esp)
    32e0:	00 
    32e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32e8:	e8 74 20 00 00       	call   5361 <printf>
	newFile("newfile.txt");
    32ed:	c7 04 24 63 bd 00 00 	movl   $0xbd63,(%esp)
    32f4:	e8 af ea ff ff       	call   1da8 <newFile>
	freeFileItemList();
    32f9:	e8 17 d1 ff ff       	call   415 <freeFileItemList>
	list(".");
    32fe:	c7 04 24 2f ba 00 00 	movl   $0xba2f,(%esp)
    3305:	e8 e9 d1 ff ff       	call   4f3 <list>
	printItemList();
    330a:	e8 95 df ff ff       	call   12a4 <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    330f:	c9                   	leave  
    3310:	c3                   	ret    

00003311 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    3311:	55                   	push   %ebp
    3312:	89 e5                	mov    %esp,%ebp
    3314:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    3317:	8b 45 08             	mov    0x8(%ebp),%eax
    331a:	8b 55 0c             	mov    0xc(%ebp),%edx
    331d:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    3320:	8b 45 08             	mov    0x8(%ebp),%eax
    3323:	8b 55 10             	mov    0x10(%ebp),%edx
    3326:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    3329:	8b 55 0c             	mov    0xc(%ebp),%edx
    332c:	8b 45 10             	mov    0x10(%ebp),%eax
    332f:	0f af c2             	imul   %edx,%eax
    3332:	01 c0                	add    %eax,%eax
    3334:	89 04 24             	mov    %eax,(%esp)
    3337:	e8 11 23 00 00       	call   564d <malloc>
    333c:	8b 55 08             	mov    0x8(%ebp),%edx
    333f:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    3341:	8b 55 0c             	mov    0xc(%ebp),%edx
    3344:	8b 45 10             	mov    0x10(%ebp),%eax
    3347:	0f af c2             	imul   %edx,%eax
    334a:	8d 14 00             	lea    (%eax,%eax,1),%edx
    334d:	8b 45 08             	mov    0x8(%ebp),%eax
    3350:	8b 00                	mov    (%eax),%eax
    3352:	89 54 24 08          	mov    %edx,0x8(%esp)
    3356:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    335d:	00 
    335e:	89 04 24             	mov    %eax,(%esp)
    3361:	e8 66 1c 00 00       	call   4fcc <memset>
    initializeASCII();
    3366:	e8 93 01 00 00       	call   34fe <initializeASCII>
    initializeGBK();
    336b:	e8 17 03 00 00       	call   3687 <initializeGBK>
    return createWindow(0, 0, width, height);
    3370:	8b 45 10             	mov    0x10(%ebp),%eax
    3373:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3377:	8b 45 0c             	mov    0xc(%ebp),%eax
    337a:	89 44 24 08          	mov    %eax,0x8(%esp)
    337e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3385:	00 
    3386:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    338d:	e8 8f 1e 00 00       	call   5221 <createWindow>
}
    3392:	c9                   	leave  
    3393:	c3                   	ret    

00003394 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    3394:	55                   	push   %ebp
    3395:	89 e5                	mov    %esp,%ebp
    3397:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    339a:	8b 45 08             	mov    0x8(%ebp),%eax
    339d:	8b 00                	mov    (%eax),%eax
    339f:	89 04 24             	mov    %eax,(%esp)
    33a2:	e8 6d 21 00 00       	call   5514 <free>
    freeASCII();
    33a7:	e8 c6 02 00 00       	call   3672 <freeASCII>
    freeGBK();
    33ac:	e8 7e 03 00 00       	call   372f <freeGBK>
    destroyWindow(winid);
    33b1:	8b 45 0c             	mov    0xc(%ebp),%eax
    33b4:	89 04 24             	mov    %eax,(%esp)
    33b7:	e8 6d 1e 00 00       	call   5229 <destroyWindow>
}
    33bc:	c9                   	leave  
    33bd:	c3                   	ret    

000033be <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    33be:	55                   	push   %ebp
    33bf:	89 e5                	mov    %esp,%ebp
    33c1:	83 ec 04             	sub    $0x4,%esp
    33c4:	8b 45 1c             	mov    0x1c(%ebp),%eax
    33c7:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    33cb:	8b 45 0c             	mov    0xc(%ebp),%eax
    33ce:	3b 45 14             	cmp    0x14(%ebp),%eax
    33d1:	77 02                	ja     33d5 <draw_point+0x17>
    return;
    33d3:	eb 26                	jmp    33fb <draw_point+0x3d>
  if(y >= c.height)
    33d5:	8b 45 10             	mov    0x10(%ebp),%eax
    33d8:	3b 45 18             	cmp    0x18(%ebp),%eax
    33db:	77 02                	ja     33df <draw_point+0x21>
    return;
    33dd:	eb 1c                	jmp    33fb <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    33df:	8b 55 08             	mov    0x8(%ebp),%edx
    33e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    33e5:	0f af 45 18          	imul   0x18(%ebp),%eax
    33e9:	89 c1                	mov    %eax,%ecx
    33eb:	8b 45 14             	mov    0x14(%ebp),%eax
    33ee:	01 c8                	add    %ecx,%eax
    33f0:	01 c0                	add    %eax,%eax
    33f2:	01 c2                	add    %eax,%edx
    33f4:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    33f8:	66 89 02             	mov    %ax,(%edx)
}
    33fb:	c9                   	leave  
    33fc:	c3                   	ret    

000033fd <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    33fd:	55                   	push   %ebp
    33fe:	89 e5                	mov    %esp,%ebp
    3400:	83 ec 2c             	sub    $0x2c,%esp
    3403:	8b 45 24             	mov    0x24(%ebp),%eax
    3406:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    340a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    340d:	8b 55 14             	mov    0x14(%ebp),%edx
    3410:	01 c2                	add    %eax,%edx
    3412:	8b 45 0c             	mov    0xc(%ebp),%eax
    3415:	39 c2                	cmp    %eax,%edx
    3417:	0f 46 c2             	cmovbe %edx,%eax
    341a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    341d:	8b 45 20             	mov    0x20(%ebp),%eax
    3420:	8b 55 18             	mov    0x18(%ebp),%edx
    3423:	01 c2                	add    %eax,%edx
    3425:	8b 45 10             	mov    0x10(%ebp),%eax
    3428:	39 c2                	cmp    %eax,%edx
    342a:	0f 46 c2             	cmovbe %edx,%eax
    342d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    3430:	8b 45 18             	mov    0x18(%ebp),%eax
    3433:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3436:	eb 47                	jmp    347f <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    3438:	8b 45 14             	mov    0x14(%ebp),%eax
    343b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    343e:	eb 33                	jmp    3473 <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    3440:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    3444:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3447:	8b 45 fc             	mov    -0x4(%ebp),%eax
    344a:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    344e:	89 54 24 10          	mov    %edx,0x10(%esp)
    3452:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3456:	8b 45 08             	mov    0x8(%ebp),%eax
    3459:	89 04 24             	mov    %eax,(%esp)
    345c:	8b 45 0c             	mov    0xc(%ebp),%eax
    345f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3463:	8b 45 10             	mov    0x10(%ebp),%eax
    3466:	89 44 24 08          	mov    %eax,0x8(%esp)
    346a:	e8 4f ff ff ff       	call   33be <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    346f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3473:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3476:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3479:	7c c5                	jl     3440 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    347b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    347f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3482:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3485:	7c b1                	jl     3438 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    3487:	c9                   	leave  
    3488:	c3                   	ret    

00003489 <printBinary>:

void printBinary(char c)
{
    3489:	55                   	push   %ebp
    348a:	89 e5                	mov    %esp,%ebp
    348c:	83 ec 28             	sub    $0x28,%esp
    348f:	8b 45 08             	mov    0x8(%ebp),%eax
    3492:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    3495:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    349c:	eb 44                	jmp    34e2 <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    349e:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    34a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34a5:	89 c1                	mov    %eax,%ecx
    34a7:	d3 e2                	shl    %cl,%edx
    34a9:	89 d0                	mov    %edx,%eax
    34ab:	25 80 00 00 00       	and    $0x80,%eax
    34b0:	85 c0                	test   %eax,%eax
    34b2:	74 16                	je     34ca <printBinary+0x41>
		{
			printf(0, "1");
    34b4:	c7 44 24 04 6f bd 00 	movl   $0xbd6f,0x4(%esp)
    34bb:	00 
    34bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34c3:	e8 99 1e 00 00       	call   5361 <printf>
    34c8:	eb 14                	jmp    34de <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    34ca:	c7 44 24 04 71 bd 00 	movl   $0xbd71,0x4(%esp)
    34d1:	00 
    34d2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34d9:	e8 83 1e 00 00       	call   5361 <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    34de:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    34e2:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    34e6:	7e b6                	jle    349e <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    34e8:	c7 44 24 04 73 bd 00 	movl   $0xbd73,0x4(%esp)
    34ef:	00 
    34f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34f7:	e8 65 1e 00 00       	call   5361 <printf>
}
    34fc:	c9                   	leave  
    34fd:	c3                   	ret    

000034fe <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    34fe:	55                   	push   %ebp
    34ff:	89 e5                	mov    %esp,%ebp
    3501:	56                   	push   %esi
    3502:	53                   	push   %ebx
    3503:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    3506:	c7 44 24 04 75 bd 00 	movl   $0xbd75,0x4(%esp)
    350d:	00 
    350e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3515:	e8 47 1e 00 00       	call   5361 <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    351a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3521:	00 
    3522:	c7 04 24 88 bd 00 00 	movl   $0xbd88,(%esp)
    3529:	e8 8b 1c 00 00       	call   51b9 <open>
    352e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3531:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3535:	79 21                	jns    3558 <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    3537:	c7 44 24 08 88 bd 00 	movl   $0xbd88,0x8(%esp)
    353e:	00 
    353f:	c7 44 24 04 94 bd 00 	movl   $0xbd94,0x4(%esp)
    3546:	00 
    3547:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    354e:	e8 0e 1e 00 00       	call   5361 <printf>
	  return;
    3553:	e9 13 01 00 00       	jmp    366b <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    3558:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    355f:	e8 e9 20 00 00       	call   564d <malloc>
    3564:	a3 40 3d 01 00       	mov    %eax,0x13d40
	for (i = 0; i < ASCII_NUM; i++)
    3569:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3570:	eb 12                	jmp    3584 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    3572:	8b 15 40 3d 01 00    	mov    0x13d40,%edx
    3578:	8b 45 f4             	mov    -0xc(%ebp),%eax
    357b:	01 d0                	add    %edx,%eax
    357d:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    3580:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3584:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    358b:	7e e5                	jle    3572 <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    358d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    3594:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    359b:	e9 84 00 00 00       	jmp    3624 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    35a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    35a7:	eb 73                	jmp    361c <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    35a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35ac:	05 60 3d 01 00       	add    $0x13d60,%eax
    35b1:	0f b6 00             	movzbl (%eax),%eax
    35b4:	3c 2a                	cmp    $0x2a,%al
    35b6:	74 0f                	je     35c7 <initializeASCII+0xc9>
    35b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35bb:	05 60 3d 01 00       	add    $0x13d60,%eax
    35c0:	0f b6 00             	movzbl (%eax),%eax
    35c3:	3c 2e                	cmp    $0x2e,%al
    35c5:	75 51                	jne    3618 <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    35c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35ca:	05 60 3d 01 00       	add    $0x13d60,%eax
    35cf:	0f b6 00             	movzbl (%eax),%eax
    35d2:	3c 2a                	cmp    $0x2a,%al
    35d4:	75 2d                	jne    3603 <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    35d6:	8b 15 40 3d 01 00    	mov    0x13d40,%edx
    35dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35df:	01 c2                	add    %eax,%edx
    35e1:	8b 0d 40 3d 01 00    	mov    0x13d40,%ecx
    35e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35ea:	01 c8                	add    %ecx,%eax
    35ec:	0f b6 00             	movzbl (%eax),%eax
    35ef:	89 c3                	mov    %eax,%ebx
    35f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35f4:	be 80 00 00 00       	mov    $0x80,%esi
    35f9:	89 c1                	mov    %eax,%ecx
    35fb:	d3 fe                	sar    %cl,%esi
    35fd:	89 f0                	mov    %esi,%eax
    35ff:	09 d8                	or     %ebx,%eax
    3601:	88 02                	mov    %al,(%edx)
				}
				x ++;
    3603:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    3607:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    360b:	7e 0b                	jle    3618 <initializeASCII+0x11a>
				{
					x = 0;
    360d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    3614:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    3618:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    361c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    361f:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    3622:	7c 85                	jl     35a9 <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    3624:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    362b:	00 
    362c:	c7 44 24 04 60 3d 01 	movl   $0x13d60,0x4(%esp)
    3633:	00 
    3634:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3637:	89 04 24             	mov    %eax,(%esp)
    363a:	e8 52 1b 00 00       	call   5191 <read>
    363f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3642:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3646:	0f 8f 54 ff ff ff    	jg     35a0 <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    364c:	c7 44 24 04 a4 bd 00 	movl   $0xbda4,0x4(%esp)
    3653:	00 
    3654:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    365b:	e8 01 1d 00 00       	call   5361 <printf>
	close(fd);
    3660:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3663:	89 04 24             	mov    %eax,(%esp)
    3666:	e8 36 1b 00 00       	call   51a1 <close>
}
    366b:	83 c4 30             	add    $0x30,%esp
    366e:	5b                   	pop    %ebx
    366f:	5e                   	pop    %esi
    3670:	5d                   	pop    %ebp
    3671:	c3                   	ret    

00003672 <freeASCII>:

void freeASCII(){
    3672:	55                   	push   %ebp
    3673:	89 e5                	mov    %esp,%ebp
    3675:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    3678:	a1 40 3d 01 00       	mov    0x13d40,%eax
    367d:	89 04 24             	mov    %eax,(%esp)
    3680:	e8 8f 1e 00 00       	call   5514 <free>
}
    3685:	c9                   	leave  
    3686:	c3                   	ret    

00003687 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    3687:	55                   	push   %ebp
    3688:	89 e5                	mov    %esp,%ebp
    368a:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    368d:	c7 44 24 04 c1 bd 00 	movl   $0xbdc1,0x4(%esp)
    3694:	00 
    3695:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    369c:	e8 c0 1c 00 00       	call   5361 <printf>
	if((fd = open(HZK16, 0)) < 0){
    36a1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    36a8:	00 
    36a9:	c7 04 24 d2 bd 00 00 	movl   $0xbdd2,(%esp)
    36b0:	e8 04 1b 00 00       	call   51b9 <open>
    36b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    36b8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    36bc:	79 1e                	jns    36dc <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    36be:	c7 44 24 08 d2 bd 00 	movl   $0xbdd2,0x8(%esp)
    36c5:	00 
    36c6:	c7 44 24 04 94 bd 00 	movl   $0xbd94,0x4(%esp)
    36cd:	00 
    36ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36d5:	e8 87 1c 00 00       	call   5361 <printf>
		return;
    36da:	eb 51                	jmp    372d <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    36dc:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    36e3:	e8 65 1f 00 00       	call   564d <malloc>
    36e8:	a3 44 3d 01 00       	mov    %eax,0x13d44
	fontFile.size = read(fd, fontFile.buf, 27000);
    36ed:	a1 44 3d 01 00       	mov    0x13d44,%eax
    36f2:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    36f9:	00 
    36fa:	89 44 24 04          	mov    %eax,0x4(%esp)
    36fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3701:	89 04 24             	mov    %eax,(%esp)
    3704:	e8 88 1a 00 00       	call   5191 <read>
    3709:	a3 48 3d 01 00       	mov    %eax,0x13d48
	printf(0,"initialzing gbk complete!\n");
    370e:	c7 44 24 04 dc bd 00 	movl   $0xbddc,0x4(%esp)
    3715:	00 
    3716:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    371d:	e8 3f 1c 00 00       	call   5361 <printf>
	close(fd);
    3722:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3725:	89 04 24             	mov    %eax,(%esp)
    3728:	e8 74 1a 00 00       	call   51a1 <close>
}
    372d:	c9                   	leave  
    372e:	c3                   	ret    

0000372f <freeGBK>:

void freeGBK(){
    372f:	55                   	push   %ebp
    3730:	89 e5                	mov    %esp,%ebp
    3732:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    3735:	a1 44 3d 01 00       	mov    0x13d44,%eax
    373a:	89 04 24             	mov    %eax,(%esp)
    373d:	e8 d2 1d 00 00       	call   5514 <free>
}
    3742:	c9                   	leave  
    3743:	c3                   	ret    

00003744 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    3744:	55                   	push   %ebp
    3745:	89 e5                	mov    %esp,%ebp
    3747:	53                   	push   %ebx
    3748:	83 ec 30             	sub    $0x30,%esp
    374b:	8b 55 14             	mov    0x14(%ebp),%edx
    374e:	8b 45 18             	mov    0x18(%ebp),%eax
    3751:	88 55 e8             	mov    %dl,-0x18(%ebp)
    3754:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    3758:	8b 45 20             	mov    0x20(%ebp),%eax
    375b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    375e:	eb 7f                	jmp    37df <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    3760:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3767:	eb 6c                	jmp    37d5 <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    3769:	a1 40 3d 01 00       	mov    0x13d40,%eax
    376e:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    3772:	c1 e2 04             	shl    $0x4,%edx
    3775:	89 d1                	mov    %edx,%ecx
    3777:	8b 55 20             	mov    0x20(%ebp),%edx
    377a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    377d:	29 d3                	sub    %edx,%ebx
    377f:	89 da                	mov    %ebx,%edx
    3781:	01 ca                	add    %ecx,%edx
    3783:	01 d0                	add    %edx,%eax
    3785:	0f b6 00             	movzbl (%eax),%eax
    3788:	0f b6 d0             	movzbl %al,%edx
    378b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    378e:	89 c1                	mov    %eax,%ecx
    3790:	d3 e2                	shl    %cl,%edx
    3792:	89 d0                	mov    %edx,%eax
    3794:	25 80 00 00 00       	and    $0x80,%eax
    3799:	85 c0                	test   %eax,%eax
    379b:	74 34                	je     37d1 <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    379d:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    37a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    37a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    37a7:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    37aa:	01 d8                	add    %ebx,%eax
    37ac:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    37b0:	89 54 24 10          	mov    %edx,0x10(%esp)
    37b4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    37b8:	8b 45 08             	mov    0x8(%ebp),%eax
    37bb:	89 04 24             	mov    %eax,(%esp)
    37be:	8b 45 0c             	mov    0xc(%ebp),%eax
    37c1:	89 44 24 04          	mov    %eax,0x4(%esp)
    37c5:	8b 45 10             	mov    0x10(%ebp),%eax
    37c8:	89 44 24 08          	mov    %eax,0x8(%esp)
    37cc:	e8 ed fb ff ff       	call   33be <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    37d1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    37d5:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    37d9:	7e 8e                	jle    3769 <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    37db:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    37df:	8b 45 20             	mov    0x20(%ebp),%eax
    37e2:	83 c0 10             	add    $0x10,%eax
    37e5:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    37e8:	0f 8f 72 ff ff ff    	jg     3760 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    37ee:	83 c4 30             	add    $0x30,%esp
    37f1:	5b                   	pop    %ebx
    37f2:	5d                   	pop    %ebp
    37f3:	c3                   	ret    

000037f4 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    37f4:	55                   	push   %ebp
    37f5:	89 e5                	mov    %esp,%ebp
    37f7:	53                   	push   %ebx
    37f8:	83 ec 34             	sub    $0x34,%esp
    37fb:	8b 55 14             	mov    0x14(%ebp),%edx
    37fe:	8b 45 18             	mov    0x18(%ebp),%eax
    3801:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    3805:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    3809:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    380d:	0f b6 c0             	movzbl %al,%eax
    3810:	3d a0 00 00 00       	cmp    $0xa0,%eax
    3815:	0f 8e 40 01 00 00    	jle    395b <put_gbk+0x167>
    381b:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    381f:	66 c1 f8 08          	sar    $0x8,%ax
    3823:	98                   	cwtl   
    3824:	0f b6 c0             	movzbl %al,%eax
    3827:	3d a0 00 00 00       	cmp    $0xa0,%eax
    382c:	0f 8e 29 01 00 00    	jle    395b <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    3832:	a1 44 3d 01 00       	mov    0x13d44,%eax
    3837:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    383a:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    383e:	0f b6 c0             	movzbl %al,%eax
    3841:	2d a1 00 00 00       	sub    $0xa1,%eax
    3846:	6b c0 5e             	imul   $0x5e,%eax,%eax
    3849:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    384d:	66 c1 fa 08          	sar    $0x8,%dx
    3851:	0f bf d2             	movswl %dx,%edx
    3854:	0f b6 d2             	movzbl %dl,%edx
    3857:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    385d:	01 d0                	add    %edx,%eax
    385f:	c1 e0 05             	shl    $0x5,%eax
    3862:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    3865:	8b 45 20             	mov    0x20(%ebp),%eax
    3868:	89 45 f4             	mov    %eax,-0xc(%ebp)
    386b:	e9 da 00 00 00       	jmp    394a <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    3870:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3877:	eb 58                	jmp    38d1 <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    3879:	8b 45 f0             	mov    -0x10(%ebp),%eax
    387c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    387f:	01 d0                	add    %edx,%eax
    3881:	0f b6 00             	movzbl (%eax),%eax
    3884:	0f b6 d0             	movzbl %al,%edx
    3887:	8b 45 f8             	mov    -0x8(%ebp),%eax
    388a:	89 c1                	mov    %eax,%ecx
    388c:	d3 e2                	shl    %cl,%edx
    388e:	89 d0                	mov    %edx,%eax
    3890:	25 80 00 00 00       	and    $0x80,%eax
    3895:	85 c0                	test   %eax,%eax
    3897:	74 34                	je     38cd <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    3899:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    389d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    38a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    38a3:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    38a6:	01 d8                	add    %ebx,%eax
    38a8:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    38ac:	89 54 24 10          	mov    %edx,0x10(%esp)
    38b0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    38b4:	8b 45 08             	mov    0x8(%ebp),%eax
    38b7:	89 04 24             	mov    %eax,(%esp)
    38ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    38bd:	89 44 24 04          	mov    %eax,0x4(%esp)
    38c1:	8b 45 10             	mov    0x10(%ebp),%eax
    38c4:	89 44 24 08          	mov    %eax,0x8(%esp)
    38c8:	e8 f1 fa ff ff       	call   33be <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    38cd:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    38d1:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    38d5:	7e a2                	jle    3879 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    38d7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    38db:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    38e2:	eb 58                	jmp    393c <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    38e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    38e7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    38ea:	01 d0                	add    %edx,%eax
    38ec:	0f b6 00             	movzbl (%eax),%eax
    38ef:	0f b6 d0             	movzbl %al,%edx
    38f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    38f5:	89 c1                	mov    %eax,%ecx
    38f7:	d3 e2                	shl    %cl,%edx
    38f9:	89 d0                	mov    %edx,%eax
    38fb:	25 80 00 00 00       	and    $0x80,%eax
    3900:	85 c0                	test   %eax,%eax
    3902:	74 34                	je     3938 <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    3904:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    3908:	8b 55 f4             	mov    -0xc(%ebp),%edx
    390b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    390e:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3911:	01 d8                	add    %ebx,%eax
    3913:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3917:	89 54 24 10          	mov    %edx,0x10(%esp)
    391b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    391f:	8b 45 08             	mov    0x8(%ebp),%eax
    3922:	89 04 24             	mov    %eax,(%esp)
    3925:	8b 45 0c             	mov    0xc(%ebp),%eax
    3928:	89 44 24 04          	mov    %eax,0x4(%esp)
    392c:	8b 45 10             	mov    0x10(%ebp),%eax
    392f:	89 44 24 08          	mov    %eax,0x8(%esp)
    3933:	e8 86 fa ff ff       	call   33be <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    3938:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    393c:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    3940:	7e a2                	jle    38e4 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    3942:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    3946:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    394a:	8b 45 20             	mov    0x20(%ebp),%eax
    394d:	83 c0 10             	add    $0x10,%eax
    3950:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3953:	0f 8f 17 ff ff ff    	jg     3870 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    3959:	eb 7b                	jmp    39d6 <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    395b:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    395f:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    3963:	0f b6 c0             	movzbl %al,%eax
    3966:	8b 4d 20             	mov    0x20(%ebp),%ecx
    3969:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    396d:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    3970:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3974:	89 54 24 10          	mov    %edx,0x10(%esp)
    3978:	89 44 24 0c          	mov    %eax,0xc(%esp)
    397c:	8b 45 08             	mov    0x8(%ebp),%eax
    397f:	89 04 24             	mov    %eax,(%esp)
    3982:	8b 45 0c             	mov    0xc(%ebp),%eax
    3985:	89 44 24 04          	mov    %eax,0x4(%esp)
    3989:	8b 45 10             	mov    0x10(%ebp),%eax
    398c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3990:	e8 af fd ff ff       	call   3744 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    3995:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3998:	8d 58 08             	lea    0x8(%eax),%ebx
    399b:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    399f:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    39a3:	66 c1 f8 08          	sar    $0x8,%ax
    39a7:	0f b6 c0             	movzbl %al,%eax
    39aa:	8b 4d 20             	mov    0x20(%ebp),%ecx
    39ad:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    39b1:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    39b5:	89 54 24 10          	mov    %edx,0x10(%esp)
    39b9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    39bd:	8b 45 08             	mov    0x8(%ebp),%eax
    39c0:	89 04 24             	mov    %eax,(%esp)
    39c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    39c6:	89 44 24 04          	mov    %eax,0x4(%esp)
    39ca:	8b 45 10             	mov    0x10(%ebp),%eax
    39cd:	89 44 24 08          	mov    %eax,0x8(%esp)
    39d1:	e8 6e fd ff ff       	call   3744 <put_ascii>
	}
}
    39d6:	83 c4 34             	add    $0x34,%esp
    39d9:	5b                   	pop    %ebx
    39da:	5d                   	pop    %ebp
    39db:	c3                   	ret    

000039dc <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    39dc:	55                   	push   %ebp
    39dd:	89 e5                	mov    %esp,%ebp
    39df:	83 ec 38             	sub    $0x38,%esp
    39e2:	8b 45 18             	mov    0x18(%ebp),%eax
    39e5:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    39e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    39f0:	8b 45 14             	mov    0x14(%ebp),%eax
    39f3:	89 04 24             	mov    %eax,(%esp)
    39f6:	e8 aa 15 00 00       	call   4fa5 <strlen>
    39fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    39fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3a05:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3a08:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3a0b:	eb 49                	jmp    3a56 <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    3a0d:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3a11:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3a14:	8b 45 14             	mov    0x14(%ebp),%eax
    3a17:	01 c8                	add    %ecx,%eax
    3a19:	0f b6 00             	movzbl (%eax),%eax
    3a1c:	0f b6 c0             	movzbl %al,%eax
    3a1f:	8b 4d 20             	mov    0x20(%ebp),%ecx
    3a22:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3a26:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    3a29:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3a2d:	89 54 24 10          	mov    %edx,0x10(%esp)
    3a31:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3a35:	8b 45 08             	mov    0x8(%ebp),%eax
    3a38:	89 04 24             	mov    %eax,(%esp)
    3a3b:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a3e:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a42:	8b 45 10             	mov    0x10(%ebp),%eax
    3a45:	89 44 24 08          	mov    %eax,0x8(%esp)
    3a49:	e8 f6 fc ff ff       	call   3744 <put_ascii>
			xTmp += 8;
    3a4e:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    3a52:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    3a56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a59:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    3a5c:	72 af                	jb     3a0d <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    3a5e:	c9                   	leave  
    3a5f:	c3                   	ret    

00003a60 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    3a60:	55                   	push   %ebp
    3a61:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    3a63:	8b 45 10             	mov    0x10(%ebp),%eax
    3a66:	8d 50 07             	lea    0x7(%eax),%edx
    3a69:	85 c0                	test   %eax,%eax
    3a6b:	0f 48 c2             	cmovs  %edx,%eax
    3a6e:	c1 f8 03             	sar    $0x3,%eax
    3a71:	89 c2                	mov    %eax,%edx
    3a73:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a76:	8d 48 03             	lea    0x3(%eax),%ecx
    3a79:	85 c0                	test   %eax,%eax
    3a7b:	0f 48 c1             	cmovs  %ecx,%eax
    3a7e:	c1 f8 02             	sar    $0x2,%eax
    3a81:	c1 e0 05             	shl    $0x5,%eax
    3a84:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    3a87:	8b 45 08             	mov    0x8(%ebp),%eax
    3a8a:	8d 50 07             	lea    0x7(%eax),%edx
    3a8d:	85 c0                	test   %eax,%eax
    3a8f:	0f 48 c2             	cmovs  %edx,%eax
    3a92:	c1 f8 03             	sar    $0x3,%eax
    3a95:	c1 e0 0b             	shl    $0xb,%eax
    3a98:	01 c8                	add    %ecx,%eax
}
    3a9a:	5d                   	pop    %ebp
    3a9b:	c3                   	ret    

00003a9c <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    3a9c:	55                   	push   %ebp
    3a9d:	89 e5                	mov    %esp,%ebp
    3a9f:	53                   	push   %ebx
    3aa0:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    3aa3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3aaa:	e9 b1 00 00 00       	jmp    3b60 <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    3aaf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3ab6:	e9 95 00 00 00       	jmp    3b50 <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    3abb:	8b 55 14             	mov    0x14(%ebp),%edx
    3abe:	8b 45 18             	mov    0x18(%ebp),%eax
    3ac1:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    3ac5:	89 c1                	mov    %eax,%ecx
    3ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3aca:	01 c8                	add    %ecx,%eax
    3acc:	c1 e0 02             	shl    $0x2,%eax
    3acf:	01 d0                	add    %edx,%eax
    3ad1:	8b 00                	mov    (%eax),%eax
    3ad3:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    3ad6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    3ada:	3c 01                	cmp    $0x1,%al
    3adc:	75 02                	jne    3ae0 <draw_picture+0x44>
    3ade:	eb 6c                	jmp    3b4c <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    3ae0:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    3ae4:	0f b6 c8             	movzbl %al,%ecx
    3ae7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3aeb:	0f b6 d0             	movzbl %al,%edx
    3aee:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    3af2:	0f b6 c0             	movzbl %al,%eax
    3af5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3af9:	89 54 24 04          	mov    %edx,0x4(%esp)
    3afd:	89 04 24             	mov    %eax,(%esp)
    3b00:	e8 5b ff ff ff       	call   3a60 <_RGB16BIT565>
    3b05:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    3b09:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    3b0d:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3b10:	83 e8 01             	sub    $0x1,%eax
    3b13:	2b 45 f8             	sub    -0x8(%ebp),%eax
    3b16:	89 c2                	mov    %eax,%edx
    3b18:	8b 45 24             	mov    0x24(%ebp),%eax
    3b1b:	01 d0                	add    %edx,%eax
    3b1d:	89 c2                	mov    %eax,%edx
    3b1f:	8b 45 20             	mov    0x20(%ebp),%eax
    3b22:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3b25:	01 d8                	add    %ebx,%eax
    3b27:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3b2b:	89 54 24 10          	mov    %edx,0x10(%esp)
    3b2f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3b33:	8b 45 08             	mov    0x8(%ebp),%eax
    3b36:	89 04 24             	mov    %eax,(%esp)
    3b39:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b3c:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b40:	8b 45 10             	mov    0x10(%ebp),%eax
    3b43:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b47:	e8 72 f8 ff ff       	call   33be <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    3b4c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3b50:	8b 45 18             	mov    0x18(%ebp),%eax
    3b53:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3b56:	0f 8f 5f ff ff ff    	jg     3abb <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    3b5c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3b60:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3b63:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3b66:	0f 8f 43 ff ff ff    	jg     3aaf <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    3b6c:	83 c4 28             	add    $0x28,%esp
    3b6f:	5b                   	pop    %ebx
    3b70:	5d                   	pop    %ebp
    3b71:	c3                   	ret    

00003b72 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    3b72:	55                   	push   %ebp
    3b73:	89 e5                	mov    %esp,%ebp
    3b75:	83 ec 3c             	sub    $0x3c,%esp
    3b78:	8b 45 24             	mov    0x24(%ebp),%eax
    3b7b:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    3b7f:	8b 45 14             	mov    0x14(%ebp),%eax
    3b82:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3b85:	29 c2                	sub    %eax,%edx
    3b87:	89 d0                	mov    %edx,%eax
    3b89:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    3b8c:	8b 45 18             	mov    0x18(%ebp),%eax
    3b8f:	8b 55 20             	mov    0x20(%ebp),%edx
    3b92:	29 c2                	sub    %eax,%edx
    3b94:	89 d0                	mov    %edx,%eax
    3b96:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    3b99:	8b 45 14             	mov    0x14(%ebp),%eax
    3b9c:	c1 e0 0a             	shl    $0xa,%eax
    3b9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    3ba2:	8b 45 18             	mov    0x18(%ebp),%eax
    3ba5:	c1 e0 0a             	shl    $0xa,%eax
    3ba8:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    3bab:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3bae:	c1 f8 1f             	sar    $0x1f,%eax
    3bb1:	31 45 fc             	xor    %eax,-0x4(%ebp)
    3bb4:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    3bb7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3bba:	c1 f8 1f             	sar    $0x1f,%eax
    3bbd:	31 45 f8             	xor    %eax,-0x8(%ebp)
    3bc0:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    3bc3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3bc6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3bc9:	7c 57                	jl     3c22 <draw_line+0xb0>
		len = dx + 1;
    3bcb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3bce:	83 c0 01             	add    $0x1,%eax
    3bd1:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    3bd4:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3bd7:	3b 45 14             	cmp    0x14(%ebp),%eax
    3bda:	7e 07                	jle    3be3 <draw_line+0x71>
    3bdc:	b8 00 04 00 00       	mov    $0x400,%eax
    3be1:	eb 05                	jmp    3be8 <draw_line+0x76>
    3be3:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3be8:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    3beb:	8b 45 20             	mov    0x20(%ebp),%eax
    3bee:	3b 45 18             	cmp    0x18(%ebp),%eax
    3bf1:	7c 16                	jl     3c09 <draw_line+0x97>
    3bf3:	8b 45 18             	mov    0x18(%ebp),%eax
    3bf6:	8b 55 20             	mov    0x20(%ebp),%edx
    3bf9:	29 c2                	sub    %eax,%edx
    3bfb:	89 d0                	mov    %edx,%eax
    3bfd:	83 c0 01             	add    $0x1,%eax
    3c00:	c1 e0 0a             	shl    $0xa,%eax
    3c03:	99                   	cltd   
    3c04:	f7 7d ec             	idivl  -0x14(%ebp)
    3c07:	eb 14                	jmp    3c1d <draw_line+0xab>
    3c09:	8b 45 18             	mov    0x18(%ebp),%eax
    3c0c:	8b 55 20             	mov    0x20(%ebp),%edx
    3c0f:	29 c2                	sub    %eax,%edx
    3c11:	89 d0                	mov    %edx,%eax
    3c13:	83 e8 01             	sub    $0x1,%eax
    3c16:	c1 e0 0a             	shl    $0xa,%eax
    3c19:	99                   	cltd   
    3c1a:	f7 7d ec             	idivl  -0x14(%ebp)
    3c1d:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3c20:	eb 55                	jmp    3c77 <draw_line+0x105>
	}
	else {
		len = dy + 1;
    3c22:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3c25:	83 c0 01             	add    $0x1,%eax
    3c28:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    3c2b:	8b 45 20             	mov    0x20(%ebp),%eax
    3c2e:	3b 45 18             	cmp    0x18(%ebp),%eax
    3c31:	7e 07                	jle    3c3a <draw_line+0xc8>
    3c33:	b8 00 04 00 00       	mov    $0x400,%eax
    3c38:	eb 05                	jmp    3c3f <draw_line+0xcd>
    3c3a:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3c3f:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    3c42:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3c45:	3b 45 14             	cmp    0x14(%ebp),%eax
    3c48:	7c 16                	jl     3c60 <draw_line+0xee>
    3c4a:	8b 45 14             	mov    0x14(%ebp),%eax
    3c4d:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3c50:	29 c2                	sub    %eax,%edx
    3c52:	89 d0                	mov    %edx,%eax
    3c54:	83 c0 01             	add    $0x1,%eax
    3c57:	c1 e0 0a             	shl    $0xa,%eax
    3c5a:	99                   	cltd   
    3c5b:	f7 7d ec             	idivl  -0x14(%ebp)
    3c5e:	eb 14                	jmp    3c74 <draw_line+0x102>
    3c60:	8b 45 14             	mov    0x14(%ebp),%eax
    3c63:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3c66:	29 c2                	sub    %eax,%edx
    3c68:	89 d0                	mov    %edx,%eax
    3c6a:	83 e8 01             	sub    $0x1,%eax
    3c6d:	c1 e0 0a             	shl    $0xa,%eax
    3c70:	99                   	cltd   
    3c71:	f7 7d ec             	idivl  -0x14(%ebp)
    3c74:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    3c77:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    3c7e:	eb 47                	jmp    3cc7 <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    3c80:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    3c84:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c87:	c1 f8 0a             	sar    $0xa,%eax
    3c8a:	89 c2                	mov    %eax,%edx
    3c8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c8f:	c1 f8 0a             	sar    $0xa,%eax
    3c92:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3c96:	89 54 24 10          	mov    %edx,0x10(%esp)
    3c9a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3c9e:	8b 45 08             	mov    0x8(%ebp),%eax
    3ca1:	89 04 24             	mov    %eax,(%esp)
    3ca4:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ca7:	89 44 24 04          	mov    %eax,0x4(%esp)
    3cab:	8b 45 10             	mov    0x10(%ebp),%eax
    3cae:	89 44 24 08          	mov    %eax,0x8(%esp)
    3cb2:	e8 07 f7 ff ff       	call   33be <draw_point>
		y += dy;
    3cb7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3cba:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    3cbd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3cc0:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    3cc3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    3cc7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3cca:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    3ccd:	7c b1                	jl     3c80 <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    3ccf:	c9                   	leave  
    3cd0:	c3                   	ret    

00003cd1 <draw_window>:

void
draw_window(Context c, char *title)
{
    3cd1:	55                   	push   %ebp
    3cd2:	89 e5                	mov    %esp,%ebp
    3cd4:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    3cd7:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cda:	83 e8 01             	sub    $0x1,%eax
    3cdd:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3ce4:	00 
    3ce5:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    3cec:	00 
    3ced:	89 44 24 14          	mov    %eax,0x14(%esp)
    3cf1:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    3cf8:	00 
    3cf9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3d00:	00 
    3d01:	8b 45 08             	mov    0x8(%ebp),%eax
    3d04:	89 04 24             	mov    %eax,(%esp)
    3d07:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d0a:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d0e:	8b 45 10             	mov    0x10(%ebp),%eax
    3d11:	89 44 24 08          	mov    %eax,0x8(%esp)
    3d15:	e8 58 fe ff ff       	call   3b72 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    3d1a:	8b 45 10             	mov    0x10(%ebp),%eax
    3d1d:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3d20:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d23:	8d 50 ff             	lea    -0x1(%eax),%edx
    3d26:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d29:	83 e8 01             	sub    $0x1,%eax
    3d2c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3d33:	00 
    3d34:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3d38:	89 54 24 14          	mov    %edx,0x14(%esp)
    3d3c:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    3d43:	00 
    3d44:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3d48:	8b 45 08             	mov    0x8(%ebp),%eax
    3d4b:	89 04 24             	mov    %eax,(%esp)
    3d4e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d51:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d55:	8b 45 10             	mov    0x10(%ebp),%eax
    3d58:	89 44 24 08          	mov    %eax,0x8(%esp)
    3d5c:	e8 11 fe ff ff       	call   3b72 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    3d61:	8b 45 10             	mov    0x10(%ebp),%eax
    3d64:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3d67:	8b 45 10             	mov    0x10(%ebp),%eax
    3d6a:	8d 50 ff             	lea    -0x1(%eax),%edx
    3d6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d70:	83 e8 01             	sub    $0x1,%eax
    3d73:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3d7a:	00 
    3d7b:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3d7f:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3d86:	00 
    3d87:	89 54 24 10          	mov    %edx,0x10(%esp)
    3d8b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3d8f:	8b 45 08             	mov    0x8(%ebp),%eax
    3d92:	89 04 24             	mov    %eax,(%esp)
    3d95:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d98:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d9c:	8b 45 10             	mov    0x10(%ebp),%eax
    3d9f:	89 44 24 08          	mov    %eax,0x8(%esp)
    3da3:	e8 ca fd ff ff       	call   3b72 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    3da8:	8b 45 10             	mov    0x10(%ebp),%eax
    3dab:	83 e8 01             	sub    $0x1,%eax
    3dae:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3db5:	00 
    3db6:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    3dbd:	00 
    3dbe:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3dc5:	00 
    3dc6:	89 44 24 10          	mov    %eax,0x10(%esp)
    3dca:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3dd1:	00 
    3dd2:	8b 45 08             	mov    0x8(%ebp),%eax
    3dd5:	89 04 24             	mov    %eax,(%esp)
    3dd8:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ddb:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ddf:	8b 45 10             	mov    0x10(%ebp),%eax
    3de2:	89 44 24 08          	mov    %eax,0x8(%esp)
    3de6:	e8 87 fd ff ff       	call   3b72 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    3deb:	8b 45 0c             	mov    0xc(%ebp),%eax
    3dee:	83 e8 02             	sub    $0x2,%eax
    3df1:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    3df8:	00 
    3df9:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    3e00:	00 
    3e01:	89 44 24 14          	mov    %eax,0x14(%esp)
    3e05:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    3e0c:	00 
    3e0d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3e14:	00 
    3e15:	8b 45 08             	mov    0x8(%ebp),%eax
    3e18:	89 04 24             	mov    %eax,(%esp)
    3e1b:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e1e:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e22:	8b 45 10             	mov    0x10(%ebp),%eax
    3e25:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e29:	e8 cf f5 ff ff       	call   33fd <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    3e2e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e31:	83 e8 02             	sub    $0x2,%eax
    3e34:	89 c2                	mov    %eax,%edx
    3e36:	8b 45 10             	mov    0x10(%ebp),%eax
    3e39:	83 e8 15             	sub    $0x15,%eax
    3e3c:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    3e43:	00 
    3e44:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    3e4b:	00 
    3e4c:	89 54 24 14          	mov    %edx,0x14(%esp)
    3e50:	89 44 24 10          	mov    %eax,0x10(%esp)
    3e54:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3e5b:	00 
    3e5c:	8b 45 08             	mov    0x8(%ebp),%eax
    3e5f:	89 04 24             	mov    %eax,(%esp)
    3e62:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e65:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e69:	8b 45 10             	mov    0x10(%ebp),%eax
    3e6c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e70:	e8 88 f5 ff ff       	call   33fd <fill_rect>

  loadBitmap(&pic, "close.bmp");
    3e75:	c7 44 24 04 f7 bd 00 	movl   $0xbdf7,0x4(%esp)
    3e7c:	00 
    3e7d:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3e80:	89 04 24             	mov    %eax,(%esp)
    3e83:	e8 44 01 00 00       	call   3fcc <loadBitmap>
  draw_picture(c, pic, 3, 3);
    3e88:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    3e8f:	00 
    3e90:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    3e97:	00 
    3e98:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3e9b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3e9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ea2:	89 44 24 10          	mov    %eax,0x10(%esp)
    3ea6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ea9:	89 44 24 14          	mov    %eax,0x14(%esp)
    3ead:	8b 45 08             	mov    0x8(%ebp),%eax
    3eb0:	89 04 24             	mov    %eax,(%esp)
    3eb3:	8b 45 0c             	mov    0xc(%ebp),%eax
    3eb6:	89 44 24 04          	mov    %eax,0x4(%esp)
    3eba:	8b 45 10             	mov    0x10(%ebp),%eax
    3ebd:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ec1:	e8 d6 fb ff ff       	call   3a9c <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    3ec6:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    3ecd:	00 
    3ece:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    3ed5:	00 
    3ed6:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    3edd:	00 
    3ede:	8b 45 14             	mov    0x14(%ebp),%eax
    3ee1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3ee5:	8b 45 08             	mov    0x8(%ebp),%eax
    3ee8:	89 04 24             	mov    %eax,(%esp)
    3eeb:	8b 45 0c             	mov    0xc(%ebp),%eax
    3eee:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ef2:	8b 45 10             	mov    0x10(%ebp),%eax
    3ef5:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ef9:	e8 de fa ff ff       	call   39dc <puts_str>
  freepic(&pic);
    3efe:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3f01:	89 04 24             	mov    %eax,(%esp)
    3f04:	e8 6f 06 00 00       	call   4578 <freepic>
}
    3f09:	c9                   	leave  
    3f0a:	c3                   	ret    

00003f0b <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    3f0b:	55                   	push   %ebp
    3f0c:	89 e5                	mov    %esp,%ebp
    3f0e:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    3f11:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3f18:	eb 29                	jmp    3f43 <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    3f1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f1d:	6b d0 34             	imul   $0x34,%eax,%edx
    3f20:	8b 45 08             	mov    0x8(%ebp),%eax
    3f23:	01 d0                	add    %edx,%eax
    3f25:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3f28:	6b ca 34             	imul   $0x34,%edx,%ecx
    3f2b:	8b 55 08             	mov    0x8(%ebp),%edx
    3f2e:	01 ca                	add    %ecx,%edx
    3f30:	83 c2 28             	add    $0x28,%edx
    3f33:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f37:	89 14 24             	mov    %edx,(%esp)
    3f3a:	e8 8d 00 00 00       	call   3fcc <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    3f3f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3f43:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f46:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3f49:	7c cf                	jl     3f1a <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    3f4b:	c9                   	leave  
    3f4c:	c3                   	ret    

00003f4d <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    3f4d:	55                   	push   %ebp
    3f4e:	89 e5                	mov    %esp,%ebp
    3f50:	53                   	push   %ebx
    3f51:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    3f54:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3f5b:	eb 61                	jmp    3fbe <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    3f5d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f60:	6b d0 34             	imul   $0x34,%eax,%edx
    3f63:	8b 45 14             	mov    0x14(%ebp),%eax
    3f66:	01 d0                	add    %edx,%eax
    3f68:	8b 48 24             	mov    0x24(%eax),%ecx
    3f6b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f6e:	6b d0 34             	imul   $0x34,%eax,%edx
    3f71:	8b 45 14             	mov    0x14(%ebp),%eax
    3f74:	01 d0                	add    %edx,%eax
    3f76:	8b 50 20             	mov    0x20(%eax),%edx
    3f79:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f7c:	6b d8 34             	imul   $0x34,%eax,%ebx
    3f7f:	8b 45 14             	mov    0x14(%ebp),%eax
    3f82:	01 d8                	add    %ebx,%eax
    3f84:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    3f88:	89 54 24 18          	mov    %edx,0x18(%esp)
    3f8c:	8b 50 28             	mov    0x28(%eax),%edx
    3f8f:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3f93:	8b 50 2c             	mov    0x2c(%eax),%edx
    3f96:	89 54 24 10          	mov    %edx,0x10(%esp)
    3f9a:	8b 40 30             	mov    0x30(%eax),%eax
    3f9d:	89 44 24 14          	mov    %eax,0x14(%esp)
    3fa1:	8b 45 08             	mov    0x8(%ebp),%eax
    3fa4:	89 04 24             	mov    %eax,(%esp)
    3fa7:	8b 45 0c             	mov    0xc(%ebp),%eax
    3faa:	89 44 24 04          	mov    %eax,0x4(%esp)
    3fae:	8b 45 10             	mov    0x10(%ebp),%eax
    3fb1:	89 44 24 08          	mov    %eax,0x8(%esp)
    3fb5:	e8 e2 fa ff ff       	call   3a9c <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    3fba:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3fbe:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fc1:	3b 45 18             	cmp    0x18(%ebp),%eax
    3fc4:	7c 97                	jl     3f5d <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    3fc6:	83 c4 30             	add    $0x30,%esp
    3fc9:	5b                   	pop    %ebx
    3fca:	5d                   	pop    %ebp
    3fcb:	c3                   	ret    

00003fcc <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    3fcc:	55                   	push   %ebp
    3fcd:	89 e5                	mov    %esp,%ebp
    3fcf:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    3fd5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    3fdc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3fe3:	00 
    3fe4:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fe7:	89 04 24             	mov    %eax,(%esp)
    3fea:	e8 ca 11 00 00       	call   51b9 <open>
    3fef:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3ff2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3ff6:	79 20                	jns    4018 <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    3ff8:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ffb:	89 44 24 08          	mov    %eax,0x8(%esp)
    3fff:	c7 44 24 04 04 be 00 	movl   $0xbe04,0x4(%esp)
    4006:	00 
    4007:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    400e:	e8 4e 13 00 00       	call   5361 <printf>
		return;
    4013:	e9 ef 02 00 00       	jmp    4307 <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    4018:	8b 45 0c             	mov    0xc(%ebp),%eax
    401b:	89 44 24 08          	mov    %eax,0x8(%esp)
    401f:	c7 44 24 04 14 be 00 	movl   $0xbe14,0x4(%esp)
    4026:	00 
    4027:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    402e:	e8 2e 13 00 00       	call   5361 <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    4033:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    403a:	e8 0e 16 00 00       	call   564d <malloc>
    403f:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    4042:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    4049:	00 
    404a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    404d:	89 44 24 04          	mov    %eax,0x4(%esp)
    4051:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4054:	89 04 24             	mov    %eax,(%esp)
    4057:	e8 35 11 00 00       	call   5191 <read>
    405c:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    405f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4062:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    4065:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4068:	0f b7 00             	movzwl (%eax),%eax
    406b:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    406f:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    4073:	66 3d 42 4d          	cmp    $0x4d42,%ax
    4077:	74 19                	je     4092 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    4079:	c7 44 24 04 28 be 00 	movl   $0xbe28,0x4(%esp)
    4080:	00 
    4081:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4088:	e8 d4 12 00 00       	call   5361 <printf>
		return;
    408d:	e9 75 02 00 00       	jmp    4307 <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    4092:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4095:	83 c0 02             	add    $0x2,%eax
    4098:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    409b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    409e:	8b 00                	mov    (%eax),%eax
    40a0:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    40a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    40a6:	83 c0 06             	add    $0x6,%eax
    40a9:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    40ac:	8b 45 dc             	mov    -0x24(%ebp),%eax
    40af:	0f b7 00             	movzwl (%eax),%eax
    40b2:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    40b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    40b9:	83 c0 08             	add    $0x8,%eax
    40bc:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    40bf:	8b 45 dc             	mov    -0x24(%ebp),%eax
    40c2:	0f b7 00             	movzwl (%eax),%eax
    40c5:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    40c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    40cc:	83 c0 0a             	add    $0xa,%eax
    40cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    40d2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    40d5:	8b 00                	mov    (%eax),%eax
    40d7:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    40da:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    40e1:	00 
    40e2:	8d 45 84             	lea    -0x7c(%ebp),%eax
    40e5:	89 44 24 04          	mov    %eax,0x4(%esp)
    40e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    40ec:	89 04 24             	mov    %eax,(%esp)
    40ef:	e8 9d 10 00 00       	call   5191 <read>
	width = bitInfoHead.biWidth;
    40f4:	8b 45 88             	mov    -0x78(%ebp),%eax
    40f7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    40fa:	8b 45 8c             	mov    -0x74(%ebp),%eax
    40fd:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    4100:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4103:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    4107:	c1 e0 02             	shl    $0x2,%eax
    410a:	89 44 24 10          	mov    %eax,0x10(%esp)
    410e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4111:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4115:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4118:	89 44 24 08          	mov    %eax,0x8(%esp)
    411c:	c7 44 24 04 40 be 00 	movl   $0xbe40,0x4(%esp)
    4123:	00 
    4124:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    412b:	e8 31 12 00 00       	call   5361 <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    4130:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    4134:	75 14                	jne    414a <loadBitmap+0x17e>
		printf(0, "0");
    4136:	c7 44 24 04 65 be 00 	movl   $0xbe65,0x4(%esp)
    413d:	00 
    413e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4145:	e8 17 12 00 00       	call   5361 <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    414a:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    414e:	0f b7 c0             	movzwl %ax,%eax
    4151:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    4155:	83 c0 1f             	add    $0x1f,%eax
    4158:	8d 50 1f             	lea    0x1f(%eax),%edx
    415b:	85 c0                	test   %eax,%eax
    415d:	0f 48 c2             	cmovs  %edx,%eax
    4160:	c1 f8 05             	sar    $0x5,%eax
    4163:	c1 e0 02             	shl    $0x2,%eax
    4166:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    4169:	8b 45 d0             	mov    -0x30(%ebp),%eax
    416c:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    4170:	89 04 24             	mov    %eax,(%esp)
    4173:	e8 d5 14 00 00       	call   564d <malloc>
    4178:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    417b:	8b 55 d0             	mov    -0x30(%ebp),%edx
    417e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4181:	0f af c2             	imul   %edx,%eax
    4184:	89 44 24 08          	mov    %eax,0x8(%esp)
    4188:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    418f:	00 
    4190:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4193:	89 04 24             	mov    %eax,(%esp)
    4196:	e8 31 0e 00 00       	call   4fcc <memset>
	long nData = height * l_width;
    419b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    419e:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    41a2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    41a5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    41a8:	89 44 24 08          	mov    %eax,0x8(%esp)
    41ac:	8b 45 c8             	mov    -0x38(%ebp),%eax
    41af:	89 44 24 04          	mov    %eax,0x4(%esp)
    41b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    41b6:	89 04 24             	mov    %eax,(%esp)
    41b9:	e8 d3 0f 00 00       	call   5191 <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    41be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    41c1:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    41c5:	c1 e0 02             	shl    $0x2,%eax
    41c8:	89 04 24             	mov    %eax,(%esp)
    41cb:	e8 7d 14 00 00       	call   564d <malloc>
    41d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    41d3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    41d6:	8b 45 d0             	mov    -0x30(%ebp),%eax
    41d9:	0f af c2             	imul   %edx,%eax
    41dc:	c1 e0 02             	shl    $0x2,%eax
    41df:	89 44 24 08          	mov    %eax,0x8(%esp)
    41e3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    41ea:	00 
    41eb:	8b 45 c0             	mov    -0x40(%ebp),%eax
    41ee:	89 04 24             	mov    %eax,(%esp)
    41f1:	e8 d6 0d 00 00       	call   4fcc <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    41f6:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    41fa:	66 83 f8 17          	cmp    $0x17,%ax
    41fe:	77 19                	ja     4219 <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    4200:	c7 44 24 04 68 be 00 	movl   $0xbe68,0x4(%esp)
    4207:	00 
    4208:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    420f:	e8 4d 11 00 00       	call   5361 <printf>
		return;
    4214:	e9 ee 00 00 00       	jmp    4307 <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    4219:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    4220:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4227:	e9 94 00 00 00       	jmp    42c0 <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    422c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4233:	eb 7b                	jmp    42b0 <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    4235:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4238:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    423c:	89 c1                	mov    %eax,%ecx
    423e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4241:	89 d0                	mov    %edx,%eax
    4243:	01 c0                	add    %eax,%eax
    4245:	01 d0                	add    %edx,%eax
    4247:	01 c8                	add    %ecx,%eax
    4249:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    424c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    424f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4256:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4259:	01 c2                	add    %eax,%edx
    425b:	8b 45 bc             	mov    -0x44(%ebp),%eax
    425e:	8d 48 02             	lea    0x2(%eax),%ecx
    4261:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4264:	01 c8                	add    %ecx,%eax
    4266:	0f b6 00             	movzbl (%eax),%eax
    4269:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    426c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    426f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4276:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4279:	01 c2                	add    %eax,%edx
    427b:	8b 45 bc             	mov    -0x44(%ebp),%eax
    427e:	8d 48 01             	lea    0x1(%eax),%ecx
    4281:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4284:	01 c8                	add    %ecx,%eax
    4286:	0f b6 00             	movzbl (%eax),%eax
    4289:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    428c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    428f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4296:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4299:	01 c2                	add    %eax,%edx
    429b:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    429e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    42a1:	01 c8                	add    %ecx,%eax
    42a3:	0f b6 00             	movzbl (%eax),%eax
    42a6:	88 02                	mov    %al,(%edx)
				index++;
    42a8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    42ac:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    42b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    42b3:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    42b6:	0f 8c 79 ff ff ff    	jl     4235 <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    42bc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    42c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42c3:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    42c6:	0f 8c 60 ff ff ff    	jl     422c <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    42cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    42cf:	89 04 24             	mov    %eax,(%esp)
    42d2:	e8 ca 0e 00 00       	call   51a1 <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    42d7:	8b 45 08             	mov    0x8(%ebp),%eax
    42da:	8b 55 c0             	mov    -0x40(%ebp),%edx
    42dd:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    42df:	8b 45 08             	mov    0x8(%ebp),%eax
    42e2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    42e5:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    42e8:	8b 45 08             	mov    0x8(%ebp),%eax
    42eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
    42ee:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    42f1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    42f4:	89 04 24             	mov    %eax,(%esp)
    42f7:	e8 18 12 00 00       	call   5514 <free>
	free(BmpFileHeader);
    42fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    42ff:	89 04 24             	mov    %eax,(%esp)
    4302:	e8 0d 12 00 00       	call   5514 <free>
	//printf("\n");
}
    4307:	c9                   	leave  
    4308:	c3                   	ret    

00004309 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    4309:	55                   	push   %ebp
    430a:	89 e5                	mov    %esp,%ebp
    430c:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    430f:	c7 44 24 04 88 be 00 	movl   $0xbe88,0x4(%esp)
    4316:	00 
    4317:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    431e:	e8 3e 10 00 00       	call   5361 <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    4323:	8b 45 08             	mov    0x8(%ebp),%eax
    4326:	0f b7 00             	movzwl (%eax),%eax
    4329:	0f b7 c0             	movzwl %ax,%eax
    432c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4330:	c7 44 24 04 9a be 00 	movl   $0xbe9a,0x4(%esp)
    4337:	00 
    4338:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    433f:	e8 1d 10 00 00       	call   5361 <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    4344:	8b 45 08             	mov    0x8(%ebp),%eax
    4347:	8b 40 04             	mov    0x4(%eax),%eax
    434a:	89 44 24 08          	mov    %eax,0x8(%esp)
    434e:	c7 44 24 04 b8 be 00 	movl   $0xbeb8,0x4(%esp)
    4355:	00 
    4356:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    435d:	e8 ff 0f 00 00       	call   5361 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    4362:	8b 45 08             	mov    0x8(%ebp),%eax
    4365:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    4369:	0f b7 c0             	movzwl %ax,%eax
    436c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4370:	c7 44 24 04 c9 be 00 	movl   $0xbec9,0x4(%esp)
    4377:	00 
    4378:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    437f:	e8 dd 0f 00 00       	call   5361 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    4384:	8b 45 08             	mov    0x8(%ebp),%eax
    4387:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    438b:	0f b7 c0             	movzwl %ax,%eax
    438e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4392:	c7 44 24 04 c9 be 00 	movl   $0xbec9,0x4(%esp)
    4399:	00 
    439a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    43a1:	e8 bb 0f 00 00       	call   5361 <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    43a6:	8b 45 08             	mov    0x8(%ebp),%eax
    43a9:	8b 40 0c             	mov    0xc(%eax),%eax
    43ac:	89 44 24 08          	mov    %eax,0x8(%esp)
    43b0:	c7 44 24 04 d8 be 00 	movl   $0xbed8,0x4(%esp)
    43b7:	00 
    43b8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    43bf:	e8 9d 0f 00 00       	call   5361 <printf>
}
    43c4:	c9                   	leave  
    43c5:	c3                   	ret    

000043c6 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    43c6:	55                   	push   %ebp
    43c7:	89 e5                	mov    %esp,%ebp
    43c9:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    43cc:	c7 44 24 04 01 bf 00 	movl   $0xbf01,0x4(%esp)
    43d3:	00 
    43d4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    43db:	e8 81 0f 00 00       	call   5361 <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    43e0:	8b 45 08             	mov    0x8(%ebp),%eax
    43e3:	8b 00                	mov    (%eax),%eax
    43e5:	89 44 24 08          	mov    %eax,0x8(%esp)
    43e9:	c7 44 24 04 13 bf 00 	movl   $0xbf13,0x4(%esp)
    43f0:	00 
    43f1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    43f8:	e8 64 0f 00 00       	call   5361 <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    43fd:	8b 45 08             	mov    0x8(%ebp),%eax
    4400:	8b 40 04             	mov    0x4(%eax),%eax
    4403:	89 44 24 08          	mov    %eax,0x8(%esp)
    4407:	c7 44 24 04 2a bf 00 	movl   $0xbf2a,0x4(%esp)
    440e:	00 
    440f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4416:	e8 46 0f 00 00       	call   5361 <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    441b:	8b 45 08             	mov    0x8(%ebp),%eax
    441e:	8b 40 08             	mov    0x8(%eax),%eax
    4421:	89 44 24 08          	mov    %eax,0x8(%esp)
    4425:	c7 44 24 04 38 bf 00 	movl   $0xbf38,0x4(%esp)
    442c:	00 
    442d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4434:	e8 28 0f 00 00       	call   5361 <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    4439:	8b 45 08             	mov    0x8(%ebp),%eax
    443c:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    4440:	0f b7 c0             	movzwl %ax,%eax
    4443:	89 44 24 08          	mov    %eax,0x8(%esp)
    4447:	c7 44 24 04 46 bf 00 	movl   $0xbf46,0x4(%esp)
    444e:	00 
    444f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4456:	e8 06 0f 00 00       	call   5361 <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    445b:	8b 45 08             	mov    0x8(%ebp),%eax
    445e:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    4462:	0f b7 c0             	movzwl %ax,%eax
    4465:	89 44 24 08          	mov    %eax,0x8(%esp)
    4469:	c7 44 24 04 5c bf 00 	movl   $0xbf5c,0x4(%esp)
    4470:	00 
    4471:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4478:	e8 e4 0e 00 00       	call   5361 <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    447d:	8b 45 08             	mov    0x8(%ebp),%eax
    4480:	8b 40 10             	mov    0x10(%eax),%eax
    4483:	89 44 24 08          	mov    %eax,0x8(%esp)
    4487:	c7 44 24 04 7d bf 00 	movl   $0xbf7d,0x4(%esp)
    448e:	00 
    448f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4496:	e8 c6 0e 00 00       	call   5361 <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    449b:	8b 45 08             	mov    0x8(%ebp),%eax
    449e:	8b 40 14             	mov    0x14(%eax),%eax
    44a1:	89 44 24 08          	mov    %eax,0x8(%esp)
    44a5:	c7 44 24 04 90 bf 00 	movl   $0xbf90,0x4(%esp)
    44ac:	00 
    44ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    44b4:	e8 a8 0e 00 00       	call   5361 <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    44b9:	8b 45 08             	mov    0x8(%ebp),%eax
    44bc:	8b 40 18             	mov    0x18(%eax),%eax
    44bf:	89 44 24 08          	mov    %eax,0x8(%esp)
    44c3:	c7 44 24 04 c4 bf 00 	movl   $0xbfc4,0x4(%esp)
    44ca:	00 
    44cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    44d2:	e8 8a 0e 00 00       	call   5361 <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    44d7:	8b 45 08             	mov    0x8(%ebp),%eax
    44da:	8b 40 1c             	mov    0x1c(%eax),%eax
    44dd:	89 44 24 08          	mov    %eax,0x8(%esp)
    44e1:	c7 44 24 04 d9 bf 00 	movl   $0xbfd9,0x4(%esp)
    44e8:	00 
    44e9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    44f0:	e8 6c 0e 00 00       	call   5361 <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    44f5:	8b 45 08             	mov    0x8(%ebp),%eax
    44f8:	8b 40 20             	mov    0x20(%eax),%eax
    44fb:	89 44 24 08          	mov    %eax,0x8(%esp)
    44ff:	c7 44 24 04 ee bf 00 	movl   $0xbfee,0x4(%esp)
    4506:	00 
    4507:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    450e:	e8 4e 0e 00 00       	call   5361 <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    4513:	8b 45 08             	mov    0x8(%ebp),%eax
    4516:	8b 40 24             	mov    0x24(%eax),%eax
    4519:	89 44 24 08          	mov    %eax,0x8(%esp)
    451d:	c7 44 24 04 05 c0 00 	movl   $0xc005,0x4(%esp)
    4524:	00 
    4525:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    452c:	e8 30 0e 00 00       	call   5361 <printf>
}
    4531:	c9                   	leave  
    4532:	c3                   	ret    

00004533 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    4533:	55                   	push   %ebp
    4534:	89 e5                	mov    %esp,%ebp
    4536:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    4539:	8b 45 08             	mov    0x8(%ebp),%eax
    453c:	0f b6 00             	movzbl (%eax),%eax
    453f:	0f b6 c8             	movzbl %al,%ecx
    4542:	8b 45 08             	mov    0x8(%ebp),%eax
    4545:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4549:	0f b6 d0             	movzbl %al,%edx
    454c:	8b 45 08             	mov    0x8(%ebp),%eax
    454f:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    4553:	0f b6 c0             	movzbl %al,%eax
    4556:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    455a:	89 54 24 0c          	mov    %edx,0xc(%esp)
    455e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4562:	c7 44 24 04 19 c0 00 	movl   $0xc019,0x4(%esp)
    4569:	00 
    456a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4571:	e8 eb 0d 00 00       	call   5361 <printf>
}
    4576:	c9                   	leave  
    4577:	c3                   	ret    

00004578 <freepic>:

void freepic(PICNODE *pic) {
    4578:	55                   	push   %ebp
    4579:	89 e5                	mov    %esp,%ebp
    457b:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    457e:	8b 45 08             	mov    0x8(%ebp),%eax
    4581:	8b 00                	mov    (%eax),%eax
    4583:	89 04 24             	mov    %eax,(%esp)
    4586:	e8 89 0f 00 00       	call   5514 <free>
}
    458b:	c9                   	leave  
    458c:	c3                   	ret    

0000458d <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    458d:	55                   	push   %ebp
    458e:	89 e5                	mov    %esp,%ebp
    4590:	53                   	push   %ebx
    4591:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    4597:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    459e:	8d 45 dc             	lea    -0x24(%ebp),%eax
    45a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    45a4:	89 54 24 10          	mov    %edx,0x10(%esp)
    45a8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    45ab:	89 54 24 0c          	mov    %edx,0xc(%esp)
    45af:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    45b6:	00 
    45b7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    45be:	00 
    45bf:	89 04 24             	mov    %eax,(%esp)
    45c2:	e8 80 02 00 00       	call   4847 <initRect>
    45c7:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    45ca:	8b 45 08             	mov    0x8(%ebp),%eax
    45cd:	8b 40 04             	mov    0x4(%eax),%eax
    45d0:	2b 45 ec             	sub    -0x14(%ebp),%eax
    45d3:	89 c2                	mov    %eax,%edx
    45d5:	8d 45 cc             	lea    -0x34(%ebp),%eax
    45d8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    45db:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    45df:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    45e2:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    45e6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    45ed:	00 
    45ee:	89 54 24 04          	mov    %edx,0x4(%esp)
    45f2:	89 04 24             	mov    %eax,(%esp)
    45f5:	e8 4d 02 00 00       	call   4847 <initRect>
    45fa:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    45fd:	8b 45 08             	mov    0x8(%ebp),%eax
    4600:	8b 40 08             	mov    0x8(%eax),%eax
    4603:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4606:	89 c1                	mov    %eax,%ecx
    4608:	8b 45 08             	mov    0x8(%ebp),%eax
    460b:	8b 40 04             	mov    0x4(%eax),%eax
    460e:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4611:	89 c2                	mov    %eax,%edx
    4613:	8d 45 bc             	lea    -0x44(%ebp),%eax
    4616:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    4619:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    461d:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    4620:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    4624:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    4628:	89 54 24 04          	mov    %edx,0x4(%esp)
    462c:	89 04 24             	mov    %eax,(%esp)
    462f:	e8 13 02 00 00       	call   4847 <initRect>
    4634:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    4637:	8b 45 08             	mov    0x8(%ebp),%eax
    463a:	8b 40 08             	mov    0x8(%eax),%eax
    463d:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4640:	89 c2                	mov    %eax,%edx
    4642:	8d 45 ac             	lea    -0x54(%ebp),%eax
    4645:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4648:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    464c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    464f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4653:	89 54 24 08          	mov    %edx,0x8(%esp)
    4657:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    465e:	00 
    465f:	89 04 24             	mov    %eax,(%esp)
    4662:	e8 e0 01 00 00       	call   4847 <initRect>
    4667:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    466a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4671:	e9 96 01 00 00       	jmp    480c <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    4676:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    467d:	e9 77 01 00 00       	jmp    47f9 <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    4682:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4685:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4688:	89 54 24 08          	mov    %edx,0x8(%esp)
    468c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    468f:	89 54 24 04          	mov    %edx,0x4(%esp)
    4693:	89 04 24             	mov    %eax,(%esp)
    4696:	e8 85 01 00 00       	call   4820 <initPoint>
    469b:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    469e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    46a1:	89 44 24 08          	mov    %eax,0x8(%esp)
    46a5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    46a8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    46ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    46af:	89 44 24 10          	mov    %eax,0x10(%esp)
    46b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    46b6:	89 44 24 14          	mov    %eax,0x14(%esp)
    46ba:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    46bd:	8b 55 a8             	mov    -0x58(%ebp),%edx
    46c0:	89 04 24             	mov    %eax,(%esp)
    46c3:	89 54 24 04          	mov    %edx,0x4(%esp)
    46c7:	e8 d6 01 00 00       	call   48a2 <isIn>
    46cc:	85 c0                	test   %eax,%eax
    46ce:	0f 85 9a 00 00 00    	jne    476e <set_icon_alpha+0x1e1>
    46d4:	8b 45 cc             	mov    -0x34(%ebp),%eax
    46d7:	89 44 24 08          	mov    %eax,0x8(%esp)
    46db:	8b 45 d0             	mov    -0x30(%ebp),%eax
    46de:	89 44 24 0c          	mov    %eax,0xc(%esp)
    46e2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    46e5:	89 44 24 10          	mov    %eax,0x10(%esp)
    46e9:	8b 45 d8             	mov    -0x28(%ebp),%eax
    46ec:	89 44 24 14          	mov    %eax,0x14(%esp)
    46f0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    46f3:	8b 55 a8             	mov    -0x58(%ebp),%edx
    46f6:	89 04 24             	mov    %eax,(%esp)
    46f9:	89 54 24 04          	mov    %edx,0x4(%esp)
    46fd:	e8 a0 01 00 00       	call   48a2 <isIn>
    4702:	85 c0                	test   %eax,%eax
    4704:	75 68                	jne    476e <set_icon_alpha+0x1e1>
    4706:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4709:	89 44 24 08          	mov    %eax,0x8(%esp)
    470d:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4710:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4714:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4717:	89 44 24 10          	mov    %eax,0x10(%esp)
    471b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    471e:	89 44 24 14          	mov    %eax,0x14(%esp)
    4722:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4725:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4728:	89 04 24             	mov    %eax,(%esp)
    472b:	89 54 24 04          	mov    %edx,0x4(%esp)
    472f:	e8 6e 01 00 00       	call   48a2 <isIn>
    4734:	85 c0                	test   %eax,%eax
    4736:	75 36                	jne    476e <set_icon_alpha+0x1e1>
    4738:	8b 45 ac             	mov    -0x54(%ebp),%eax
    473b:	89 44 24 08          	mov    %eax,0x8(%esp)
    473f:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4742:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4746:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4749:	89 44 24 10          	mov    %eax,0x10(%esp)
    474d:	8b 45 b8             	mov    -0x48(%ebp),%eax
    4750:	89 44 24 14          	mov    %eax,0x14(%esp)
    4754:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4757:	8b 55 a8             	mov    -0x58(%ebp),%edx
    475a:	89 04 24             	mov    %eax,(%esp)
    475d:	89 54 24 04          	mov    %edx,0x4(%esp)
    4761:	e8 3c 01 00 00       	call   48a2 <isIn>
    4766:	85 c0                	test   %eax,%eax
    4768:	0f 84 87 00 00 00    	je     47f5 <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    476e:	8b 45 08             	mov    0x8(%ebp),%eax
    4771:	8b 10                	mov    (%eax),%edx
    4773:	8b 45 08             	mov    0x8(%ebp),%eax
    4776:	8b 40 04             	mov    0x4(%eax),%eax
    4779:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    477d:	89 c1                	mov    %eax,%ecx
    477f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4782:	01 c8                	add    %ecx,%eax
    4784:	c1 e0 02             	shl    $0x2,%eax
    4787:	01 d0                	add    %edx,%eax
    4789:	0f b6 00             	movzbl (%eax),%eax
    478c:	3c ff                	cmp    $0xff,%al
    478e:	75 65                	jne    47f5 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    4790:	8b 45 08             	mov    0x8(%ebp),%eax
    4793:	8b 10                	mov    (%eax),%edx
    4795:	8b 45 08             	mov    0x8(%ebp),%eax
    4798:	8b 40 04             	mov    0x4(%eax),%eax
    479b:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    479f:	89 c1                	mov    %eax,%ecx
    47a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    47a4:	01 c8                	add    %ecx,%eax
    47a6:	c1 e0 02             	shl    $0x2,%eax
    47a9:	01 d0                	add    %edx,%eax
    47ab:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    47af:	3c ff                	cmp    $0xff,%al
    47b1:	75 42                	jne    47f5 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    47b3:	8b 45 08             	mov    0x8(%ebp),%eax
    47b6:	8b 10                	mov    (%eax),%edx
    47b8:	8b 45 08             	mov    0x8(%ebp),%eax
    47bb:	8b 40 04             	mov    0x4(%eax),%eax
    47be:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    47c2:	89 c1                	mov    %eax,%ecx
    47c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    47c7:	01 c8                	add    %ecx,%eax
    47c9:	c1 e0 02             	shl    $0x2,%eax
    47cc:	01 d0                	add    %edx,%eax
    47ce:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    47d2:	3c ff                	cmp    $0xff,%al
    47d4:	75 1f                	jne    47f5 <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    47d6:	8b 45 08             	mov    0x8(%ebp),%eax
    47d9:	8b 10                	mov    (%eax),%edx
    47db:	8b 45 08             	mov    0x8(%ebp),%eax
    47de:	8b 40 04             	mov    0x4(%eax),%eax
    47e1:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    47e5:	89 c1                	mov    %eax,%ecx
    47e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    47ea:	01 c8                	add    %ecx,%eax
    47ec:	c1 e0 02             	shl    $0x2,%eax
    47ef:	01 d0                	add    %edx,%eax
    47f1:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    47f5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    47f9:	8b 45 08             	mov    0x8(%ebp),%eax
    47fc:	8b 40 08             	mov    0x8(%eax),%eax
    47ff:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    4802:	0f 8f 7a fe ff ff    	jg     4682 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    4808:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    480c:	8b 45 08             	mov    0x8(%ebp),%eax
    480f:	8b 40 04             	mov    0x4(%eax),%eax
    4812:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4815:	0f 8f 5b fe ff ff    	jg     4676 <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    481b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    481e:	c9                   	leave  
    481f:	c3                   	ret    

00004820 <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
    4820:	55                   	push   %ebp
    4821:	89 e5                	mov    %esp,%ebp
    4823:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    4826:	8b 45 0c             	mov    0xc(%ebp),%eax
    4829:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    482c:	8b 45 10             	mov    0x10(%ebp),%eax
    482f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    4832:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4835:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4838:	8b 55 fc             	mov    -0x4(%ebp),%edx
    483b:	89 01                	mov    %eax,(%ecx)
    483d:	89 51 04             	mov    %edx,0x4(%ecx)
}
    4840:	8b 45 08             	mov    0x8(%ebp),%eax
    4843:	c9                   	leave  
    4844:	c2 04 00             	ret    $0x4

00004847 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    4847:	55                   	push   %ebp
    4848:	89 e5                	mov    %esp,%ebp
    484a:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    484d:	8d 45 e8             	lea    -0x18(%ebp),%eax
    4850:	8b 55 10             	mov    0x10(%ebp),%edx
    4853:	89 54 24 08          	mov    %edx,0x8(%esp)
    4857:	8b 55 0c             	mov    0xc(%ebp),%edx
    485a:	89 54 24 04          	mov    %edx,0x4(%esp)
    485e:	89 04 24             	mov    %eax,(%esp)
    4861:	e8 ba ff ff ff       	call   4820 <initPoint>
    4866:	83 ec 04             	sub    $0x4,%esp
    4869:	8b 45 e8             	mov    -0x18(%ebp),%eax
    486c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    486f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4872:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    4875:	8b 45 14             	mov    0x14(%ebp),%eax
    4878:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    487b:	8b 45 18             	mov    0x18(%ebp),%eax
    487e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    4881:	8b 45 08             	mov    0x8(%ebp),%eax
    4884:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4887:	89 10                	mov    %edx,(%eax)
    4889:	8b 55 f4             	mov    -0xc(%ebp),%edx
    488c:	89 50 04             	mov    %edx,0x4(%eax)
    488f:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4892:	89 50 08             	mov    %edx,0x8(%eax)
    4895:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4898:	89 50 0c             	mov    %edx,0xc(%eax)
}
    489b:	8b 45 08             	mov    0x8(%ebp),%eax
    489e:	c9                   	leave  
    489f:	c2 04 00             	ret    $0x4

000048a2 <isIn>:

int isIn(Point p, Rect r)
{
    48a2:	55                   	push   %ebp
    48a3:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    48a5:	8b 55 08             	mov    0x8(%ebp),%edx
    48a8:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    48ab:	39 c2                	cmp    %eax,%edx
    48ad:	7c 2f                	jl     48de <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    48af:	8b 45 08             	mov    0x8(%ebp),%eax
    48b2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    48b5:	8b 55 18             	mov    0x18(%ebp),%edx
    48b8:	01 ca                	add    %ecx,%edx
    48ba:	39 d0                	cmp    %edx,%eax
    48bc:	7d 20                	jge    48de <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    48be:	8b 55 0c             	mov    0xc(%ebp),%edx
    48c1:	8b 45 14             	mov    0x14(%ebp),%eax
    48c4:	39 c2                	cmp    %eax,%edx
    48c6:	7c 16                	jl     48de <isIn+0x3c>
    48c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    48cb:	8b 4d 14             	mov    0x14(%ebp),%ecx
    48ce:	8b 55 1c             	mov    0x1c(%ebp),%edx
    48d1:	01 ca                	add    %ecx,%edx
    48d3:	39 d0                	cmp    %edx,%eax
    48d5:	7d 07                	jge    48de <isIn+0x3c>
    48d7:	b8 01 00 00 00       	mov    $0x1,%eax
    48dc:	eb 05                	jmp    48e3 <isIn+0x41>
    48de:	b8 00 00 00 00       	mov    $0x0,%eax
}
    48e3:	5d                   	pop    %ebp
    48e4:	c3                   	ret    

000048e5 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    48e5:	55                   	push   %ebp
    48e6:	89 e5                	mov    %esp,%ebp
    48e8:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    48eb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    48f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    48f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    4900:	8b 45 10             	mov    0x10(%ebp),%eax
    4903:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    4906:	8b 45 14             	mov    0x14(%ebp),%eax
    4909:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    490c:	8b 45 08             	mov    0x8(%ebp),%eax
    490f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4912:	89 10                	mov    %edx,(%eax)
    4914:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4917:	89 50 04             	mov    %edx,0x4(%eax)
    491a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    491d:	89 50 08             	mov    %edx,0x8(%eax)
    4920:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4923:	89 50 0c             	mov    %edx,0xc(%eax)
    4926:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4929:	89 50 10             	mov    %edx,0x10(%eax)
}
    492c:	8b 45 08             	mov    0x8(%ebp),%eax
    492f:	c9                   	leave  
    4930:	c2 04 00             	ret    $0x4

00004933 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    4933:	55                   	push   %ebp
    4934:	89 e5                	mov    %esp,%ebp
    4936:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    4939:	8b 45 1c             	mov    0x1c(%ebp),%eax
    493c:	83 f8 03             	cmp    $0x3,%eax
    493f:	74 72                	je     49b3 <createClickable+0x80>
    4941:	83 f8 04             	cmp    $0x4,%eax
    4944:	74 0a                	je     4950 <createClickable+0x1d>
    4946:	83 f8 02             	cmp    $0x2,%eax
    4949:	74 38                	je     4983 <createClickable+0x50>
    494b:	e9 96 00 00 00       	jmp    49e6 <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    4950:	8b 45 08             	mov    0x8(%ebp),%eax
    4953:	8d 50 04             	lea    0x4(%eax),%edx
    4956:	8b 45 20             	mov    0x20(%ebp),%eax
    4959:	89 44 24 14          	mov    %eax,0x14(%esp)
    495d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4960:	89 44 24 04          	mov    %eax,0x4(%esp)
    4964:	8b 45 10             	mov    0x10(%ebp),%eax
    4967:	89 44 24 08          	mov    %eax,0x8(%esp)
    496b:	8b 45 14             	mov    0x14(%ebp),%eax
    496e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4972:	8b 45 18             	mov    0x18(%ebp),%eax
    4975:	89 44 24 10          	mov    %eax,0x10(%esp)
    4979:	89 14 24             	mov    %edx,(%esp)
    497c:	e8 7c 00 00 00       	call   49fd <addClickable>
	        break;
    4981:	eb 78                	jmp    49fb <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    4983:	8b 45 08             	mov    0x8(%ebp),%eax
    4986:	8b 55 20             	mov    0x20(%ebp),%edx
    4989:	89 54 24 14          	mov    %edx,0x14(%esp)
    498d:	8b 55 0c             	mov    0xc(%ebp),%edx
    4990:	89 54 24 04          	mov    %edx,0x4(%esp)
    4994:	8b 55 10             	mov    0x10(%ebp),%edx
    4997:	89 54 24 08          	mov    %edx,0x8(%esp)
    499b:	8b 55 14             	mov    0x14(%ebp),%edx
    499e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    49a2:	8b 55 18             	mov    0x18(%ebp),%edx
    49a5:	89 54 24 10          	mov    %edx,0x10(%esp)
    49a9:	89 04 24             	mov    %eax,(%esp)
    49ac:	e8 4c 00 00 00       	call   49fd <addClickable>
	    	break;
    49b1:	eb 48                	jmp    49fb <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    49b3:	8b 45 08             	mov    0x8(%ebp),%eax
    49b6:	8d 50 08             	lea    0x8(%eax),%edx
    49b9:	8b 45 20             	mov    0x20(%ebp),%eax
    49bc:	89 44 24 14          	mov    %eax,0x14(%esp)
    49c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    49c3:	89 44 24 04          	mov    %eax,0x4(%esp)
    49c7:	8b 45 10             	mov    0x10(%ebp),%eax
    49ca:	89 44 24 08          	mov    %eax,0x8(%esp)
    49ce:	8b 45 14             	mov    0x14(%ebp),%eax
    49d1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    49d5:	8b 45 18             	mov    0x18(%ebp),%eax
    49d8:	89 44 24 10          	mov    %eax,0x10(%esp)
    49dc:	89 14 24             	mov    %edx,(%esp)
    49df:	e8 19 00 00 00       	call   49fd <addClickable>
	    	break;
    49e4:	eb 15                	jmp    49fb <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    49e6:	c7 44 24 04 28 c0 00 	movl   $0xc028,0x4(%esp)
    49ed:	00 
    49ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    49f5:	e8 67 09 00 00       	call   5361 <printf>
	    	break;
    49fa:	90                   	nop
	}
}
    49fb:	c9                   	leave  
    49fc:	c3                   	ret    

000049fd <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    49fd:	55                   	push   %ebp
    49fe:	89 e5                	mov    %esp,%ebp
    4a00:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    4a03:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    4a0a:	e8 3e 0c 00 00       	call   564d <malloc>
    4a0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    4a12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a15:	8b 55 0c             	mov    0xc(%ebp),%edx
    4a18:	89 10                	mov    %edx,(%eax)
    4a1a:	8b 55 10             	mov    0x10(%ebp),%edx
    4a1d:	89 50 04             	mov    %edx,0x4(%eax)
    4a20:	8b 55 14             	mov    0x14(%ebp),%edx
    4a23:	89 50 08             	mov    %edx,0x8(%eax)
    4a26:	8b 55 18             	mov    0x18(%ebp),%edx
    4a29:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    4a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a2f:	8b 55 1c             	mov    0x1c(%ebp),%edx
    4a32:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    4a35:	8b 45 08             	mov    0x8(%ebp),%eax
    4a38:	8b 10                	mov    (%eax),%edx
    4a3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a3d:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    4a40:	8b 45 08             	mov    0x8(%ebp),%eax
    4a43:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4a46:	89 10                	mov    %edx,(%eax)
}
    4a48:	c9                   	leave  
    4a49:	c3                   	ret    

00004a4a <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    4a4a:	55                   	push   %ebp
    4a4b:	89 e5                	mov    %esp,%ebp
    4a4d:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    4a50:	8b 45 08             	mov    0x8(%ebp),%eax
    4a53:	8b 00                	mov    (%eax),%eax
    4a55:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4a58:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    4a5e:	e9 bb 00 00 00       	jmp    4b1e <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    4a63:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a66:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a6a:	8b 45 10             	mov    0x10(%ebp),%eax
    4a6d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4a71:	8b 45 14             	mov    0x14(%ebp),%eax
    4a74:	89 44 24 10          	mov    %eax,0x10(%esp)
    4a78:	8b 45 18             	mov    0x18(%ebp),%eax
    4a7b:	89 44 24 14          	mov    %eax,0x14(%esp)
    4a7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a82:	8b 50 04             	mov    0x4(%eax),%edx
    4a85:	8b 00                	mov    (%eax),%eax
    4a87:	89 04 24             	mov    %eax,(%esp)
    4a8a:	89 54 24 04          	mov    %edx,0x4(%esp)
    4a8e:	e8 0f fe ff ff       	call   48a2 <isIn>
    4a93:	85 c0                	test   %eax,%eax
    4a95:	74 60                	je     4af7 <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    4a97:	8b 45 08             	mov    0x8(%ebp),%eax
    4a9a:	8b 00                	mov    (%eax),%eax
    4a9c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    4a9f:	75 2e                	jne    4acf <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    4aa1:	8b 45 08             	mov    0x8(%ebp),%eax
    4aa4:	8b 00                	mov    (%eax),%eax
    4aa6:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    4aa9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4aac:	8b 50 14             	mov    0x14(%eax),%edx
    4aaf:	8b 45 08             	mov    0x8(%ebp),%eax
    4ab2:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    4ab4:	8b 45 08             	mov    0x8(%ebp),%eax
    4ab7:	8b 00                	mov    (%eax),%eax
    4ab9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4abc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4abf:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    4ac2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4ac5:	89 04 24             	mov    %eax,(%esp)
    4ac8:	e8 47 0a 00 00       	call   5514 <free>
    4acd:	eb 4f                	jmp    4b1e <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    4acf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4ad2:	8b 50 14             	mov    0x14(%eax),%edx
    4ad5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ad8:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    4adb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4ade:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    4ae1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4ae4:	8b 40 14             	mov    0x14(%eax),%eax
    4ae7:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    4aea:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4aed:	89 04 24             	mov    %eax,(%esp)
    4af0:	e8 1f 0a 00 00       	call   5514 <free>
    4af5:	eb 27                	jmp    4b1e <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    4af7:	8b 45 08             	mov    0x8(%ebp),%eax
    4afa:	8b 00                	mov    (%eax),%eax
    4afc:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    4aff:	75 0b                	jne    4b0c <deleteClickable+0xc2>
			{
				cur = cur->next;
    4b01:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4b04:	8b 40 14             	mov    0x14(%eax),%eax
    4b07:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4b0a:	eb 12                	jmp    4b1e <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    4b0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4b0f:	8b 40 14             	mov    0x14(%eax),%eax
    4b12:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    4b15:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b18:	8b 40 14             	mov    0x14(%eax),%eax
    4b1b:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    4b1e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4b22:	0f 85 3b ff ff ff    	jne    4a63 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    4b28:	c9                   	leave  
    4b29:	c3                   	ret    

00004b2a <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    4b2a:	55                   	push   %ebp
    4b2b:	89 e5                	mov    %esp,%ebp
    4b2d:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    4b30:	8b 45 08             	mov    0x8(%ebp),%eax
    4b33:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    4b36:	eb 63                	jmp    4b9b <executeHandler+0x71>
	{
		if (isIn(click, cur->area))
    4b38:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b3b:	8b 10                	mov    (%eax),%edx
    4b3d:	89 54 24 08          	mov    %edx,0x8(%esp)
    4b41:	8b 50 04             	mov    0x4(%eax),%edx
    4b44:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4b48:	8b 50 08             	mov    0x8(%eax),%edx
    4b4b:	89 54 24 10          	mov    %edx,0x10(%esp)
    4b4f:	8b 40 0c             	mov    0xc(%eax),%eax
    4b52:	89 44 24 14          	mov    %eax,0x14(%esp)
    4b56:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b59:	8b 55 10             	mov    0x10(%ebp),%edx
    4b5c:	89 04 24             	mov    %eax,(%esp)
    4b5f:	89 54 24 04          	mov    %edx,0x4(%esp)
    4b63:	e8 3a fd ff ff       	call   48a2 <isIn>
    4b68:	85 c0                	test   %eax,%eax
    4b6a:	74 26                	je     4b92 <executeHandler+0x68>
		{
			isSearching = 0;
    4b6c:	c7 05 c0 33 01 00 00 	movl   $0x0,0x133c0
    4b73:	00 00 00 
			cur->handler(click);
    4b76:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b79:	8b 48 10             	mov    0x10(%eax),%ecx
    4b7c:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b7f:	8b 55 10             	mov    0x10(%ebp),%edx
    4b82:	89 04 24             	mov    %eax,(%esp)
    4b85:	89 54 24 04          	mov    %edx,0x4(%esp)
    4b89:	ff d1                	call   *%ecx
			return 1;
    4b8b:	b8 01 00 00 00       	mov    $0x1,%eax
    4b90:	eb 32                	jmp    4bc4 <executeHandler+0x9a>
		}
		cur = cur->next;
    4b92:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b95:	8b 40 14             	mov    0x14(%eax),%eax
    4b98:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    4b9b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4b9f:	75 97                	jne    4b38 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
    4ba1:	c7 05 c0 33 01 00 00 	movl   $0x0,0x133c0
    4ba8:	00 00 00 
	printf(0, "execute: none!\n");
    4bab:	c7 44 24 04 56 c0 00 	movl   $0xc056,0x4(%esp)
    4bb2:	00 
    4bb3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4bba:	e8 a2 07 00 00       	call   5361 <printf>
	return 0;
    4bbf:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4bc4:	c9                   	leave  
    4bc5:	c3                   	ret    

00004bc6 <printClickable>:

void printClickable(Clickable *c)
{
    4bc6:	55                   	push   %ebp
    4bc7:	89 e5                	mov    %esp,%ebp
    4bc9:	53                   	push   %ebx
    4bca:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    4bcd:	8b 45 08             	mov    0x8(%ebp),%eax
    4bd0:	8b 58 0c             	mov    0xc(%eax),%ebx
    4bd3:	8b 45 08             	mov    0x8(%ebp),%eax
    4bd6:	8b 48 08             	mov    0x8(%eax),%ecx
    4bd9:	8b 45 08             	mov    0x8(%ebp),%eax
    4bdc:	8b 50 04             	mov    0x4(%eax),%edx
    4bdf:	8b 45 08             	mov    0x8(%ebp),%eax
    4be2:	8b 00                	mov    (%eax),%eax
    4be4:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    4be8:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4bec:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4bf0:	89 44 24 08          	mov    %eax,0x8(%esp)
    4bf4:	c7 44 24 04 66 c0 00 	movl   $0xc066,0x4(%esp)
    4bfb:	00 
    4bfc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c03:	e8 59 07 00 00       	call   5361 <printf>
}
    4c08:	83 c4 24             	add    $0x24,%esp
    4c0b:	5b                   	pop    %ebx
    4c0c:	5d                   	pop    %ebp
    4c0d:	c3                   	ret    

00004c0e <printClickableList>:

void printClickableList(Clickable *head)
{
    4c0e:	55                   	push   %ebp
    4c0f:	89 e5                	mov    %esp,%ebp
    4c11:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    4c14:	8b 45 08             	mov    0x8(%ebp),%eax
    4c17:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    4c1a:	c7 44 24 04 78 c0 00 	movl   $0xc078,0x4(%esp)
    4c21:	00 
    4c22:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c29:	e8 33 07 00 00       	call   5361 <printf>
	while(cur != 0)
    4c2e:	eb 14                	jmp    4c44 <printClickableList+0x36>
	{
		printClickable(cur);
    4c30:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4c33:	89 04 24             	mov    %eax,(%esp)
    4c36:	e8 8b ff ff ff       	call   4bc6 <printClickable>
		cur = cur->next;
    4c3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4c3e:	8b 40 14             	mov    0x14(%eax),%eax
    4c41:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    4c44:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4c48:	75 e6                	jne    4c30 <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    4c4a:	c7 44 24 04 89 c0 00 	movl   $0xc089,0x4(%esp)
    4c51:	00 
    4c52:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c59:	e8 03 07 00 00       	call   5361 <printf>
}
    4c5e:	c9                   	leave  
    4c5f:	c3                   	ret    

00004c60 <testHanler>:

void testHanler(struct Point p)
{
    4c60:	55                   	push   %ebp
    4c61:	89 e5                	mov    %esp,%ebp
    4c63:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    4c66:	8b 55 0c             	mov    0xc(%ebp),%edx
    4c69:	8b 45 08             	mov    0x8(%ebp),%eax
    4c6c:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4c70:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c74:	c7 44 24 04 8b c0 00 	movl   $0xc08b,0x4(%esp)
    4c7b:	00 
    4c7c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c83:	e8 d9 06 00 00       	call   5361 <printf>
}
    4c88:	c9                   	leave  
    4c89:	c3                   	ret    

00004c8a <testClickable>:
void testClickable(struct Context c)
{
    4c8a:	55                   	push   %ebp
    4c8b:	89 e5                	mov    %esp,%ebp
    4c8d:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    4c93:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4c96:	8b 55 08             	mov    0x8(%ebp),%edx
    4c99:	89 54 24 04          	mov    %edx,0x4(%esp)
    4c9d:	8b 55 0c             	mov    0xc(%ebp),%edx
    4ca0:	89 54 24 08          	mov    %edx,0x8(%esp)
    4ca4:	8b 55 10             	mov    0x10(%ebp),%edx
    4ca7:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4cab:	89 04 24             	mov    %eax,(%esp)
    4cae:	e8 32 fc ff ff       	call   48e5 <initClickManager>
    4cb3:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    4cb6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    4cb9:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    4cc0:	00 
    4cc1:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    4cc8:	00 
    4cc9:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    4cd0:	00 
    4cd1:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    4cd8:	00 
    4cd9:	89 04 24             	mov    %eax,(%esp)
    4cdc:	e8 66 fb ff ff       	call   4847 <initRect>
    4ce1:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    4ce4:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    4ce7:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    4cee:	00 
    4cef:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    4cf6:	00 
    4cf7:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    4cfe:	00 
    4cff:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    4d06:	00 
    4d07:	89 04 24             	mov    %eax,(%esp)
    4d0a:	e8 38 fb ff ff       	call   4847 <initRect>
    4d0f:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    4d12:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    4d15:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    4d1c:	00 
    4d1d:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    4d24:	00 
    4d25:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    4d2c:	00 
    4d2d:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    4d34:	00 
    4d35:	89 04 24             	mov    %eax,(%esp)
    4d38:	e8 0a fb ff ff       	call   4847 <initRect>
    4d3d:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    4d40:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4d43:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    4d4a:	00 
    4d4b:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    4d52:	00 
    4d53:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    4d5a:	00 
    4d5b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4d62:	00 
    4d63:	89 04 24             	mov    %eax,(%esp)
    4d66:	e8 dc fa ff ff       	call   4847 <initRect>
    4d6b:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    4d6e:	8d 45 9c             	lea    -0x64(%ebp),%eax
    4d71:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    4d78:	00 
    4d79:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    4d80:	00 
    4d81:	89 04 24             	mov    %eax,(%esp)
    4d84:	e8 97 fa ff ff       	call   4820 <initPoint>
    4d89:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    4d8c:	8d 45 94             	lea    -0x6c(%ebp),%eax
    4d8f:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    4d96:	00 
    4d97:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    4d9e:	00 
    4d9f:	89 04 24             	mov    %eax,(%esp)
    4da2:	e8 79 fa ff ff       	call   4820 <initPoint>
    4da7:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    4daa:	c7 44 24 18 60 4c 00 	movl   $0x4c60,0x18(%esp)
    4db1:	00 
    4db2:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    4db9:	00 
    4dba:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4dbd:	89 44 24 04          	mov    %eax,0x4(%esp)
    4dc1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4dc4:	89 44 24 08          	mov    %eax,0x8(%esp)
    4dc8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4dcb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4dcf:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4dd2:	89 44 24 10          	mov    %eax,0x10(%esp)
    4dd6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4dd9:	89 04 24             	mov    %eax,(%esp)
    4ddc:	e8 52 fb ff ff       	call   4933 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4de1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4de4:	89 44 24 08          	mov    %eax,0x8(%esp)
    4de8:	c7 44 24 04 9f c0 00 	movl   $0xc09f,0x4(%esp)
    4def:	00 
    4df0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4df7:	e8 65 05 00 00       	call   5361 <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    4dfc:	c7 44 24 18 60 4c 00 	movl   $0x4c60,0x18(%esp)
    4e03:	00 
    4e04:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    4e0b:	00 
    4e0c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4e0f:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e13:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4e16:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e1a:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4e1d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4e21:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4e24:	89 44 24 10          	mov    %eax,0x10(%esp)
    4e28:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4e2b:	89 04 24             	mov    %eax,(%esp)
    4e2e:	e8 00 fb ff ff       	call   4933 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4e33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e36:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e3a:	c7 44 24 04 9f c0 00 	movl   $0xc09f,0x4(%esp)
    4e41:	00 
    4e42:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4e49:	e8 13 05 00 00       	call   5361 <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    4e4e:	c7 44 24 18 60 4c 00 	movl   $0x4c60,0x18(%esp)
    4e55:	00 
    4e56:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    4e5d:	00 
    4e5e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4e61:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e65:	8b 45 b8             	mov    -0x48(%ebp),%eax
    4e68:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e6c:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4e6f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4e73:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4e76:	89 44 24 10          	mov    %eax,0x10(%esp)
    4e7a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4e7d:	89 04 24             	mov    %eax,(%esp)
    4e80:	e8 ae fa ff ff       	call   4933 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4e85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e88:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e8c:	c7 44 24 04 9f c0 00 	movl   $0xc09f,0x4(%esp)
    4e93:	00 
    4e94:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4e9b:	e8 c1 04 00 00       	call   5361 <printf>
	printClickableList(cm.left_click);
    4ea0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4ea3:	89 04 24             	mov    %eax,(%esp)
    4ea6:	e8 63 fd ff ff       	call   4c0e <printClickableList>
	executeHandler(cm.left_click, p1);
    4eab:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    4eae:	8b 45 9c             	mov    -0x64(%ebp),%eax
    4eb1:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4eb4:	89 44 24 04          	mov    %eax,0x4(%esp)
    4eb8:	89 54 24 08          	mov    %edx,0x8(%esp)
    4ebc:	89 0c 24             	mov    %ecx,(%esp)
    4ebf:	e8 66 fc ff ff       	call   4b2a <executeHandler>
	executeHandler(cm.left_click, p2);
    4ec4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    4ec7:	8b 45 94             	mov    -0x6c(%ebp),%eax
    4eca:	8b 55 98             	mov    -0x68(%ebp),%edx
    4ecd:	89 44 24 04          	mov    %eax,0x4(%esp)
    4ed1:	89 54 24 08          	mov    %edx,0x8(%esp)
    4ed5:	89 0c 24             	mov    %ecx,(%esp)
    4ed8:	e8 4d fc ff ff       	call   4b2a <executeHandler>
	deleteClickable(&cm.left_click, r4);
    4edd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4ee0:	89 44 24 04          	mov    %eax,0x4(%esp)
    4ee4:	8b 45 a8             	mov    -0x58(%ebp),%eax
    4ee7:	89 44 24 08          	mov    %eax,0x8(%esp)
    4eeb:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4eee:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4ef2:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4ef5:	89 44 24 10          	mov    %eax,0x10(%esp)
    4ef9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4efc:	89 04 24             	mov    %eax,(%esp)
    4eff:	e8 46 fb ff ff       	call   4a4a <deleteClickable>
	printClickableList(cm.left_click);
    4f04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4f07:	89 04 24             	mov    %eax,(%esp)
    4f0a:	e8 ff fc ff ff       	call   4c0e <printClickableList>
}
    4f0f:	c9                   	leave  
    4f10:	c3                   	ret    

00004f11 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    4f11:	55                   	push   %ebp
    4f12:	89 e5                	mov    %esp,%ebp
    4f14:	57                   	push   %edi
    4f15:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    4f16:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4f19:	8b 55 10             	mov    0x10(%ebp),%edx
    4f1c:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f1f:	89 cb                	mov    %ecx,%ebx
    4f21:	89 df                	mov    %ebx,%edi
    4f23:	89 d1                	mov    %edx,%ecx
    4f25:	fc                   	cld    
    4f26:	f3 aa                	rep stos %al,%es:(%edi)
    4f28:	89 ca                	mov    %ecx,%edx
    4f2a:	89 fb                	mov    %edi,%ebx
    4f2c:	89 5d 08             	mov    %ebx,0x8(%ebp)
    4f2f:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    4f32:	5b                   	pop    %ebx
    4f33:	5f                   	pop    %edi
    4f34:	5d                   	pop    %ebp
    4f35:	c3                   	ret    

00004f36 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    4f36:	55                   	push   %ebp
    4f37:	89 e5                	mov    %esp,%ebp
    4f39:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    4f3c:	8b 45 08             	mov    0x8(%ebp),%eax
    4f3f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    4f42:	90                   	nop
    4f43:	8b 45 08             	mov    0x8(%ebp),%eax
    4f46:	8d 50 01             	lea    0x1(%eax),%edx
    4f49:	89 55 08             	mov    %edx,0x8(%ebp)
    4f4c:	8b 55 0c             	mov    0xc(%ebp),%edx
    4f4f:	8d 4a 01             	lea    0x1(%edx),%ecx
    4f52:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    4f55:	0f b6 12             	movzbl (%edx),%edx
    4f58:	88 10                	mov    %dl,(%eax)
    4f5a:	0f b6 00             	movzbl (%eax),%eax
    4f5d:	84 c0                	test   %al,%al
    4f5f:	75 e2                	jne    4f43 <strcpy+0xd>
    ;
  return os;
    4f61:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4f64:	c9                   	leave  
    4f65:	c3                   	ret    

00004f66 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    4f66:	55                   	push   %ebp
    4f67:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    4f69:	eb 08                	jmp    4f73 <strcmp+0xd>
    p++, q++;
    4f6b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4f6f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    4f73:	8b 45 08             	mov    0x8(%ebp),%eax
    4f76:	0f b6 00             	movzbl (%eax),%eax
    4f79:	84 c0                	test   %al,%al
    4f7b:	74 10                	je     4f8d <strcmp+0x27>
    4f7d:	8b 45 08             	mov    0x8(%ebp),%eax
    4f80:	0f b6 10             	movzbl (%eax),%edx
    4f83:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f86:	0f b6 00             	movzbl (%eax),%eax
    4f89:	38 c2                	cmp    %al,%dl
    4f8b:	74 de                	je     4f6b <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    4f8d:	8b 45 08             	mov    0x8(%ebp),%eax
    4f90:	0f b6 00             	movzbl (%eax),%eax
    4f93:	0f b6 d0             	movzbl %al,%edx
    4f96:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f99:	0f b6 00             	movzbl (%eax),%eax
    4f9c:	0f b6 c0             	movzbl %al,%eax
    4f9f:	29 c2                	sub    %eax,%edx
    4fa1:	89 d0                	mov    %edx,%eax
}
    4fa3:	5d                   	pop    %ebp
    4fa4:	c3                   	ret    

00004fa5 <strlen>:

uint
strlen(char *s)
{
    4fa5:	55                   	push   %ebp
    4fa6:	89 e5                	mov    %esp,%ebp
    4fa8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    4fab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    4fb2:	eb 04                	jmp    4fb8 <strlen+0x13>
    4fb4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    4fb8:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4fbb:	8b 45 08             	mov    0x8(%ebp),%eax
    4fbe:	01 d0                	add    %edx,%eax
    4fc0:	0f b6 00             	movzbl (%eax),%eax
    4fc3:	84 c0                	test   %al,%al
    4fc5:	75 ed                	jne    4fb4 <strlen+0xf>
    ;
  return n;
    4fc7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4fca:	c9                   	leave  
    4fcb:	c3                   	ret    

00004fcc <memset>:

void*
memset(void *dst, int c, uint n)
{
    4fcc:	55                   	push   %ebp
    4fcd:	89 e5                	mov    %esp,%ebp
    4fcf:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    4fd2:	8b 45 10             	mov    0x10(%ebp),%eax
    4fd5:	89 44 24 08          	mov    %eax,0x8(%esp)
    4fd9:	8b 45 0c             	mov    0xc(%ebp),%eax
    4fdc:	89 44 24 04          	mov    %eax,0x4(%esp)
    4fe0:	8b 45 08             	mov    0x8(%ebp),%eax
    4fe3:	89 04 24             	mov    %eax,(%esp)
    4fe6:	e8 26 ff ff ff       	call   4f11 <stosb>
  return dst;
    4feb:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4fee:	c9                   	leave  
    4fef:	c3                   	ret    

00004ff0 <strchr>:

char*
strchr(const char *s, char c)
{
    4ff0:	55                   	push   %ebp
    4ff1:	89 e5                	mov    %esp,%ebp
    4ff3:	83 ec 04             	sub    $0x4,%esp
    4ff6:	8b 45 0c             	mov    0xc(%ebp),%eax
    4ff9:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    4ffc:	eb 14                	jmp    5012 <strchr+0x22>
    if(*s == c)
    4ffe:	8b 45 08             	mov    0x8(%ebp),%eax
    5001:	0f b6 00             	movzbl (%eax),%eax
    5004:	3a 45 fc             	cmp    -0x4(%ebp),%al
    5007:	75 05                	jne    500e <strchr+0x1e>
      return (char*)s;
    5009:	8b 45 08             	mov    0x8(%ebp),%eax
    500c:	eb 13                	jmp    5021 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    500e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    5012:	8b 45 08             	mov    0x8(%ebp),%eax
    5015:	0f b6 00             	movzbl (%eax),%eax
    5018:	84 c0                	test   %al,%al
    501a:	75 e2                	jne    4ffe <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    501c:	b8 00 00 00 00       	mov    $0x0,%eax
}
    5021:	c9                   	leave  
    5022:	c3                   	ret    

00005023 <gets>:

char*
gets(char *buf, int max)
{
    5023:	55                   	push   %ebp
    5024:	89 e5                	mov    %esp,%ebp
    5026:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    5029:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5030:	eb 4c                	jmp    507e <gets+0x5b>
    cc = read(0, &c, 1);
    5032:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5039:	00 
    503a:	8d 45 ef             	lea    -0x11(%ebp),%eax
    503d:	89 44 24 04          	mov    %eax,0x4(%esp)
    5041:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5048:	e8 44 01 00 00       	call   5191 <read>
    504d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    5050:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5054:	7f 02                	jg     5058 <gets+0x35>
      break;
    5056:	eb 31                	jmp    5089 <gets+0x66>
    buf[i++] = c;
    5058:	8b 45 f4             	mov    -0xc(%ebp),%eax
    505b:	8d 50 01             	lea    0x1(%eax),%edx
    505e:	89 55 f4             	mov    %edx,-0xc(%ebp)
    5061:	89 c2                	mov    %eax,%edx
    5063:	8b 45 08             	mov    0x8(%ebp),%eax
    5066:	01 c2                	add    %eax,%edx
    5068:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    506c:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    506e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    5072:	3c 0a                	cmp    $0xa,%al
    5074:	74 13                	je     5089 <gets+0x66>
    5076:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    507a:	3c 0d                	cmp    $0xd,%al
    507c:	74 0b                	je     5089 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    507e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5081:	83 c0 01             	add    $0x1,%eax
    5084:	3b 45 0c             	cmp    0xc(%ebp),%eax
    5087:	7c a9                	jl     5032 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    5089:	8b 55 f4             	mov    -0xc(%ebp),%edx
    508c:	8b 45 08             	mov    0x8(%ebp),%eax
    508f:	01 d0                	add    %edx,%eax
    5091:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    5094:	8b 45 08             	mov    0x8(%ebp),%eax
}
    5097:	c9                   	leave  
    5098:	c3                   	ret    

00005099 <stat>:

int
stat(char *n, struct stat *st)
{
    5099:	55                   	push   %ebp
    509a:	89 e5                	mov    %esp,%ebp
    509c:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    509f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    50a6:	00 
    50a7:	8b 45 08             	mov    0x8(%ebp),%eax
    50aa:	89 04 24             	mov    %eax,(%esp)
    50ad:	e8 07 01 00 00       	call   51b9 <open>
    50b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    50b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    50b9:	79 07                	jns    50c2 <stat+0x29>
    return -1;
    50bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    50c0:	eb 23                	jmp    50e5 <stat+0x4c>
  r = fstat(fd, st);
    50c2:	8b 45 0c             	mov    0xc(%ebp),%eax
    50c5:	89 44 24 04          	mov    %eax,0x4(%esp)
    50c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50cc:	89 04 24             	mov    %eax,(%esp)
    50cf:	e8 fd 00 00 00       	call   51d1 <fstat>
    50d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    50d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50da:	89 04 24             	mov    %eax,(%esp)
    50dd:	e8 bf 00 00 00       	call   51a1 <close>
  return r;
    50e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    50e5:	c9                   	leave  
    50e6:	c3                   	ret    

000050e7 <atoi>:

int
atoi(const char *s)
{
    50e7:	55                   	push   %ebp
    50e8:	89 e5                	mov    %esp,%ebp
    50ea:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    50ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    50f4:	eb 25                	jmp    511b <atoi+0x34>
    n = n*10 + *s++ - '0';
    50f6:	8b 55 fc             	mov    -0x4(%ebp),%edx
    50f9:	89 d0                	mov    %edx,%eax
    50fb:	c1 e0 02             	shl    $0x2,%eax
    50fe:	01 d0                	add    %edx,%eax
    5100:	01 c0                	add    %eax,%eax
    5102:	89 c1                	mov    %eax,%ecx
    5104:	8b 45 08             	mov    0x8(%ebp),%eax
    5107:	8d 50 01             	lea    0x1(%eax),%edx
    510a:	89 55 08             	mov    %edx,0x8(%ebp)
    510d:	0f b6 00             	movzbl (%eax),%eax
    5110:	0f be c0             	movsbl %al,%eax
    5113:	01 c8                	add    %ecx,%eax
    5115:	83 e8 30             	sub    $0x30,%eax
    5118:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    511b:	8b 45 08             	mov    0x8(%ebp),%eax
    511e:	0f b6 00             	movzbl (%eax),%eax
    5121:	3c 2f                	cmp    $0x2f,%al
    5123:	7e 0a                	jle    512f <atoi+0x48>
    5125:	8b 45 08             	mov    0x8(%ebp),%eax
    5128:	0f b6 00             	movzbl (%eax),%eax
    512b:	3c 39                	cmp    $0x39,%al
    512d:	7e c7                	jle    50f6 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    512f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    5132:	c9                   	leave  
    5133:	c3                   	ret    

00005134 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    5134:	55                   	push   %ebp
    5135:	89 e5                	mov    %esp,%ebp
    5137:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    513a:	8b 45 08             	mov    0x8(%ebp),%eax
    513d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    5140:	8b 45 0c             	mov    0xc(%ebp),%eax
    5143:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    5146:	eb 17                	jmp    515f <memmove+0x2b>
    *dst++ = *src++;
    5148:	8b 45 fc             	mov    -0x4(%ebp),%eax
    514b:	8d 50 01             	lea    0x1(%eax),%edx
    514e:	89 55 fc             	mov    %edx,-0x4(%ebp)
    5151:	8b 55 f8             	mov    -0x8(%ebp),%edx
    5154:	8d 4a 01             	lea    0x1(%edx),%ecx
    5157:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    515a:	0f b6 12             	movzbl (%edx),%edx
    515d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    515f:	8b 45 10             	mov    0x10(%ebp),%eax
    5162:	8d 50 ff             	lea    -0x1(%eax),%edx
    5165:	89 55 10             	mov    %edx,0x10(%ebp)
    5168:	85 c0                	test   %eax,%eax
    516a:	7f dc                	jg     5148 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    516c:	8b 45 08             	mov    0x8(%ebp),%eax
}
    516f:	c9                   	leave  
    5170:	c3                   	ret    

00005171 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    5171:	b8 01 00 00 00       	mov    $0x1,%eax
    5176:	cd 40                	int    $0x40
    5178:	c3                   	ret    

00005179 <exit>:
SYSCALL(exit)
    5179:	b8 02 00 00 00       	mov    $0x2,%eax
    517e:	cd 40                	int    $0x40
    5180:	c3                   	ret    

00005181 <wait>:
SYSCALL(wait)
    5181:	b8 03 00 00 00       	mov    $0x3,%eax
    5186:	cd 40                	int    $0x40
    5188:	c3                   	ret    

00005189 <pipe>:
SYSCALL(pipe)
    5189:	b8 04 00 00 00       	mov    $0x4,%eax
    518e:	cd 40                	int    $0x40
    5190:	c3                   	ret    

00005191 <read>:
SYSCALL(read)
    5191:	b8 05 00 00 00       	mov    $0x5,%eax
    5196:	cd 40                	int    $0x40
    5198:	c3                   	ret    

00005199 <write>:
SYSCALL(write)
    5199:	b8 10 00 00 00       	mov    $0x10,%eax
    519e:	cd 40                	int    $0x40
    51a0:	c3                   	ret    

000051a1 <close>:
SYSCALL(close)
    51a1:	b8 15 00 00 00       	mov    $0x15,%eax
    51a6:	cd 40                	int    $0x40
    51a8:	c3                   	ret    

000051a9 <kill>:
SYSCALL(kill)
    51a9:	b8 06 00 00 00       	mov    $0x6,%eax
    51ae:	cd 40                	int    $0x40
    51b0:	c3                   	ret    

000051b1 <exec>:
SYSCALL(exec)
    51b1:	b8 07 00 00 00       	mov    $0x7,%eax
    51b6:	cd 40                	int    $0x40
    51b8:	c3                   	ret    

000051b9 <open>:
SYSCALL(open)
    51b9:	b8 0f 00 00 00       	mov    $0xf,%eax
    51be:	cd 40                	int    $0x40
    51c0:	c3                   	ret    

000051c1 <mknod>:
SYSCALL(mknod)
    51c1:	b8 11 00 00 00       	mov    $0x11,%eax
    51c6:	cd 40                	int    $0x40
    51c8:	c3                   	ret    

000051c9 <unlink>:
SYSCALL(unlink)
    51c9:	b8 12 00 00 00       	mov    $0x12,%eax
    51ce:	cd 40                	int    $0x40
    51d0:	c3                   	ret    

000051d1 <fstat>:
SYSCALL(fstat)
    51d1:	b8 08 00 00 00       	mov    $0x8,%eax
    51d6:	cd 40                	int    $0x40
    51d8:	c3                   	ret    

000051d9 <link>:
SYSCALL(link)
    51d9:	b8 13 00 00 00       	mov    $0x13,%eax
    51de:	cd 40                	int    $0x40
    51e0:	c3                   	ret    

000051e1 <mkdir>:
SYSCALL(mkdir)
    51e1:	b8 14 00 00 00       	mov    $0x14,%eax
    51e6:	cd 40                	int    $0x40
    51e8:	c3                   	ret    

000051e9 <chdir>:
SYSCALL(chdir)
    51e9:	b8 09 00 00 00       	mov    $0x9,%eax
    51ee:	cd 40                	int    $0x40
    51f0:	c3                   	ret    

000051f1 <dup>:
SYSCALL(dup)
    51f1:	b8 0a 00 00 00       	mov    $0xa,%eax
    51f6:	cd 40                	int    $0x40
    51f8:	c3                   	ret    

000051f9 <getpid>:
SYSCALL(getpid)
    51f9:	b8 0b 00 00 00       	mov    $0xb,%eax
    51fe:	cd 40                	int    $0x40
    5200:	c3                   	ret    

00005201 <sbrk>:
SYSCALL(sbrk)
    5201:	b8 0c 00 00 00       	mov    $0xc,%eax
    5206:	cd 40                	int    $0x40
    5208:	c3                   	ret    

00005209 <sleep>:
SYSCALL(sleep)
    5209:	b8 0d 00 00 00       	mov    $0xd,%eax
    520e:	cd 40                	int    $0x40
    5210:	c3                   	ret    

00005211 <uptime>:
SYSCALL(uptime)
    5211:	b8 0e 00 00 00       	mov    $0xe,%eax
    5216:	cd 40                	int    $0x40
    5218:	c3                   	ret    

00005219 <getMsg>:
SYSCALL(getMsg)
    5219:	b8 16 00 00 00       	mov    $0x16,%eax
    521e:	cd 40                	int    $0x40
    5220:	c3                   	ret    

00005221 <createWindow>:
SYSCALL(createWindow)
    5221:	b8 17 00 00 00       	mov    $0x17,%eax
    5226:	cd 40                	int    $0x40
    5228:	c3                   	ret    

00005229 <destroyWindow>:
SYSCALL(destroyWindow)
    5229:	b8 18 00 00 00       	mov    $0x18,%eax
    522e:	cd 40                	int    $0x40
    5230:	c3                   	ret    

00005231 <updateWindow>:
SYSCALL(updateWindow)
    5231:	b8 19 00 00 00       	mov    $0x19,%eax
    5236:	cd 40                	int    $0x40
    5238:	c3                   	ret    

00005239 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    5239:	b8 1a 00 00 00       	mov    $0x1a,%eax
    523e:	cd 40                	int    $0x40
    5240:	c3                   	ret    

00005241 <kwrite>:
SYSCALL(kwrite)
    5241:	b8 1c 00 00 00       	mov    $0x1c,%eax
    5246:	cd 40                	int    $0x40
    5248:	c3                   	ret    

00005249 <setSampleRate>:
SYSCALL(setSampleRate)
    5249:	b8 1b 00 00 00       	mov    $0x1b,%eax
    524e:	cd 40                	int    $0x40
    5250:	c3                   	ret    

00005251 <pause>:
SYSCALL(pause)
    5251:	b8 1d 00 00 00       	mov    $0x1d,%eax
    5256:	cd 40                	int    $0x40
    5258:	c3                   	ret    

00005259 <wavdecode>:
SYSCALL(wavdecode)
    5259:	b8 1e 00 00 00       	mov    $0x1e,%eax
    525e:	cd 40                	int    $0x40
    5260:	c3                   	ret    

00005261 <beginDecode>:
SYSCALL(beginDecode)
    5261:	b8 1f 00 00 00       	mov    $0x1f,%eax
    5266:	cd 40                	int    $0x40
    5268:	c3                   	ret    

00005269 <waitForDecode>:
SYSCALL(waitForDecode)
    5269:	b8 20 00 00 00       	mov    $0x20,%eax
    526e:	cd 40                	int    $0x40
    5270:	c3                   	ret    

00005271 <endDecode>:
SYSCALL(endDecode)
    5271:	b8 21 00 00 00       	mov    $0x21,%eax
    5276:	cd 40                	int    $0x40
    5278:	c3                   	ret    

00005279 <getCoreBuf>:
    5279:	b8 22 00 00 00       	mov    $0x22,%eax
    527e:	cd 40                	int    $0x40
    5280:	c3                   	ret    

00005281 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    5281:	55                   	push   %ebp
    5282:	89 e5                	mov    %esp,%ebp
    5284:	83 ec 18             	sub    $0x18,%esp
    5287:	8b 45 0c             	mov    0xc(%ebp),%eax
    528a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    528d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5294:	00 
    5295:	8d 45 f4             	lea    -0xc(%ebp),%eax
    5298:	89 44 24 04          	mov    %eax,0x4(%esp)
    529c:	8b 45 08             	mov    0x8(%ebp),%eax
    529f:	89 04 24             	mov    %eax,(%esp)
    52a2:	e8 f2 fe ff ff       	call   5199 <write>
}
    52a7:	c9                   	leave  
    52a8:	c3                   	ret    

000052a9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    52a9:	55                   	push   %ebp
    52aa:	89 e5                	mov    %esp,%ebp
    52ac:	56                   	push   %esi
    52ad:	53                   	push   %ebx
    52ae:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    52b1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    52b8:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    52bc:	74 17                	je     52d5 <printint+0x2c>
    52be:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    52c2:	79 11                	jns    52d5 <printint+0x2c>
    neg = 1;
    52c4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    52cb:	8b 45 0c             	mov    0xc(%ebp),%eax
    52ce:	f7 d8                	neg    %eax
    52d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    52d3:	eb 06                	jmp    52db <printint+0x32>
  } else {
    x = xx;
    52d5:	8b 45 0c             	mov    0xc(%ebp),%eax
    52d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    52db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    52e2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    52e5:	8d 41 01             	lea    0x1(%ecx),%eax
    52e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    52eb:	8b 5d 10             	mov    0x10(%ebp),%ebx
    52ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
    52f1:	ba 00 00 00 00       	mov    $0x0,%edx
    52f6:	f7 f3                	div    %ebx
    52f8:	89 d0                	mov    %edx,%eax
    52fa:	0f b6 80 b4 00 01 00 	movzbl 0x100b4(%eax),%eax
    5301:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    5305:	8b 75 10             	mov    0x10(%ebp),%esi
    5308:	8b 45 ec             	mov    -0x14(%ebp),%eax
    530b:	ba 00 00 00 00       	mov    $0x0,%edx
    5310:	f7 f6                	div    %esi
    5312:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5315:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5319:	75 c7                	jne    52e2 <printint+0x39>
  if(neg)
    531b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    531f:	74 10                	je     5331 <printint+0x88>
    buf[i++] = '-';
    5321:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5324:	8d 50 01             	lea    0x1(%eax),%edx
    5327:	89 55 f4             	mov    %edx,-0xc(%ebp)
    532a:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    532f:	eb 1f                	jmp    5350 <printint+0xa7>
    5331:	eb 1d                	jmp    5350 <printint+0xa7>
    putc(fd, buf[i]);
    5333:	8d 55 dc             	lea    -0x24(%ebp),%edx
    5336:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5339:	01 d0                	add    %edx,%eax
    533b:	0f b6 00             	movzbl (%eax),%eax
    533e:	0f be c0             	movsbl %al,%eax
    5341:	89 44 24 04          	mov    %eax,0x4(%esp)
    5345:	8b 45 08             	mov    0x8(%ebp),%eax
    5348:	89 04 24             	mov    %eax,(%esp)
    534b:	e8 31 ff ff ff       	call   5281 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    5350:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    5354:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5358:	79 d9                	jns    5333 <printint+0x8a>
    putc(fd, buf[i]);
}
    535a:	83 c4 30             	add    $0x30,%esp
    535d:	5b                   	pop    %ebx
    535e:	5e                   	pop    %esi
    535f:	5d                   	pop    %ebp
    5360:	c3                   	ret    

00005361 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    5361:	55                   	push   %ebp
    5362:	89 e5                	mov    %esp,%ebp
    5364:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    5367:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    536e:	8d 45 0c             	lea    0xc(%ebp),%eax
    5371:	83 c0 04             	add    $0x4,%eax
    5374:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    5377:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    537e:	e9 7c 01 00 00       	jmp    54ff <printf+0x19e>
    c = fmt[i] & 0xff;
    5383:	8b 55 0c             	mov    0xc(%ebp),%edx
    5386:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5389:	01 d0                	add    %edx,%eax
    538b:	0f b6 00             	movzbl (%eax),%eax
    538e:	0f be c0             	movsbl %al,%eax
    5391:	25 ff 00 00 00       	and    $0xff,%eax
    5396:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    5399:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    539d:	75 2c                	jne    53cb <printf+0x6a>
      if(c == '%'){
    539f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    53a3:	75 0c                	jne    53b1 <printf+0x50>
        state = '%';
    53a5:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    53ac:	e9 4a 01 00 00       	jmp    54fb <printf+0x19a>
      } else {
        putc(fd, c);
    53b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    53b4:	0f be c0             	movsbl %al,%eax
    53b7:	89 44 24 04          	mov    %eax,0x4(%esp)
    53bb:	8b 45 08             	mov    0x8(%ebp),%eax
    53be:	89 04 24             	mov    %eax,(%esp)
    53c1:	e8 bb fe ff ff       	call   5281 <putc>
    53c6:	e9 30 01 00 00       	jmp    54fb <printf+0x19a>
      }
    } else if(state == '%'){
    53cb:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    53cf:	0f 85 26 01 00 00    	jne    54fb <printf+0x19a>
      if(c == 'd'){
    53d5:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    53d9:	75 2d                	jne    5408 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    53db:	8b 45 e8             	mov    -0x18(%ebp),%eax
    53de:	8b 00                	mov    (%eax),%eax
    53e0:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    53e7:	00 
    53e8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    53ef:	00 
    53f0:	89 44 24 04          	mov    %eax,0x4(%esp)
    53f4:	8b 45 08             	mov    0x8(%ebp),%eax
    53f7:	89 04 24             	mov    %eax,(%esp)
    53fa:	e8 aa fe ff ff       	call   52a9 <printint>
        ap++;
    53ff:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5403:	e9 ec 00 00 00       	jmp    54f4 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    5408:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    540c:	74 06                	je     5414 <printf+0xb3>
    540e:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    5412:	75 2d                	jne    5441 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    5414:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5417:	8b 00                	mov    (%eax),%eax
    5419:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    5420:	00 
    5421:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    5428:	00 
    5429:	89 44 24 04          	mov    %eax,0x4(%esp)
    542d:	8b 45 08             	mov    0x8(%ebp),%eax
    5430:	89 04 24             	mov    %eax,(%esp)
    5433:	e8 71 fe ff ff       	call   52a9 <printint>
        ap++;
    5438:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    543c:	e9 b3 00 00 00       	jmp    54f4 <printf+0x193>
      } else if(c == 's'){
    5441:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    5445:	75 45                	jne    548c <printf+0x12b>
        s = (char*)*ap;
    5447:	8b 45 e8             	mov    -0x18(%ebp),%eax
    544a:	8b 00                	mov    (%eax),%eax
    544c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    544f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    5453:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5457:	75 09                	jne    5462 <printf+0x101>
          s = "(null)";
    5459:	c7 45 f4 af c0 00 00 	movl   $0xc0af,-0xc(%ebp)
        while(*s != 0){
    5460:	eb 1e                	jmp    5480 <printf+0x11f>
    5462:	eb 1c                	jmp    5480 <printf+0x11f>
          putc(fd, *s);
    5464:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5467:	0f b6 00             	movzbl (%eax),%eax
    546a:	0f be c0             	movsbl %al,%eax
    546d:	89 44 24 04          	mov    %eax,0x4(%esp)
    5471:	8b 45 08             	mov    0x8(%ebp),%eax
    5474:	89 04 24             	mov    %eax,(%esp)
    5477:	e8 05 fe ff ff       	call   5281 <putc>
          s++;
    547c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    5480:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5483:	0f b6 00             	movzbl (%eax),%eax
    5486:	84 c0                	test   %al,%al
    5488:	75 da                	jne    5464 <printf+0x103>
    548a:	eb 68                	jmp    54f4 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    548c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    5490:	75 1d                	jne    54af <printf+0x14e>
        putc(fd, *ap);
    5492:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5495:	8b 00                	mov    (%eax),%eax
    5497:	0f be c0             	movsbl %al,%eax
    549a:	89 44 24 04          	mov    %eax,0x4(%esp)
    549e:	8b 45 08             	mov    0x8(%ebp),%eax
    54a1:	89 04 24             	mov    %eax,(%esp)
    54a4:	e8 d8 fd ff ff       	call   5281 <putc>
        ap++;
    54a9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    54ad:	eb 45                	jmp    54f4 <printf+0x193>
      } else if(c == '%'){
    54af:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    54b3:	75 17                	jne    54cc <printf+0x16b>
        putc(fd, c);
    54b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54b8:	0f be c0             	movsbl %al,%eax
    54bb:	89 44 24 04          	mov    %eax,0x4(%esp)
    54bf:	8b 45 08             	mov    0x8(%ebp),%eax
    54c2:	89 04 24             	mov    %eax,(%esp)
    54c5:	e8 b7 fd ff ff       	call   5281 <putc>
    54ca:	eb 28                	jmp    54f4 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    54cc:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    54d3:	00 
    54d4:	8b 45 08             	mov    0x8(%ebp),%eax
    54d7:	89 04 24             	mov    %eax,(%esp)
    54da:	e8 a2 fd ff ff       	call   5281 <putc>
        putc(fd, c);
    54df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54e2:	0f be c0             	movsbl %al,%eax
    54e5:	89 44 24 04          	mov    %eax,0x4(%esp)
    54e9:	8b 45 08             	mov    0x8(%ebp),%eax
    54ec:	89 04 24             	mov    %eax,(%esp)
    54ef:	e8 8d fd ff ff       	call   5281 <putc>
      }
      state = 0;
    54f4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    54fb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    54ff:	8b 55 0c             	mov    0xc(%ebp),%edx
    5502:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5505:	01 d0                	add    %edx,%eax
    5507:	0f b6 00             	movzbl (%eax),%eax
    550a:	84 c0                	test   %al,%al
    550c:	0f 85 71 fe ff ff    	jne    5383 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    5512:	c9                   	leave  
    5513:	c3                   	ret    

00005514 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    5514:	55                   	push   %ebp
    5515:	89 e5                	mov    %esp,%ebp
    5517:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    551a:	8b 45 08             	mov    0x8(%ebp),%eax
    551d:	83 e8 08             	sub    $0x8,%eax
    5520:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5523:	a1 dc 05 01 00       	mov    0x105dc,%eax
    5528:	89 45 fc             	mov    %eax,-0x4(%ebp)
    552b:	eb 24                	jmp    5551 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    552d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5530:	8b 00                	mov    (%eax),%eax
    5532:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    5535:	77 12                	ja     5549 <free+0x35>
    5537:	8b 45 f8             	mov    -0x8(%ebp),%eax
    553a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    553d:	77 24                	ja     5563 <free+0x4f>
    553f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5542:	8b 00                	mov    (%eax),%eax
    5544:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    5547:	77 1a                	ja     5563 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5549:	8b 45 fc             	mov    -0x4(%ebp),%eax
    554c:	8b 00                	mov    (%eax),%eax
    554e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5551:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5554:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    5557:	76 d4                	jbe    552d <free+0x19>
    5559:	8b 45 fc             	mov    -0x4(%ebp),%eax
    555c:	8b 00                	mov    (%eax),%eax
    555e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    5561:	76 ca                	jbe    552d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    5563:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5566:	8b 40 04             	mov    0x4(%eax),%eax
    5569:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    5570:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5573:	01 c2                	add    %eax,%edx
    5575:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5578:	8b 00                	mov    (%eax),%eax
    557a:	39 c2                	cmp    %eax,%edx
    557c:	75 24                	jne    55a2 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    557e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5581:	8b 50 04             	mov    0x4(%eax),%edx
    5584:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5587:	8b 00                	mov    (%eax),%eax
    5589:	8b 40 04             	mov    0x4(%eax),%eax
    558c:	01 c2                	add    %eax,%edx
    558e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5591:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    5594:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5597:	8b 00                	mov    (%eax),%eax
    5599:	8b 10                	mov    (%eax),%edx
    559b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    559e:	89 10                	mov    %edx,(%eax)
    55a0:	eb 0a                	jmp    55ac <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    55a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    55a5:	8b 10                	mov    (%eax),%edx
    55a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    55aa:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    55ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
    55af:	8b 40 04             	mov    0x4(%eax),%eax
    55b2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    55b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    55bc:	01 d0                	add    %edx,%eax
    55be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    55c1:	75 20                	jne    55e3 <free+0xcf>
    p->s.size += bp->s.size;
    55c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    55c6:	8b 50 04             	mov    0x4(%eax),%edx
    55c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    55cc:	8b 40 04             	mov    0x4(%eax),%eax
    55cf:	01 c2                	add    %eax,%edx
    55d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    55d4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    55d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    55da:	8b 10                	mov    (%eax),%edx
    55dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    55df:	89 10                	mov    %edx,(%eax)
    55e1:	eb 08                	jmp    55eb <free+0xd7>
  } else
    p->s.ptr = bp;
    55e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    55e6:	8b 55 f8             	mov    -0x8(%ebp),%edx
    55e9:	89 10                	mov    %edx,(%eax)
  freep = p;
    55eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    55ee:	a3 dc 05 01 00       	mov    %eax,0x105dc
}
    55f3:	c9                   	leave  
    55f4:	c3                   	ret    

000055f5 <morecore>:

static Header*
morecore(uint nu)
{
    55f5:	55                   	push   %ebp
    55f6:	89 e5                	mov    %esp,%ebp
    55f8:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    55fb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    5602:	77 07                	ja     560b <morecore+0x16>
    nu = 4096;
    5604:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    560b:	8b 45 08             	mov    0x8(%ebp),%eax
    560e:	c1 e0 03             	shl    $0x3,%eax
    5611:	89 04 24             	mov    %eax,(%esp)
    5614:	e8 e8 fb ff ff       	call   5201 <sbrk>
    5619:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    561c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    5620:	75 07                	jne    5629 <morecore+0x34>
    return 0;
    5622:	b8 00 00 00 00       	mov    $0x0,%eax
    5627:	eb 22                	jmp    564b <morecore+0x56>
  hp = (Header*)p;
    5629:	8b 45 f4             	mov    -0xc(%ebp),%eax
    562c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    562f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5632:	8b 55 08             	mov    0x8(%ebp),%edx
    5635:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    5638:	8b 45 f0             	mov    -0x10(%ebp),%eax
    563b:	83 c0 08             	add    $0x8,%eax
    563e:	89 04 24             	mov    %eax,(%esp)
    5641:	e8 ce fe ff ff       	call   5514 <free>
  return freep;
    5646:	a1 dc 05 01 00       	mov    0x105dc,%eax
}
    564b:	c9                   	leave  
    564c:	c3                   	ret    

0000564d <malloc>:

void*
malloc(uint nbytes)
{
    564d:	55                   	push   %ebp
    564e:	89 e5                	mov    %esp,%ebp
    5650:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    5653:	8b 45 08             	mov    0x8(%ebp),%eax
    5656:	83 c0 07             	add    $0x7,%eax
    5659:	c1 e8 03             	shr    $0x3,%eax
    565c:	83 c0 01             	add    $0x1,%eax
    565f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    5662:	a1 dc 05 01 00       	mov    0x105dc,%eax
    5667:	89 45 f0             	mov    %eax,-0x10(%ebp)
    566a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    566e:	75 23                	jne    5693 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    5670:	c7 45 f0 d4 05 01 00 	movl   $0x105d4,-0x10(%ebp)
    5677:	8b 45 f0             	mov    -0x10(%ebp),%eax
    567a:	a3 dc 05 01 00       	mov    %eax,0x105dc
    567f:	a1 dc 05 01 00       	mov    0x105dc,%eax
    5684:	a3 d4 05 01 00       	mov    %eax,0x105d4
    base.s.size = 0;
    5689:	c7 05 d8 05 01 00 00 	movl   $0x0,0x105d8
    5690:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5693:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5696:	8b 00                	mov    (%eax),%eax
    5698:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    569b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    569e:	8b 40 04             	mov    0x4(%eax),%eax
    56a1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    56a4:	72 4d                	jb     56f3 <malloc+0xa6>
      if(p->s.size == nunits)
    56a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    56a9:	8b 40 04             	mov    0x4(%eax),%eax
    56ac:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    56af:	75 0c                	jne    56bd <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    56b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    56b4:	8b 10                	mov    (%eax),%edx
    56b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    56b9:	89 10                	mov    %edx,(%eax)
    56bb:	eb 26                	jmp    56e3 <malloc+0x96>
      else {
        p->s.size -= nunits;
    56bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    56c0:	8b 40 04             	mov    0x4(%eax),%eax
    56c3:	2b 45 ec             	sub    -0x14(%ebp),%eax
    56c6:	89 c2                	mov    %eax,%edx
    56c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    56cb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    56ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    56d1:	8b 40 04             	mov    0x4(%eax),%eax
    56d4:	c1 e0 03             	shl    $0x3,%eax
    56d7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    56da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    56dd:	8b 55 ec             	mov    -0x14(%ebp),%edx
    56e0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    56e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    56e6:	a3 dc 05 01 00       	mov    %eax,0x105dc
      return (void*)(p + 1);
    56eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    56ee:	83 c0 08             	add    $0x8,%eax
    56f1:	eb 38                	jmp    572b <malloc+0xde>
    }
    if(p == freep)
    56f3:	a1 dc 05 01 00       	mov    0x105dc,%eax
    56f8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    56fb:	75 1b                	jne    5718 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    56fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5700:	89 04 24             	mov    %eax,(%esp)
    5703:	e8 ed fe ff ff       	call   55f5 <morecore>
    5708:	89 45 f4             	mov    %eax,-0xc(%ebp)
    570b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    570f:	75 07                	jne    5718 <malloc+0xcb>
        return 0;
    5711:	b8 00 00 00 00       	mov    $0x0,%eax
    5716:	eb 13                	jmp    572b <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5718:	8b 45 f4             	mov    -0xc(%ebp),%eax
    571b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    571e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5721:	8b 00                	mov    (%eax),%eax
    5723:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    5726:	e9 70 ff ff ff       	jmp    569b <malloc+0x4e>
}
    572b:	c9                   	leave  
    572c:	c3                   	ret    

0000572d <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    572d:	55                   	push   %ebp
    572e:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    5730:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    5734:	79 07                	jns    573d <abs+0x10>
		return x * -1;
    5736:	8b 45 08             	mov    0x8(%ebp),%eax
    5739:	f7 d8                	neg    %eax
    573b:	eb 03                	jmp    5740 <abs+0x13>
	else
		return x;
    573d:	8b 45 08             	mov    0x8(%ebp),%eax
}
    5740:	5d                   	pop    %ebp
    5741:	c3                   	ret    

00005742 <sin>:
double sin(double x)  
{  
    5742:	55                   	push   %ebp
    5743:	89 e5                	mov    %esp,%ebp
    5745:	83 ec 3c             	sub    $0x3c,%esp
    5748:	8b 45 08             	mov    0x8(%ebp),%eax
    574b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    574e:	8b 45 0c             	mov    0xc(%ebp),%eax
    5751:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    5754:	dd 45 c8             	fldl   -0x38(%ebp)
    5757:	dd 5d f8             	fstpl  -0x8(%ebp)
    575a:	d9 e8                	fld1   
    575c:	dd 5d f0             	fstpl  -0x10(%ebp)
    575f:	dd 45 c8             	fldl   -0x38(%ebp)
    5762:	dd 5d e8             	fstpl  -0x18(%ebp)
    5765:	dd 45 c8             	fldl   -0x38(%ebp)
    5768:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    576b:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    5772:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    5779:	eb 50                	jmp    57cb <sin+0x89>
	{  
		n = n+1;  
    577b:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    577f:	db 45 dc             	fildl  -0x24(%ebp)
    5782:	dc 4d f0             	fmull  -0x10(%ebp)
    5785:	8b 45 dc             	mov    -0x24(%ebp),%eax
    5788:	83 c0 01             	add    $0x1,%eax
    578b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    578e:	db 45 c4             	fildl  -0x3c(%ebp)
    5791:	de c9                	fmulp  %st,%st(1)
    5793:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    5796:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    579a:	dd 45 c8             	fldl   -0x38(%ebp)
    579d:	dc 4d c8             	fmull  -0x38(%ebp)
    57a0:	dd 45 e8             	fldl   -0x18(%ebp)
    57a3:	de c9                	fmulp  %st,%st(1)
    57a5:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    57a8:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    57ab:	dd 45 e8             	fldl   -0x18(%ebp)
    57ae:	dc 75 f0             	fdivl  -0x10(%ebp)
    57b1:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    57b4:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    57b8:	7e 08                	jle    57c2 <sin+0x80>
    57ba:	dd 45 f8             	fldl   -0x8(%ebp)
    57bd:	dc 45 e0             	faddl  -0x20(%ebp)
    57c0:	eb 06                	jmp    57c8 <sin+0x86>
    57c2:	dd 45 f8             	fldl   -0x8(%ebp)
    57c5:	dc 65 e0             	fsubl  -0x20(%ebp)
    57c8:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    57cb:	dd 45 e0             	fldl   -0x20(%ebp)
    57ce:	dd 05 b8 c0 00 00    	fldl   0xc0b8
    57d4:	d9 c9                	fxch   %st(1)
    57d6:	df e9                	fucomip %st(1),%st
    57d8:	dd d8                	fstp   %st(0)
    57da:	77 9f                	ja     577b <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    57dc:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    57df:	c9                   	leave  
    57e0:	c3                   	ret    

000057e1 <cos>:
double cos(double x)  
{  
    57e1:	55                   	push   %ebp
    57e2:	89 e5                	mov    %esp,%ebp
    57e4:	83 ec 10             	sub    $0x10,%esp
    57e7:	8b 45 08             	mov    0x8(%ebp),%eax
    57ea:	89 45 f8             	mov    %eax,-0x8(%ebp)
    57ed:	8b 45 0c             	mov    0xc(%ebp),%eax
    57f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    57f3:	dd 05 c0 c0 00 00    	fldl   0xc0c0
    57f9:	dc 65 f8             	fsubl  -0x8(%ebp)
    57fc:	dd 1c 24             	fstpl  (%esp)
    57ff:	e8 3e ff ff ff       	call   5742 <sin>
}  
    5804:	c9                   	leave  
    5805:	c3                   	ret    

00005806 <tan>:
double tan(double x)  
{  
    5806:	55                   	push   %ebp
    5807:	89 e5                	mov    %esp,%ebp
    5809:	83 ec 18             	sub    $0x18,%esp
    580c:	8b 45 08             	mov    0x8(%ebp),%eax
    580f:	89 45 f8             	mov    %eax,-0x8(%ebp)
    5812:	8b 45 0c             	mov    0xc(%ebp),%eax
    5815:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    5818:	dd 45 f8             	fldl   -0x8(%ebp)
    581b:	dd 1c 24             	fstpl  (%esp)
    581e:	e8 1f ff ff ff       	call   5742 <sin>
    5823:	dd 5d f0             	fstpl  -0x10(%ebp)
    5826:	dd 45 f8             	fldl   -0x8(%ebp)
    5829:	dd 1c 24             	fstpl  (%esp)
    582c:	e8 b0 ff ff ff       	call   57e1 <cos>
    5831:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    5834:	c9                   	leave  
    5835:	c3                   	ret    

00005836 <pow>:

double pow(double x, double y)
{
    5836:	55                   	push   %ebp
    5837:	89 e5                	mov    %esp,%ebp
    5839:	83 ec 48             	sub    $0x48,%esp
    583c:	8b 45 08             	mov    0x8(%ebp),%eax
    583f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5842:	8b 45 0c             	mov    0xc(%ebp),%eax
    5845:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5848:	8b 45 10             	mov    0x10(%ebp),%eax
    584b:	89 45 d8             	mov    %eax,-0x28(%ebp)
    584e:	8b 45 14             	mov    0x14(%ebp),%eax
    5851:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    5854:	dd 45 e0             	fldl   -0x20(%ebp)
    5857:	d9 ee                	fldz   
    5859:	df e9                	fucomip %st(1),%st
    585b:	dd d8                	fstp   %st(0)
    585d:	7a 28                	jp     5887 <pow+0x51>
    585f:	dd 45 e0             	fldl   -0x20(%ebp)
    5862:	d9 ee                	fldz   
    5864:	df e9                	fucomip %st(1),%st
    5866:	dd d8                	fstp   %st(0)
    5868:	75 1d                	jne    5887 <pow+0x51>
    586a:	dd 45 d8             	fldl   -0x28(%ebp)
    586d:	d9 ee                	fldz   
    586f:	df e9                	fucomip %st(1),%st
    5871:	dd d8                	fstp   %st(0)
    5873:	7a 0b                	jp     5880 <pow+0x4a>
    5875:	dd 45 d8             	fldl   -0x28(%ebp)
    5878:	d9 ee                	fldz   
    587a:	df e9                	fucomip %st(1),%st
    587c:	dd d8                	fstp   %st(0)
    587e:	74 07                	je     5887 <pow+0x51>
    5880:	d9 ee                	fldz   
    5882:	e9 30 01 00 00       	jmp    59b7 <pow+0x181>
	else if(x==0 && y==0) return 1;
    5887:	dd 45 e0             	fldl   -0x20(%ebp)
    588a:	d9 ee                	fldz   
    588c:	df e9                	fucomip %st(1),%st
    588e:	dd d8                	fstp   %st(0)
    5890:	7a 28                	jp     58ba <pow+0x84>
    5892:	dd 45 e0             	fldl   -0x20(%ebp)
    5895:	d9 ee                	fldz   
    5897:	df e9                	fucomip %st(1),%st
    5899:	dd d8                	fstp   %st(0)
    589b:	75 1d                	jne    58ba <pow+0x84>
    589d:	dd 45 d8             	fldl   -0x28(%ebp)
    58a0:	d9 ee                	fldz   
    58a2:	df e9                	fucomip %st(1),%st
    58a4:	dd d8                	fstp   %st(0)
    58a6:	7a 12                	jp     58ba <pow+0x84>
    58a8:	dd 45 d8             	fldl   -0x28(%ebp)
    58ab:	d9 ee                	fldz   
    58ad:	df e9                	fucomip %st(1),%st
    58af:	dd d8                	fstp   %st(0)
    58b1:	75 07                	jne    58ba <pow+0x84>
    58b3:	d9 e8                	fld1   
    58b5:	e9 fd 00 00 00       	jmp    59b7 <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    58ba:	d9 ee                	fldz   
    58bc:	dd 45 d8             	fldl   -0x28(%ebp)
    58bf:	d9 c9                	fxch   %st(1)
    58c1:	df e9                	fucomip %st(1),%st
    58c3:	dd d8                	fstp   %st(0)
    58c5:	76 1d                	jbe    58e4 <pow+0xae>
    58c7:	dd 45 d8             	fldl   -0x28(%ebp)
    58ca:	d9 e0                	fchs   
    58cc:	dd 5c 24 08          	fstpl  0x8(%esp)
    58d0:	dd 45 e0             	fldl   -0x20(%ebp)
    58d3:	dd 1c 24             	fstpl  (%esp)
    58d6:	e8 5b ff ff ff       	call   5836 <pow>
    58db:	d9 e8                	fld1   
    58dd:	de f1                	fdivp  %st,%st(1)
    58df:	e9 d3 00 00 00       	jmp    59b7 <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    58e4:	d9 ee                	fldz   
    58e6:	dd 45 e0             	fldl   -0x20(%ebp)
    58e9:	d9 c9                	fxch   %st(1)
    58eb:	df e9                	fucomip %st(1),%st
    58ed:	dd d8                	fstp   %st(0)
    58ef:	76 40                	jbe    5931 <pow+0xfb>
    58f1:	dd 45 d8             	fldl   -0x28(%ebp)
    58f4:	d9 7d d6             	fnstcw -0x2a(%ebp)
    58f7:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    58fb:	b4 0c                	mov    $0xc,%ah
    58fd:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    5901:	d9 6d d4             	fldcw  -0x2c(%ebp)
    5904:	db 5d d0             	fistpl -0x30(%ebp)
    5907:	d9 6d d6             	fldcw  -0x2a(%ebp)
    590a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    590d:	89 45 d0             	mov    %eax,-0x30(%ebp)
    5910:	db 45 d0             	fildl  -0x30(%ebp)
    5913:	dd 45 d8             	fldl   -0x28(%ebp)
    5916:	de e1                	fsubp  %st,%st(1)
    5918:	d9 ee                	fldz   
    591a:	df e9                	fucomip %st(1),%st
    591c:	7a 0a                	jp     5928 <pow+0xf2>
    591e:	d9 ee                	fldz   
    5920:	df e9                	fucomip %st(1),%st
    5922:	dd d8                	fstp   %st(0)
    5924:	74 0b                	je     5931 <pow+0xfb>
    5926:	eb 02                	jmp    592a <pow+0xf4>
    5928:	dd d8                	fstp   %st(0)
    592a:	d9 ee                	fldz   
    592c:	e9 86 00 00 00       	jmp    59b7 <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    5931:	d9 ee                	fldz   
    5933:	dd 45 e0             	fldl   -0x20(%ebp)
    5936:	d9 c9                	fxch   %st(1)
    5938:	df e9                	fucomip %st(1),%st
    593a:	dd d8                	fstp   %st(0)
    593c:	76 63                	jbe    59a1 <pow+0x16b>
    593e:	dd 45 d8             	fldl   -0x28(%ebp)
    5941:	d9 7d d6             	fnstcw -0x2a(%ebp)
    5944:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    5948:	b4 0c                	mov    $0xc,%ah
    594a:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    594e:	d9 6d d4             	fldcw  -0x2c(%ebp)
    5951:	db 5d d0             	fistpl -0x30(%ebp)
    5954:	d9 6d d6             	fldcw  -0x2a(%ebp)
    5957:	8b 45 d0             	mov    -0x30(%ebp),%eax
    595a:	89 45 d0             	mov    %eax,-0x30(%ebp)
    595d:	db 45 d0             	fildl  -0x30(%ebp)
    5960:	dd 45 d8             	fldl   -0x28(%ebp)
    5963:	de e1                	fsubp  %st,%st(1)
    5965:	d9 ee                	fldz   
    5967:	df e9                	fucomip %st(1),%st
    5969:	7a 34                	jp     599f <pow+0x169>
    596b:	d9 ee                	fldz   
    596d:	df e9                	fucomip %st(1),%st
    596f:	dd d8                	fstp   %st(0)
    5971:	75 2e                	jne    59a1 <pow+0x16b>
	{
		double powint=1;
    5973:	d9 e8                	fld1   
    5975:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    5978:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    597f:	eb 0d                	jmp    598e <pow+0x158>
    5981:	dd 45 f0             	fldl   -0x10(%ebp)
    5984:	dc 4d e0             	fmull  -0x20(%ebp)
    5987:	dd 5d f0             	fstpl  -0x10(%ebp)
    598a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    598e:	db 45 ec             	fildl  -0x14(%ebp)
    5991:	dd 45 d8             	fldl   -0x28(%ebp)
    5994:	df e9                	fucomip %st(1),%st
    5996:	dd d8                	fstp   %st(0)
    5998:	73 e7                	jae    5981 <pow+0x14b>
		return powint;
    599a:	dd 45 f0             	fldl   -0x10(%ebp)
    599d:	eb 18                	jmp    59b7 <pow+0x181>
    599f:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    59a1:	dd 45 e0             	fldl   -0x20(%ebp)
    59a4:	dd 1c 24             	fstpl  (%esp)
    59a7:	e8 36 00 00 00       	call   59e2 <ln>
    59ac:	dc 4d d8             	fmull  -0x28(%ebp)
    59af:	dd 1c 24             	fstpl  (%esp)
    59b2:	e8 0e 02 00 00       	call   5bc5 <exp>
}
    59b7:	c9                   	leave  
    59b8:	c3                   	ret    

000059b9 <sqrt>:
// 求根
double sqrt(double x)
{
    59b9:	55                   	push   %ebp
    59ba:	89 e5                	mov    %esp,%ebp
    59bc:	83 ec 28             	sub    $0x28,%esp
    59bf:	8b 45 08             	mov    0x8(%ebp),%eax
    59c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    59c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    59c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    59cb:	dd 05 c8 c0 00 00    	fldl   0xc0c8
    59d1:	dd 5c 24 08          	fstpl  0x8(%esp)
    59d5:	dd 45 f0             	fldl   -0x10(%ebp)
    59d8:	dd 1c 24             	fstpl  (%esp)
    59db:	e8 56 fe ff ff       	call   5836 <pow>
}
    59e0:	c9                   	leave  
    59e1:	c3                   	ret    

000059e2 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    59e2:	55                   	push   %ebp
    59e3:	89 e5                	mov    %esp,%ebp
    59e5:	81 ec 88 00 00 00    	sub    $0x88,%esp
    59eb:	8b 45 08             	mov    0x8(%ebp),%eax
    59ee:	89 45 90             	mov    %eax,-0x70(%ebp)
    59f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    59f4:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    59f7:	dd 45 90             	fldl   -0x70(%ebp)
    59fa:	d9 e8                	fld1   
    59fc:	de e9                	fsubrp %st,%st(1)
    59fe:	dd 5d c0             	fstpl  -0x40(%ebp)
    5a01:	d9 ee                	fldz   
    5a03:	dd 5d f0             	fstpl  -0x10(%ebp)
    5a06:	d9 ee                	fldz   
    5a08:	dd 5d b8             	fstpl  -0x48(%ebp)
    5a0b:	d9 ee                	fldz   
    5a0d:	dd 5d b0             	fstpl  -0x50(%ebp)
    5a10:	d9 ee                	fldz   
    5a12:	dd 5d e8             	fstpl  -0x18(%ebp)
    5a15:	d9 e8                	fld1   
    5a17:	dd 5d e0             	fstpl  -0x20(%ebp)
    5a1a:	d9 e8                	fld1   
    5a1c:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    5a1f:	dd 45 90             	fldl   -0x70(%ebp)
    5a22:	d9 e8                	fld1   
    5a24:	df e9                	fucomip %st(1),%st
    5a26:	dd d8                	fstp   %st(0)
    5a28:	7a 12                	jp     5a3c <ln+0x5a>
    5a2a:	dd 45 90             	fldl   -0x70(%ebp)
    5a2d:	d9 e8                	fld1   
    5a2f:	df e9                	fucomip %st(1),%st
    5a31:	dd d8                	fstp   %st(0)
    5a33:	75 07                	jne    5a3c <ln+0x5a>
    5a35:	d9 ee                	fldz   
    5a37:	e9 87 01 00 00       	jmp    5bc3 <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    5a3c:	dd 45 90             	fldl   -0x70(%ebp)
    5a3f:	dd 05 d0 c0 00 00    	fldl   0xc0d0
    5a45:	d9 c9                	fxch   %st(1)
    5a47:	df e9                	fucomip %st(1),%st
    5a49:	dd d8                	fstp   %st(0)
    5a4b:	76 14                	jbe    5a61 <ln+0x7f>
    5a4d:	d9 e8                	fld1   
    5a4f:	dc 75 90             	fdivl  -0x70(%ebp)
    5a52:	dd 1c 24             	fstpl  (%esp)
    5a55:	e8 88 ff ff ff       	call   59e2 <ln>
    5a5a:	d9 e0                	fchs   
    5a5c:	e9 62 01 00 00       	jmp    5bc3 <ln+0x1e1>
	else if(x<.1)
    5a61:	dd 05 d8 c0 00 00    	fldl   0xc0d8
    5a67:	dd 45 90             	fldl   -0x70(%ebp)
    5a6a:	d9 c9                	fxch   %st(1)
    5a6c:	df e9                	fucomip %st(1),%st
    5a6e:	dd d8                	fstp   %st(0)
    5a70:	76 59                	jbe    5acb <ln+0xe9>
	{
		double n=-1;
    5a72:	d9 e8                	fld1   
    5a74:	d9 e0                	fchs   
    5a76:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    5a79:	dd 45 c8             	fldl   -0x38(%ebp)
    5a7c:	dd 05 e0 c0 00 00    	fldl   0xc0e0
    5a82:	de e9                	fsubrp %st,%st(1)
    5a84:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    5a87:	dd 45 c8             	fldl   -0x38(%ebp)
    5a8a:	dd 1c 24             	fstpl  (%esp)
    5a8d:	e8 33 01 00 00       	call   5bc5 <exp>
    5a92:	dd 45 90             	fldl   -0x70(%ebp)
    5a95:	de f1                	fdivp  %st,%st(1)
    5a97:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    5a9a:	dd 45 a0             	fldl   -0x60(%ebp)
    5a9d:	dd 05 d0 c0 00 00    	fldl   0xc0d0
    5aa3:	d9 c9                	fxch   %st(1)
    5aa5:	df e9                	fucomip %st(1),%st
    5aa7:	dd d8                	fstp   %st(0)
    5aa9:	77 ce                	ja     5a79 <ln+0x97>
    5aab:	d9 e8                	fld1   
    5aad:	dd 45 a0             	fldl   -0x60(%ebp)
    5ab0:	d9 c9                	fxch   %st(1)
    5ab2:	df e9                	fucomip %st(1),%st
    5ab4:	dd d8                	fstp   %st(0)
    5ab6:	77 c1                	ja     5a79 <ln+0x97>
		return ln(a)+n;
    5ab8:	dd 45 a0             	fldl   -0x60(%ebp)
    5abb:	dd 1c 24             	fstpl  (%esp)
    5abe:	e8 1f ff ff ff       	call   59e2 <ln>
    5ac3:	dc 45 c8             	faddl  -0x38(%ebp)
    5ac6:	e9 f8 00 00 00       	jmp    5bc3 <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    5acb:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    5ad2:	d9 e8                	fld1   
    5ad4:	dd 5d d8             	fstpl  -0x28(%ebp)
    5ad7:	e9 b6 00 00 00       	jmp    5b92 <ln+0x1b0>
	{
		ln_tmp=ln_px;
    5adc:	dd 45 e8             	fldl   -0x18(%ebp)
    5adf:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    5ae2:	dd 45 d8             	fldl   -0x28(%ebp)
    5ae5:	dc 4d c0             	fmull  -0x40(%ebp)
    5ae8:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    5aeb:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    5aef:	75 0d                	jne    5afe <ln+0x11c>
    5af1:	db 45 d4             	fildl  -0x2c(%ebp)
    5af4:	dd 45 d8             	fldl   -0x28(%ebp)
    5af7:	de f1                	fdivp  %st,%st(1)
    5af9:	dd 5d d8             	fstpl  -0x28(%ebp)
    5afc:	eb 13                	jmp    5b11 <ln+0x12f>
		else tmp=tmp/-l;
    5afe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5b01:	f7 d8                	neg    %eax
    5b03:	89 45 8c             	mov    %eax,-0x74(%ebp)
    5b06:	db 45 8c             	fildl  -0x74(%ebp)
    5b09:	dd 45 d8             	fldl   -0x28(%ebp)
    5b0c:	de f1                	fdivp  %st,%st(1)
    5b0e:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    5b11:	dd 45 f0             	fldl   -0x10(%ebp)
    5b14:	dc 45 d8             	faddl  -0x28(%ebp)
    5b17:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    5b1a:	dd 45 d8             	fldl   -0x28(%ebp)
    5b1d:	d9 e0                	fchs   
    5b1f:	dc 4d c0             	fmull  -0x40(%ebp)
    5b22:	db 45 d4             	fildl  -0x2c(%ebp)
    5b25:	de c9                	fmulp  %st,%st(1)
    5b27:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5b2a:	83 c0 01             	add    $0x1,%eax
    5b2d:	89 45 8c             	mov    %eax,-0x74(%ebp)
    5b30:	db 45 8c             	fildl  -0x74(%ebp)
    5b33:	de f9                	fdivrp %st,%st(1)
    5b35:	dc 45 f0             	faddl  -0x10(%ebp)
    5b38:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    5b3b:	dd 45 d8             	fldl   -0x28(%ebp)
    5b3e:	dc 4d c0             	fmull  -0x40(%ebp)
    5b41:	dc 4d c0             	fmull  -0x40(%ebp)
    5b44:	db 45 d4             	fildl  -0x2c(%ebp)
    5b47:	de c9                	fmulp  %st,%st(1)
    5b49:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5b4c:	83 c0 02             	add    $0x2,%eax
    5b4f:	89 45 8c             	mov    %eax,-0x74(%ebp)
    5b52:	db 45 8c             	fildl  -0x74(%ebp)
    5b55:	de f9                	fdivrp %st,%st(1)
    5b57:	dc 45 b8             	faddl  -0x48(%ebp)
    5b5a:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    5b5d:	dd 45 b0             	fldl   -0x50(%ebp)
    5b60:	dc 65 b8             	fsubl  -0x48(%ebp)
    5b63:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    5b66:	dd 45 a8             	fldl   -0x58(%ebp)
    5b69:	dc 4d a8             	fmull  -0x58(%ebp)
    5b6c:	dd 45 b8             	fldl   -0x48(%ebp)
    5b6f:	d8 c0                	fadd   %st(0),%st
    5b71:	dd 45 b0             	fldl   -0x50(%ebp)
    5b74:	de e1                	fsubp  %st,%st(1)
    5b76:	dc 45 f0             	faddl  -0x10(%ebp)
    5b79:	de f9                	fdivrp %st,%st(1)
    5b7b:	dd 45 b0             	fldl   -0x50(%ebp)
    5b7e:	de e1                	fsubp  %st,%st(1)
    5b80:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    5b83:	db 45 d4             	fildl  -0x2c(%ebp)
    5b86:	dd 45 d8             	fldl   -0x28(%ebp)
    5b89:	de c9                	fmulp  %st,%st(1)
    5b8b:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    5b8e:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    5b92:	dd 45 e8             	fldl   -0x18(%ebp)
    5b95:	dc 65 e0             	fsubl  -0x20(%ebp)
    5b98:	dd 05 e8 c0 00 00    	fldl   0xc0e8
    5b9e:	d9 c9                	fxch   %st(1)
    5ba0:	df e9                	fucomip %st(1),%st
    5ba2:	dd d8                	fstp   %st(0)
    5ba4:	0f 87 32 ff ff ff    	ja     5adc <ln+0xfa>
    5baa:	dd 45 e8             	fldl   -0x18(%ebp)
    5bad:	dc 65 e0             	fsubl  -0x20(%ebp)
    5bb0:	dd 05 f0 c0 00 00    	fldl   0xc0f0
    5bb6:	df e9                	fucomip %st(1),%st
    5bb8:	dd d8                	fstp   %st(0)
    5bba:	0f 87 1c ff ff ff    	ja     5adc <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    5bc0:	dd 45 e8             	fldl   -0x18(%ebp)
}
    5bc3:	c9                   	leave  
    5bc4:	c3                   	ret    

00005bc5 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    5bc5:	55                   	push   %ebp
    5bc6:	89 e5                	mov    %esp,%ebp
    5bc8:	83 ec 78             	sub    $0x78,%esp
    5bcb:	8b 45 08             	mov    0x8(%ebp),%eax
    5bce:	89 45 a0             	mov    %eax,-0x60(%ebp)
    5bd1:	8b 45 0c             	mov    0xc(%ebp),%eax
    5bd4:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    5bd7:	dd 45 a0             	fldl   -0x60(%ebp)
    5bda:	dd 5d c0             	fstpl  -0x40(%ebp)
    5bdd:	d9 ee                	fldz   
    5bdf:	dd 5d f0             	fstpl  -0x10(%ebp)
    5be2:	d9 ee                	fldz   
    5be4:	dd 5d b8             	fstpl  -0x48(%ebp)
    5be7:	d9 ee                	fldz   
    5be9:	dd 5d b0             	fstpl  -0x50(%ebp)
    5bec:	d9 ee                	fldz   
    5bee:	dd 5d e8             	fstpl  -0x18(%ebp)
    5bf1:	d9 e8                	fld1   
    5bf3:	dd 5d e0             	fstpl  -0x20(%ebp)
    5bf6:	d9 e8                	fld1   
    5bf8:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    5bfb:	dd 45 a0             	fldl   -0x60(%ebp)
    5bfe:	d9 ee                	fldz   
    5c00:	df e9                	fucomip %st(1),%st
    5c02:	dd d8                	fstp   %st(0)
    5c04:	7a 12                	jp     5c18 <exp+0x53>
    5c06:	dd 45 a0             	fldl   -0x60(%ebp)
    5c09:	d9 ee                	fldz   
    5c0b:	df e9                	fucomip %st(1),%st
    5c0d:	dd d8                	fstp   %st(0)
    5c0f:	75 07                	jne    5c18 <exp+0x53>
    5c11:	d9 e8                	fld1   
    5c13:	e9 08 01 00 00       	jmp    5d20 <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    5c18:	d9 ee                	fldz   
    5c1a:	dd 45 a0             	fldl   -0x60(%ebp)
    5c1d:	d9 c9                	fxch   %st(1)
    5c1f:	df e9                	fucomip %st(1),%st
    5c21:	dd d8                	fstp   %st(0)
    5c23:	76 16                	jbe    5c3b <exp+0x76>
    5c25:	dd 45 a0             	fldl   -0x60(%ebp)
    5c28:	d9 e0                	fchs   
    5c2a:	dd 1c 24             	fstpl  (%esp)
    5c2d:	e8 93 ff ff ff       	call   5bc5 <exp>
    5c32:	d9 e8                	fld1   
    5c34:	de f1                	fdivp  %st,%st(1)
    5c36:	e9 e5 00 00 00       	jmp    5d20 <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    5c3b:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    5c42:	d9 e8                	fld1   
    5c44:	dd 5d d0             	fstpl  -0x30(%ebp)
    5c47:	e9 92 00 00 00       	jmp    5cde <exp+0x119>
	{
		ex_tmp=ex_px;
    5c4c:	dd 45 e8             	fldl   -0x18(%ebp)
    5c4f:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    5c52:	dd 45 d0             	fldl   -0x30(%ebp)
    5c55:	dc 4d c0             	fmull  -0x40(%ebp)
    5c58:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    5c5b:	db 45 cc             	fildl  -0x34(%ebp)
    5c5e:	dd 45 d0             	fldl   -0x30(%ebp)
    5c61:	de f1                	fdivp  %st,%st(1)
    5c63:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    5c66:	dd 45 f0             	fldl   -0x10(%ebp)
    5c69:	dc 45 d0             	faddl  -0x30(%ebp)
    5c6c:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    5c6f:	dd 45 d0             	fldl   -0x30(%ebp)
    5c72:	dc 4d c0             	fmull  -0x40(%ebp)
    5c75:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5c78:	83 c0 01             	add    $0x1,%eax
    5c7b:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5c7e:	db 45 9c             	fildl  -0x64(%ebp)
    5c81:	de f9                	fdivrp %st,%st(1)
    5c83:	dc 45 f0             	faddl  -0x10(%ebp)
    5c86:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    5c89:	dd 45 d0             	fldl   -0x30(%ebp)
    5c8c:	dc 4d c0             	fmull  -0x40(%ebp)
    5c8f:	dc 4d c0             	fmull  -0x40(%ebp)
    5c92:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5c95:	83 c0 01             	add    $0x1,%eax
    5c98:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5c9b:	db 45 9c             	fildl  -0x64(%ebp)
    5c9e:	de f9                	fdivrp %st,%st(1)
    5ca0:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5ca3:	83 c0 02             	add    $0x2,%eax
    5ca6:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5ca9:	db 45 9c             	fildl  -0x64(%ebp)
    5cac:	de f9                	fdivrp %st,%st(1)
    5cae:	dc 45 b8             	faddl  -0x48(%ebp)
    5cb1:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    5cb4:	dd 45 b0             	fldl   -0x50(%ebp)
    5cb7:	dc 65 b8             	fsubl  -0x48(%ebp)
    5cba:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    5cbd:	dd 45 d8             	fldl   -0x28(%ebp)
    5cc0:	dc 4d d8             	fmull  -0x28(%ebp)
    5cc3:	dd 45 b8             	fldl   -0x48(%ebp)
    5cc6:	d8 c0                	fadd   %st(0),%st
    5cc8:	dd 45 b0             	fldl   -0x50(%ebp)
    5ccb:	de e1                	fsubp  %st,%st(1)
    5ccd:	dc 45 f0             	faddl  -0x10(%ebp)
    5cd0:	de f9                	fdivrp %st,%st(1)
    5cd2:	dd 45 b0             	fldl   -0x50(%ebp)
    5cd5:	de e1                	fsubp  %st,%st(1)
    5cd7:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    5cda:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    5cde:	dd 45 e8             	fldl   -0x18(%ebp)
    5ce1:	dc 65 e0             	fsubl  -0x20(%ebp)
    5ce4:	dd 05 f8 c0 00 00    	fldl   0xc0f8
    5cea:	d9 c9                	fxch   %st(1)
    5cec:	df e9                	fucomip %st(1),%st
    5cee:	dd d8                	fstp   %st(0)
    5cf0:	77 12                	ja     5d04 <exp+0x13f>
    5cf2:	dd 45 e8             	fldl   -0x18(%ebp)
    5cf5:	dc 65 e0             	fsubl  -0x20(%ebp)
    5cf8:	dd 05 00 c1 00 00    	fldl   0xc100
    5cfe:	df e9                	fucomip %st(1),%st
    5d00:	dd d8                	fstp   %st(0)
    5d02:	76 15                	jbe    5d19 <exp+0x154>
    5d04:	dd 45 d8             	fldl   -0x28(%ebp)
    5d07:	dd 05 f8 c0 00 00    	fldl   0xc0f8
    5d0d:	d9 c9                	fxch   %st(1)
    5d0f:	df e9                	fucomip %st(1),%st
    5d11:	dd d8                	fstp   %st(0)
    5d13:	0f 87 33 ff ff ff    	ja     5c4c <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    5d19:	dd 45 e8             	fldl   -0x18(%ebp)
    5d1c:	d9 e8                	fld1   
    5d1e:	de c1                	faddp  %st,%st(1)
    5d20:	c9                   	leave  
    5d21:	c3                   	ret    

00005d22 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    5d22:	55                   	push   %ebp
    5d23:	89 e5                	mov    %esp,%ebp
    5d25:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    5d28:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    5d2c:	8b 45 08             	mov    0x8(%ebp),%eax
    5d2f:	89 44 24 04          	mov    %eax,0x4(%esp)
    5d33:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5d36:	89 04 24             	mov    %eax,(%esp)
    5d39:	e8 f8 f1 ff ff       	call   4f36 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    5d3e:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5d45:	00 
    5d46:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5d49:	89 04 24             	mov    %eax,(%esp)
    5d4c:	e8 68 f4 ff ff       	call   51b9 <open>
    5d51:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5d54:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    5d58:	75 1b                	jne    5d75 <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    5d5a:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5d5d:	89 44 24 08          	mov    %eax,0x8(%esp)
    5d61:	c7 44 24 04 34 c1 00 	movl   $0xc134,0x4(%esp)
    5d68:	00 
    5d69:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5d70:	e8 ec f5 ff ff       	call   5361 <printf>
    }
    return f;
    5d75:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5d78:	c9                   	leave  
    5d79:	c3                   	ret    

00005d7a <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    5d7a:	55                   	push   %ebp
    5d7b:	89 e5                	mov    %esp,%ebp
    5d7d:	57                   	push   %edi
    5d7e:	56                   	push   %esi
    5d7f:	53                   	push   %ebx
    5d80:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    5d83:	8b 45 08             	mov    0x8(%ebp),%eax
    5d86:	8b 00                	mov    (%eax),%eax
    5d88:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    5d8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5d8e:	8b 78 14             	mov    0x14(%eax),%edi
    5d91:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5d94:	8b 70 10             	mov    0x10(%eax),%esi
    5d97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5d9a:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    5d9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5da0:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    5da3:	85 c0                	test   %eax,%eax
    5da5:	0f 94 c0             	sete   %al
    5da8:	0f b6 c8             	movzbl %al,%ecx
    5dab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5dae:	8b 50 04             	mov    0x4(%eax),%edx
    5db1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5db4:	8b 00                	mov    (%eax),%eax
    5db6:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    5dba:	89 74 24 18          	mov    %esi,0x18(%esp)
    5dbe:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    5dc2:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5dc6:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5dca:	89 44 24 08          	mov    %eax,0x8(%esp)
    5dce:	c7 44 24 04 54 c1 00 	movl   $0xc154,0x4(%esp)
    5dd5:	00 
    5dd6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5ddd:	e8 7f f5 ff ff       	call   5361 <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    5de2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5de5:	8b 78 2c             	mov    0x2c(%eax),%edi
    5de8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5deb:	8b 70 28             	mov    0x28(%eax),%esi
    5dee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5df1:	8b 58 24             	mov    0x24(%eax),%ebx
    5df4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5df7:	8b 48 20             	mov    0x20(%eax),%ecx
    5dfa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5dfd:	8b 50 1c             	mov    0x1c(%eax),%edx
    5e00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5e03:	8b 40 18             	mov    0x18(%eax),%eax
    5e06:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    5e0a:	89 74 24 18          	mov    %esi,0x18(%esp)
    5e0e:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    5e12:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5e16:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5e1a:	89 44 24 08          	mov    %eax,0x8(%esp)
    5e1e:	c7 44 24 04 94 c1 00 	movl   $0xc194,0x4(%esp)
    5e25:	00 
    5e26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5e2d:	e8 2f f5 ff ff       	call   5361 <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    5e32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5e35:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5e38:	8b 0c 85 e0 01 01 00 	mov    0x101e0(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    5e3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5e42:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5e45:	dd 04 c5 c0 01 01 00 	fldl   0x101c0(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    5e4c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5e4f:	8b 40 04             	mov    0x4(%eax),%eax
    5e52:	8d 50 ff             	lea    -0x1(%eax),%edx
    5e55:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5e58:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5e5b:	89 d0                	mov    %edx,%eax
    5e5d:	c1 e0 04             	shl    $0x4,%eax
    5e60:	29 d0                	sub    %edx,%eax
    5e62:	01 d8                	add    %ebx,%eax
    5e64:	8b 14 85 00 01 01 00 	mov    0x10100(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    5e6b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5e6e:	8b 40 04             	mov    0x4(%eax),%eax
    5e71:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5e74:	8b 04 85 e0 00 01 00 	mov    0x100e0(,%eax,4),%eax
    5e7b:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    5e7f:	dd 5c 24 10          	fstpl  0x10(%esp)
    5e83:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5e87:	89 44 24 08          	mov    %eax,0x8(%esp)
    5e8b:	c7 44 24 04 bc c1 00 	movl   $0xc1bc,0x4(%esp)
    5e92:	00 
    5e93:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5e9a:	e8 c2 f4 ff ff       	call   5361 <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    5e9f:	8b 45 08             	mov    0x8(%ebp),%eax
    5ea2:	8b 48 08             	mov    0x8(%eax),%ecx
    5ea5:	8b 45 08             	mov    0x8(%ebp),%eax
    5ea8:	8b 50 0c             	mov    0xc(%eax),%edx
    5eab:	8b 45 08             	mov    0x8(%ebp),%eax
    5eae:	8b 40 10             	mov    0x10(%eax),%eax
    5eb1:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5eb5:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5eb9:	89 44 24 08          	mov    %eax,0x8(%esp)
    5ebd:	c7 44 24 04 eb c1 00 	movl   $0xc1eb,0x4(%esp)
    5ec4:	00 
    5ec5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5ecc:	e8 90 f4 ff ff       	call   5361 <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    5ed1:	83 c4 3c             	add    $0x3c,%esp
    5ed4:	5b                   	pop    %ebx
    5ed5:	5e                   	pop    %esi
    5ed6:	5f                   	pop    %edi
    5ed7:	5d                   	pop    %ebp
    5ed8:	c3                   	ret    

00005ed9 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    5ed9:	55                   	push   %ebp
    5eda:	89 e5                	mov    %esp,%ebp
    5edc:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    5edf:	8b 45 08             	mov    0x8(%ebp),%eax
    5ee2:	89 04 24             	mov    %eax,(%esp)
    5ee5:	e8 63 f7 ff ff       	call   564d <malloc>
    5eea:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    5eed:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5ef1:	74 1c                	je     5f0f <mem_alloc+0x36>
		memset(ptr, 0, block);
    5ef3:	8b 45 08             	mov    0x8(%ebp),%eax
    5ef6:	89 44 24 08          	mov    %eax,0x8(%esp)
    5efa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    5f01:	00 
    5f02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f05:	89 04 24             	mov    %eax,(%esp)
    5f08:	e8 bf f0 ff ff       	call   4fcc <memset>
    5f0d:	eb 20                	jmp    5f2f <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    5f0f:	8b 45 0c             	mov    0xc(%ebp),%eax
    5f12:	89 44 24 08          	mov    %eax,0x8(%esp)
    5f16:	c7 44 24 04 05 c2 00 	movl   $0xc205,0x4(%esp)
    5f1d:	00 
    5f1e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5f25:	e8 37 f4 ff ff       	call   5361 <printf>
		exit();
    5f2a:	e8 4a f2 ff ff       	call   5179 <exit>
	}
	return ptr;
    5f2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5f32:	c9                   	leave  
    5f33:	c3                   	ret    

00005f34 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    5f34:	55                   	push   %ebp
    5f35:	89 e5                	mov    %esp,%ebp
    5f37:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    5f3a:	8b 45 0c             	mov    0xc(%ebp),%eax
    5f3d:	c7 44 24 04 1c c2 00 	movl   $0xc21c,0x4(%esp)
    5f44:	00 
    5f45:	89 04 24             	mov    %eax,(%esp)
    5f48:	e8 8c ff ff ff       	call   5ed9 <mem_alloc>
    5f4d:	8b 55 08             	mov    0x8(%ebp),%edx
    5f50:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    5f53:	8b 45 08             	mov    0x8(%ebp),%eax
    5f56:	8b 55 0c             	mov    0xc(%ebp),%edx
    5f59:	89 50 08             	mov    %edx,0x8(%eax)
}
    5f5c:	c9                   	leave  
    5f5d:	c3                   	ret    

00005f5e <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    5f5e:	55                   	push   %ebp
    5f5f:	89 e5                	mov    %esp,%ebp
    5f61:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    5f64:	8b 45 08             	mov    0x8(%ebp),%eax
    5f67:	8b 40 04             	mov    0x4(%eax),%eax
    5f6a:	89 04 24             	mov    %eax,(%esp)
    5f6d:	e8 a2 f5 ff ff       	call   5514 <free>
}
    5f72:	c9                   	leave  
    5f73:	c3                   	ret    

00005f74 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    5f74:	55                   	push   %ebp
    5f75:	89 e5                	mov    %esp,%ebp
    5f77:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    5f7a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5f81:	00 
    5f82:	8b 45 0c             	mov    0xc(%ebp),%eax
    5f85:	89 04 24             	mov    %eax,(%esp)
    5f88:	e8 2c f2 ff ff       	call   51b9 <open>
    5f8d:	8b 55 08             	mov    0x8(%ebp),%edx
    5f90:	89 02                	mov    %eax,(%edx)
    5f92:	8b 45 08             	mov    0x8(%ebp),%eax
    5f95:	8b 00                	mov    (%eax),%eax
    5f97:	83 f8 ff             	cmp    $0xffffffff,%eax
    5f9a:	75 20                	jne    5fbc <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    5f9c:	8b 45 0c             	mov    0xc(%ebp),%eax
    5f9f:	89 44 24 08          	mov    %eax,0x8(%esp)
    5fa3:	c7 44 24 04 23 c2 00 	movl   $0xc223,0x4(%esp)
    5faa:	00 
    5fab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5fb2:	e8 aa f3 ff ff       	call   5361 <printf>
		exit();
    5fb7:	e8 bd f1 ff ff       	call   5179 <exit>
	}

	bs->format = BINARY;
    5fbc:	8b 45 08             	mov    0x8(%ebp),%eax
    5fbf:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    5fc3:	8b 45 10             	mov    0x10(%ebp),%eax
    5fc6:	89 44 24 04          	mov    %eax,0x4(%esp)
    5fca:	8b 45 08             	mov    0x8(%ebp),%eax
    5fcd:	89 04 24             	mov    %eax,(%esp)
    5fd0:	e8 5f ff ff ff       	call   5f34 <alloc_buffer>
	bs->buf_byte_idx=0;
    5fd5:	8b 45 08             	mov    0x8(%ebp),%eax
    5fd8:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    5fdf:	8b 45 08             	mov    0x8(%ebp),%eax
    5fe2:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    5fe9:	8b 45 08             	mov    0x8(%ebp),%eax
    5fec:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    5ff3:	8b 45 08             	mov    0x8(%ebp),%eax
    5ff6:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    5ffd:	8b 45 08             	mov    0x8(%ebp),%eax
    6000:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    6007:	8b 45 08             	mov    0x8(%ebp),%eax
    600a:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    6011:	c9                   	leave  
    6012:	c3                   	ret    

00006013 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    6013:	55                   	push   %ebp
    6014:	89 e5                	mov    %esp,%ebp
    6016:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    6019:	8b 45 08             	mov    0x8(%ebp),%eax
    601c:	8b 00                	mov    (%eax),%eax
    601e:	89 04 24             	mov    %eax,(%esp)
    6021:	e8 7b f1 ff ff       	call   51a1 <close>
	desalloc_buffer(bs);
    6026:	8b 45 08             	mov    0x8(%ebp),%eax
    6029:	89 04 24             	mov    %eax,(%esp)
    602c:	e8 2d ff ff ff       	call   5f5e <desalloc_buffer>
}
    6031:	c9                   	leave  
    6032:	c3                   	ret    

00006033 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    6033:	55                   	push   %ebp
    6034:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    6036:	8b 45 08             	mov    0x8(%ebp),%eax
    6039:	8b 40 20             	mov    0x20(%eax),%eax
}
    603c:	5d                   	pop    %ebp
    603d:	c3                   	ret    

0000603e <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    603e:	55                   	push   %ebp
    603f:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    6041:	8b 45 08             	mov    0x8(%ebp),%eax
    6044:	8b 40 0c             	mov    0xc(%eax),%eax
}
    6047:	5d                   	pop    %ebp
    6048:	c3                   	ret    

00006049 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    6049:	55                   	push   %ebp
    604a:	89 e5                	mov    %esp,%ebp
    604c:	56                   	push   %esi
    604d:	53                   	push   %ebx
    604e:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    6051:	8b 45 08             	mov    0x8(%ebp),%eax
    6054:	8b 40 08             	mov    0x8(%eax),%eax
    6057:	8d 50 fe             	lea    -0x2(%eax),%edx
    605a:	8b 45 08             	mov    0x8(%ebp),%eax
    605d:	8b 40 10             	mov    0x10(%eax),%eax
    6060:	89 d3                	mov    %edx,%ebx
    6062:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    6064:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    6069:	eb 35                	jmp    60a0 <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    606b:	8b 45 08             	mov    0x8(%ebp),%eax
    606e:	8b 50 04             	mov    0x4(%eax),%edx
    6071:	89 d8                	mov    %ebx,%eax
    6073:	8d 58 ff             	lea    -0x1(%eax),%ebx
    6076:	01 c2                	add    %eax,%edx
    6078:	8b 45 08             	mov    0x8(%ebp),%eax
    607b:	8b 00                	mov    (%eax),%eax
    607d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    6084:	00 
    6085:	89 54 24 04          	mov    %edx,0x4(%esp)
    6089:	89 04 24             	mov    %eax,(%esp)
    608c:	e8 00 f1 ff ff       	call   5191 <read>
    6091:	89 c6                	mov    %eax,%esi
		if (!n)
    6093:	85 f6                	test   %esi,%esi
    6095:	75 09                	jne    60a0 <refill_buffer+0x57>
		bs->eob= i+1;
    6097:	8d 53 01             	lea    0x1(%ebx),%edx
    609a:	8b 45 08             	mov    0x8(%ebp),%eax
    609d:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    60a0:	85 db                	test   %ebx,%ebx
    60a2:	78 0a                	js     60ae <refill_buffer+0x65>
    60a4:	8b 45 08             	mov    0x8(%ebp),%eax
    60a7:	8b 40 1c             	mov    0x1c(%eax),%eax
    60aa:	85 c0                	test   %eax,%eax
    60ac:	74 bd                	je     606b <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    60ae:	83 c4 10             	add    $0x10,%esp
    60b1:	5b                   	pop    %ebx
    60b2:	5e                   	pop    %esi
    60b3:	5d                   	pop    %ebp
    60b4:	c3                   	ret    

000060b5 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    60b5:	55                   	push   %ebp
    60b6:	89 e5                	mov    %esp,%ebp
    60b8:	53                   	push   %ebx
    60b9:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    60bc:	8b 45 08             	mov    0x8(%ebp),%eax
    60bf:	8b 40 0c             	mov    0xc(%eax),%eax
    60c2:	8d 50 01             	lea    0x1(%eax),%edx
    60c5:	8b 45 08             	mov    0x8(%ebp),%eax
    60c8:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    60cb:	8b 45 08             	mov    0x8(%ebp),%eax
    60ce:	8b 40 14             	mov    0x14(%eax),%eax
    60d1:	85 c0                	test   %eax,%eax
    60d3:	0f 85 9f 00 00 00    	jne    6178 <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    60d9:	8b 45 08             	mov    0x8(%ebp),%eax
    60dc:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    60e3:	8b 45 08             	mov    0x8(%ebp),%eax
    60e6:	8b 40 10             	mov    0x10(%eax),%eax
    60e9:	8d 50 ff             	lea    -0x1(%eax),%edx
    60ec:	8b 45 08             	mov    0x8(%ebp),%eax
    60ef:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    60f2:	8b 45 08             	mov    0x8(%ebp),%eax
    60f5:	8b 40 10             	mov    0x10(%eax),%eax
    60f8:	83 f8 03             	cmp    $0x3,%eax
    60fb:	7e 10                	jle    610d <get1bit+0x58>
    60fd:	8b 45 08             	mov    0x8(%ebp),%eax
    6100:	8b 50 10             	mov    0x10(%eax),%edx
    6103:	8b 45 08             	mov    0x8(%ebp),%eax
    6106:	8b 40 1c             	mov    0x1c(%eax),%eax
    6109:	39 c2                	cmp    %eax,%edx
    610b:	7d 6b                	jge    6178 <get1bit+0xc3>
             if (bs->eob)
    610d:	8b 45 08             	mov    0x8(%ebp),%eax
    6110:	8b 40 1c             	mov    0x1c(%eax),%eax
    6113:	85 c0                	test   %eax,%eax
    6115:	74 0c                	je     6123 <get1bit+0x6e>
                bs->eobs = TRUE;
    6117:	8b 45 08             	mov    0x8(%ebp),%eax
    611a:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    6121:	eb 55                	jmp    6178 <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    6123:	8b 45 08             	mov    0x8(%ebp),%eax
    6126:	8b 58 10             	mov    0x10(%eax),%ebx
    6129:	eb 2f                	jmp    615a <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    612b:	8b 45 08             	mov    0x8(%ebp),%eax
    612e:	8b 50 04             	mov    0x4(%eax),%edx
    6131:	8b 45 08             	mov    0x8(%ebp),%eax
    6134:	8b 40 08             	mov    0x8(%eax),%eax
    6137:	8d 48 ff             	lea    -0x1(%eax),%ecx
    613a:	8b 45 08             	mov    0x8(%ebp),%eax
    613d:	8b 40 10             	mov    0x10(%eax),%eax
    6140:	29 c1                	sub    %eax,%ecx
    6142:	89 c8                	mov    %ecx,%eax
    6144:	01 d8                	add    %ebx,%eax
    6146:	01 c2                	add    %eax,%edx
    6148:	8b 45 08             	mov    0x8(%ebp),%eax
    614b:	8b 48 04             	mov    0x4(%eax),%ecx
    614e:	89 d8                	mov    %ebx,%eax
    6150:	01 c8                	add    %ecx,%eax
    6152:	0f b6 00             	movzbl (%eax),%eax
    6155:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    6157:	83 eb 01             	sub    $0x1,%ebx
    615a:	85 db                	test   %ebx,%ebx
    615c:	79 cd                	jns    612b <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    615e:	8b 45 08             	mov    0x8(%ebp),%eax
    6161:	89 04 24             	mov    %eax,(%esp)
    6164:	e8 e0 fe ff ff       	call   6049 <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    6169:	8b 45 08             	mov    0x8(%ebp),%eax
    616c:	8b 40 08             	mov    0x8(%eax),%eax
    616f:	8d 50 ff             	lea    -0x1(%eax),%edx
    6172:	8b 45 08             	mov    0x8(%ebp),%eax
    6175:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    6178:	8b 45 08             	mov    0x8(%ebp),%eax
    617b:	8b 50 04             	mov    0x4(%eax),%edx
    617e:	8b 45 08             	mov    0x8(%ebp),%eax
    6181:	8b 40 10             	mov    0x10(%eax),%eax
    6184:	01 d0                	add    %edx,%eax
    6186:	0f b6 00             	movzbl (%eax),%eax
    6189:	0f b6 d0             	movzbl %al,%edx
    618c:	8b 45 08             	mov    0x8(%ebp),%eax
    618f:	8b 40 14             	mov    0x14(%eax),%eax
    6192:	83 e8 01             	sub    $0x1,%eax
    6195:	8b 04 85 00 02 01 00 	mov    0x10200(,%eax,4),%eax
    619c:	21 d0                	and    %edx,%eax
    619e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    61a1:	8b 45 08             	mov    0x8(%ebp),%eax
    61a4:	8b 40 14             	mov    0x14(%eax),%eax
    61a7:	83 e8 01             	sub    $0x1,%eax
    61aa:	89 c1                	mov    %eax,%ecx
    61ac:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    61af:	8b 45 08             	mov    0x8(%ebp),%eax
    61b2:	8b 40 14             	mov    0x14(%eax),%eax
    61b5:	8d 50 ff             	lea    -0x1(%eax),%edx
    61b8:	8b 45 08             	mov    0x8(%ebp),%eax
    61bb:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    61be:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    61c1:	83 c4 24             	add    $0x24,%esp
    61c4:	5b                   	pop    %ebx
    61c5:	5d                   	pop    %ebp
    61c6:	c3                   	ret    

000061c7 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    61c7:	55                   	push   %ebp
    61c8:	89 e5                	mov    %esp,%ebp
    61ca:	57                   	push   %edi
    61cb:	56                   	push   %esi
    61cc:	53                   	push   %ebx
    61cd:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    61d0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    61d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    61da:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    61de:	7e 1c                	jle    61fc <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    61e0:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    61e7:	00 
    61e8:	c7 44 24 04 3c c2 00 	movl   $0xc23c,0x4(%esp)
    61ef:	00 
    61f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    61f7:	e8 65 f1 ff ff       	call   5361 <printf>

	bs->totbit += N;
    61fc:	8b 45 08             	mov    0x8(%ebp),%eax
    61ff:	8b 50 0c             	mov    0xc(%eax),%edx
    6202:	8b 45 0c             	mov    0xc(%ebp),%eax
    6205:	01 c2                	add    %eax,%edx
    6207:	8b 45 08             	mov    0x8(%ebp),%eax
    620a:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    620d:	e9 0a 01 00 00       	jmp    631c <getbits+0x155>
		if (!bs->buf_bit_idx) {
    6212:	8b 45 08             	mov    0x8(%ebp),%eax
    6215:	8b 40 14             	mov    0x14(%eax),%eax
    6218:	85 c0                	test   %eax,%eax
    621a:	0f 85 9f 00 00 00    	jne    62bf <getbits+0xf8>
			bs->buf_bit_idx = 8;
    6220:	8b 45 08             	mov    0x8(%ebp),%eax
    6223:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    622a:	8b 45 08             	mov    0x8(%ebp),%eax
    622d:	8b 40 10             	mov    0x10(%eax),%eax
    6230:	8d 50 ff             	lea    -0x1(%eax),%edx
    6233:	8b 45 08             	mov    0x8(%ebp),%eax
    6236:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    6239:	8b 45 08             	mov    0x8(%ebp),%eax
    623c:	8b 40 10             	mov    0x10(%eax),%eax
    623f:	83 f8 03             	cmp    $0x3,%eax
    6242:	7e 10                	jle    6254 <getbits+0x8d>
    6244:	8b 45 08             	mov    0x8(%ebp),%eax
    6247:	8b 50 10             	mov    0x10(%eax),%edx
    624a:	8b 45 08             	mov    0x8(%ebp),%eax
    624d:	8b 40 1c             	mov    0x1c(%eax),%eax
    6250:	39 c2                	cmp    %eax,%edx
    6252:	7d 6b                	jge    62bf <getbits+0xf8>
				if (bs->eob)
    6254:	8b 45 08             	mov    0x8(%ebp),%eax
    6257:	8b 40 1c             	mov    0x1c(%eax),%eax
    625a:	85 c0                	test   %eax,%eax
    625c:	74 0c                	je     626a <getbits+0xa3>
					bs->eobs = TRUE;
    625e:	8b 45 08             	mov    0x8(%ebp),%eax
    6261:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    6268:	eb 55                	jmp    62bf <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    626a:	8b 45 08             	mov    0x8(%ebp),%eax
    626d:	8b 70 10             	mov    0x10(%eax),%esi
    6270:	eb 2f                	jmp    62a1 <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    6272:	8b 45 08             	mov    0x8(%ebp),%eax
    6275:	8b 50 04             	mov    0x4(%eax),%edx
    6278:	8b 45 08             	mov    0x8(%ebp),%eax
    627b:	8b 40 08             	mov    0x8(%eax),%eax
    627e:	8d 48 ff             	lea    -0x1(%eax),%ecx
    6281:	8b 45 08             	mov    0x8(%ebp),%eax
    6284:	8b 40 10             	mov    0x10(%eax),%eax
    6287:	29 c1                	sub    %eax,%ecx
    6289:	89 c8                	mov    %ecx,%eax
    628b:	01 f0                	add    %esi,%eax
    628d:	01 c2                	add    %eax,%edx
    628f:	8b 45 08             	mov    0x8(%ebp),%eax
    6292:	8b 48 04             	mov    0x4(%eax),%ecx
    6295:	89 f0                	mov    %esi,%eax
    6297:	01 c8                	add    %ecx,%eax
    6299:	0f b6 00             	movzbl (%eax),%eax
    629c:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    629e:	83 ee 01             	sub    $0x1,%esi
    62a1:	85 f6                	test   %esi,%esi
    62a3:	79 cd                	jns    6272 <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    62a5:	8b 45 08             	mov    0x8(%ebp),%eax
    62a8:	89 04 24             	mov    %eax,(%esp)
    62ab:	e8 99 fd ff ff       	call   6049 <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    62b0:	8b 45 08             	mov    0x8(%ebp),%eax
    62b3:	8b 40 08             	mov    0x8(%eax),%eax
    62b6:	8d 50 ff             	lea    -0x1(%eax),%edx
    62b9:	8b 45 08             	mov    0x8(%ebp),%eax
    62bc:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    62bf:	8b 45 08             	mov    0x8(%ebp),%eax
    62c2:	8b 40 14             	mov    0x14(%eax),%eax
    62c5:	39 d8                	cmp    %ebx,%eax
    62c7:	0f 4f c3             	cmovg  %ebx,%eax
    62ca:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    62cc:	8b 45 08             	mov    0x8(%ebp),%eax
    62cf:	8b 50 04             	mov    0x4(%eax),%edx
    62d2:	8b 45 08             	mov    0x8(%ebp),%eax
    62d5:	8b 40 10             	mov    0x10(%eax),%eax
    62d8:	01 d0                	add    %edx,%eax
    62da:	0f b6 00             	movzbl (%eax),%eax
    62dd:	0f b6 d0             	movzbl %al,%edx
    62e0:	8b 45 08             	mov    0x8(%ebp),%eax
    62e3:	8b 40 14             	mov    0x14(%eax),%eax
    62e6:	8b 04 85 20 02 01 00 	mov    0x10220(,%eax,4),%eax
    62ed:	89 d7                	mov    %edx,%edi
    62ef:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    62f1:	8b 45 08             	mov    0x8(%ebp),%eax
    62f4:	8b 40 14             	mov    0x14(%eax),%eax
    62f7:	29 f0                	sub    %esi,%eax
    62f9:	89 c1                	mov    %eax,%ecx
    62fb:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    62fd:	89 d8                	mov    %ebx,%eax
    62ff:	29 f0                	sub    %esi,%eax
    6301:	89 c1                	mov    %eax,%ecx
    6303:	d3 e7                	shl    %cl,%edi
    6305:	89 f8                	mov    %edi,%eax
    6307:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    630a:	8b 45 08             	mov    0x8(%ebp),%eax
    630d:	8b 40 14             	mov    0x14(%eax),%eax
    6310:	29 f0                	sub    %esi,%eax
    6312:	89 c2                	mov    %eax,%edx
    6314:	8b 45 08             	mov    0x8(%ebp),%eax
    6317:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    631a:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    631c:	85 db                	test   %ebx,%ebx
    631e:	0f 8f ee fe ff ff    	jg     6212 <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    6324:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    6327:	83 c4 2c             	add    $0x2c,%esp
    632a:	5b                   	pop    %ebx
    632b:	5e                   	pop    %esi
    632c:	5f                   	pop    %edi
    632d:	5d                   	pop    %ebp
    632e:	c3                   	ret    

0000632f <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    632f:	55                   	push   %ebp
    6330:	89 e5                	mov    %esp,%ebp
    6332:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    6335:	db 45 10             	fildl  0x10(%ebp)
    6338:	dd 5c 24 08          	fstpl  0x8(%esp)
    633c:	dd 05 a8 c2 00 00    	fldl   0xc2a8
    6342:	dd 1c 24             	fstpl  (%esp)
    6345:	e8 ec f4 ff ff       	call   5836 <pow>
    634a:	d9 7d e6             	fnstcw -0x1a(%ebp)
    634d:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    6351:	b4 0c                	mov    $0xc,%ah
    6353:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    6357:	d9 6d e4             	fldcw  -0x1c(%ebp)
    635a:	db 5d e0             	fistpl -0x20(%ebp)
    635d:	d9 6d e6             	fldcw  -0x1a(%ebp)
    6360:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6363:	83 e8 01             	sub    $0x1,%eax
    6366:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    6369:	8b 45 08             	mov    0x8(%ebp),%eax
    636c:	89 04 24             	mov    %eax,(%esp)
    636f:	e8 ca fc ff ff       	call   603e <sstell>
    6374:	83 e0 07             	and    $0x7,%eax
    6377:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    637a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    637e:	74 17                	je     6397 <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    6380:	b8 08 00 00 00       	mov    $0x8,%eax
    6385:	2b 45 ec             	sub    -0x14(%ebp),%eax
    6388:	89 44 24 04          	mov    %eax,0x4(%esp)
    638c:	8b 45 08             	mov    0x8(%ebp),%eax
    638f:	89 04 24             	mov    %eax,(%esp)
    6392:	e8 30 fe ff ff       	call   61c7 <getbits>

	val = getbits(bs, N);
    6397:	8b 45 10             	mov    0x10(%ebp),%eax
    639a:	89 44 24 04          	mov    %eax,0x4(%esp)
    639e:	8b 45 08             	mov    0x8(%ebp),%eax
    63a1:	89 04 24             	mov    %eax,(%esp)
    63a4:	e8 1e fe ff ff       	call   61c7 <getbits>
    63a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    63ac:	eb 1a                	jmp    63c8 <seek_sync+0x99>
		val <<= ALIGNING;
    63ae:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    63b2:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    63b9:	00 
    63ba:	8b 45 08             	mov    0x8(%ebp),%eax
    63bd:	89 04 24             	mov    %eax,(%esp)
    63c0:	e8 02 fe ff ff       	call   61c7 <getbits>
    63c5:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    63c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    63cb:	23 45 f4             	and    -0xc(%ebp),%eax
    63ce:	3b 45 0c             	cmp    0xc(%ebp),%eax
    63d1:	74 0f                	je     63e2 <seek_sync+0xb3>
    63d3:	8b 45 08             	mov    0x8(%ebp),%eax
    63d6:	89 04 24             	mov    %eax,(%esp)
    63d9:	e8 55 fc ff ff       	call   6033 <end_bs>
    63de:	85 c0                	test   %eax,%eax
    63e0:	74 cc                	je     63ae <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    63e2:	8b 45 08             	mov    0x8(%ebp),%eax
    63e5:	89 04 24             	mov    %eax,(%esp)
    63e8:	e8 46 fc ff ff       	call   6033 <end_bs>
    63ed:	85 c0                	test   %eax,%eax
    63ef:	74 07                	je     63f8 <seek_sync+0xc9>
		return(0);
    63f1:	b8 00 00 00 00       	mov    $0x0,%eax
    63f6:	eb 05                	jmp    63fd <seek_sync+0xce>
	else
		return(1);
    63f8:	b8 01 00 00 00       	mov    $0x1,%eax
}
    63fd:	c9                   	leave  
    63fe:	c3                   	ret    

000063ff <js_bound>:

int js_bound(int lay, int m_ext)
{
    63ff:	55                   	push   %ebp
    6400:	89 e5                	mov    %esp,%ebp
    6402:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    6405:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    6409:	7e 12                	jle    641d <js_bound+0x1e>
    640b:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    640f:	7f 0c                	jg     641d <js_bound+0x1e>
    6411:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    6415:	78 06                	js     641d <js_bound+0x1e>
    6417:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    641b:	7e 27                	jle    6444 <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    641d:	8b 45 0c             	mov    0xc(%ebp),%eax
    6420:	89 44 24 0c          	mov    %eax,0xc(%esp)
    6424:	8b 45 08             	mov    0x8(%ebp),%eax
    6427:	89 44 24 08          	mov    %eax,0x8(%esp)
    642b:	c7 44 24 04 70 c2 00 	movl   $0xc270,0x4(%esp)
    6432:	00 
    6433:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    643a:	e8 22 ef ff ff       	call   5361 <printf>
        exit();
    643f:	e8 35 ed ff ff       	call   5179 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    6444:	8b 45 08             	mov    0x8(%ebp),%eax
    6447:	83 e8 01             	sub    $0x1,%eax
    644a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    6451:	8b 45 0c             	mov    0xc(%ebp),%eax
    6454:	01 d0                	add    %edx,%eax
    6456:	8b 04 85 60 02 01 00 	mov    0x10260(,%eax,4),%eax
}
    645d:	c9                   	leave  
    645e:	c3                   	ret    

0000645f <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    645f:	55                   	push   %ebp
    6460:	89 e5                	mov    %esp,%ebp
    6462:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    6465:	8b 45 08             	mov    0x8(%ebp),%eax
    6468:	8b 00                	mov    (%eax),%eax
    646a:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    646d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6470:	8b 50 1c             	mov    0x1c(%eax),%edx
    6473:	8b 45 08             	mov    0x8(%ebp),%eax
    6476:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    6479:	8b 45 f4             	mov    -0xc(%ebp),%eax
    647c:	8b 40 1c             	mov    0x1c(%eax),%eax
    647f:	83 f8 03             	cmp    $0x3,%eax
    6482:	75 07                	jne    648b <hdr_to_frps+0x2c>
    6484:	b8 01 00 00 00       	mov    $0x1,%eax
    6489:	eb 05                	jmp    6490 <hdr_to_frps+0x31>
    648b:	b8 02 00 00 00       	mov    $0x2,%eax
    6490:	8b 55 08             	mov    0x8(%ebp),%edx
    6493:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    6496:	8b 45 08             	mov    0x8(%ebp),%eax
    6499:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    64a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    64a3:	8b 40 1c             	mov    0x1c(%eax),%eax
    64a6:	83 f8 01             	cmp    $0x1,%eax
    64a9:	75 20                	jne    64cb <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    64ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    64ae:	8b 50 20             	mov    0x20(%eax),%edx
    64b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    64b4:	8b 40 04             	mov    0x4(%eax),%eax
    64b7:	89 54 24 04          	mov    %edx,0x4(%esp)
    64bb:	89 04 24             	mov    %eax,(%esp)
    64be:	e8 3c ff ff ff       	call   63ff <js_bound>
    64c3:	8b 55 08             	mov    0x8(%ebp),%edx
    64c6:	89 42 0c             	mov    %eax,0xc(%edx)
    64c9:	eb 0c                	jmp    64d7 <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    64cb:	8b 45 08             	mov    0x8(%ebp),%eax
    64ce:	8b 50 10             	mov    0x10(%eax),%edx
    64d1:	8b 45 08             	mov    0x8(%ebp),%eax
    64d4:	89 50 0c             	mov    %edx,0xc(%eax)
}
    64d7:	c9                   	leave  
    64d8:	c3                   	ret    

000064d9 <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    64d9:	55                   	push   %ebp
    64da:	89 e5                	mov    %esp,%ebp
    64dc:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    64df:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    64e3:	74 19                	je     64fe <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    64e5:	c7 44 24 04 93 c2 00 	movl   $0xc293,0x4(%esp)
    64ec:	00 
    64ed:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    64f4:	e8 68 ee ff ff       	call   5361 <printf>
		exit();
    64f9:	e8 7b ec ff ff       	call   5179 <exit>
	}
	getCoreBuf(1, val);
    64fe:	8b 45 08             	mov    0x8(%ebp),%eax
    6501:	89 44 24 04          	mov    %eax,0x4(%esp)
    6505:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    650c:	e8 68 ed ff ff       	call   5279 <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    6511:	c9                   	leave  
    6512:	c3                   	ret    

00006513 <hsstell>:

unsigned long hsstell()
{
    6513:	55                   	push   %ebp
    6514:	89 e5                	mov    %esp,%ebp
    6516:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    6519:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    6520:	00 
    6521:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    6528:	e8 4c ed ff ff       	call   5279 <getCoreBuf>
//	return(totbit);
}
    652d:	c9                   	leave  
    652e:	c3                   	ret    

0000652f <hgetbits>:

unsigned long hgetbits(int N)
{
    652f:	55                   	push   %ebp
    6530:	89 e5                	mov    %esp,%ebp
    6532:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    6535:	8b 45 08             	mov    0x8(%ebp),%eax
    6538:	89 44 24 04          	mov    %eax,0x4(%esp)
    653c:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    6543:	e8 31 ed ff ff       	call   5279 <getCoreBuf>
}
    6548:	c9                   	leave  
    6549:	c3                   	ret    

0000654a <hget1bit>:


unsigned int hget1bit()
{
    654a:	55                   	push   %ebp
    654b:	89 e5                	mov    %esp,%ebp
    654d:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    6550:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    6557:	e8 d3 ff ff ff       	call   652f <hgetbits>
}
    655c:	c9                   	leave  
    655d:	c3                   	ret    

0000655e <rewindNbits>:


void rewindNbits(int N)
{
    655e:	55                   	push   %ebp
    655f:	89 e5                	mov    %esp,%ebp
    6561:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    6564:	8b 45 08             	mov    0x8(%ebp),%eax
    6567:	89 44 24 04          	mov    %eax,0x4(%esp)
    656b:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    6572:	e8 02 ed ff ff       	call   5279 <getCoreBuf>
}
    6577:	c9                   	leave  
    6578:	c3                   	ret    

00006579 <rewindNbytes>:


void rewindNbytes(int N)
{
    6579:	55                   	push   %ebp
    657a:	89 e5                	mov    %esp,%ebp
    657c:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    657f:	8b 45 08             	mov    0x8(%ebp),%eax
    6582:	89 44 24 04          	mov    %eax,0x4(%esp)
    6586:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    658d:	e8 e7 ec ff ff       	call   5279 <getCoreBuf>
}
    6592:	c9                   	leave  
    6593:	c3                   	ret    

00006594 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    6594:	55                   	push   %ebp
    6595:	89 e5                	mov    %esp,%ebp
    6597:	57                   	push   %edi
    6598:	56                   	push   %esi
    6599:	53                   	push   %ebx
    659a:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    65a0:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    65a4:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    65a8:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    65ac:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    65b0:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    65b4:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    65b8:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    65bc:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    65c0:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    65c4:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    65c8:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    65cc:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    65d0:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    65d4:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    65d8:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    65dc:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    65e0:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    65e4:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    65e8:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    65ec:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    65f0:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    65f4:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    65f8:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    65fc:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    6600:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    6604:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    6608:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    660c:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    6610:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    6614:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    6618:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    661c:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    6620:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    6624:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    6628:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    662c:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    6630:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    6634:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    6638:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    663c:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    6640:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    6644:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    6648:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    664c:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    6650:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    6654:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    6658:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    665c:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    6660:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    6664:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    6668:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    666c:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    6670:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    6674:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    6678:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    667c:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    6680:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    6684:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    6688:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    668c:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    6690:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    6694:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    6698:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    669c:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    66a0:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    66a4:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    66a8:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    66ac:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    66b0:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    66b4:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    66b8:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    66bc:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    66c0:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    66c4:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    66c8:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    66cc:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    66d0:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    66d4:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    66d8:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    66dc:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    66e0:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    66e4:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    66e8:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    66ef:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    66f6:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    66fd:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    6704:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    670b:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    6712:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    6719:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    6720:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    6727:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    672e:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    6735:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    673c:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    6743:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    674a:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    6751:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    6758:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    675f:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    6766:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    676d:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    6774:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    677b:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    6782:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    6789:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    6790:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    6797:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    679e:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    67a5:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    67ac:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    67b0:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    67b4:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    67b8:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    67bc:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    67c0:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    67c4:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    67c8:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    67cc:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    67d0:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    67d4:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    67d8:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    67dc:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    67e0:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    67e4:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    67e8:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    67ec:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    67f0:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    67f4:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    67f8:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    67fc:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    6800:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    6804:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    6808:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    680c:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    6810:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    6814:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    6818:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    681c:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    6820:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    6824:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    6828:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    682c:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    6830:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    6834:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    683b:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    6842:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    6849:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    6850:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    6857:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    685e:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    6865:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    686c:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    6873:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    687a:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    6881:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    6888:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    688f:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    6896:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    689d:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    68a4:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    68ab:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    68b2:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    68b9:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    68c0:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    68c7:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    68ce:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    68d5:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    68dc:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    68e3:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    68ea:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    68f1:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    68f8:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    68ff:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    6906:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    690d:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    6914:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    691b:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    6922:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    6929:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    6930:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    6937:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    693e:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    6945:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    694c:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    6953:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    695a:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    6961:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    6968:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    696f:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    6976:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    697d:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    6984:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    698b:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    6992:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    6999:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    69a0:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    69a7:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    69ae:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    69b5:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    69bc:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    69c3:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    69ca:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    69d1:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    69d8:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    69df:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    69e6:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    69ec:	b8 c0 c2 00 00       	mov    $0xc2c0,%eax
    69f1:	b9 23 00 00 00       	mov    $0x23,%ecx
    69f6:	89 d7                	mov    %edx,%edi
    69f8:	89 c6                	mov    %eax,%esi
    69fa:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    69fc:	89 f0                	mov    %esi,%eax
    69fe:	89 fa                	mov    %edi,%edx
    6a00:	0f b7 08             	movzwl (%eax),%ecx
    6a03:	66 89 0a             	mov    %cx,(%edx)
    6a06:	83 c2 02             	add    $0x2,%edx
    6a09:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    6a0c:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    6a12:	ba 60 c3 00 00       	mov    $0xc360,%edx
    6a17:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    6a1c:	89 c1                	mov    %eax,%ecx
    6a1e:	83 e1 02             	and    $0x2,%ecx
    6a21:	85 c9                	test   %ecx,%ecx
    6a23:	74 0f                	je     6a34 <read_decoder_table+0x4a0>
    6a25:	0f b7 0a             	movzwl (%edx),%ecx
    6a28:	66 89 08             	mov    %cx,(%eax)
    6a2b:	83 c0 02             	add    $0x2,%eax
    6a2e:	83 c2 02             	add    $0x2,%edx
    6a31:	83 eb 02             	sub    $0x2,%ebx
    6a34:	89 d9                	mov    %ebx,%ecx
    6a36:	c1 e9 02             	shr    $0x2,%ecx
    6a39:	89 c7                	mov    %eax,%edi
    6a3b:	89 d6                	mov    %edx,%esi
    6a3d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6a3f:	89 f2                	mov    %esi,%edx
    6a41:	89 f8                	mov    %edi,%eax
    6a43:	b9 00 00 00 00       	mov    $0x0,%ecx
    6a48:	89 de                	mov    %ebx,%esi
    6a4a:	83 e6 02             	and    $0x2,%esi
    6a4d:	85 f6                	test   %esi,%esi
    6a4f:	74 0b                	je     6a5c <read_decoder_table+0x4c8>
    6a51:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    6a55:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    6a59:	83 c1 02             	add    $0x2,%ecx
    6a5c:	83 e3 01             	and    $0x1,%ebx
    6a5f:	85 db                	test   %ebx,%ebx
    6a61:	74 07                	je     6a6a <read_decoder_table+0x4d6>
    6a63:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    6a67:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    6a6a:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    6a70:	b8 00 c4 00 00       	mov    $0xc400,%eax
    6a75:	b9 23 00 00 00       	mov    $0x23,%ecx
    6a7a:	89 d7                	mov    %edx,%edi
    6a7c:	89 c6                	mov    %eax,%esi
    6a7e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6a80:	89 f0                	mov    %esi,%eax
    6a82:	89 fa                	mov    %edi,%edx
    6a84:	0f b7 08             	movzwl (%eax),%ecx
    6a87:	66 89 0a             	mov    %cx,(%edx)
    6a8a:	83 c2 02             	add    $0x2,%edx
    6a8d:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    6a90:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    6a96:	ba a0 c4 00 00       	mov    $0xc4a0,%edx
    6a9b:	bb fe 00 00 00       	mov    $0xfe,%ebx
    6aa0:	89 c1                	mov    %eax,%ecx
    6aa2:	83 e1 02             	and    $0x2,%ecx
    6aa5:	85 c9                	test   %ecx,%ecx
    6aa7:	74 0f                	je     6ab8 <read_decoder_table+0x524>
    6aa9:	0f b7 0a             	movzwl (%edx),%ecx
    6aac:	66 89 08             	mov    %cx,(%eax)
    6aaf:	83 c0 02             	add    $0x2,%eax
    6ab2:	83 c2 02             	add    $0x2,%edx
    6ab5:	83 eb 02             	sub    $0x2,%ebx
    6ab8:	89 d9                	mov    %ebx,%ecx
    6aba:	c1 e9 02             	shr    $0x2,%ecx
    6abd:	89 c7                	mov    %eax,%edi
    6abf:	89 d6                	mov    %edx,%esi
    6ac1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6ac3:	89 f2                	mov    %esi,%edx
    6ac5:	89 f8                	mov    %edi,%eax
    6ac7:	b9 00 00 00 00       	mov    $0x0,%ecx
    6acc:	89 de                	mov    %ebx,%esi
    6ace:	83 e6 02             	and    $0x2,%esi
    6ad1:	85 f6                	test   %esi,%esi
    6ad3:	74 0b                	je     6ae0 <read_decoder_table+0x54c>
    6ad5:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    6ad9:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    6add:	83 c1 02             	add    $0x2,%ecx
    6ae0:	83 e3 01             	and    $0x1,%ebx
    6ae3:	85 db                	test   %ebx,%ebx
    6ae5:	74 07                	je     6aee <read_decoder_table+0x55a>
    6ae7:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    6aeb:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    6aee:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    6af4:	b8 a0 c5 00 00       	mov    $0xc5a0,%eax
    6af9:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    6afe:	89 d7                	mov    %edx,%edi
    6b00:	89 c6                	mov    %eax,%esi
    6b02:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6b04:	89 f0                	mov    %esi,%eax
    6b06:	89 fa                	mov    %edi,%edx
    6b08:	0f b7 08             	movzwl (%eax),%ecx
    6b0b:	66 89 0a             	mov    %cx,(%edx)
    6b0e:	83 c2 02             	add    $0x2,%edx
    6b11:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    6b14:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    6b1a:	ba a0 c6 00 00       	mov    $0xc6a0,%edx
    6b1f:	bb fe 00 00 00       	mov    $0xfe,%ebx
    6b24:	89 c1                	mov    %eax,%ecx
    6b26:	83 e1 02             	and    $0x2,%ecx
    6b29:	85 c9                	test   %ecx,%ecx
    6b2b:	74 0f                	je     6b3c <read_decoder_table+0x5a8>
    6b2d:	0f b7 0a             	movzwl (%edx),%ecx
    6b30:	66 89 08             	mov    %cx,(%eax)
    6b33:	83 c0 02             	add    $0x2,%eax
    6b36:	83 c2 02             	add    $0x2,%edx
    6b39:	83 eb 02             	sub    $0x2,%ebx
    6b3c:	89 d9                	mov    %ebx,%ecx
    6b3e:	c1 e9 02             	shr    $0x2,%ecx
    6b41:	89 c7                	mov    %eax,%edi
    6b43:	89 d6                	mov    %edx,%esi
    6b45:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6b47:	89 f2                	mov    %esi,%edx
    6b49:	89 f8                	mov    %edi,%eax
    6b4b:	b9 00 00 00 00       	mov    $0x0,%ecx
    6b50:	89 de                	mov    %ebx,%esi
    6b52:	83 e6 02             	and    $0x2,%esi
    6b55:	85 f6                	test   %esi,%esi
    6b57:	74 0b                	je     6b64 <read_decoder_table+0x5d0>
    6b59:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    6b5d:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    6b61:	83 c1 02             	add    $0x2,%ecx
    6b64:	83 e3 01             	and    $0x1,%ebx
    6b67:	85 db                	test   %ebx,%ebx
    6b69:	74 07                	je     6b72 <read_decoder_table+0x5de>
    6b6b:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    6b6f:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    6b72:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    6b78:	b8 a0 c7 00 00       	mov    $0xc7a0,%eax
    6b7d:	b9 ff 00 00 00       	mov    $0xff,%ecx
    6b82:	89 d7                	mov    %edx,%edi
    6b84:	89 c6                	mov    %eax,%esi
    6b86:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6b88:	89 f0                	mov    %esi,%eax
    6b8a:	89 fa                	mov    %edi,%edx
    6b8c:	0f b7 08             	movzwl (%eax),%ecx
    6b8f:	66 89 0a             	mov    %cx,(%edx)
    6b92:	83 c2 02             	add    $0x2,%edx
    6b95:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    6b98:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    6b9e:	ba a0 cb 00 00       	mov    $0xcba0,%edx
    6ba3:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    6ba8:	89 c1                	mov    %eax,%ecx
    6baa:	83 e1 02             	and    $0x2,%ecx
    6bad:	85 c9                	test   %ecx,%ecx
    6baf:	74 0f                	je     6bc0 <read_decoder_table+0x62c>
    6bb1:	0f b7 0a             	movzwl (%edx),%ecx
    6bb4:	66 89 08             	mov    %cx,(%eax)
    6bb7:	83 c0 02             	add    $0x2,%eax
    6bba:	83 c2 02             	add    $0x2,%edx
    6bbd:	83 eb 02             	sub    $0x2,%ebx
    6bc0:	89 d9                	mov    %ebx,%ecx
    6bc2:	c1 e9 02             	shr    $0x2,%ecx
    6bc5:	89 c7                	mov    %eax,%edi
    6bc7:	89 d6                	mov    %edx,%esi
    6bc9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6bcb:	89 f2                	mov    %esi,%edx
    6bcd:	89 f8                	mov    %edi,%eax
    6bcf:	b9 00 00 00 00       	mov    $0x0,%ecx
    6bd4:	89 de                	mov    %ebx,%esi
    6bd6:	83 e6 02             	and    $0x2,%esi
    6bd9:	85 f6                	test   %esi,%esi
    6bdb:	74 0b                	je     6be8 <read_decoder_table+0x654>
    6bdd:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    6be1:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    6be5:	83 c1 02             	add    $0x2,%ecx
    6be8:	83 e3 01             	and    $0x1,%ebx
    6beb:	85 db                	test   %ebx,%ebx
    6bed:	74 07                	je     6bf6 <read_decoder_table+0x662>
    6bef:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    6bf3:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    6bf6:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    6bfc:	b8 a0 cf 00 00       	mov    $0xcfa0,%eax
    6c01:	b9 ff 00 00 00       	mov    $0xff,%ecx
    6c06:	89 d7                	mov    %edx,%edi
    6c08:	89 c6                	mov    %eax,%esi
    6c0a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6c0c:	89 f0                	mov    %esi,%eax
    6c0e:	89 fa                	mov    %edi,%edx
    6c10:	0f b7 08             	movzwl (%eax),%ecx
    6c13:	66 89 0a             	mov    %cx,(%edx)
    6c16:	83 c2 02             	add    $0x2,%edx
    6c19:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    6c1c:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    6c22:	bb a0 d3 00 00       	mov    $0xd3a0,%ebx
    6c27:	b8 00 01 00 00       	mov    $0x100,%eax
    6c2c:	89 d7                	mov    %edx,%edi
    6c2e:	89 de                	mov    %ebx,%esi
    6c30:	89 c1                	mov    %eax,%ecx
    6c32:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    6c34:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    6c3b:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    6c42:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    6c49:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    6c50:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    6c57:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    6c5e:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    6c65:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    6c6c:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    6c73:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    6c7a:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    6c81:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    6c88:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    6c8f:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    6c96:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    6c9d:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    6ca4:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    6cab:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    6cb2:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    6cb9:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    6cc0:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    6cc7:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    6cce:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    6cd5:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    6cdc:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    6ce3:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    6cea:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    6cf1:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    6cf8:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    6cff:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    6d06:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    6d0d:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    6d14:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    6d1b:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    6d22:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    6d29:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    6d30:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    6d37:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    6d3e:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    6d45:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    6d4c:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    6d53:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    6d5a:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    6d61:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    6d68:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    6d6f:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    6d76:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    6d7d:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    6d84:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    6d8b:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    6d92:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    6d99:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    6da0:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    6da7:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    6dae:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    6db5:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    6dbc:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    6dc3:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    6dca:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    6dd1:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    6dd8:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    6ddf:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    6de6:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    6ded:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    6df4:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    6dfb:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    6e02:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    6e09:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    6e10:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    6e17:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    6e1e:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    6e25:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    6e2c:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    6e33:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    6e3a:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    6e41:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    6e48:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    6e4f:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    6e56:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    6e5d:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    6e64:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    6e6b:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    6e72:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    6e79:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    6e80:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    6e87:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    6e8e:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    6e95:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    6e9c:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    6ea3:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    6eaa:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    6eb1:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    6eb8:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    6ebf:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    6ec6:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    6ecd:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    6ed4:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    6edb:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    6ee2:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    6ee9:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    6ef0:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    6ef7:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    6efe:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    6f05:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    6f0c:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    6f13:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    6f1a:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    6f21:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    6f28:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    6f2f:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    6f36:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    6f3d:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    6f44:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    6f4b:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    6f52:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    6f59:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    6f60:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    6f67:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    6f6e:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    6f75:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    6f7c:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    6f83:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    6f8a:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    6f91:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    6f98:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    6f9f:	30 00 
    6fa1:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    6fa8:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    6faf:	00 00 00 
    6fb2:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    6fb9:	00 00 00 
    6fbc:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    6fc3:	00 00 00 
    6fc6:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    6fcd:	00 00 00 
    6fd0:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    6fd7:	ff ff ff 
    6fda:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    6fe1:	00 00 00 
    6fe4:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    6feb:	00 00 00 
    6fee:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    6ff5:	00 00 00 
    6ff8:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    6fff:	00 00 00 
    7002:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    7009:	31 00 
    700b:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    7012:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    7019:	00 00 00 
    701c:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    7023:	00 00 00 
    7026:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    702d:	00 00 00 
    7030:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    7037:	00 00 00 
    703a:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    7041:	ff ff ff 
    7044:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    704b:	00 00 00 
    704e:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    7055:	00 00 00 
    7058:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    705b:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    7061:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    7068:	00 00 00 
    706b:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    7072:	32 00 
    7074:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    707b:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    7082:	00 00 00 
    7085:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    708c:	00 00 00 
    708f:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    7096:	00 00 00 
    7099:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    70a0:	00 00 00 
    70a3:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    70aa:	ff ff ff 
    70ad:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    70b4:	00 00 00 
    70b7:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    70be:	00 00 00 
    70c1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    70c4:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    70ca:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    70d1:	00 00 00 
    70d4:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    70db:	33 00 
    70dd:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    70e4:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    70eb:	00 00 00 
    70ee:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    70f5:	00 00 00 
    70f8:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    70ff:	00 00 00 
    7102:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    7109:	00 00 00 
    710c:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    7113:	ff ff ff 
    7116:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    711d:	00 00 00 
    7120:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    7127:	00 00 00 
    712a:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    712d:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    7133:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    713a:	00 00 00 
    713d:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    7144:	34 00 
    7146:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    714d:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    7154:	00 00 00 
    7157:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    715e:	00 00 00 
    7161:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    7168:	00 00 00 
    716b:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    7172:	00 00 00 
    7175:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    717c:	ff ff ff 
    717f:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    7186:	00 00 00 
    7189:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    7190:	00 00 00 
    7193:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    719a:	00 00 00 
    719d:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    71a4:	00 00 00 
    71a7:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    71ae:	35 00 
    71b0:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    71b7:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    71be:	00 00 00 
    71c1:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    71c8:	00 00 00 
    71cb:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    71d2:	00 00 00 
    71d5:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    71dc:	00 00 00 
    71df:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    71e6:	ff ff ff 
    71e9:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    71f0:	00 00 00 
    71f3:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    71fa:	00 00 00 
    71fd:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    7203:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    7209:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    7210:	00 00 00 
    7213:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    721a:	36 00 
    721c:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    7223:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    722a:	00 00 00 
    722d:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    7234:	00 00 00 
    7237:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    723e:	00 00 00 
    7241:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    7248:	00 00 00 
    724b:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    7252:	ff ff ff 
    7255:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    725c:	00 00 00 
    725f:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    7266:	00 00 00 
    7269:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    726f:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    7275:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    727c:	00 00 00 
    727f:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    7286:	37 00 
    7288:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    728f:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    7296:	00 00 00 
    7299:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    72a0:	00 00 00 
    72a3:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    72aa:	00 00 00 
    72ad:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    72b4:	00 00 00 
    72b7:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    72be:	ff ff ff 
    72c1:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    72c8:	00 00 00 
    72cb:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    72d2:	00 00 00 
    72d5:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    72db:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    72e1:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    72e8:	00 00 00 
    72eb:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    72f2:	38 00 
    72f4:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    72fb:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    7302:	00 00 00 
    7305:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    730c:	00 00 00 
    730f:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    7316:	00 00 00 
    7319:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    7320:	00 00 00 
    7323:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    732a:	ff ff ff 
    732d:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    7334:	00 00 00 
    7337:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    733e:	00 00 00 
    7341:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    7347:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    734d:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    7354:	00 00 00 
    7357:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    735e:	39 00 
    7360:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    7367:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    736e:	00 00 00 
    7371:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    7378:	00 00 00 
    737b:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    7382:	00 00 00 
    7385:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    738c:	00 00 00 
    738f:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    7396:	ff ff ff 
    7399:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    73a0:	00 00 00 
    73a3:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    73aa:	00 00 00 
    73ad:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    73b3:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    73b9:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    73c0:	00 00 00 
    73c3:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    73ca:	31 30 
    73cc:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    73d3:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    73da:	00 00 00 
    73dd:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    73e4:	00 00 00 
    73e7:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    73ee:	00 00 00 
    73f1:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    73f8:	00 00 00 
    73fb:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    7402:	ff ff ff 
    7405:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    740c:	00 00 00 
    740f:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    7416:	00 00 00 
    7419:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    741f:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    7425:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    742c:	00 00 00 
    742f:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    7436:	31 31 
    7438:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    743f:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    7446:	00 00 00 
    7449:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    7450:	00 00 00 
    7453:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    745a:	00 00 00 
    745d:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    7464:	00 00 00 
    7467:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    746e:	ff ff ff 
    7471:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    7478:	00 00 00 
    747b:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    7482:	00 00 00 
    7485:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    748b:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    7491:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    7498:	00 00 00 
    749b:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    74a2:	31 32 
    74a4:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    74ab:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    74b2:	00 00 00 
    74b5:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    74bc:	00 00 00 
    74bf:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    74c6:	00 00 00 
    74c9:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    74d0:	00 00 00 
    74d3:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    74da:	ff ff ff 
    74dd:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    74e4:	00 00 00 
    74e7:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    74ee:	00 00 00 
    74f1:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    74f7:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    74fd:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    7504:	00 00 00 
    7507:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    750e:	31 33 
    7510:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    7517:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    751e:	00 00 00 
    7521:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    7528:	00 00 00 
    752b:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    7532:	00 00 00 
    7535:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    753c:	00 00 00 
    753f:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    7546:	ff ff ff 
    7549:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    7550:	00 00 00 
    7553:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    755a:	00 00 00 
    755d:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    7563:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    7569:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    7570:	01 00 00 
    7573:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    757a:	31 34 
    757c:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    7583:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    758a:	00 00 00 
    758d:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    7594:	00 00 00 
    7597:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    759e:	00 00 00 
    75a1:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    75a8:	00 00 00 
    75ab:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    75b2:	ff ff ff 
    75b5:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    75bc:	00 00 00 
    75bf:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    75c6:	00 00 00 
    75c9:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    75d0:	00 00 00 
    75d3:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    75da:	00 00 00 
    75dd:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    75e4:	31 35 
    75e6:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    75ed:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    75f4:	00 00 00 
    75f7:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    75fe:	00 00 00 
    7601:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    7608:	00 00 00 
    760b:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    7612:	00 00 00 
    7615:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    761c:	ff ff ff 
    761f:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    7626:	00 00 00 
    7629:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    7630:	00 00 00 
    7633:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    7639:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    763f:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    7646:	01 00 00 
    7649:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    7650:	31 36 
    7652:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    7659:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    7660:	00 00 00 
    7663:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    766a:	00 00 00 
    766d:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    7674:	00 00 00 
    7677:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    767e:	00 00 00 
    7681:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    7688:	ff ff ff 
    768b:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    7692:	00 00 00 
    7695:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    769c:	00 00 00 
    769f:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    76a5:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    76ab:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    76b2:	01 00 00 
    76b5:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    76bc:	31 37 
    76be:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    76c5:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    76cc:	00 00 00 
    76cf:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    76d6:	00 00 00 
    76d9:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    76e0:	00 00 00 
    76e3:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    76ea:	00 00 00 
    76ed:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    76f4:	00 00 00 
    76f7:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    76fe:	00 00 00 
    7701:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    7708:	00 00 00 
    770b:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7711:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    7717:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    771e:	01 00 00 
    7721:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    7728:	31 38 
    772a:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    7731:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    7738:	00 00 00 
    773b:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    7742:	00 00 00 
    7745:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    774c:	00 00 00 
    774f:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    7756:	00 00 00 
    7759:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    7760:	00 00 00 
    7763:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    776a:	00 00 00 
    776d:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    7774:	00 00 00 
    7777:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    777d:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    7783:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    778a:	01 00 00 
    778d:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    7794:	31 39 
    7796:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    779d:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    77a4:	00 00 00 
    77a7:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    77ae:	00 00 00 
    77b1:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    77b8:	00 00 00 
    77bb:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    77c2:	00 00 00 
    77c5:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    77cc:	00 00 00 
    77cf:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    77d6:	00 00 00 
    77d9:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    77e0:	00 00 00 
    77e3:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    77e9:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    77ef:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    77f6:	01 00 00 
    77f9:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    7800:	32 30 
    7802:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    7809:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    7810:	00 00 00 
    7813:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    781a:	00 00 00 
    781d:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    7824:	00 00 00 
    7827:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    782e:	00 00 00 
    7831:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    7838:	00 00 00 
    783b:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    7842:	00 00 00 
    7845:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    784c:	00 00 00 
    784f:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7855:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    785b:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    7862:	01 00 00 
    7865:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    786c:	32 31 
    786e:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    7875:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    787c:	00 00 00 
    787f:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    7886:	00 00 00 
    7889:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    7890:	00 00 00 
    7893:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    789a:	00 00 00 
    789d:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    78a4:	00 00 00 
    78a7:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    78ae:	00 00 00 
    78b1:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    78b8:	00 00 00 
    78bb:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    78c1:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    78c7:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    78ce:	01 00 00 
    78d1:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    78d8:	32 32 
    78da:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    78e1:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    78e8:	00 00 00 
    78eb:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    78f2:	00 00 00 
    78f5:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    78fc:	00 00 00 
    78ff:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    7906:	03 00 00 
    7909:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    7910:	00 00 00 
    7913:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    791a:	00 00 00 
    791d:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    7924:	00 00 00 
    7927:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    792d:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    7933:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    793a:	01 00 00 
    793d:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    7944:	32 33 
    7946:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    794d:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    7954:	00 00 00 
    7957:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    795e:	00 00 00 
    7961:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    7968:	00 00 00 
    796b:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    7972:	1f 00 00 
    7975:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    797c:	00 00 00 
    797f:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    7986:	00 00 00 
    7989:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    7990:	00 00 00 
    7993:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7999:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    799f:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    79a6:	01 00 00 
    79a9:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    79b0:	32 34 
    79b2:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    79b9:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    79c0:	00 00 00 
    79c3:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    79ca:	00 00 00 
    79cd:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    79d4:	00 00 00 
    79d7:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    79de:	00 00 00 
    79e1:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    79e8:	ff ff ff 
    79eb:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    79f2:	00 00 00 
    79f5:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    79fc:	00 00 00 
    79ff:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7a05:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    7a0b:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    7a12:	02 00 00 
    7a15:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    7a1c:	32 35 
    7a1e:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    7a25:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    7a2c:	00 00 00 
    7a2f:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    7a36:	00 00 00 
    7a39:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    7a40:	00 00 00 
    7a43:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    7a4a:	00 00 00 
    7a4d:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    7a54:	00 00 00 
    7a57:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    7a5e:	00 00 00 
    7a61:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    7a68:	00 00 00 
    7a6b:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7a71:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    7a77:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    7a7e:	02 00 00 
    7a81:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    7a88:	32 36 
    7a8a:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    7a91:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    7a98:	00 00 00 
    7a9b:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    7aa2:	00 00 00 
    7aa5:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    7aac:	00 00 00 
    7aaf:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    7ab6:	00 00 00 
    7ab9:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    7ac0:	00 00 00 
    7ac3:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    7aca:	00 00 00 
    7acd:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    7ad4:	00 00 00 
    7ad7:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7add:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    7ae3:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    7aea:	02 00 00 
    7aed:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    7af4:	32 37 
    7af6:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    7afd:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    7b04:	00 00 00 
    7b07:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    7b0e:	00 00 00 
    7b11:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    7b18:	00 00 00 
    7b1b:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    7b22:	00 00 00 
    7b25:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    7b2c:	00 00 00 
    7b2f:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    7b36:	00 00 00 
    7b39:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    7b40:	00 00 00 
    7b43:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7b49:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    7b4f:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    7b56:	02 00 00 
    7b59:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    7b60:	32 38 
    7b62:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    7b69:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    7b70:	00 00 00 
    7b73:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    7b7a:	00 00 00 
    7b7d:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    7b84:	00 00 00 
    7b87:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    7b8e:	00 00 00 
    7b91:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    7b98:	00 00 00 
    7b9b:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    7ba2:	00 00 00 
    7ba5:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    7bac:	00 00 00 
    7baf:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7bb5:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    7bbb:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    7bc2:	02 00 00 
    7bc5:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    7bcc:	32 39 
    7bce:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    7bd5:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    7bdc:	00 00 00 
    7bdf:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    7be6:	00 00 00 
    7be9:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    7bf0:	00 00 00 
    7bf3:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    7bfa:	01 00 00 
    7bfd:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    7c04:	00 00 00 
    7c07:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    7c0e:	00 00 00 
    7c11:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    7c18:	00 00 00 
    7c1b:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7c21:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    7c27:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    7c2e:	02 00 00 
    7c31:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    7c38:	33 30 
    7c3a:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    7c41:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    7c48:	00 00 00 
    7c4b:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    7c52:	00 00 00 
    7c55:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    7c5c:	00 00 00 
    7c5f:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    7c66:	07 00 00 
    7c69:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    7c70:	00 00 00 
    7c73:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    7c7a:	00 00 00 
    7c7d:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    7c84:	00 00 00 
    7c87:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7c8d:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    7c93:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    7c9a:	02 00 00 
    7c9d:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    7ca4:	33 31 
    7ca6:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    7cad:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    7cb4:	00 00 00 
    7cb7:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    7cbe:	00 00 00 
    7cc1:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    7cc8:	00 00 00 
    7ccb:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    7cd2:	1f 00 00 
    7cd5:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    7cdc:	00 00 00 
    7cdf:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    7ce6:	00 00 00 
    7ce9:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    7cf0:	00 00 00 
    7cf3:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7cf9:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    7cff:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    7d06:	02 00 00 
    7d09:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    7d10:	33 32 
    7d12:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    7d19:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    7d20:	00 00 00 
    7d23:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    7d2a:	00 00 00 
    7d2d:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    7d34:	00 00 00 
    7d37:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    7d3e:	00 00 00 
    7d41:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    7d48:	ff ff ff 
    7d4b:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    7d52:	00 00 00 
    7d55:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    7d5c:	00 00 00 
    7d5f:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    7d65:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    7d6b:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    7d72:	00 00 00 
    7d75:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    7d7c:	33 33 
    7d7e:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    7d85:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    7d8c:	00 00 00 
    7d8f:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    7d96:	00 00 00 
    7d99:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    7da0:	00 00 00 
    7da3:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    7daa:	00 00 00 
    7dad:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    7db4:	ff ff ff 
    7db7:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    7dbe:	00 00 00 
    7dc1:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    7dc8:	00 00 00 
    7dcb:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    7dd1:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    7dd7:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    7dde:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    7de1:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    7de7:	5b                   	pop    %ebx
    7de8:	5e                   	pop    %esi
    7de9:	5f                   	pop    %edi
    7dea:	5d                   	pop    %ebp
    7deb:	c3                   	ret    

00007dec <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    7dec:	55                   	push   %ebp
    7ded:	89 e5                	mov    %esp,%ebp
    7def:	53                   	push   %ebx
    7df0:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    7df3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    7dfa:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    7e01:	a1 90 02 01 00       	mov    0x10290,%eax
    7e06:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    7e09:	8b 45 08             	mov    0x8(%ebp),%eax
    7e0c:	8b 40 20             	mov    0x20(%eax),%eax
    7e0f:	85 c0                	test   %eax,%eax
    7e11:	75 0a                	jne    7e1d <huffman_decoder+0x31>
    7e13:	b8 02 00 00 00       	mov    $0x2,%eax
    7e18:	e9 0d 03 00 00       	jmp    812a <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    7e1d:	8b 45 08             	mov    0x8(%ebp),%eax
    7e20:	8b 40 24             	mov    0x24(%eax),%eax
    7e23:	85 c0                	test   %eax,%eax
    7e25:	75 1d                	jne    7e44 <huffman_decoder+0x58>
  {  *x = *y = 0;
    7e27:	8b 45 10             	mov    0x10(%ebp),%eax
    7e2a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    7e30:	8b 45 10             	mov    0x10(%ebp),%eax
    7e33:	8b 10                	mov    (%eax),%edx
    7e35:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e38:	89 10                	mov    %edx,(%eax)
     return 0;
    7e3a:	b8 00 00 00 00       	mov    $0x0,%eax
    7e3f:	e9 e6 02 00 00       	jmp    812a <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    7e44:	8b 45 08             	mov    0x8(%ebp),%eax
    7e47:	8b 40 20             	mov    0x20(%eax),%eax
    7e4a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7e4d:	01 d2                	add    %edx,%edx
    7e4f:	01 d0                	add    %edx,%eax
    7e51:	0f b6 00             	movzbl (%eax),%eax
    7e54:	84 c0                	test   %al,%al
    7e56:	75 46                	jne    7e9e <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    7e58:	8b 45 08             	mov    0x8(%ebp),%eax
    7e5b:	8b 40 20             	mov    0x20(%eax),%eax
    7e5e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7e61:	01 d2                	add    %edx,%edx
    7e63:	01 d0                	add    %edx,%eax
    7e65:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7e69:	c0 e8 04             	shr    $0x4,%al
    7e6c:	0f b6 d0             	movzbl %al,%edx
    7e6f:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e72:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    7e74:	8b 45 08             	mov    0x8(%ebp),%eax
    7e77:	8b 40 20             	mov    0x20(%eax),%eax
    7e7a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7e7d:	01 d2                	add    %edx,%edx
    7e7f:	01 d0                	add    %edx,%eax
    7e81:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7e85:	0f b6 c0             	movzbl %al,%eax
    7e88:	83 e0 0f             	and    $0xf,%eax
    7e8b:	89 c2                	mov    %eax,%edx
    7e8d:	8b 45 10             	mov    0x10(%ebp),%eax
    7e90:	89 10                	mov    %edx,(%eax)

      error = 0;
    7e92:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    7e99:	e9 af 00 00 00       	jmp    7f4d <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    7e9e:	e8 a7 e6 ff ff       	call   654a <hget1bit>
    7ea3:	85 c0                	test   %eax,%eax
    7ea5:	74 47                	je     7eee <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    7ea7:	eb 17                	jmp    7ec0 <huffman_decoder+0xd4>
    7ea9:	8b 45 08             	mov    0x8(%ebp),%eax
    7eac:	8b 40 20             	mov    0x20(%eax),%eax
    7eaf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7eb2:	01 d2                	add    %edx,%edx
    7eb4:	01 d0                	add    %edx,%eax
    7eb6:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7eba:	0f b6 c0             	movzbl %al,%eax
    7ebd:	01 45 f0             	add    %eax,-0x10(%ebp)
    7ec0:	8b 45 08             	mov    0x8(%ebp),%eax
    7ec3:	8b 40 20             	mov    0x20(%eax),%eax
    7ec6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7ec9:	01 d2                	add    %edx,%edx
    7ecb:	01 d0                	add    %edx,%eax
    7ecd:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7ed1:	3c f9                	cmp    $0xf9,%al
    7ed3:	77 d4                	ja     7ea9 <huffman_decoder+0xbd>
      point += h->val[point][1];
    7ed5:	8b 45 08             	mov    0x8(%ebp),%eax
    7ed8:	8b 40 20             	mov    0x20(%eax),%eax
    7edb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7ede:	01 d2                	add    %edx,%edx
    7ee0:	01 d0                	add    %edx,%eax
    7ee2:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7ee6:	0f b6 c0             	movzbl %al,%eax
    7ee9:	01 45 f0             	add    %eax,-0x10(%ebp)
    7eec:	eb 42                	jmp    7f30 <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    7eee:	eb 16                	jmp    7f06 <huffman_decoder+0x11a>
    7ef0:	8b 45 08             	mov    0x8(%ebp),%eax
    7ef3:	8b 40 20             	mov    0x20(%eax),%eax
    7ef6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7ef9:	01 d2                	add    %edx,%edx
    7efb:	01 d0                	add    %edx,%eax
    7efd:	0f b6 00             	movzbl (%eax),%eax
    7f00:	0f b6 c0             	movzbl %al,%eax
    7f03:	01 45 f0             	add    %eax,-0x10(%ebp)
    7f06:	8b 45 08             	mov    0x8(%ebp),%eax
    7f09:	8b 40 20             	mov    0x20(%eax),%eax
    7f0c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7f0f:	01 d2                	add    %edx,%edx
    7f11:	01 d0                	add    %edx,%eax
    7f13:	0f b6 00             	movzbl (%eax),%eax
    7f16:	3c f9                	cmp    $0xf9,%al
    7f18:	77 d6                	ja     7ef0 <huffman_decoder+0x104>
      point += h->val[point][0];
    7f1a:	8b 45 08             	mov    0x8(%ebp),%eax
    7f1d:	8b 40 20             	mov    0x20(%eax),%eax
    7f20:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7f23:	01 d2                	add    %edx,%edx
    7f25:	01 d0                	add    %edx,%eax
    7f27:	0f b6 00             	movzbl (%eax),%eax
    7f2a:	0f b6 c0             	movzbl %al,%eax
    7f2d:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    7f30:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    7f33:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7f37:	0f 85 07 ff ff ff    	jne    7e44 <huffman_decoder+0x58>
    7f3d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7f40:	a1 84 3f 01 00       	mov    0x13f84,%eax
    7f45:	39 c2                	cmp    %eax,%edx
    7f47:	0f 82 f7 fe ff ff    	jb     7e44 <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    7f4d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    7f51:	74 24                	je     7f77 <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    7f53:	8b 45 08             	mov    0x8(%ebp),%eax
    7f56:	8b 40 04             	mov    0x4(%eax),%eax
    7f59:	83 e8 01             	sub    $0x1,%eax
    7f5c:	01 c0                	add    %eax,%eax
    7f5e:	89 c2                	mov    %eax,%edx
    7f60:	8b 45 0c             	mov    0xc(%ebp),%eax
    7f63:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    7f65:	8b 45 08             	mov    0x8(%ebp),%eax
    7f68:	8b 40 08             	mov    0x8(%eax),%eax
    7f6b:	83 e8 01             	sub    $0x1,%eax
    7f6e:	01 c0                	add    %eax,%eax
    7f70:	89 c2                	mov    %eax,%edx
    7f72:	8b 45 10             	mov    0x10(%ebp),%eax
    7f75:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    7f77:	8b 45 08             	mov    0x8(%ebp),%eax
    7f7a:	0f b6 00             	movzbl (%eax),%eax
    7f7d:	3c 33                	cmp    $0x33,%al
    7f7f:	0f 85 ec 00 00 00    	jne    8071 <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    7f85:	8b 45 08             	mov    0x8(%ebp),%eax
    7f88:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7f8c:	3c 32                	cmp    $0x32,%al
    7f8e:	74 0f                	je     7f9f <huffman_decoder+0x1b3>
    7f90:	8b 45 08             	mov    0x8(%ebp),%eax
    7f93:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7f97:	3c 33                	cmp    $0x33,%al
    7f99:	0f 85 d2 00 00 00    	jne    8071 <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    7f9f:	8b 45 10             	mov    0x10(%ebp),%eax
    7fa2:	8b 00                	mov    (%eax),%eax
    7fa4:	c1 f8 03             	sar    $0x3,%eax
    7fa7:	83 e0 01             	and    $0x1,%eax
    7faa:	89 c2                	mov    %eax,%edx
    7fac:	8b 45 14             	mov    0x14(%ebp),%eax
    7faf:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    7fb1:	8b 45 10             	mov    0x10(%ebp),%eax
    7fb4:	8b 00                	mov    (%eax),%eax
    7fb6:	c1 f8 02             	sar    $0x2,%eax
    7fb9:	83 e0 01             	and    $0x1,%eax
    7fbc:	89 c2                	mov    %eax,%edx
    7fbe:	8b 45 18             	mov    0x18(%ebp),%eax
    7fc1:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    7fc3:	8b 45 10             	mov    0x10(%ebp),%eax
    7fc6:	8b 00                	mov    (%eax),%eax
    7fc8:	d1 f8                	sar    %eax
    7fca:	83 e0 01             	and    $0x1,%eax
    7fcd:	89 c2                	mov    %eax,%edx
    7fcf:	8b 45 0c             	mov    0xc(%ebp),%eax
    7fd2:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    7fd4:	8b 45 10             	mov    0x10(%ebp),%eax
    7fd7:	8b 00                	mov    (%eax),%eax
    7fd9:	83 e0 01             	and    $0x1,%eax
    7fdc:	89 c2                	mov    %eax,%edx
    7fde:	8b 45 10             	mov    0x10(%ebp),%eax
    7fe1:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    7fe3:	8b 45 14             	mov    0x14(%ebp),%eax
    7fe6:	8b 00                	mov    (%eax),%eax
    7fe8:	85 c0                	test   %eax,%eax
    7fea:	74 18                	je     8004 <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    7fec:	e8 59 e5 ff ff       	call   654a <hget1bit>
    7ff1:	83 f8 01             	cmp    $0x1,%eax
    7ff4:	75 0e                	jne    8004 <huffman_decoder+0x218>
    7ff6:	8b 45 14             	mov    0x14(%ebp),%eax
    7ff9:	8b 00                	mov    (%eax),%eax
    7ffb:	f7 d8                	neg    %eax
    7ffd:	89 c2                	mov    %eax,%edx
    7fff:	8b 45 14             	mov    0x14(%ebp),%eax
    8002:	89 10                	mov    %edx,(%eax)
     if (*w)
    8004:	8b 45 18             	mov    0x18(%ebp),%eax
    8007:	8b 00                	mov    (%eax),%eax
    8009:	85 c0                	test   %eax,%eax
    800b:	74 18                	je     8025 <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    800d:	e8 38 e5 ff ff       	call   654a <hget1bit>
    8012:	83 f8 01             	cmp    $0x1,%eax
    8015:	75 0e                	jne    8025 <huffman_decoder+0x239>
    8017:	8b 45 18             	mov    0x18(%ebp),%eax
    801a:	8b 00                	mov    (%eax),%eax
    801c:	f7 d8                	neg    %eax
    801e:	89 c2                	mov    %eax,%edx
    8020:	8b 45 18             	mov    0x18(%ebp),%eax
    8023:	89 10                	mov    %edx,(%eax)
     if (*x)
    8025:	8b 45 0c             	mov    0xc(%ebp),%eax
    8028:	8b 00                	mov    (%eax),%eax
    802a:	85 c0                	test   %eax,%eax
    802c:	74 18                	je     8046 <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    802e:	e8 17 e5 ff ff       	call   654a <hget1bit>
    8033:	83 f8 01             	cmp    $0x1,%eax
    8036:	75 0e                	jne    8046 <huffman_decoder+0x25a>
    8038:	8b 45 0c             	mov    0xc(%ebp),%eax
    803b:	8b 00                	mov    (%eax),%eax
    803d:	f7 d8                	neg    %eax
    803f:	89 c2                	mov    %eax,%edx
    8041:	8b 45 0c             	mov    0xc(%ebp),%eax
    8044:	89 10                	mov    %edx,(%eax)
     if (*y)
    8046:	8b 45 10             	mov    0x10(%ebp),%eax
    8049:	8b 00                	mov    (%eax),%eax
    804b:	85 c0                	test   %eax,%eax
    804d:	74 1d                	je     806c <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    804f:	e8 f6 e4 ff ff       	call   654a <hget1bit>
    8054:	83 f8 01             	cmp    $0x1,%eax
    8057:	75 13                	jne    806c <huffman_decoder+0x280>
    8059:	8b 45 10             	mov    0x10(%ebp),%eax
    805c:	8b 00                	mov    (%eax),%eax
    805e:	f7 d8                	neg    %eax
    8060:	89 c2                	mov    %eax,%edx
    8062:	8b 45 10             	mov    0x10(%ebp),%eax
    8065:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    8067:	e9 bb 00 00 00       	jmp    8127 <huffman_decoder+0x33b>
    806c:	e9 b6 00 00 00       	jmp    8127 <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    8071:	8b 45 08             	mov    0x8(%ebp),%eax
    8074:	8b 40 0c             	mov    0xc(%eax),%eax
    8077:	85 c0                	test   %eax,%eax
    8079:	74 30                	je     80ab <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    807b:	8b 45 08             	mov    0x8(%ebp),%eax
    807e:	8b 40 04             	mov    0x4(%eax),%eax
    8081:	8d 50 ff             	lea    -0x1(%eax),%edx
    8084:	8b 45 0c             	mov    0xc(%ebp),%eax
    8087:	8b 00                	mov    (%eax),%eax
    8089:	39 c2                	cmp    %eax,%edx
    808b:	75 1e                	jne    80ab <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    808d:	8b 45 0c             	mov    0xc(%ebp),%eax
    8090:	8b 00                	mov    (%eax),%eax
    8092:	89 c3                	mov    %eax,%ebx
    8094:	8b 45 08             	mov    0x8(%ebp),%eax
    8097:	8b 40 0c             	mov    0xc(%eax),%eax
    809a:	89 04 24             	mov    %eax,(%esp)
    809d:	e8 8d e4 ff ff       	call   652f <hgetbits>
    80a2:	01 d8                	add    %ebx,%eax
    80a4:	89 c2                	mov    %eax,%edx
    80a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    80a9:	89 10                	mov    %edx,(%eax)
     if (*x)
    80ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    80ae:	8b 00                	mov    (%eax),%eax
    80b0:	85 c0                	test   %eax,%eax
    80b2:	74 18                	je     80cc <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    80b4:	e8 91 e4 ff ff       	call   654a <hget1bit>
    80b9:	83 f8 01             	cmp    $0x1,%eax
    80bc:	75 0e                	jne    80cc <huffman_decoder+0x2e0>
    80be:	8b 45 0c             	mov    0xc(%ebp),%eax
    80c1:	8b 00                	mov    (%eax),%eax
    80c3:	f7 d8                	neg    %eax
    80c5:	89 c2                	mov    %eax,%edx
    80c7:	8b 45 0c             	mov    0xc(%ebp),%eax
    80ca:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    80cc:	8b 45 08             	mov    0x8(%ebp),%eax
    80cf:	8b 40 0c             	mov    0xc(%eax),%eax
    80d2:	85 c0                	test   %eax,%eax
    80d4:	74 30                	je     8106 <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    80d6:	8b 45 08             	mov    0x8(%ebp),%eax
    80d9:	8b 40 08             	mov    0x8(%eax),%eax
    80dc:	8d 50 ff             	lea    -0x1(%eax),%edx
    80df:	8b 45 10             	mov    0x10(%ebp),%eax
    80e2:	8b 00                	mov    (%eax),%eax
    80e4:	39 c2                	cmp    %eax,%edx
    80e6:	75 1e                	jne    8106 <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    80e8:	8b 45 10             	mov    0x10(%ebp),%eax
    80eb:	8b 00                	mov    (%eax),%eax
    80ed:	89 c3                	mov    %eax,%ebx
    80ef:	8b 45 08             	mov    0x8(%ebp),%eax
    80f2:	8b 40 0c             	mov    0xc(%eax),%eax
    80f5:	89 04 24             	mov    %eax,(%esp)
    80f8:	e8 32 e4 ff ff       	call   652f <hgetbits>
    80fd:	01 d8                	add    %ebx,%eax
    80ff:	89 c2                	mov    %eax,%edx
    8101:	8b 45 10             	mov    0x10(%ebp),%eax
    8104:	89 10                	mov    %edx,(%eax)
     if (*y)
    8106:	8b 45 10             	mov    0x10(%ebp),%eax
    8109:	8b 00                	mov    (%eax),%eax
    810b:	85 c0                	test   %eax,%eax
    810d:	74 18                	je     8127 <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    810f:	e8 36 e4 ff ff       	call   654a <hget1bit>
    8114:	83 f8 01             	cmp    $0x1,%eax
    8117:	75 0e                	jne    8127 <huffman_decoder+0x33b>
    8119:	8b 45 10             	mov    0x10(%ebp),%eax
    811c:	8b 00                	mov    (%eax),%eax
    811e:	f7 d8                	neg    %eax
    8120:	89 c2                	mov    %eax,%edx
    8122:	8b 45 10             	mov    0x10(%ebp),%eax
    8125:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    8127:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    812a:	83 c4 24             	add    $0x24,%esp
    812d:	5b                   	pop    %ebx
    812e:	5d                   	pop    %ebp
    812f:	c3                   	ret    

00008130 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    8130:	55                   	push   %ebp
    8131:	89 e5                	mov    %esp,%ebp
    8133:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    8136:	8b 45 0c             	mov    0xc(%ebp),%eax
    8139:	8b 00                	mov    (%eax),%eax
    813b:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    813e:	8b 45 08             	mov    0x8(%ebp),%eax
    8141:	89 04 24             	mov    %eax,(%esp)
    8144:	e8 6c df ff ff       	call   60b5 <get1bit>
    8149:	89 c2                	mov    %eax,%edx
    814b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    814e:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    8150:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8157:	00 
    8158:	8b 45 08             	mov    0x8(%ebp),%eax
    815b:	89 04 24             	mov    %eax,(%esp)
    815e:	e8 64 e0 ff ff       	call   61c7 <getbits>
    8163:	ba 04 00 00 00       	mov    $0x4,%edx
    8168:	29 c2                	sub    %eax,%edx
    816a:	89 d0                	mov    %edx,%eax
    816c:	89 c2                	mov    %eax,%edx
    816e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8171:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    8174:	8b 45 08             	mov    0x8(%ebp),%eax
    8177:	89 04 24             	mov    %eax,(%esp)
    817a:	e8 36 df ff ff       	call   60b5 <get1bit>
    817f:	85 c0                	test   %eax,%eax
    8181:	0f 94 c0             	sete   %al
    8184:	0f b6 d0             	movzbl %al,%edx
    8187:	8b 45 f4             	mov    -0xc(%ebp),%eax
    818a:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    818d:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    8194:	00 
    8195:	8b 45 08             	mov    0x8(%ebp),%eax
    8198:	89 04 24             	mov    %eax,(%esp)
    819b:	e8 27 e0 ff ff       	call   61c7 <getbits>
    81a0:	89 c2                	mov    %eax,%edx
    81a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81a5:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    81a8:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    81af:	00 
    81b0:	8b 45 08             	mov    0x8(%ebp),%eax
    81b3:	89 04 24             	mov    %eax,(%esp)
    81b6:	e8 0c e0 ff ff       	call   61c7 <getbits>
    81bb:	89 c2                	mov    %eax,%edx
    81bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81c0:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    81c3:	8b 45 08             	mov    0x8(%ebp),%eax
    81c6:	89 04 24             	mov    %eax,(%esp)
    81c9:	e8 e7 de ff ff       	call   60b5 <get1bit>
    81ce:	89 c2                	mov    %eax,%edx
    81d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81d3:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    81d6:	8b 45 08             	mov    0x8(%ebp),%eax
    81d9:	89 04 24             	mov    %eax,(%esp)
    81dc:	e8 d4 de ff ff       	call   60b5 <get1bit>
    81e1:	89 c2                	mov    %eax,%edx
    81e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81e6:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    81e9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    81f0:	00 
    81f1:	8b 45 08             	mov    0x8(%ebp),%eax
    81f4:	89 04 24             	mov    %eax,(%esp)
    81f7:	e8 cb df ff ff       	call   61c7 <getbits>
    81fc:	89 c2                	mov    %eax,%edx
    81fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8201:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    8204:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    820b:	00 
    820c:	8b 45 08             	mov    0x8(%ebp),%eax
    820f:	89 04 24             	mov    %eax,(%esp)
    8212:	e8 b0 df ff ff       	call   61c7 <getbits>
    8217:	89 c2                	mov    %eax,%edx
    8219:	8b 45 f4             	mov    -0xc(%ebp),%eax
    821c:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    821f:	8b 45 08             	mov    0x8(%ebp),%eax
    8222:	89 04 24             	mov    %eax,(%esp)
    8225:	e8 8b de ff ff       	call   60b5 <get1bit>
    822a:	89 c2                	mov    %eax,%edx
    822c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    822f:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    8232:	8b 45 08             	mov    0x8(%ebp),%eax
    8235:	89 04 24             	mov    %eax,(%esp)
    8238:	e8 78 de ff ff       	call   60b5 <get1bit>
    823d:	89 c2                	mov    %eax,%edx
    823f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8242:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    8245:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    824c:	00 
    824d:	8b 45 08             	mov    0x8(%ebp),%eax
    8250:	89 04 24             	mov    %eax,(%esp)
    8253:	e8 6f df ff ff       	call   61c7 <getbits>
    8258:	89 c2                	mov    %eax,%edx
    825a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    825d:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    8260:	c9                   	leave  
    8261:	c3                   	ret    

00008262 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    8262:	55                   	push   %ebp
    8263:	89 e5                	mov    %esp,%ebp
    8265:	56                   	push   %esi
    8266:	53                   	push   %ebx
    8267:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    826a:	8b 45 10             	mov    0x10(%ebp),%eax
    826d:	8b 40 08             	mov    0x8(%eax),%eax
    8270:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    8273:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    827a:	00 
    827b:	8b 45 08             	mov    0x8(%ebp),%eax
    827e:	89 04 24             	mov    %eax,(%esp)
    8281:	e8 41 df ff ff       	call   61c7 <getbits>
    8286:	8b 55 0c             	mov    0xc(%ebp),%edx
    8289:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    828b:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    828f:	75 1b                	jne    82ac <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    8291:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    8298:	00 
    8299:	8b 45 08             	mov    0x8(%ebp),%eax
    829c:	89 04 24             	mov    %eax,(%esp)
    829f:	e8 23 df ff ff       	call   61c7 <getbits>
    82a4:	8b 55 0c             	mov    0xc(%ebp),%edx
    82a7:	89 42 04             	mov    %eax,0x4(%edx)
    82aa:	eb 19                	jmp    82c5 <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    82ac:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    82b3:	00 
    82b4:	8b 45 08             	mov    0x8(%ebp),%eax
    82b7:	89 04 24             	mov    %eax,(%esp)
    82ba:	e8 08 df ff ff       	call   61c7 <getbits>
    82bf:	8b 55 0c             	mov    0xc(%ebp),%edx
    82c2:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    82c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    82cc:	eb 3d                	jmp    830b <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    82ce:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    82d5:	eb 2a                	jmp    8301 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    82d7:	8b 45 08             	mov    0x8(%ebp),%eax
    82da:	89 04 24             	mov    %eax,(%esp)
    82dd:	e8 d3 dd ff ff       	call   60b5 <get1bit>
    82e2:	89 c1                	mov    %eax,%ecx
    82e4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    82e7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    82ea:	89 d0                	mov    %edx,%eax
    82ec:	c1 e0 02             	shl    $0x2,%eax
    82ef:	01 d0                	add    %edx,%eax
    82f1:	c1 e0 03             	shl    $0x3,%eax
    82f4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    82f7:	01 d0                	add    %edx,%eax
    82f9:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    82fd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8301:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    8305:	7e d0                	jle    82d7 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    8307:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    830b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    830e:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8311:	7c bb                	jl     82ce <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    8313:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    831a:	e9 c5 05 00 00       	jmp    88e4 <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    831f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8326:	e9 a9 05 00 00       	jmp    88d4 <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    832b:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    8332:	00 
    8333:	8b 45 08             	mov    0x8(%ebp),%eax
    8336:	89 04 24             	mov    %eax,(%esp)
    8339:	e8 89 de ff ff       	call   61c7 <getbits>
    833e:	89 c3                	mov    %eax,%ebx
    8340:	8b 75 0c             	mov    0xc(%ebp),%esi
    8343:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8346:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8349:	89 c2                	mov    %eax,%edx
    834b:	c1 e2 03             	shl    $0x3,%edx
    834e:	01 c2                	add    %eax,%edx
    8350:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8357:	89 c2                	mov    %eax,%edx
    8359:	89 c8                	mov    %ecx,%eax
    835b:	c1 e0 02             	shl    $0x2,%eax
    835e:	01 c8                	add    %ecx,%eax
    8360:	c1 e0 05             	shl    $0x5,%eax
    8363:	01 d0                	add    %edx,%eax
    8365:	01 f0                	add    %esi,%eax
    8367:	83 c0 18             	add    $0x18,%eax
    836a:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    836c:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    8373:	00 
    8374:	8b 45 08             	mov    0x8(%ebp),%eax
    8377:	89 04 24             	mov    %eax,(%esp)
    837a:	e8 48 de ff ff       	call   61c7 <getbits>
    837f:	89 c3                	mov    %eax,%ebx
    8381:	8b 75 0c             	mov    0xc(%ebp),%esi
    8384:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8387:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    838a:	89 c2                	mov    %eax,%edx
    838c:	c1 e2 03             	shl    $0x3,%edx
    838f:	01 c2                	add    %eax,%edx
    8391:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8398:	89 c2                	mov    %eax,%edx
    839a:	89 c8                	mov    %ecx,%eax
    839c:	c1 e0 02             	shl    $0x2,%eax
    839f:	01 c8                	add    %ecx,%eax
    83a1:	c1 e0 05             	shl    $0x5,%eax
    83a4:	01 d0                	add    %edx,%eax
    83a6:	01 f0                	add    %esi,%eax
    83a8:	83 c0 1c             	add    $0x1c,%eax
    83ab:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    83ad:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    83b4:	00 
    83b5:	8b 45 08             	mov    0x8(%ebp),%eax
    83b8:	89 04 24             	mov    %eax,(%esp)
    83bb:	e8 07 de ff ff       	call   61c7 <getbits>
    83c0:	89 c3                	mov    %eax,%ebx
    83c2:	8b 75 0c             	mov    0xc(%ebp),%esi
    83c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    83c8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    83cb:	89 c2                	mov    %eax,%edx
    83cd:	c1 e2 03             	shl    $0x3,%edx
    83d0:	01 c2                	add    %eax,%edx
    83d2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    83d9:	89 c2                	mov    %eax,%edx
    83db:	89 c8                	mov    %ecx,%eax
    83dd:	c1 e0 02             	shl    $0x2,%eax
    83e0:	01 c8                	add    %ecx,%eax
    83e2:	c1 e0 05             	shl    $0x5,%eax
    83e5:	01 d0                	add    %edx,%eax
    83e7:	01 f0                	add    %esi,%eax
    83e9:	83 c0 20             	add    $0x20,%eax
    83ec:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    83ee:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    83f5:	00 
    83f6:	8b 45 08             	mov    0x8(%ebp),%eax
    83f9:	89 04 24             	mov    %eax,(%esp)
    83fc:	e8 c6 dd ff ff       	call   61c7 <getbits>
    8401:	89 c3                	mov    %eax,%ebx
    8403:	8b 75 0c             	mov    0xc(%ebp),%esi
    8406:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8409:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    840c:	89 c2                	mov    %eax,%edx
    840e:	c1 e2 03             	shl    $0x3,%edx
    8411:	01 c2                	add    %eax,%edx
    8413:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    841a:	89 c2                	mov    %eax,%edx
    841c:	89 c8                	mov    %ecx,%eax
    841e:	c1 e0 02             	shl    $0x2,%eax
    8421:	01 c8                	add    %ecx,%eax
    8423:	c1 e0 05             	shl    $0x5,%eax
    8426:	01 d0                	add    %edx,%eax
    8428:	01 f0                	add    %esi,%eax
    842a:	83 c0 24             	add    $0x24,%eax
    842d:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    842f:	8b 45 08             	mov    0x8(%ebp),%eax
    8432:	89 04 24             	mov    %eax,(%esp)
    8435:	e8 7b dc ff ff       	call   60b5 <get1bit>
    843a:	89 c3                	mov    %eax,%ebx
    843c:	8b 75 0c             	mov    0xc(%ebp),%esi
    843f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8442:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8445:	89 c2                	mov    %eax,%edx
    8447:	c1 e2 03             	shl    $0x3,%edx
    844a:	01 c2                	add    %eax,%edx
    844c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8453:	89 c2                	mov    %eax,%edx
    8455:	89 c8                	mov    %ecx,%eax
    8457:	c1 e0 02             	shl    $0x2,%eax
    845a:	01 c8                	add    %ecx,%eax
    845c:	c1 e0 05             	shl    $0x5,%eax
    845f:	01 d0                	add    %edx,%eax
    8461:	01 f0                	add    %esi,%eax
    8463:	83 c0 28             	add    $0x28,%eax
    8466:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    8468:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    846b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    846e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8471:	89 c2                	mov    %eax,%edx
    8473:	c1 e2 03             	shl    $0x3,%edx
    8476:	01 c2                	add    %eax,%edx
    8478:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    847f:	89 c2                	mov    %eax,%edx
    8481:	89 c8                	mov    %ecx,%eax
    8483:	c1 e0 02             	shl    $0x2,%eax
    8486:	01 c8                	add    %ecx,%eax
    8488:	c1 e0 05             	shl    $0x5,%eax
    848b:	01 d0                	add    %edx,%eax
    848d:	01 d8                	add    %ebx,%eax
    848f:	83 c0 28             	add    $0x28,%eax
    8492:	8b 00                	mov    (%eax),%eax
    8494:	85 c0                	test   %eax,%eax
    8496:	0f 84 82 02 00 00    	je     871e <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    849c:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    84a3:	00 
    84a4:	8b 45 08             	mov    0x8(%ebp),%eax
    84a7:	89 04 24             	mov    %eax,(%esp)
    84aa:	e8 18 dd ff ff       	call   61c7 <getbits>
    84af:	89 c3                	mov    %eax,%ebx
    84b1:	8b 75 0c             	mov    0xc(%ebp),%esi
    84b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84b7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    84ba:	89 c2                	mov    %eax,%edx
    84bc:	c1 e2 03             	shl    $0x3,%edx
    84bf:	01 c2                	add    %eax,%edx
    84c1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    84c8:	89 c2                	mov    %eax,%edx
    84ca:	89 c8                	mov    %ecx,%eax
    84cc:	c1 e0 02             	shl    $0x2,%eax
    84cf:	01 c8                	add    %ecx,%eax
    84d1:	c1 e0 05             	shl    $0x5,%eax
    84d4:	01 d0                	add    %edx,%eax
    84d6:	01 f0                	add    %esi,%eax
    84d8:	83 c0 2c             	add    $0x2c,%eax
    84db:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    84dd:	8b 45 08             	mov    0x8(%ebp),%eax
    84e0:	89 04 24             	mov    %eax,(%esp)
    84e3:	e8 cd db ff ff       	call   60b5 <get1bit>
    84e8:	89 c3                	mov    %eax,%ebx
    84ea:	8b 75 0c             	mov    0xc(%ebp),%esi
    84ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84f0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    84f3:	89 c2                	mov    %eax,%edx
    84f5:	c1 e2 03             	shl    $0x3,%edx
    84f8:	01 c2                	add    %eax,%edx
    84fa:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8501:	89 c2                	mov    %eax,%edx
    8503:	89 c8                	mov    %ecx,%eax
    8505:	c1 e0 02             	shl    $0x2,%eax
    8508:	01 c8                	add    %ecx,%eax
    850a:	c1 e0 05             	shl    $0x5,%eax
    850d:	01 d0                	add    %edx,%eax
    850f:	01 f0                	add    %esi,%eax
    8511:	83 c0 30             	add    $0x30,%eax
    8514:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    8516:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    851d:	eb 46                	jmp    8565 <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    851f:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    8526:	00 
    8527:	8b 45 08             	mov    0x8(%ebp),%eax
    852a:	89 04 24             	mov    %eax,(%esp)
    852d:	e8 95 dc ff ff       	call   61c7 <getbits>
    8532:	89 c3                	mov    %eax,%ebx
    8534:	8b 75 0c             	mov    0xc(%ebp),%esi
    8537:	8b 45 f0             	mov    -0x10(%ebp),%eax
    853a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    853d:	89 c2                	mov    %eax,%edx
    853f:	c1 e2 03             	shl    $0x3,%edx
    8542:	01 c2                	add    %eax,%edx
    8544:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8547:	89 c2                	mov    %eax,%edx
    8549:	89 c8                	mov    %ecx,%eax
    854b:	c1 e0 02             	shl    $0x2,%eax
    854e:	01 c8                	add    %ecx,%eax
    8550:	c1 e0 03             	shl    $0x3,%eax
    8553:	01 c2                	add    %eax,%edx
    8555:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8558:	01 d0                	add    %edx,%eax
    855a:	83 c0 08             	add    $0x8,%eax
    855d:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    8561:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8565:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    8569:	7e b4                	jle    851f <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    856b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8572:	eb 46                	jmp    85ba <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    8574:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    857b:	00 
    857c:	8b 45 08             	mov    0x8(%ebp),%eax
    857f:	89 04 24             	mov    %eax,(%esp)
    8582:	e8 40 dc ff ff       	call   61c7 <getbits>
    8587:	89 c3                	mov    %eax,%ebx
    8589:	8b 75 0c             	mov    0xc(%ebp),%esi
    858c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    858f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8592:	89 c2                	mov    %eax,%edx
    8594:	c1 e2 03             	shl    $0x3,%edx
    8597:	01 c2                	add    %eax,%edx
    8599:	8d 04 12             	lea    (%edx,%edx,1),%eax
    859c:	89 c2                	mov    %eax,%edx
    859e:	89 c8                	mov    %ecx,%eax
    85a0:	c1 e0 02             	shl    $0x2,%eax
    85a3:	01 c8                	add    %ecx,%eax
    85a5:	c1 e0 03             	shl    $0x3,%eax
    85a8:	01 c2                	add    %eax,%edx
    85aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    85ad:	01 d0                	add    %edx,%eax
    85af:	83 c0 0c             	add    $0xc,%eax
    85b2:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    85b6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    85ba:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    85be:	7e b4                	jle    8574 <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    85c0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    85c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    85c6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    85c9:	89 c2                	mov    %eax,%edx
    85cb:	c1 e2 03             	shl    $0x3,%edx
    85ce:	01 c2                	add    %eax,%edx
    85d0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    85d7:	89 c2                	mov    %eax,%edx
    85d9:	89 c8                	mov    %ecx,%eax
    85db:	c1 e0 02             	shl    $0x2,%eax
    85de:	01 c8                	add    %ecx,%eax
    85e0:	c1 e0 05             	shl    $0x5,%eax
    85e3:	01 d0                	add    %edx,%eax
    85e5:	01 d8                	add    %ebx,%eax
    85e7:	83 c0 2c             	add    $0x2c,%eax
    85ea:	8b 00                	mov    (%eax),%eax
    85ec:	85 c0                	test   %eax,%eax
    85ee:	75 05                	jne    85f5 <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    85f0:	e8 84 cb ff ff       	call   5179 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    85f5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    85f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    85fb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    85fe:	89 c2                	mov    %eax,%edx
    8600:	c1 e2 03             	shl    $0x3,%edx
    8603:	01 c2                	add    %eax,%edx
    8605:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    860c:	89 c2                	mov    %eax,%edx
    860e:	89 c8                	mov    %ecx,%eax
    8610:	c1 e0 02             	shl    $0x2,%eax
    8613:	01 c8                	add    %ecx,%eax
    8615:	c1 e0 05             	shl    $0x5,%eax
    8618:	01 d0                	add    %edx,%eax
    861a:	01 d8                	add    %ebx,%eax
    861c:	83 c0 2c             	add    $0x2c,%eax
    861f:	8b 00                	mov    (%eax),%eax
    8621:	83 f8 02             	cmp    $0x2,%eax
    8624:	75 62                	jne    8688 <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    8626:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8629:	8b 45 f0             	mov    -0x10(%ebp),%eax
    862c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    862f:	89 c2                	mov    %eax,%edx
    8631:	c1 e2 03             	shl    $0x3,%edx
    8634:	01 c2                	add    %eax,%edx
    8636:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    863d:	89 c2                	mov    %eax,%edx
    863f:	89 c8                	mov    %ecx,%eax
    8641:	c1 e0 02             	shl    $0x2,%eax
    8644:	01 c8                	add    %ecx,%eax
    8646:	c1 e0 05             	shl    $0x5,%eax
    8649:	01 d0                	add    %edx,%eax
    864b:	01 d8                	add    %ebx,%eax
    864d:	83 c0 30             	add    $0x30,%eax
    8650:	8b 00                	mov    (%eax),%eax
    8652:	85 c0                	test   %eax,%eax
    8654:	75 32                	jne    8688 <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    8656:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8659:	8b 45 f0             	mov    -0x10(%ebp),%eax
    865c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    865f:	89 c2                	mov    %eax,%edx
    8661:	c1 e2 03             	shl    $0x3,%edx
    8664:	01 c2                	add    %eax,%edx
    8666:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    866d:	89 c2                	mov    %eax,%edx
    866f:	89 c8                	mov    %ecx,%eax
    8671:	c1 e0 02             	shl    $0x2,%eax
    8674:	01 c8                	add    %ecx,%eax
    8676:	c1 e0 05             	shl    $0x5,%eax
    8679:	01 d0                	add    %edx,%eax
    867b:	01 d8                	add    %ebx,%eax
    867d:	83 c0 4c             	add    $0x4c,%eax
    8680:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    8686:	eb 30                	jmp    86b8 <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    8688:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    868b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    868e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8691:	89 c2                	mov    %eax,%edx
    8693:	c1 e2 03             	shl    $0x3,%edx
    8696:	01 c2                	add    %eax,%edx
    8698:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    869f:	89 c2                	mov    %eax,%edx
    86a1:	89 c8                	mov    %ecx,%eax
    86a3:	c1 e0 02             	shl    $0x2,%eax
    86a6:	01 c8                	add    %ecx,%eax
    86a8:	c1 e0 05             	shl    $0x5,%eax
    86ab:	01 d0                	add    %edx,%eax
    86ad:	01 d8                	add    %ebx,%eax
    86af:	83 c0 4c             	add    $0x4c,%eax
    86b2:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    86b8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    86bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    86be:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    86c1:	89 c2                	mov    %eax,%edx
    86c3:	c1 e2 03             	shl    $0x3,%edx
    86c6:	01 c2                	add    %eax,%edx
    86c8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    86cf:	89 c2                	mov    %eax,%edx
    86d1:	89 c8                	mov    %ecx,%eax
    86d3:	c1 e0 02             	shl    $0x2,%eax
    86d6:	01 c8                	add    %ecx,%eax
    86d8:	c1 e0 05             	shl    $0x5,%eax
    86db:	01 d0                	add    %edx,%eax
    86dd:	01 d8                	add    %ebx,%eax
    86df:	83 c0 4c             	add    $0x4c,%eax
    86e2:	8b 00                	mov    (%eax),%eax
    86e4:	ba 14 00 00 00       	mov    $0x14,%edx
    86e9:	89 d3                	mov    %edx,%ebx
    86eb:	29 c3                	sub    %eax,%ebx
    86ed:	8b 75 0c             	mov    0xc(%ebp),%esi
    86f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    86f3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    86f6:	89 c2                	mov    %eax,%edx
    86f8:	c1 e2 03             	shl    $0x3,%edx
    86fb:	01 c2                	add    %eax,%edx
    86fd:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8704:	89 c2                	mov    %eax,%edx
    8706:	89 c8                	mov    %ecx,%eax
    8708:	c1 e0 02             	shl    $0x2,%eax
    870b:	01 c8                	add    %ecx,%eax
    870d:	c1 e0 05             	shl    $0x5,%eax
    8710:	01 d0                	add    %edx,%eax
    8712:	01 f0                	add    %esi,%eax
    8714:	83 c0 50             	add    $0x50,%eax
    8717:	89 18                	mov    %ebx,(%eax)
    8719:	e9 07 01 00 00       	jmp    8825 <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    871e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8725:	eb 46                	jmp    876d <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    8727:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    872e:	00 
    872f:	8b 45 08             	mov    0x8(%ebp),%eax
    8732:	89 04 24             	mov    %eax,(%esp)
    8735:	e8 8d da ff ff       	call   61c7 <getbits>
    873a:	89 c3                	mov    %eax,%ebx
    873c:	8b 75 0c             	mov    0xc(%ebp),%esi
    873f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8742:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8745:	89 c2                	mov    %eax,%edx
    8747:	c1 e2 03             	shl    $0x3,%edx
    874a:	01 c2                	add    %eax,%edx
    874c:	8d 04 12             	lea    (%edx,%edx,1),%eax
    874f:	89 c2                	mov    %eax,%edx
    8751:	89 c8                	mov    %ecx,%eax
    8753:	c1 e0 02             	shl    $0x2,%eax
    8756:	01 c8                	add    %ecx,%eax
    8758:	c1 e0 03             	shl    $0x3,%eax
    875b:	01 c2                	add    %eax,%edx
    875d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8760:	01 d0                	add    %edx,%eax
    8762:	83 c0 08             	add    $0x8,%eax
    8765:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    8769:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    876d:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8771:	7e b4                	jle    8727 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    8773:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    877a:	00 
    877b:	8b 45 08             	mov    0x8(%ebp),%eax
    877e:	89 04 24             	mov    %eax,(%esp)
    8781:	e8 41 da ff ff       	call   61c7 <getbits>
    8786:	89 c3                	mov    %eax,%ebx
    8788:	8b 75 0c             	mov    0xc(%ebp),%esi
    878b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    878e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8791:	89 c2                	mov    %eax,%edx
    8793:	c1 e2 03             	shl    $0x3,%edx
    8796:	01 c2                	add    %eax,%edx
    8798:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    879f:	89 c2                	mov    %eax,%edx
    87a1:	89 c8                	mov    %ecx,%eax
    87a3:	c1 e0 02             	shl    $0x2,%eax
    87a6:	01 c8                	add    %ecx,%eax
    87a8:	c1 e0 05             	shl    $0x5,%eax
    87ab:	01 d0                	add    %edx,%eax
    87ad:	01 f0                	add    %esi,%eax
    87af:	83 c0 4c             	add    $0x4c,%eax
    87b2:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    87b4:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    87bb:	00 
    87bc:	8b 45 08             	mov    0x8(%ebp),%eax
    87bf:	89 04 24             	mov    %eax,(%esp)
    87c2:	e8 00 da ff ff       	call   61c7 <getbits>
    87c7:	89 c3                	mov    %eax,%ebx
    87c9:	8b 75 0c             	mov    0xc(%ebp),%esi
    87cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    87cf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    87d2:	89 c2                	mov    %eax,%edx
    87d4:	c1 e2 03             	shl    $0x3,%edx
    87d7:	01 c2                	add    %eax,%edx
    87d9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    87e0:	89 c2                	mov    %eax,%edx
    87e2:	89 c8                	mov    %ecx,%eax
    87e4:	c1 e0 02             	shl    $0x2,%eax
    87e7:	01 c8                	add    %ecx,%eax
    87e9:	c1 e0 05             	shl    $0x5,%eax
    87ec:	01 d0                	add    %edx,%eax
    87ee:	01 f0                	add    %esi,%eax
    87f0:	83 c0 50             	add    $0x50,%eax
    87f3:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    87f5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    87f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    87fb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    87fe:	89 c2                	mov    %eax,%edx
    8800:	c1 e2 03             	shl    $0x3,%edx
    8803:	01 c2                	add    %eax,%edx
    8805:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    880c:	89 c2                	mov    %eax,%edx
    880e:	89 c8                	mov    %ecx,%eax
    8810:	c1 e0 02             	shl    $0x2,%eax
    8813:	01 c8                	add    %ecx,%eax
    8815:	c1 e0 05             	shl    $0x5,%eax
    8818:	01 d0                	add    %edx,%eax
    881a:	01 d8                	add    %ebx,%eax
    881c:	83 c0 2c             	add    $0x2c,%eax
    881f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    8825:	8b 45 08             	mov    0x8(%ebp),%eax
    8828:	89 04 24             	mov    %eax,(%esp)
    882b:	e8 85 d8 ff ff       	call   60b5 <get1bit>
    8830:	89 c3                	mov    %eax,%ebx
    8832:	8b 75 0c             	mov    0xc(%ebp),%esi
    8835:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8838:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    883b:	89 c2                	mov    %eax,%edx
    883d:	c1 e2 03             	shl    $0x3,%edx
    8840:	01 c2                	add    %eax,%edx
    8842:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8849:	89 c2                	mov    %eax,%edx
    884b:	89 c8                	mov    %ecx,%eax
    884d:	c1 e0 02             	shl    $0x2,%eax
    8850:	01 c8                	add    %ecx,%eax
    8852:	c1 e0 05             	shl    $0x5,%eax
    8855:	01 d0                	add    %edx,%eax
    8857:	01 f0                	add    %esi,%eax
    8859:	83 c0 54             	add    $0x54,%eax
    885c:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    885e:	8b 45 08             	mov    0x8(%ebp),%eax
    8861:	89 04 24             	mov    %eax,(%esp)
    8864:	e8 4c d8 ff ff       	call   60b5 <get1bit>
    8869:	89 c3                	mov    %eax,%ebx
    886b:	8b 75 0c             	mov    0xc(%ebp),%esi
    886e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8871:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8874:	89 c2                	mov    %eax,%edx
    8876:	c1 e2 03             	shl    $0x3,%edx
    8879:	01 c2                	add    %eax,%edx
    887b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8882:	89 c2                	mov    %eax,%edx
    8884:	89 c8                	mov    %ecx,%eax
    8886:	c1 e0 02             	shl    $0x2,%eax
    8889:	01 c8                	add    %ecx,%eax
    888b:	c1 e0 05             	shl    $0x5,%eax
    888e:	01 d0                	add    %edx,%eax
    8890:	01 f0                	add    %esi,%eax
    8892:	83 c0 58             	add    $0x58,%eax
    8895:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    8897:	8b 45 08             	mov    0x8(%ebp),%eax
    889a:	89 04 24             	mov    %eax,(%esp)
    889d:	e8 13 d8 ff ff       	call   60b5 <get1bit>
    88a2:	89 c3                	mov    %eax,%ebx
    88a4:	8b 75 0c             	mov    0xc(%ebp),%esi
    88a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    88aa:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    88ad:	89 c2                	mov    %eax,%edx
    88af:	c1 e2 03             	shl    $0x3,%edx
    88b2:	01 c2                	add    %eax,%edx
    88b4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    88bb:	89 c2                	mov    %eax,%edx
    88bd:	89 c8                	mov    %ecx,%eax
    88bf:	c1 e0 02             	shl    $0x2,%eax
    88c2:	01 c8                	add    %ecx,%eax
    88c4:	c1 e0 05             	shl    $0x5,%eax
    88c7:	01 d0                	add    %edx,%eax
    88c9:	01 f0                	add    %esi,%eax
    88cb:	83 c0 5c             	add    $0x5c,%eax
    88ce:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    88d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    88d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88d7:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    88da:	0f 8c 4b fa ff ff    	jl     832b <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    88e0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    88e4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    88e8:	0f 8e 31 fa ff ff    	jle    831f <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    88ee:	83 c4 20             	add    $0x20,%esp
    88f1:	5b                   	pop    %ebx
    88f2:	5e                   	pop    %esi
    88f3:	5d                   	pop    %ebp
    88f4:	c3                   	ret    

000088f5 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    88f5:	55                   	push   %ebp
    88f6:	89 e5                	mov    %esp,%ebp
    88f8:	56                   	push   %esi
    88f9:	53                   	push   %ebx
    88fa:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    88fd:	8b 45 10             	mov    0x10(%ebp),%eax
    8900:	89 c2                	mov    %eax,%edx
    8902:	c1 e2 03             	shl    $0x3,%edx
    8905:	01 c2                	add    %eax,%edx
    8907:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    890e:	89 c2                	mov    %eax,%edx
    8910:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8913:	89 c8                	mov    %ecx,%eax
    8915:	c1 e0 02             	shl    $0x2,%eax
    8918:	01 c8                	add    %ecx,%eax
    891a:	c1 e0 05             	shl    $0x5,%eax
    891d:	01 d0                	add    %edx,%eax
    891f:	8d 50 10             	lea    0x10(%eax),%edx
    8922:	8b 45 0c             	mov    0xc(%ebp),%eax
    8925:	01 d0                	add    %edx,%eax
    8927:	83 c0 08             	add    $0x8,%eax
    892a:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    892d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8930:	8b 40 10             	mov    0x10(%eax),%eax
    8933:	85 c0                	test   %eax,%eax
    8935:	0f 84 7e 02 00 00    	je     8bb9 <III_get_scale_factors+0x2c4>
    893b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    893e:	8b 40 14             	mov    0x14(%eax),%eax
    8941:	83 f8 02             	cmp    $0x2,%eax
    8944:	0f 85 6f 02 00 00    	jne    8bb9 <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    894a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    894d:	8b 40 18             	mov    0x18(%eax),%eax
    8950:	85 c0                	test   %eax,%eax
    8952:	0f 84 6b 01 00 00    	je     8ac3 <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    8958:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    895f:	eb 32                	jmp    8993 <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    8961:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8964:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    8967:	8b 04 85 c0 02 01 00 	mov    0x102c0(,%eax,4),%eax
    896e:	89 04 24             	mov    %eax,(%esp)
    8971:	e8 b9 db ff ff       	call   652f <hgetbits>
    8976:	89 c3                	mov    %eax,%ebx
    8978:	8b 4d 08             	mov    0x8(%ebp),%ecx
    897b:	8b 45 14             	mov    0x14(%ebp),%eax
    897e:	01 c0                	add    %eax,%eax
    8980:	89 c2                	mov    %eax,%edx
    8982:	c1 e2 05             	shl    $0x5,%edx
    8985:	29 c2                	sub    %eax,%edx
    8987:	8b 45 f4             	mov    -0xc(%ebp),%eax
    898a:	01 d0                	add    %edx,%eax
    898c:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    898f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8993:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    8997:	7e c8                	jle    8961 <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    8999:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    89a0:	eb 5c                	jmp    89fe <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    89a2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    89a9:	eb 49                	jmp    89f4 <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    89ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
    89ae:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    89b1:	8b 04 85 c0 02 01 00 	mov    0x102c0(,%eax,4),%eax
    89b8:	89 04 24             	mov    %eax,(%esp)
    89bb:	e8 6f db ff ff       	call   652f <hgetbits>
    89c0:	89 c6                	mov    %eax,%esi
    89c2:	8b 5d 08             	mov    0x8(%ebp),%ebx
    89c5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    89c8:	8b 4d 14             	mov    0x14(%ebp),%ecx
    89cb:	89 d0                	mov    %edx,%eax
    89cd:	01 c0                	add    %eax,%eax
    89cf:	01 d0                	add    %edx,%eax
    89d1:	c1 e0 02             	shl    $0x2,%eax
    89d4:	01 d0                	add    %edx,%eax
    89d6:	89 ca                	mov    %ecx,%edx
    89d8:	01 d2                	add    %edx,%edx
    89da:	89 d1                	mov    %edx,%ecx
    89dc:	c1 e1 05             	shl    $0x5,%ecx
    89df:	29 d1                	sub    %edx,%ecx
    89e1:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    89e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89e7:	01 d0                	add    %edx,%eax
    89e9:	83 c0 14             	add    $0x14,%eax
    89ec:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    89f0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    89f4:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    89f8:	7e b1                	jle    89ab <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    89fa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    89fe:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    8a02:	7e 9e                	jle    89a2 <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    8a04:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    8a0b:	eb 5f                	jmp    8a6c <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    8a0d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8a14:	eb 4c                	jmp    8a62 <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    8a16:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8a19:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    8a1c:	83 c0 10             	add    $0x10,%eax
    8a1f:	8b 04 85 c0 02 01 00 	mov    0x102c0(,%eax,4),%eax
    8a26:	89 04 24             	mov    %eax,(%esp)
    8a29:	e8 01 db ff ff       	call   652f <hgetbits>
    8a2e:	89 c6                	mov    %eax,%esi
    8a30:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8a33:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8a36:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8a39:	89 d0                	mov    %edx,%eax
    8a3b:	01 c0                	add    %eax,%eax
    8a3d:	01 d0                	add    %edx,%eax
    8a3f:	c1 e0 02             	shl    $0x2,%eax
    8a42:	01 d0                	add    %edx,%eax
    8a44:	89 ca                	mov    %ecx,%edx
    8a46:	01 d2                	add    %edx,%edx
    8a48:	89 d1                	mov    %edx,%ecx
    8a4a:	c1 e1 05             	shl    $0x5,%ecx
    8a4d:	29 d1                	sub    %edx,%ecx
    8a4f:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8a52:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a55:	01 d0                	add    %edx,%eax
    8a57:	83 c0 14             	add    $0x14,%eax
    8a5a:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    8a5e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8a62:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8a66:	7e ae                	jle    8a16 <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    8a68:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8a6c:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    8a70:	7e 9b                	jle    8a0d <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    8a72:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8a79:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8a80:	eb 36                	jmp    8ab8 <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    8a82:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8a85:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8a88:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8a8b:	89 d0                	mov    %edx,%eax
    8a8d:	01 c0                	add    %eax,%eax
    8a8f:	01 d0                	add    %edx,%eax
    8a91:	c1 e0 02             	shl    $0x2,%eax
    8a94:	01 d0                	add    %edx,%eax
    8a96:	89 ca                	mov    %ecx,%edx
    8a98:	01 d2                	add    %edx,%edx
    8a9a:	89 d1                	mov    %edx,%ecx
    8a9c:	c1 e1 05             	shl    $0x5,%ecx
    8a9f:	29 d1                	sub    %edx,%ecx
    8aa1:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8aa4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8aa7:	01 d0                	add    %edx,%eax
    8aa9:	83 c0 14             	add    $0x14,%eax
    8aac:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    8ab3:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    8ab4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8ab8:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8abc:	7e c4                	jle    8a82 <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    8abe:	e9 b1 01 00 00       	jmp    8c74 <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    8ac3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8aca:	e9 8f 00 00 00       	jmp    8b5e <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    8acf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8ad2:	83 c0 04             	add    $0x4,%eax
    8ad5:	8b 04 85 a4 02 01 00 	mov    0x102a4(,%eax,4),%eax
    8adc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8adf:	eb 64                	jmp    8b45 <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    8ae1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8ae8:	eb 51                	jmp    8b3b <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    8aea:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8aed:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    8af0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8af3:	c1 e2 04             	shl    $0x4,%edx
    8af6:	01 d0                	add    %edx,%eax
    8af8:	8b 04 85 c0 02 01 00 	mov    0x102c0(,%eax,4),%eax
    8aff:	89 04 24             	mov    %eax,(%esp)
    8b02:	e8 28 da ff ff       	call   652f <hgetbits>
    8b07:	89 c6                	mov    %eax,%esi
    8b09:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8b0c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8b0f:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8b12:	89 d0                	mov    %edx,%eax
    8b14:	01 c0                	add    %eax,%eax
    8b16:	01 d0                	add    %edx,%eax
    8b18:	c1 e0 02             	shl    $0x2,%eax
    8b1b:	01 d0                	add    %edx,%eax
    8b1d:	89 ca                	mov    %ecx,%edx
    8b1f:	01 d2                	add    %edx,%edx
    8b21:	89 d1                	mov    %edx,%ecx
    8b23:	c1 e1 05             	shl    $0x5,%ecx
    8b26:	29 d1                	sub    %edx,%ecx
    8b28:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8b2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8b2e:	01 d0                	add    %edx,%eax
    8b30:	83 c0 14             	add    $0x14,%eax
    8b33:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    8b37:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8b3b:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8b3f:	7e a9                	jle    8aea <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    8b41:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8b45:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8b48:	83 c0 01             	add    $0x1,%eax
    8b4b:	83 c0 04             	add    $0x4,%eax
    8b4e:	8b 04 85 a4 02 01 00 	mov    0x102a4(,%eax,4),%eax
    8b55:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    8b58:	7f 87                	jg     8ae1 <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    8b5a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8b5e:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8b62:	0f 8e 67 ff ff ff    	jle    8acf <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    8b68:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8b6f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8b76:	eb 36                	jmp    8bae <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    8b78:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8b7b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8b7e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8b81:	89 d0                	mov    %edx,%eax
    8b83:	01 c0                	add    %eax,%eax
    8b85:	01 d0                	add    %edx,%eax
    8b87:	c1 e0 02             	shl    $0x2,%eax
    8b8a:	01 d0                	add    %edx,%eax
    8b8c:	89 ca                	mov    %ecx,%edx
    8b8e:	01 d2                	add    %edx,%edx
    8b90:	89 d1                	mov    %edx,%ecx
    8b92:	c1 e1 05             	shl    $0x5,%ecx
    8b95:	29 d1                	sub    %edx,%ecx
    8b97:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8b9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8b9d:	01 d0                	add    %edx,%eax
    8b9f:	83 c0 14             	add    $0x14,%eax
    8ba2:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    8ba9:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    8baa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8bae:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8bb2:	7e c4                	jle    8b78 <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    8bb4:	e9 bb 00 00 00       	jmp    8c74 <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    8bb9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8bc0:	e9 89 00 00 00       	jmp    8c4e <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    8bc5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8bc8:	8b 55 14             	mov    0x14(%ebp),%edx
    8bcb:	89 d0                	mov    %edx,%eax
    8bcd:	c1 e0 02             	shl    $0x2,%eax
    8bd0:	01 d0                	add    %edx,%eax
    8bd2:	c1 e0 03             	shl    $0x3,%eax
    8bd5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8bd8:	01 d0                	add    %edx,%eax
    8bda:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    8bde:	85 c0                	test   %eax,%eax
    8be0:	74 06                	je     8be8 <III_get_scale_factors+0x2f3>
    8be2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    8be6:	75 62                	jne    8c4a <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    8be8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8beb:	8b 04 85 a0 02 01 00 	mov    0x102a0(,%eax,4),%eax
    8bf2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8bf5:	eb 41                	jmp    8c38 <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    8bf7:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8bfb:	0f 9f c0             	setg   %al
    8bfe:	0f b6 d0             	movzbl %al,%edx
    8c01:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8c04:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    8c07:	c1 e2 04             	shl    $0x4,%edx
    8c0a:	01 d0                	add    %edx,%eax
    8c0c:	8b 04 85 c0 02 01 00 	mov    0x102c0(,%eax,4),%eax
    8c13:	89 04 24             	mov    %eax,(%esp)
    8c16:	e8 14 d9 ff ff       	call   652f <hgetbits>
    8c1b:	89 c3                	mov    %eax,%ebx
    8c1d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8c20:	8b 45 14             	mov    0x14(%ebp),%eax
    8c23:	01 c0                	add    %eax,%eax
    8c25:	89 c2                	mov    %eax,%edx
    8c27:	c1 e2 05             	shl    $0x5,%edx
    8c2a:	29 c2                	sub    %eax,%edx
    8c2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8c2f:	01 d0                	add    %edx,%eax
    8c31:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    8c34:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8c38:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c3b:	83 c0 01             	add    $0x1,%eax
    8c3e:	8b 04 85 a0 02 01 00 	mov    0x102a0(,%eax,4),%eax
    8c45:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    8c48:	7f ad                	jg     8bf7 <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    8c4a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8c4e:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    8c52:	0f 8e 6d ff ff ff    	jle    8bc5 <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    8c58:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8c5b:	8b 45 14             	mov    0x14(%ebp),%eax
    8c5e:	c1 e0 03             	shl    $0x3,%eax
    8c61:	89 c2                	mov    %eax,%edx
    8c63:	c1 e2 05             	shl    $0x5,%edx
    8c66:	29 c2                	sub    %eax,%edx
    8c68:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    8c6b:	83 c0 58             	add    $0x58,%eax
    8c6e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    8c74:	83 c4 20             	add    $0x20,%esp
    8c77:	5b                   	pop    %ebx
    8c78:	5e                   	pop    %esi
    8c79:	5d                   	pop    %ebp
    8c7a:	c3                   	ret    

00008c7b <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    8c7b:	55                   	push   %ebp
    8c7c:	89 e5                	mov    %esp,%ebp
    8c7e:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    8c81:	a1 e0 05 01 00       	mov    0x105e0,%eax
    8c86:	85 c0                	test   %eax,%eax
    8c88:	74 02                	je     8c8c <initialize_huffman+0x11>
    8c8a:	eb 0f                	jmp    8c9b <initialize_huffman+0x20>
	read_decoder_table();
    8c8c:	e8 03 d9 ff ff       	call   6594 <read_decoder_table>
	huffman_initialized = TRUE;
    8c91:	c7 05 e0 05 01 00 01 	movl   $0x1,0x105e0
    8c98:	00 00 00 
}
    8c9b:	c9                   	leave  
    8c9c:	c3                   	ret    

00008c9d <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    8c9d:	55                   	push   %ebp
    8c9e:	89 e5                	mov    %esp,%ebp
    8ca0:	57                   	push   %edi
    8ca1:	56                   	push   %esi
    8ca2:	53                   	push   %ebx
    8ca3:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    8ca6:	e8 d0 ff ff ff       	call   8c7b <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    8cab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8cae:	8b 45 14             	mov    0x14(%ebp),%eax
    8cb1:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8cb4:	89 c2                	mov    %eax,%edx
    8cb6:	c1 e2 03             	shl    $0x3,%edx
    8cb9:	01 c2                	add    %eax,%edx
    8cbb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8cc2:	89 c2                	mov    %eax,%edx
    8cc4:	89 c8                	mov    %ecx,%eax
    8cc6:	c1 e0 02             	shl    $0x2,%eax
    8cc9:	01 c8                	add    %ecx,%eax
    8ccb:	c1 e0 05             	shl    $0x5,%eax
    8cce:	01 d0                	add    %edx,%eax
    8cd0:	01 d8                	add    %ebx,%eax
    8cd2:	83 c0 28             	add    $0x28,%eax
    8cd5:	8b 00                	mov    (%eax),%eax
    8cd7:	85 c0                	test   %eax,%eax
    8cd9:	74 44                	je     8d1f <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    8cdb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8cde:	8b 45 14             	mov    0x14(%ebp),%eax
    8ce1:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8ce4:	89 c2                	mov    %eax,%edx
    8ce6:	c1 e2 03             	shl    $0x3,%edx
    8ce9:	01 c2                	add    %eax,%edx
    8ceb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8cf2:	89 c2                	mov    %eax,%edx
    8cf4:	89 c8                	mov    %ecx,%eax
    8cf6:	c1 e0 02             	shl    $0x2,%eax
    8cf9:	01 c8                	add    %ecx,%eax
    8cfb:	c1 e0 05             	shl    $0x5,%eax
    8cfe:	01 d0                	add    %edx,%eax
    8d00:	01 d8                	add    %ebx,%eax
    8d02:	83 c0 2c             	add    $0x2c,%eax
    8d05:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    8d07:	83 f8 02             	cmp    $0x2,%eax
    8d0a:	75 13                	jne    8d1f <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    8d0c:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    8d13:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    8d1a:	e9 cc 00 00 00       	jmp    8deb <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8d1f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8d22:	8b 00                	mov    (%eax),%eax
    8d24:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    8d27:	8b 75 0c             	mov    0xc(%ebp),%esi
    8d2a:	8b 45 14             	mov    0x14(%ebp),%eax
    8d2d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8d30:	89 c2                	mov    %eax,%edx
    8d32:	c1 e2 03             	shl    $0x3,%edx
    8d35:	01 c2                	add    %eax,%edx
    8d37:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8d3e:	89 c2                	mov    %eax,%edx
    8d40:	89 d8                	mov    %ebx,%eax
    8d42:	c1 e0 02             	shl    $0x2,%eax
    8d45:	01 d8                	add    %ebx,%eax
    8d47:	c1 e0 05             	shl    $0x5,%eax
    8d4a:	01 d0                	add    %edx,%eax
    8d4c:	01 f0                	add    %esi,%eax
    8d4e:	83 c0 4c             	add    $0x4c,%eax
    8d51:	8b 00                	mov    (%eax),%eax
    8d53:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8d56:	89 c8                	mov    %ecx,%eax
    8d58:	c1 e0 03             	shl    $0x3,%eax
    8d5b:	01 c8                	add    %ecx,%eax
    8d5d:	c1 e0 02             	shl    $0x2,%eax
    8d60:	01 c8                	add    %ecx,%eax
    8d62:	01 d0                	add    %edx,%eax
    8d64:	8b 04 85 40 03 01 00 	mov    0x10340(,%eax,4),%eax
    8d6b:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8d6e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8d71:	8b 00                	mov    (%eax),%eax
    8d73:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    8d76:	8b 75 0c             	mov    0xc(%ebp),%esi
    8d79:	8b 45 14             	mov    0x14(%ebp),%eax
    8d7c:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8d7f:	89 c2                	mov    %eax,%edx
    8d81:	c1 e2 03             	shl    $0x3,%edx
    8d84:	01 c2                	add    %eax,%edx
    8d86:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8d8d:	89 c2                	mov    %eax,%edx
    8d8f:	89 d8                	mov    %ebx,%eax
    8d91:	c1 e0 02             	shl    $0x2,%eax
    8d94:	01 d8                	add    %ebx,%eax
    8d96:	c1 e0 05             	shl    $0x5,%eax
    8d99:	01 d0                	add    %edx,%eax
    8d9b:	01 f0                	add    %esi,%eax
    8d9d:	83 c0 4c             	add    $0x4c,%eax
    8da0:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    8da2:	8b 7d 0c             	mov    0xc(%ebp),%edi
    8da5:	8b 45 14             	mov    0x14(%ebp),%eax
    8da8:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8dab:	89 c2                	mov    %eax,%edx
    8dad:	c1 e2 03             	shl    $0x3,%edx
    8db0:	01 c2                	add    %eax,%edx
    8db2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8db9:	89 c2                	mov    %eax,%edx
    8dbb:	89 d8                	mov    %ebx,%eax
    8dbd:	c1 e0 02             	shl    $0x2,%eax
    8dc0:	01 d8                	add    %ebx,%eax
    8dc2:	c1 e0 05             	shl    $0x5,%eax
    8dc5:	01 d0                	add    %edx,%eax
    8dc7:	01 f8                	add    %edi,%eax
    8dc9:	83 c0 50             	add    $0x50,%eax
    8dcc:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    8dce:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    8dd0:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8dd3:	89 c8                	mov    %ecx,%eax
    8dd5:	c1 e0 03             	shl    $0x3,%eax
    8dd8:	01 c8                	add    %ecx,%eax
    8dda:	c1 e0 02             	shl    $0x2,%eax
    8ddd:	01 c8                	add    %ecx,%eax
    8ddf:	01 d0                	add    %edx,%eax
    8de1:	8b 04 85 40 03 01 00 	mov    0x10340(,%eax,4),%eax
    8de8:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    8deb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    8df2:	e9 ac 01 00 00       	jmp    8fa3 <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    8df7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8dfa:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8dfd:	7d 43                	jge    8e42 <III_hufman_decode+0x1a5>
    8dff:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8e02:	8b 45 14             	mov    0x14(%ebp),%eax
    8e05:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8e08:	89 c2                	mov    %eax,%edx
    8e0a:	c1 e2 03             	shl    $0x3,%edx
    8e0d:	01 c2                	add    %eax,%edx
    8e0f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8e16:	89 c2                	mov    %eax,%edx
    8e18:	89 c8                	mov    %ecx,%eax
    8e1a:	c1 e0 02             	shl    $0x2,%eax
    8e1d:	01 c8                	add    %ecx,%eax
    8e1f:	c1 e0 05             	shl    $0x5,%eax
    8e22:	01 d0                	add    %edx,%eax
    8e24:	01 d8                	add    %ebx,%eax
    8e26:	83 c0 34             	add    $0x34,%eax
    8e29:	8b 10                	mov    (%eax),%edx
    8e2b:	89 d0                	mov    %edx,%eax
    8e2d:	c1 e0 02             	shl    $0x2,%eax
    8e30:	01 d0                	add    %edx,%eax
    8e32:	c1 e0 03             	shl    $0x3,%eax
    8e35:	05 60 3f 01 00       	add    $0x13f60,%eax
    8e3a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8e3d:	e9 86 00 00 00       	jmp    8ec8 <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    8e42:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8e45:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    8e48:	7d 40                	jge    8e8a <III_hufman_decode+0x1ed>
    8e4a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8e4d:	8b 45 14             	mov    0x14(%ebp),%eax
    8e50:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8e53:	89 c2                	mov    %eax,%edx
    8e55:	c1 e2 03             	shl    $0x3,%edx
    8e58:	01 c2                	add    %eax,%edx
    8e5a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8e61:	89 c2                	mov    %eax,%edx
    8e63:	89 c8                	mov    %ecx,%eax
    8e65:	c1 e0 02             	shl    $0x2,%eax
    8e68:	01 c8                	add    %ecx,%eax
    8e6a:	c1 e0 05             	shl    $0x5,%eax
    8e6d:	01 d0                	add    %edx,%eax
    8e6f:	01 d8                	add    %ebx,%eax
    8e71:	83 c0 38             	add    $0x38,%eax
    8e74:	8b 10                	mov    (%eax),%edx
    8e76:	89 d0                	mov    %edx,%eax
    8e78:	c1 e0 02             	shl    $0x2,%eax
    8e7b:	01 d0                	add    %edx,%eax
    8e7d:	c1 e0 03             	shl    $0x3,%eax
    8e80:	05 60 3f 01 00       	add    $0x13f60,%eax
    8e85:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8e88:	eb 3e                	jmp    8ec8 <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    8e8a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8e8d:	8b 45 14             	mov    0x14(%ebp),%eax
    8e90:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8e93:	89 c2                	mov    %eax,%edx
    8e95:	c1 e2 03             	shl    $0x3,%edx
    8e98:	01 c2                	add    %eax,%edx
    8e9a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8ea1:	89 c2                	mov    %eax,%edx
    8ea3:	89 c8                	mov    %ecx,%eax
    8ea5:	c1 e0 02             	shl    $0x2,%eax
    8ea8:	01 c8                	add    %ecx,%eax
    8eaa:	c1 e0 05             	shl    $0x5,%eax
    8ead:	01 d0                	add    %edx,%eax
    8eaf:	01 d8                	add    %ebx,%eax
    8eb1:	83 c0 3c             	add    $0x3c,%eax
    8eb4:	8b 10                	mov    (%eax),%edx
    8eb6:	89 d0                	mov    %edx,%eax
    8eb8:	c1 e0 02             	shl    $0x2,%eax
    8ebb:	01 d0                	add    %edx,%eax
    8ebd:	c1 e0 03             	shl    $0x3,%eax
    8ec0:	05 60 3f 01 00       	add    $0x13f60,%eax
    8ec5:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    8ec8:	8d 45 c8             	lea    -0x38(%ebp),%eax
    8ecb:	89 44 24 10          	mov    %eax,0x10(%esp)
    8ecf:	8d 45 cc             	lea    -0x34(%ebp),%eax
    8ed2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    8ed6:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8ed9:	89 44 24 08          	mov    %eax,0x8(%esp)
    8edd:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    8ee0:	89 44 24 04          	mov    %eax,0x4(%esp)
    8ee4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8ee7:	89 04 24             	mov    %eax,(%esp)
    8eea:	e8 fd ee ff ff       	call   7dec <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    8eef:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8ef2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ef7:	89 c8                	mov    %ecx,%eax
    8ef9:	f7 ea                	imul   %edx
    8efb:	c1 fa 02             	sar    $0x2,%edx
    8efe:	89 c8                	mov    %ecx,%eax
    8f00:	c1 f8 1f             	sar    $0x1f,%eax
    8f03:	29 c2                	sub    %eax,%edx
    8f05:	89 d0                	mov    %edx,%eax
    8f07:	89 c2                	mov    %eax,%edx
    8f09:	89 d0                	mov    %edx,%eax
    8f0b:	c1 e0 03             	shl    $0x3,%eax
    8f0e:	01 d0                	add    %edx,%eax
    8f10:	c1 e0 03             	shl    $0x3,%eax
    8f13:	89 c2                	mov    %eax,%edx
    8f15:	8b 45 08             	mov    0x8(%ebp),%eax
    8f18:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8f1b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8f1e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8f23:	89 c8                	mov    %ecx,%eax
    8f25:	f7 ea                	imul   %edx
    8f27:	c1 fa 02             	sar    $0x2,%edx
    8f2a:	89 c8                	mov    %ecx,%eax
    8f2c:	c1 f8 1f             	sar    $0x1f,%eax
    8f2f:	29 c2                	sub    %eax,%edx
    8f31:	89 d0                	mov    %edx,%eax
    8f33:	c1 e0 03             	shl    $0x3,%eax
    8f36:	01 d0                	add    %edx,%eax
    8f38:	01 c0                	add    %eax,%eax
    8f3a:	29 c1                	sub    %eax,%ecx
    8f3c:	89 ca                	mov    %ecx,%edx
    8f3e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8f41:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    8f44:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8f47:	8d 48 01             	lea    0x1(%eax),%ecx
    8f4a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8f4f:	89 c8                	mov    %ecx,%eax
    8f51:	f7 ea                	imul   %edx
    8f53:	c1 fa 02             	sar    $0x2,%edx
    8f56:	89 c8                	mov    %ecx,%eax
    8f58:	c1 f8 1f             	sar    $0x1f,%eax
    8f5b:	29 c2                	sub    %eax,%edx
    8f5d:	89 d0                	mov    %edx,%eax
    8f5f:	89 c2                	mov    %eax,%edx
    8f61:	89 d0                	mov    %edx,%eax
    8f63:	c1 e0 03             	shl    $0x3,%eax
    8f66:	01 d0                	add    %edx,%eax
    8f68:	c1 e0 03             	shl    $0x3,%eax
    8f6b:	89 c2                	mov    %eax,%edx
    8f6d:	8b 45 08             	mov    0x8(%ebp),%eax
    8f70:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8f73:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8f76:	8d 48 01             	lea    0x1(%eax),%ecx
    8f79:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8f7e:	89 c8                	mov    %ecx,%eax
    8f80:	f7 ea                	imul   %edx
    8f82:	c1 fa 02             	sar    $0x2,%edx
    8f85:	89 c8                	mov    %ecx,%eax
    8f87:	c1 f8 1f             	sar    $0x1f,%eax
    8f8a:	29 c2                	sub    %eax,%edx
    8f8c:	89 d0                	mov    %edx,%eax
    8f8e:	c1 e0 03             	shl    $0x3,%eax
    8f91:	01 d0                	add    %edx,%eax
    8f93:	01 c0                	add    %eax,%eax
    8f95:	29 c1                	sub    %eax,%ecx
    8f97:	89 ca                	mov    %ecx,%edx
    8f99:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8f9c:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    8f9f:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    8fa3:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    8fa6:	8b 75 0c             	mov    0xc(%ebp),%esi
    8fa9:	8b 45 14             	mov    0x14(%ebp),%eax
    8fac:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8faf:	89 c2                	mov    %eax,%edx
    8fb1:	c1 e2 03             	shl    $0x3,%edx
    8fb4:	01 c2                	add    %eax,%edx
    8fb6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8fbd:	89 c2                	mov    %eax,%edx
    8fbf:	89 c8                	mov    %ecx,%eax
    8fc1:	c1 e0 02             	shl    $0x2,%eax
    8fc4:	01 c8                	add    %ecx,%eax
    8fc6:	c1 e0 05             	shl    $0x5,%eax
    8fc9:	01 d0                	add    %edx,%eax
    8fcb:	01 f0                	add    %esi,%eax
    8fcd:	83 c0 1c             	add    $0x1c,%eax
    8fd0:	8b 00                	mov    (%eax),%eax
    8fd2:	01 c0                	add    %eax,%eax
    8fd4:	39 c3                	cmp    %eax,%ebx
    8fd6:	0f 82 1b fe ff ff    	jb     8df7 <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    8fdc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8fdf:	8b 45 14             	mov    0x14(%ebp),%eax
    8fe2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8fe5:	89 c2                	mov    %eax,%edx
    8fe7:	c1 e2 03             	shl    $0x3,%edx
    8fea:	01 c2                	add    %eax,%edx
    8fec:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8ff3:	89 c2                	mov    %eax,%edx
    8ff5:	89 c8                	mov    %ecx,%eax
    8ff7:	c1 e0 02             	shl    $0x2,%eax
    8ffa:	01 c8                	add    %ecx,%eax
    8ffc:	c1 e0 05             	shl    $0x5,%eax
    8fff:	01 d0                	add    %edx,%eax
    9001:	01 d8                	add    %ebx,%eax
    9003:	83 c0 5c             	add    $0x5c,%eax
    9006:	8b 00                	mov    (%eax),%eax
    9008:	8d 50 20             	lea    0x20(%eax),%edx
    900b:	89 d0                	mov    %edx,%eax
    900d:	c1 e0 02             	shl    $0x2,%eax
    9010:	01 d0                	add    %edx,%eax
    9012:	c1 e0 03             	shl    $0x3,%eax
    9015:	05 60 3f 01 00       	add    $0x13f60,%eax
    901a:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    901d:	e9 91 01 00 00       	jmp    91b3 <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    9022:	8d 45 c8             	lea    -0x38(%ebp),%eax
    9025:	89 44 24 10          	mov    %eax,0x10(%esp)
    9029:	8d 45 cc             	lea    -0x34(%ebp),%eax
    902c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    9030:	8d 45 d0             	lea    -0x30(%ebp),%eax
    9033:	89 44 24 08          	mov    %eax,0x8(%esp)
    9037:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    903a:	89 44 24 04          	mov    %eax,0x4(%esp)
    903e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    9041:	89 04 24             	mov    %eax,(%esp)
    9044:	e8 a3 ed ff ff       	call   7dec <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    9049:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    904c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9051:	89 c8                	mov    %ecx,%eax
    9053:	f7 ea                	imul   %edx
    9055:	c1 fa 02             	sar    $0x2,%edx
    9058:	89 c8                	mov    %ecx,%eax
    905a:	c1 f8 1f             	sar    $0x1f,%eax
    905d:	29 c2                	sub    %eax,%edx
    905f:	89 d0                	mov    %edx,%eax
    9061:	89 c2                	mov    %eax,%edx
    9063:	89 d0                	mov    %edx,%eax
    9065:	c1 e0 03             	shl    $0x3,%eax
    9068:	01 d0                	add    %edx,%eax
    906a:	c1 e0 03             	shl    $0x3,%eax
    906d:	89 c2                	mov    %eax,%edx
    906f:	8b 45 08             	mov    0x8(%ebp),%eax
    9072:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9075:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9078:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    907d:	89 c8                	mov    %ecx,%eax
    907f:	f7 ea                	imul   %edx
    9081:	c1 fa 02             	sar    $0x2,%edx
    9084:	89 c8                	mov    %ecx,%eax
    9086:	c1 f8 1f             	sar    $0x1f,%eax
    9089:	29 c2                	sub    %eax,%edx
    908b:	89 d0                	mov    %edx,%eax
    908d:	c1 e0 03             	shl    $0x3,%eax
    9090:	01 d0                	add    %edx,%eax
    9092:	01 c0                	add    %eax,%eax
    9094:	29 c1                	sub    %eax,%ecx
    9096:	89 ca                	mov    %ecx,%edx
    9098:	8b 45 cc             	mov    -0x34(%ebp),%eax
    909b:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    909e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    90a1:	8d 48 01             	lea    0x1(%eax),%ecx
    90a4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    90a9:	89 c8                	mov    %ecx,%eax
    90ab:	f7 ea                	imul   %edx
    90ad:	c1 fa 02             	sar    $0x2,%edx
    90b0:	89 c8                	mov    %ecx,%eax
    90b2:	c1 f8 1f             	sar    $0x1f,%eax
    90b5:	29 c2                	sub    %eax,%edx
    90b7:	89 d0                	mov    %edx,%eax
    90b9:	89 c2                	mov    %eax,%edx
    90bb:	89 d0                	mov    %edx,%eax
    90bd:	c1 e0 03             	shl    $0x3,%eax
    90c0:	01 d0                	add    %edx,%eax
    90c2:	c1 e0 03             	shl    $0x3,%eax
    90c5:	89 c2                	mov    %eax,%edx
    90c7:	8b 45 08             	mov    0x8(%ebp),%eax
    90ca:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    90cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    90d0:	8d 48 01             	lea    0x1(%eax),%ecx
    90d3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    90d8:	89 c8                	mov    %ecx,%eax
    90da:	f7 ea                	imul   %edx
    90dc:	c1 fa 02             	sar    $0x2,%edx
    90df:	89 c8                	mov    %ecx,%eax
    90e1:	c1 f8 1f             	sar    $0x1f,%eax
    90e4:	29 c2                	sub    %eax,%edx
    90e6:	89 d0                	mov    %edx,%eax
    90e8:	c1 e0 03             	shl    $0x3,%eax
    90eb:	01 d0                	add    %edx,%eax
    90ed:	01 c0                	add    %eax,%eax
    90ef:	29 c1                	sub    %eax,%ecx
    90f1:	89 ca                	mov    %ecx,%edx
    90f3:	8b 45 c8             	mov    -0x38(%ebp),%eax
    90f6:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    90f9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    90fc:	8d 48 02             	lea    0x2(%eax),%ecx
    90ff:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9104:	89 c8                	mov    %ecx,%eax
    9106:	f7 ea                	imul   %edx
    9108:	c1 fa 02             	sar    $0x2,%edx
    910b:	89 c8                	mov    %ecx,%eax
    910d:	c1 f8 1f             	sar    $0x1f,%eax
    9110:	29 c2                	sub    %eax,%edx
    9112:	89 d0                	mov    %edx,%eax
    9114:	89 c2                	mov    %eax,%edx
    9116:	89 d0                	mov    %edx,%eax
    9118:	c1 e0 03             	shl    $0x3,%eax
    911b:	01 d0                	add    %edx,%eax
    911d:	c1 e0 03             	shl    $0x3,%eax
    9120:	89 c2                	mov    %eax,%edx
    9122:	8b 45 08             	mov    0x8(%ebp),%eax
    9125:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9128:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    912b:	8d 48 02             	lea    0x2(%eax),%ecx
    912e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9133:	89 c8                	mov    %ecx,%eax
    9135:	f7 ea                	imul   %edx
    9137:	c1 fa 02             	sar    $0x2,%edx
    913a:	89 c8                	mov    %ecx,%eax
    913c:	c1 f8 1f             	sar    $0x1f,%eax
    913f:	29 c2                	sub    %eax,%edx
    9141:	89 d0                	mov    %edx,%eax
    9143:	c1 e0 03             	shl    $0x3,%eax
    9146:	01 d0                	add    %edx,%eax
    9148:	01 c0                	add    %eax,%eax
    914a:	29 c1                	sub    %eax,%ecx
    914c:	89 ca                	mov    %ecx,%edx
    914e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9151:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    9154:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9157:	8d 48 03             	lea    0x3(%eax),%ecx
    915a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    915f:	89 c8                	mov    %ecx,%eax
    9161:	f7 ea                	imul   %edx
    9163:	c1 fa 02             	sar    $0x2,%edx
    9166:	89 c8                	mov    %ecx,%eax
    9168:	c1 f8 1f             	sar    $0x1f,%eax
    916b:	29 c2                	sub    %eax,%edx
    916d:	89 d0                	mov    %edx,%eax
    916f:	89 c2                	mov    %eax,%edx
    9171:	89 d0                	mov    %edx,%eax
    9173:	c1 e0 03             	shl    $0x3,%eax
    9176:	01 d0                	add    %edx,%eax
    9178:	c1 e0 03             	shl    $0x3,%eax
    917b:	89 c2                	mov    %eax,%edx
    917d:	8b 45 08             	mov    0x8(%ebp),%eax
    9180:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9183:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9186:	8d 48 03             	lea    0x3(%eax),%ecx
    9189:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    918e:	89 c8                	mov    %ecx,%eax
    9190:	f7 ea                	imul   %edx
    9192:	c1 fa 02             	sar    $0x2,%edx
    9195:	89 c8                	mov    %ecx,%eax
    9197:	c1 f8 1f             	sar    $0x1f,%eax
    919a:	29 c2                	sub    %eax,%edx
    919c:	89 d0                	mov    %edx,%eax
    919e:	c1 e0 03             	shl    $0x3,%eax
    91a1:	01 d0                	add    %edx,%eax
    91a3:	01 c0                	add    %eax,%eax
    91a5:	29 c1                	sub    %eax,%ecx
    91a7:	89 ca                	mov    %ecx,%edx
    91a9:	8b 45 d0             	mov    -0x30(%ebp),%eax
    91ac:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    91af:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    91b3:	e8 5b d3 ff ff       	call   6513 <hsstell>
    91b8:	89 c3                	mov    %eax,%ebx
    91ba:	8b 75 0c             	mov    0xc(%ebp),%esi
    91bd:	8b 45 14             	mov    0x14(%ebp),%eax
    91c0:	8b 4d 10             	mov    0x10(%ebp),%ecx
    91c3:	89 c2                	mov    %eax,%edx
    91c5:	c1 e2 03             	shl    $0x3,%edx
    91c8:	01 c2                	add    %eax,%edx
    91ca:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    91d1:	89 c2                	mov    %eax,%edx
    91d3:	89 c8                	mov    %ecx,%eax
    91d5:	c1 e0 02             	shl    $0x2,%eax
    91d8:	01 c8                	add    %ecx,%eax
    91da:	c1 e0 05             	shl    $0x5,%eax
    91dd:	01 d0                	add    %edx,%eax
    91df:	01 f0                	add    %esi,%eax
    91e1:	83 c0 18             	add    $0x18,%eax
    91e4:	8b 10                	mov    (%eax),%edx
    91e6:	8b 45 18             	mov    0x18(%ebp),%eax
    91e9:	01 d0                	add    %edx,%eax
    91eb:	39 c3                	cmp    %eax,%ebx
    91ed:	73 0d                	jae    91fc <III_hufman_decode+0x55f>
    91ef:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    91f6:	0f 8e 26 fe ff ff    	jle    9022 <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    91fc:	e8 12 d3 ff ff       	call   6513 <hsstell>
    9201:	89 c3                	mov    %eax,%ebx
    9203:	8b 75 0c             	mov    0xc(%ebp),%esi
    9206:	8b 45 14             	mov    0x14(%ebp),%eax
    9209:	8b 4d 10             	mov    0x10(%ebp),%ecx
    920c:	89 c2                	mov    %eax,%edx
    920e:	c1 e2 03             	shl    $0x3,%edx
    9211:	01 c2                	add    %eax,%edx
    9213:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    921a:	89 c2                	mov    %eax,%edx
    921c:	89 c8                	mov    %ecx,%eax
    921e:	c1 e0 02             	shl    $0x2,%eax
    9221:	01 c8                	add    %ecx,%eax
    9223:	c1 e0 05             	shl    $0x5,%eax
    9226:	01 d0                	add    %edx,%eax
    9228:	01 f0                	add    %esi,%eax
    922a:	83 c0 18             	add    $0x18,%eax
    922d:	8b 10                	mov    (%eax),%edx
    922f:	8b 45 18             	mov    0x18(%ebp),%eax
    9232:	01 d0                	add    %edx,%eax
    9234:	39 c3                	cmp    %eax,%ebx
    9236:	76 48                	jbe    9280 <III_hufman_decode+0x5e3>
   {  i -=4;
    9238:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    923c:	e8 d2 d2 ff ff       	call   6513 <hsstell>
    9241:	8b 55 18             	mov    0x18(%ebp),%edx
    9244:	29 d0                	sub    %edx,%eax
    9246:	89 c6                	mov    %eax,%esi
    9248:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    924b:	8b 45 14             	mov    0x14(%ebp),%eax
    924e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9251:	89 c2                	mov    %eax,%edx
    9253:	c1 e2 03             	shl    $0x3,%edx
    9256:	01 c2                	add    %eax,%edx
    9258:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    925f:	89 c2                	mov    %eax,%edx
    9261:	89 c8                	mov    %ecx,%eax
    9263:	c1 e0 02             	shl    $0x2,%eax
    9266:	01 c8                	add    %ecx,%eax
    9268:	c1 e0 05             	shl    $0x5,%eax
    926b:	01 d0                	add    %edx,%eax
    926d:	01 d8                	add    %ebx,%eax
    926f:	83 c0 18             	add    $0x18,%eax
    9272:	8b 00                	mov    (%eax),%eax
    9274:	29 c6                	sub    %eax,%esi
    9276:	89 f0                	mov    %esi,%eax
    9278:	89 04 24             	mov    %eax,(%esp)
    927b:	e8 de d2 ff ff       	call   655e <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    9280:	e8 8e d2 ff ff       	call   6513 <hsstell>
    9285:	89 c3                	mov    %eax,%ebx
    9287:	8b 75 0c             	mov    0xc(%ebp),%esi
    928a:	8b 45 14             	mov    0x14(%ebp),%eax
    928d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9290:	89 c2                	mov    %eax,%edx
    9292:	c1 e2 03             	shl    $0x3,%edx
    9295:	01 c2                	add    %eax,%edx
    9297:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    929e:	89 c2                	mov    %eax,%edx
    92a0:	89 c8                	mov    %ecx,%eax
    92a2:	c1 e0 02             	shl    $0x2,%eax
    92a5:	01 c8                	add    %ecx,%eax
    92a7:	c1 e0 05             	shl    $0x5,%eax
    92aa:	01 d0                	add    %edx,%eax
    92ac:	01 f0                	add    %esi,%eax
    92ae:	83 c0 18             	add    $0x18,%eax
    92b1:	8b 10                	mov    (%eax),%edx
    92b3:	8b 45 18             	mov    0x18(%ebp),%eax
    92b6:	01 d0                	add    %edx,%eax
    92b8:	39 c3                	cmp    %eax,%ebx
    92ba:	73 45                	jae    9301 <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    92bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    92bf:	8b 45 14             	mov    0x14(%ebp),%eax
    92c2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    92c5:	89 c2                	mov    %eax,%edx
    92c7:	c1 e2 03             	shl    $0x3,%edx
    92ca:	01 c2                	add    %eax,%edx
    92cc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    92d3:	89 c2                	mov    %eax,%edx
    92d5:	89 c8                	mov    %ecx,%eax
    92d7:	c1 e0 02             	shl    $0x2,%eax
    92da:	01 c8                	add    %ecx,%eax
    92dc:	c1 e0 05             	shl    $0x5,%eax
    92df:	01 d0                	add    %edx,%eax
    92e1:	01 d8                	add    %ebx,%eax
    92e3:	83 c0 18             	add    $0x18,%eax
    92e6:	8b 10                	mov    (%eax),%edx
    92e8:	8b 45 18             	mov    0x18(%ebp),%eax
    92eb:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    92ee:	e8 20 d2 ff ff       	call   6513 <hsstell>
    92f3:	29 c3                	sub    %eax,%ebx
    92f5:	89 d8                	mov    %ebx,%eax
    92f7:	89 04 24             	mov    %eax,(%esp)
    92fa:	e8 30 d2 ff ff       	call   652f <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    92ff:	eb 5c                	jmp    935d <III_hufman_decode+0x6c0>
    9301:	eb 5a                	jmp    935d <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    9303:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9306:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    930b:	89 c8                	mov    %ecx,%eax
    930d:	f7 ea                	imul   %edx
    930f:	c1 fa 02             	sar    $0x2,%edx
    9312:	89 c8                	mov    %ecx,%eax
    9314:	c1 f8 1f             	sar    $0x1f,%eax
    9317:	29 c2                	sub    %eax,%edx
    9319:	89 d0                	mov    %edx,%eax
    931b:	89 c2                	mov    %eax,%edx
    931d:	89 d0                	mov    %edx,%eax
    931f:	c1 e0 03             	shl    $0x3,%eax
    9322:	01 d0                	add    %edx,%eax
    9324:	c1 e0 03             	shl    $0x3,%eax
    9327:	89 c2                	mov    %eax,%edx
    9329:	8b 45 08             	mov    0x8(%ebp),%eax
    932c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    932f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9332:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9337:	89 c8                	mov    %ecx,%eax
    9339:	f7 ea                	imul   %edx
    933b:	c1 fa 02             	sar    $0x2,%edx
    933e:	89 c8                	mov    %ecx,%eax
    9340:	c1 f8 1f             	sar    $0x1f,%eax
    9343:	29 c2                	sub    %eax,%edx
    9345:	89 d0                	mov    %edx,%eax
    9347:	c1 e0 03             	shl    $0x3,%eax
    934a:	01 d0                	add    %edx,%eax
    934c:	01 c0                	add    %eax,%eax
    934e:	29 c1                	sub    %eax,%ecx
    9350:	89 ca                	mov    %ecx,%edx
    9352:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    9359:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    935d:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    9364:	7e 9d                	jle    9303 <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    9366:	83 c4 4c             	add    $0x4c,%esp
    9369:	5b                   	pop    %ebx
    936a:	5e                   	pop    %esi
    936b:	5f                   	pop    %edi
    936c:	5d                   	pop    %ebp
    936d:	c3                   	ret    

0000936e <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    936e:	55                   	push   %ebp
    936f:	89 e5                	mov    %esp,%ebp
    9371:	56                   	push   %esi
    9372:	53                   	push   %ebx
    9373:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    9376:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    937d:	8b 45 1c             	mov    0x1c(%ebp),%eax
    9380:	8b 00                	mov    (%eax),%eax
    9382:	8b 40 10             	mov    0x10(%eax),%eax
    9385:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    9388:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    938f:	8b 45 14             	mov    0x14(%ebp),%eax
    9392:	8b 40 10             	mov    0x10(%eax),%eax
    9395:	85 c0                	test   %eax,%eax
    9397:	74 61                	je     93fa <III_dequantize_sample+0x8c>
    9399:	8b 45 14             	mov    0x14(%ebp),%eax
    939c:	8b 40 14             	mov    0x14(%eax),%eax
    939f:	83 f8 02             	cmp    $0x2,%eax
    93a2:	75 56                	jne    93fa <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    93a4:	8b 45 14             	mov    0x14(%ebp),%eax
    93a7:	8b 40 18             	mov    0x18(%eax),%eax
    93aa:	85 c0                	test   %eax,%eax
    93ac:	74 15                	je     93c3 <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    93ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
    93b1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    93b7:	05 44 03 01 00       	add    $0x10344,%eax
    93bc:	8b 00                	mov    (%eax),%eax
    93be:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    93c1:	eb 4a                	jmp    940d <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    93c3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    93c6:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    93cc:	05 94 03 01 00       	add    $0x10394,%eax
    93d1:	8b 50 0c             	mov    0xc(%eax),%edx
    93d4:	89 d0                	mov    %edx,%eax
    93d6:	01 c0                	add    %eax,%eax
    93d8:	01 d0                	add    %edx,%eax
    93da:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    93dd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    93e0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    93e6:	05 94 03 01 00       	add    $0x10394,%eax
    93eb:	8b 40 0c             	mov    0xc(%eax),%eax
    93ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    93f1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    93f8:	eb 13                	jmp    940d <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    93fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
    93fd:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9403:	05 44 03 01 00       	add    $0x10344,%eax
    9408:	8b 00                	mov    (%eax),%eax
    940a:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    940d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9414:	e9 3d 06 00 00       	jmp    9a56 <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    9419:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9420:	e9 23 06 00 00       	jmp    9a48 <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    9425:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9428:	89 d0                	mov    %edx,%eax
    942a:	c1 e0 03             	shl    $0x3,%eax
    942d:	01 d0                	add    %edx,%eax
    942f:	01 c0                	add    %eax,%eax
    9431:	89 c2                	mov    %eax,%edx
    9433:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9436:	01 d0                	add    %edx,%eax
    9438:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    943b:	0f 85 9e 02 00 00    	jne    96df <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    9441:	8b 45 14             	mov    0x14(%ebp),%eax
    9444:	8b 40 10             	mov    0x10(%eax),%eax
    9447:	85 c0                	test   %eax,%eax
    9449:	0f 84 6b 02 00 00    	je     96ba <III_dequantize_sample+0x34c>
    944f:	8b 45 14             	mov    0x14(%ebp),%eax
    9452:	8b 40 14             	mov    0x14(%eax),%eax
    9455:	83 f8 02             	cmp    $0x2,%eax
    9458:	0f 85 5c 02 00 00    	jne    96ba <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    945e:	8b 45 14             	mov    0x14(%ebp),%eax
    9461:	8b 40 18             	mov    0x18(%eax),%eax
    9464:	85 c0                	test   %eax,%eax
    9466:	0f 84 af 01 00 00    	je     961b <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    946c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    946f:	89 d0                	mov    %edx,%eax
    9471:	c1 e0 03             	shl    $0x3,%eax
    9474:	01 d0                	add    %edx,%eax
    9476:	01 c0                	add    %eax,%eax
    9478:	89 c2                	mov    %eax,%edx
    947a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    947d:	01 c2                	add    %eax,%edx
    947f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9482:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9488:	05 60 03 01 00       	add    $0x10360,%eax
    948d:	8b 00                	mov    (%eax),%eax
    948f:	39 c2                	cmp    %eax,%edx
    9491:	0f 85 93 00 00 00    	jne    952a <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    9497:	8b 45 dc             	mov    -0x24(%ebp),%eax
    949a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    94a0:	05 a0 03 01 00       	add    $0x103a0,%eax
    94a5:	8b 50 0c             	mov    0xc(%eax),%edx
    94a8:	89 d0                	mov    %edx,%eax
    94aa:	01 c0                	add    %eax,%eax
    94ac:	01 d0                	add    %edx,%eax
    94ae:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    94b1:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    94b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    94bb:	8d 48 01             	lea    0x1(%eax),%ecx
    94be:	8b 55 dc             	mov    -0x24(%ebp),%edx
    94c1:	89 d0                	mov    %edx,%eax
    94c3:	c1 e0 03             	shl    $0x3,%eax
    94c6:	01 d0                	add    %edx,%eax
    94c8:	c1 e0 02             	shl    $0x2,%eax
    94cb:	01 d0                	add    %edx,%eax
    94cd:	01 c8                	add    %ecx,%eax
    94cf:	83 c0 14             	add    $0x14,%eax
    94d2:	8b 0c 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    94d9:	8b 55 dc             	mov    -0x24(%ebp),%edx
    94dc:	89 d0                	mov    %edx,%eax
    94de:	c1 e0 03             	shl    $0x3,%eax
    94e1:	01 d0                	add    %edx,%eax
    94e3:	c1 e0 02             	shl    $0x2,%eax
    94e6:	01 d0                	add    %edx,%eax
    94e8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    94eb:	01 d0                	add    %edx,%eax
    94ed:	83 c0 14             	add    $0x14,%eax
    94f0:	8b 04 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    94f7:	29 c1                	sub    %eax,%ecx
    94f9:	89 c8                	mov    %ecx,%eax
    94fb:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    94fe:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9501:	89 d0                	mov    %edx,%eax
    9503:	c1 e0 03             	shl    $0x3,%eax
    9506:	01 d0                	add    %edx,%eax
    9508:	c1 e0 02             	shl    $0x2,%eax
    950b:	01 d0                	add    %edx,%eax
    950d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9510:	01 d0                	add    %edx,%eax
    9512:	83 c0 14             	add    $0x14,%eax
    9515:	8b 14 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%edx
    951c:	89 d0                	mov    %edx,%eax
    951e:	01 c0                	add    %eax,%eax
    9520:	01 d0                	add    %edx,%eax
    9522:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    9525:	e9 8e 01 00 00       	jmp    96b8 <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    952a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    952d:	89 d0                	mov    %edx,%eax
    952f:	c1 e0 03             	shl    $0x3,%eax
    9532:	01 d0                	add    %edx,%eax
    9534:	01 c0                	add    %eax,%eax
    9536:	89 c2                	mov    %eax,%edx
    9538:	8b 45 f4             	mov    -0xc(%ebp),%eax
    953b:	01 c2                	add    %eax,%edx
    953d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9540:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9546:	05 60 03 01 00       	add    $0x10360,%eax
    954b:	8b 00                	mov    (%eax),%eax
    954d:	39 c2                	cmp    %eax,%edx
    954f:	7d 2a                	jge    957b <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    9551:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9555:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9558:	8d 48 01             	lea    0x1(%eax),%ecx
    955b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    955e:	89 d0                	mov    %edx,%eax
    9560:	c1 e0 03             	shl    $0x3,%eax
    9563:	01 d0                	add    %edx,%eax
    9565:	c1 e0 02             	shl    $0x2,%eax
    9568:	01 d0                	add    %edx,%eax
    956a:	01 c8                	add    %ecx,%eax
    956c:	8b 04 85 40 03 01 00 	mov    0x10340(,%eax,4),%eax
    9573:	89 45 e8             	mov    %eax,-0x18(%ebp)
    9576:	e9 3d 01 00 00       	jmp    96b8 <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    957b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    957f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9582:	8d 48 01             	lea    0x1(%eax),%ecx
    9585:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9588:	89 d0                	mov    %edx,%eax
    958a:	c1 e0 03             	shl    $0x3,%eax
    958d:	01 d0                	add    %edx,%eax
    958f:	c1 e0 02             	shl    $0x2,%eax
    9592:	01 d0                	add    %edx,%eax
    9594:	01 c8                	add    %ecx,%eax
    9596:	83 c0 14             	add    $0x14,%eax
    9599:	8b 14 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%edx
    95a0:	89 d0                	mov    %edx,%eax
    95a2:	01 c0                	add    %eax,%eax
    95a4:	01 d0                	add    %edx,%eax
    95a6:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    95a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    95ac:	8d 48 01             	lea    0x1(%eax),%ecx
    95af:	8b 55 dc             	mov    -0x24(%ebp),%edx
    95b2:	89 d0                	mov    %edx,%eax
    95b4:	c1 e0 03             	shl    $0x3,%eax
    95b7:	01 d0                	add    %edx,%eax
    95b9:	c1 e0 02             	shl    $0x2,%eax
    95bc:	01 d0                	add    %edx,%eax
    95be:	01 c8                	add    %ecx,%eax
    95c0:	83 c0 14             	add    $0x14,%eax
    95c3:	8b 0c 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    95ca:	8b 55 dc             	mov    -0x24(%ebp),%edx
    95cd:	89 d0                	mov    %edx,%eax
    95cf:	c1 e0 03             	shl    $0x3,%eax
    95d2:	01 d0                	add    %edx,%eax
    95d4:	c1 e0 02             	shl    $0x2,%eax
    95d7:	01 d0                	add    %edx,%eax
    95d9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    95dc:	01 d0                	add    %edx,%eax
    95de:	83 c0 14             	add    $0x14,%eax
    95e1:	8b 04 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    95e8:	29 c1                	sub    %eax,%ecx
    95ea:	89 c8                	mov    %ecx,%eax
    95ec:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    95ef:	8b 55 dc             	mov    -0x24(%ebp),%edx
    95f2:	89 d0                	mov    %edx,%eax
    95f4:	c1 e0 03             	shl    $0x3,%eax
    95f7:	01 d0                	add    %edx,%eax
    95f9:	c1 e0 02             	shl    $0x2,%eax
    95fc:	01 d0                	add    %edx,%eax
    95fe:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9601:	01 d0                	add    %edx,%eax
    9603:	83 c0 14             	add    $0x14,%eax
    9606:	8b 14 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%edx
    960d:	89 d0                	mov    %edx,%eax
    960f:	01 c0                	add    %eax,%eax
    9611:	01 d0                	add    %edx,%eax
    9613:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    9616:	e9 c4 00 00 00       	jmp    96df <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    961b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    961f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9622:	8d 48 01             	lea    0x1(%eax),%ecx
    9625:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9628:	89 d0                	mov    %edx,%eax
    962a:	c1 e0 03             	shl    $0x3,%eax
    962d:	01 d0                	add    %edx,%eax
    962f:	c1 e0 02             	shl    $0x2,%eax
    9632:	01 d0                	add    %edx,%eax
    9634:	01 c8                	add    %ecx,%eax
    9636:	83 c0 14             	add    $0x14,%eax
    9639:	8b 14 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%edx
    9640:	89 d0                	mov    %edx,%eax
    9642:	01 c0                	add    %eax,%eax
    9644:	01 d0                	add    %edx,%eax
    9646:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    9649:	8b 45 ec             	mov    -0x14(%ebp),%eax
    964c:	8d 48 01             	lea    0x1(%eax),%ecx
    964f:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9652:	89 d0                	mov    %edx,%eax
    9654:	c1 e0 03             	shl    $0x3,%eax
    9657:	01 d0                	add    %edx,%eax
    9659:	c1 e0 02             	shl    $0x2,%eax
    965c:	01 d0                	add    %edx,%eax
    965e:	01 c8                	add    %ecx,%eax
    9660:	83 c0 14             	add    $0x14,%eax
    9663:	8b 0c 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    966a:	8b 55 dc             	mov    -0x24(%ebp),%edx
    966d:	89 d0                	mov    %edx,%eax
    966f:	c1 e0 03             	shl    $0x3,%eax
    9672:	01 d0                	add    %edx,%eax
    9674:	c1 e0 02             	shl    $0x2,%eax
    9677:	01 d0                	add    %edx,%eax
    9679:	8b 55 ec             	mov    -0x14(%ebp),%edx
    967c:	01 d0                	add    %edx,%eax
    967e:	83 c0 14             	add    $0x14,%eax
    9681:	8b 04 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    9688:	29 c1                	sub    %eax,%ecx
    968a:	89 c8                	mov    %ecx,%eax
    968c:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    968f:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9692:	89 d0                	mov    %edx,%eax
    9694:	c1 e0 03             	shl    $0x3,%eax
    9697:	01 d0                	add    %edx,%eax
    9699:	c1 e0 02             	shl    $0x2,%eax
    969c:	01 d0                	add    %edx,%eax
    969e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    96a1:	01 d0                	add    %edx,%eax
    96a3:	83 c0 14             	add    $0x14,%eax
    96a6:	8b 14 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%edx
    96ad:	89 d0                	mov    %edx,%eax
    96af:	01 c0                	add    %eax,%eax
    96b1:	01 d0                	add    %edx,%eax
    96b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    96b6:	eb 27                	jmp    96df <III_dequantize_sample+0x371>
    96b8:	eb 25                	jmp    96df <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    96ba:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    96be:	8b 45 ec             	mov    -0x14(%ebp),%eax
    96c1:	8d 48 01             	lea    0x1(%eax),%ecx
    96c4:	8b 55 dc             	mov    -0x24(%ebp),%edx
    96c7:	89 d0                	mov    %edx,%eax
    96c9:	c1 e0 03             	shl    $0x3,%eax
    96cc:	01 d0                	add    %edx,%eax
    96ce:	c1 e0 02             	shl    $0x2,%eax
    96d1:	01 d0                	add    %edx,%eax
    96d3:	01 c8                	add    %ecx,%eax
    96d5:	8b 04 85 40 03 01 00 	mov    0x10340(,%eax,4),%eax
    96dc:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    96df:	8b 55 f0             	mov    -0x10(%ebp),%edx
    96e2:	89 d0                	mov    %edx,%eax
    96e4:	c1 e0 03             	shl    $0x3,%eax
    96e7:	01 d0                	add    %edx,%eax
    96e9:	c1 e0 04             	shl    $0x4,%eax
    96ec:	89 c2                	mov    %eax,%edx
    96ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    96f1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    96f4:	8b 45 14             	mov    0x14(%ebp),%eax
    96f7:	8b 40 08             	mov    0x8(%eax),%eax
    96fa:	ba 00 00 00 00       	mov    $0x0,%edx
    96ff:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9702:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9705:	df 6d c8             	fildll -0x38(%ebp)
    9708:	dd 05 d0 e7 00 00    	fldl   0xe7d0
    970e:	de e9                	fsubrp %st,%st(1)
    9710:	dd 05 d8 e7 00 00    	fldl   0xe7d8
    9716:	de c9                	fmulp  %st,%st(1)
    9718:	dd 5c 24 08          	fstpl  0x8(%esp)
    971c:	dd 05 e0 e7 00 00    	fldl   0xe7e0
    9722:	dd 1c 24             	fstpl  (%esp)
    9725:	e8 0c c1 ff ff       	call   5836 <pow>
    972a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    972d:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    9730:	8b 45 14             	mov    0x14(%ebp),%eax
    9733:	8b 40 10             	mov    0x10(%eax),%eax
    9736:	85 c0                	test   %eax,%eax
    9738:	0f 84 86 01 00 00    	je     98c4 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    973e:	8b 45 14             	mov    0x14(%ebp),%eax
    9741:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    9744:	83 f8 02             	cmp    $0x2,%eax
    9747:	75 0a                	jne    9753 <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9749:	8b 45 14             	mov    0x14(%ebp),%eax
    974c:	8b 40 18             	mov    0x18(%eax),%eax
    974f:	85 c0                	test   %eax,%eax
    9751:	74 27                	je     977a <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    9753:	8b 45 14             	mov    0x14(%ebp),%eax
    9756:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9759:	83 f8 02             	cmp    $0x2,%eax
    975c:	0f 85 62 01 00 00    	jne    98c4 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    9762:	8b 45 14             	mov    0x14(%ebp),%eax
    9765:	8b 40 18             	mov    0x18(%eax),%eax
    9768:	85 c0                	test   %eax,%eax
    976a:	0f 84 54 01 00 00    	je     98c4 <III_dequantize_sample+0x556>
    9770:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9774:	0f 8e 4a 01 00 00    	jle    98c4 <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    977a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    977d:	89 d0                	mov    %edx,%eax
    977f:	c1 e0 03             	shl    $0x3,%eax
    9782:	01 d0                	add    %edx,%eax
    9784:	c1 e0 04             	shl    $0x4,%eax
    9787:	89 c2                	mov    %eax,%edx
    9789:	8b 45 0c             	mov    0xc(%ebp),%eax
    978c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    978f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9792:	89 d0                	mov    %edx,%eax
    9794:	c1 e0 03             	shl    $0x3,%eax
    9797:	01 d0                	add    %edx,%eax
    9799:	c1 e0 04             	shl    $0x4,%eax
    979c:	89 c2                	mov    %eax,%edx
    979e:	8b 45 0c             	mov    0xc(%ebp),%eax
    97a1:	01 c2                	add    %eax,%edx
    97a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97a6:	dd 04 c2             	fldl   (%edx,%eax,8)
    97a9:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    97ac:	8b 55 f0             	mov    -0x10(%ebp),%edx
    97af:	89 d0                	mov    %edx,%eax
    97b1:	c1 e0 03             	shl    $0x3,%eax
    97b4:	01 d0                	add    %edx,%eax
    97b6:	01 c0                	add    %eax,%eax
    97b8:	89 c2                	mov    %eax,%edx
    97ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97bd:	01 d0                	add    %edx,%eax
    97bf:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    97c2:	99                   	cltd   
    97c3:	f7 7d e0             	idivl  -0x20(%ebp)
    97c6:	89 c2                	mov    %eax,%edx
    97c8:	8b 45 14             	mov    0x14(%ebp),%eax
    97cb:	83 c2 08             	add    $0x8,%edx
    97ce:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    97d2:	ba 00 00 00 00       	mov    $0x0,%edx
    97d7:	89 45 c8             	mov    %eax,-0x38(%ebp)
    97da:	89 55 cc             	mov    %edx,-0x34(%ebp)
    97dd:	df 6d c8             	fildll -0x38(%ebp)
    97e0:	dd 05 e8 e7 00 00    	fldl   0xe7e8
    97e6:	de c9                	fmulp  %st,%st(1)
    97e8:	dd 5c 24 08          	fstpl  0x8(%esp)
    97ec:	dd 05 e0 e7 00 00    	fldl   0xe7e0
    97f2:	dd 1c 24             	fstpl  (%esp)
    97f5:	e8 3c c0 ff ff       	call   5836 <pow>
    97fa:	dc 4d c0             	fmull  -0x40(%ebp)
    97fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9800:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    9803:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9806:	89 d0                	mov    %edx,%eax
    9808:	c1 e0 03             	shl    $0x3,%eax
    980b:	01 d0                	add    %edx,%eax
    980d:	c1 e0 04             	shl    $0x4,%eax
    9810:	89 c2                	mov    %eax,%edx
    9812:	8b 45 0c             	mov    0xc(%ebp),%eax
    9815:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9818:	8b 55 f0             	mov    -0x10(%ebp),%edx
    981b:	89 d0                	mov    %edx,%eax
    981d:	c1 e0 03             	shl    $0x3,%eax
    9820:	01 d0                	add    %edx,%eax
    9822:	c1 e0 04             	shl    $0x4,%eax
    9825:	89 c2                	mov    %eax,%edx
    9827:	8b 45 0c             	mov    0xc(%ebp),%eax
    982a:	01 c2                	add    %eax,%edx
    982c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    982f:	dd 04 c2             	fldl   (%edx,%eax,8)
    9832:	dd 5d c0             	fstpl  -0x40(%ebp)
    9835:	8b 45 14             	mov    0x14(%ebp),%eax
    9838:	8b 40 40             	mov    0x40(%eax),%eax
    983b:	ba 00 00 00 00       	mov    $0x0,%edx
    9840:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9843:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9846:	df 6d c8             	fildll -0x38(%ebp)
    9849:	d9 e8                	fld1   
    984b:	de c1                	faddp  %st,%st(1)
    984d:	dd 05 f0 e7 00 00    	fldl   0xe7f0
    9853:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    9855:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9858:	89 d0                	mov    %edx,%eax
    985a:	c1 e0 03             	shl    $0x3,%eax
    985d:	01 d0                	add    %edx,%eax
    985f:	01 c0                	add    %eax,%eax
    9861:	89 c2                	mov    %eax,%edx
    9863:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9866:	01 d0                	add    %edx,%eax
    9868:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    986b:	99                   	cltd   
    986c:	f7 7d e0             	idivl  -0x20(%ebp)
    986f:	89 c2                	mov    %eax,%edx
    9871:	8b 5d 10             	mov    0x10(%ebp),%ebx
    9874:	8b 4d 18             	mov    0x18(%ebp),%ecx
    9877:	89 d0                	mov    %edx,%eax
    9879:	01 c0                	add    %eax,%eax
    987b:	01 d0                	add    %edx,%eax
    987d:	c1 e0 02             	shl    $0x2,%eax
    9880:	01 d0                	add    %edx,%eax
    9882:	89 ca                	mov    %ecx,%edx
    9884:	01 d2                	add    %edx,%edx
    9886:	89 d1                	mov    %edx,%ecx
    9888:	c1 e1 05             	shl    $0x5,%ecx
    988b:	29 d1                	sub    %edx,%ecx
    988d:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    9890:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9893:	01 d0                	add    %edx,%eax
    9895:	83 c0 14             	add    $0x14,%eax
    9898:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    989c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    989f:	db 45 d4             	fildl  -0x2c(%ebp)
    98a2:	de c9                	fmulp  %st,%st(1)
    98a4:	dd 5c 24 08          	fstpl  0x8(%esp)
    98a8:	dd 05 e0 e7 00 00    	fldl   0xe7e0
    98ae:	dd 1c 24             	fstpl  (%esp)
    98b1:	e8 80 bf ff ff       	call   5836 <pow>
    98b6:	dc 4d c0             	fmull  -0x40(%ebp)
    98b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    98bc:	dd 1c c6             	fstpl  (%esi,%eax,8)
    98bf:	e9 ab 00 00 00       	jmp    996f <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    98c4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    98c7:	89 d0                	mov    %edx,%eax
    98c9:	c1 e0 03             	shl    $0x3,%eax
    98cc:	01 d0                	add    %edx,%eax
    98ce:	c1 e0 04             	shl    $0x4,%eax
    98d1:	89 c2                	mov    %eax,%edx
    98d3:	8b 45 0c             	mov    0xc(%ebp),%eax
    98d6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    98d9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    98dc:	89 d0                	mov    %edx,%eax
    98de:	c1 e0 03             	shl    $0x3,%eax
    98e1:	01 d0                	add    %edx,%eax
    98e3:	c1 e0 04             	shl    $0x4,%eax
    98e6:	89 c2                	mov    %eax,%edx
    98e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    98eb:	01 c2                	add    %eax,%edx
    98ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    98f0:	dd 04 c2             	fldl   (%edx,%eax,8)
    98f3:	dd 5d c0             	fstpl  -0x40(%ebp)
    98f6:	8b 45 14             	mov    0x14(%ebp),%eax
    98f9:	8b 40 40             	mov    0x40(%eax),%eax
    98fc:	ba 00 00 00 00       	mov    $0x0,%edx
    9901:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9904:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9907:	df 6d c8             	fildll -0x38(%ebp)
    990a:	d9 e8                	fld1   
    990c:	de c1                	faddp  %st,%st(1)
    990e:	dd 05 f0 e7 00 00    	fldl   0xe7f0
    9914:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    9916:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9919:	8b 45 18             	mov    0x18(%ebp),%eax
    991c:	01 c0                	add    %eax,%eax
    991e:	89 c2                	mov    %eax,%edx
    9920:	c1 e2 05             	shl    $0x5,%edx
    9923:	29 c2                	sub    %eax,%edx
    9925:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9928:	01 d0                	add    %edx,%eax
    992a:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    992d:	89 c2                	mov    %eax,%edx
    992f:	8b 45 14             	mov    0x14(%ebp),%eax
    9932:	8b 48 3c             	mov    0x3c(%eax),%ecx
    9935:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9938:	8b 04 85 00 05 01 00 	mov    0x10500(,%eax,4),%eax
    993f:	0f af c1             	imul   %ecx,%eax
    9942:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    9944:	ba 00 00 00 00       	mov    $0x0,%edx
    9949:	89 45 c8             	mov    %eax,-0x38(%ebp)
    994c:	89 55 cc             	mov    %edx,-0x34(%ebp)
    994f:	df 6d c8             	fildll -0x38(%ebp)
    9952:	de c9                	fmulp  %st,%st(1)
    9954:	dd 5c 24 08          	fstpl  0x8(%esp)
    9958:	dd 05 e0 e7 00 00    	fldl   0xe7e0
    995e:	dd 1c 24             	fstpl  (%esp)
    9961:	e8 d0 be ff ff       	call   5836 <pow>
    9966:	dc 4d c0             	fmull  -0x40(%ebp)
    9969:	8b 45 f4             	mov    -0xc(%ebp),%eax
    996c:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    996f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9972:	89 d0                	mov    %edx,%eax
    9974:	c1 e0 03             	shl    $0x3,%eax
    9977:	01 d0                	add    %edx,%eax
    9979:	c1 e0 03             	shl    $0x3,%eax
    997c:	89 c2                	mov    %eax,%edx
    997e:	8b 45 08             	mov    0x8(%ebp),%eax
    9981:	01 c2                	add    %eax,%edx
    9983:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9986:	8b 04 82             	mov    (%edx,%eax,4),%eax
    9989:	c1 e8 1f             	shr    $0x1f,%eax
    998c:	0f b6 c0             	movzbl %al,%eax
    998f:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    9992:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9995:	89 d0                	mov    %edx,%eax
    9997:	c1 e0 03             	shl    $0x3,%eax
    999a:	01 d0                	add    %edx,%eax
    999c:	c1 e0 04             	shl    $0x4,%eax
    999f:	89 c2                	mov    %eax,%edx
    99a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    99a4:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    99a7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    99aa:	89 d0                	mov    %edx,%eax
    99ac:	c1 e0 03             	shl    $0x3,%eax
    99af:	01 d0                	add    %edx,%eax
    99b1:	c1 e0 04             	shl    $0x4,%eax
    99b4:	89 c2                	mov    %eax,%edx
    99b6:	8b 45 0c             	mov    0xc(%ebp),%eax
    99b9:	01 c2                	add    %eax,%edx
    99bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99be:	dd 04 c2             	fldl   (%edx,%eax,8)
    99c1:	dd 5d c0             	fstpl  -0x40(%ebp)
    99c4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    99c7:	89 d0                	mov    %edx,%eax
    99c9:	c1 e0 03             	shl    $0x3,%eax
    99cc:	01 d0                	add    %edx,%eax
    99ce:	c1 e0 03             	shl    $0x3,%eax
    99d1:	89 c2                	mov    %eax,%edx
    99d3:	8b 45 08             	mov    0x8(%ebp),%eax
    99d6:	01 c2                	add    %eax,%edx
    99d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99db:	8b 04 82             	mov    (%edx,%eax,4),%eax
    99de:	89 04 24             	mov    %eax,(%esp)
    99e1:	e8 47 bd ff ff       	call   572d <abs>
    99e6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    99e9:	db 45 d4             	fildl  -0x2c(%ebp)
    99ec:	dd 05 f8 e7 00 00    	fldl   0xe7f8
    99f2:	dd 5c 24 08          	fstpl  0x8(%esp)
    99f6:	dd 1c 24             	fstpl  (%esp)
    99f9:	e8 38 be ff ff       	call   5836 <pow>
    99fe:	dc 4d c0             	fmull  -0x40(%ebp)
    9a01:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9a04:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    9a07:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    9a0b:	74 37                	je     9a44 <III_dequantize_sample+0x6d6>
    9a0d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9a10:	89 d0                	mov    %edx,%eax
    9a12:	c1 e0 03             	shl    $0x3,%eax
    9a15:	01 d0                	add    %edx,%eax
    9a17:	c1 e0 04             	shl    $0x4,%eax
    9a1a:	89 c2                	mov    %eax,%edx
    9a1c:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a1f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9a22:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9a25:	89 d0                	mov    %edx,%eax
    9a27:	c1 e0 03             	shl    $0x3,%eax
    9a2a:	01 d0                	add    %edx,%eax
    9a2c:	c1 e0 04             	shl    $0x4,%eax
    9a2f:	89 c2                	mov    %eax,%edx
    9a31:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a34:	01 c2                	add    %eax,%edx
    9a36:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9a39:	dd 04 c2             	fldl   (%edx,%eax,8)
    9a3c:	d9 e0                	fchs   
    9a3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9a41:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    9a44:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9a48:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9a4c:	0f 8e d3 f9 ff ff    	jle    9425 <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    9a52:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9a56:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    9a5a:	0f 8e b9 f9 ff ff    	jle    9419 <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    9a60:	83 c4 50             	add    $0x50,%esp
    9a63:	5b                   	pop    %ebx
    9a64:	5e                   	pop    %esi
    9a65:	5d                   	pop    %ebp
    9a66:	c3                   	ret    

00009a67 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9a67:	55                   	push   %ebp
    9a68:	89 e5                	mov    %esp,%ebp
    9a6a:	57                   	push   %edi
    9a6b:	56                   	push   %esi
    9a6c:	53                   	push   %ebx
    9a6d:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    9a70:	8b 45 14             	mov    0x14(%ebp),%eax
    9a73:	8b 00                	mov    (%eax),%eax
    9a75:	8b 40 10             	mov    0x10(%eax),%eax
    9a78:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    9a7b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9a82:	eb 33                	jmp    9ab7 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    9a84:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9a8b:	eb 20                	jmp    9aad <III_reorder+0x46>
         ro[sb][ss] = 0;
    9a8d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9a90:	89 d0                	mov    %edx,%eax
    9a92:	c1 e0 03             	shl    $0x3,%eax
    9a95:	01 d0                	add    %edx,%eax
    9a97:	c1 e0 04             	shl    $0x4,%eax
    9a9a:	89 c2                	mov    %eax,%edx
    9a9c:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a9f:	01 c2                	add    %eax,%edx
    9aa1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9aa4:	d9 ee                	fldz   
    9aa6:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    9aa9:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    9aad:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9ab1:	7e da                	jle    9a8d <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    9ab3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9ab7:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    9abb:	7e c7                	jle    9a84 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    9abd:	8b 45 10             	mov    0x10(%ebp),%eax
    9ac0:	8b 40 10             	mov    0x10(%eax),%eax
    9ac3:	85 c0                	test   %eax,%eax
    9ac5:	0f 84 af 03 00 00    	je     9e7a <III_reorder+0x413>
    9acb:	8b 45 10             	mov    0x10(%ebp),%eax
    9ace:	8b 40 14             	mov    0x14(%eax),%eax
    9ad1:	83 f8 02             	cmp    $0x2,%eax
    9ad4:	0f 85 a0 03 00 00    	jne    9e7a <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    9ada:	8b 45 10             	mov    0x10(%ebp),%eax
    9add:	8b 40 18             	mov    0x18(%eax),%eax
    9ae0:	85 c0                	test   %eax,%eax
    9ae2:	0f 84 00 02 00 00    	je     9ce8 <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    9ae8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9aef:	eb 4c                	jmp    9b3d <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    9af1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9af8:	eb 39                	jmp    9b33 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    9afa:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9afd:	89 d0                	mov    %edx,%eax
    9aff:	c1 e0 03             	shl    $0x3,%eax
    9b02:	01 d0                	add    %edx,%eax
    9b04:	c1 e0 04             	shl    $0x4,%eax
    9b07:	89 c2                	mov    %eax,%edx
    9b09:	8b 45 0c             	mov    0xc(%ebp),%eax
    9b0c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9b0f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9b12:	89 d0                	mov    %edx,%eax
    9b14:	c1 e0 03             	shl    $0x3,%eax
    9b17:	01 d0                	add    %edx,%eax
    9b19:	c1 e0 04             	shl    $0x4,%eax
    9b1c:	89 c2                	mov    %eax,%edx
    9b1e:	8b 45 08             	mov    0x8(%ebp),%eax
    9b21:	01 c2                	add    %eax,%edx
    9b23:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9b26:	dd 04 c2             	fldl   (%edx,%eax,8)
    9b29:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9b2c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    9b2f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    9b33:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9b37:	7e c1                	jle    9afa <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    9b39:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9b3d:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    9b41:	7e ae                	jle    9af1 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    9b43:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    9b4a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9b4d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9b53:	05 9c 03 01 00       	add    $0x1039c,%eax
    9b58:	8b 40 0c             	mov    0xc(%eax),%eax
    9b5b:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    9b5e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9b61:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9b67:	05 a0 03 01 00       	add    $0x103a0,%eax
    9b6c:	8b 40 0c             	mov    0xc(%eax),%eax
    9b6f:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9b72:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    9b75:	e9 5f 01 00 00       	jmp    9cd9 <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9b7a:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    9b81:	e9 fd 00 00 00       	jmp    9c83 <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    9b86:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    9b8d:	e9 e1 00 00 00       	jmp    9c73 <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    9b92:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b95:	89 d0                	mov    %edx,%eax
    9b97:	01 c0                	add    %eax,%eax
    9b99:	01 c2                	add    %eax,%edx
    9b9b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9b9e:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    9ba2:	01 c2                	add    %eax,%edx
    9ba4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9ba7:	01 d0                	add    %edx,%eax
    9ba9:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    9bac:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9baf:	89 d0                	mov    %edx,%eax
    9bb1:	01 c0                	add    %eax,%eax
    9bb3:	01 c2                	add    %eax,%edx
    9bb5:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9bb8:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9bbb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    9bbe:	89 d0                	mov    %edx,%eax
    9bc0:	01 c0                	add    %eax,%eax
    9bc2:	01 d0                	add    %edx,%eax
    9bc4:	01 c8                	add    %ecx,%eax
    9bc6:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9bc9:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    9bcc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9bd1:	89 c8                	mov    %ecx,%eax
    9bd3:	f7 ea                	imul   %edx
    9bd5:	c1 fa 02             	sar    $0x2,%edx
    9bd8:	89 c8                	mov    %ecx,%eax
    9bda:	c1 f8 1f             	sar    $0x1f,%eax
    9bdd:	29 c2                	sub    %eax,%edx
    9bdf:	89 d0                	mov    %edx,%eax
    9be1:	89 c2                	mov    %eax,%edx
    9be3:	89 d0                	mov    %edx,%eax
    9be5:	c1 e0 03             	shl    $0x3,%eax
    9be8:	01 d0                	add    %edx,%eax
    9bea:	c1 e0 04             	shl    $0x4,%eax
    9bed:	89 c2                	mov    %eax,%edx
    9bef:	8b 45 0c             	mov    0xc(%ebp),%eax
    9bf2:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9bf5:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    9bf8:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9bfd:	89 d8                	mov    %ebx,%eax
    9bff:	f7 ea                	imul   %edx
    9c01:	c1 fa 02             	sar    $0x2,%edx
    9c04:	89 d8                	mov    %ebx,%eax
    9c06:	c1 f8 1f             	sar    $0x1f,%eax
    9c09:	89 d1                	mov    %edx,%ecx
    9c0b:	29 c1                	sub    %eax,%ecx
    9c0d:	89 c8                	mov    %ecx,%eax
    9c0f:	c1 e0 03             	shl    $0x3,%eax
    9c12:	01 c8                	add    %ecx,%eax
    9c14:	01 c0                	add    %eax,%eax
    9c16:	29 c3                	sub    %eax,%ebx
    9c18:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    9c1a:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9c1d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9c22:	89 d8                	mov    %ebx,%eax
    9c24:	f7 ea                	imul   %edx
    9c26:	c1 fa 02             	sar    $0x2,%edx
    9c29:	89 d8                	mov    %ebx,%eax
    9c2b:	c1 f8 1f             	sar    $0x1f,%eax
    9c2e:	29 c2                	sub    %eax,%edx
    9c30:	89 d0                	mov    %edx,%eax
    9c32:	89 c2                	mov    %eax,%edx
    9c34:	89 d0                	mov    %edx,%eax
    9c36:	c1 e0 03             	shl    $0x3,%eax
    9c39:	01 d0                	add    %edx,%eax
    9c3b:	c1 e0 04             	shl    $0x4,%eax
    9c3e:	89 c2                	mov    %eax,%edx
    9c40:	8b 45 08             	mov    0x8(%ebp),%eax
    9c43:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9c46:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9c49:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9c4e:	89 d8                	mov    %ebx,%eax
    9c50:	f7 ea                	imul   %edx
    9c52:	c1 fa 02             	sar    $0x2,%edx
    9c55:	89 d8                	mov    %ebx,%eax
    9c57:	c1 f8 1f             	sar    $0x1f,%eax
    9c5a:	29 c2                	sub    %eax,%edx
    9c5c:	89 d0                	mov    %edx,%eax
    9c5e:	c1 e0 03             	shl    $0x3,%eax
    9c61:	01 d0                	add    %edx,%eax
    9c63:	01 c0                	add    %eax,%eax
    9c65:	29 c3                	sub    %eax,%ebx
    9c67:	89 da                	mov    %ebx,%edx
    9c69:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9c6c:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    9c6f:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    9c73:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9c76:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    9c79:	0f 8c 13 ff ff ff    	jl     9b92 <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9c7f:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    9c83:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    9c87:	0f 8e f9 fe ff ff    	jle    9b86 <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    9c8d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9c91:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9c94:	89 d0                	mov    %edx,%eax
    9c96:	c1 e0 03             	shl    $0x3,%eax
    9c99:	01 d0                	add    %edx,%eax
    9c9b:	c1 e0 02             	shl    $0x2,%eax
    9c9e:	01 d0                	add    %edx,%eax
    9ca0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9ca3:	01 d0                	add    %edx,%eax
    9ca5:	83 c0 14             	add    $0x14,%eax
    9ca8:	8b 04 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%eax
    9caf:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    9cb2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9cb5:	8d 48 01             	lea    0x1(%eax),%ecx
    9cb8:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9cbb:	89 d0                	mov    %edx,%eax
    9cbd:	c1 e0 03             	shl    $0x3,%eax
    9cc0:	01 d0                	add    %edx,%eax
    9cc2:	c1 e0 02             	shl    $0x2,%eax
    9cc5:	01 d0                	add    %edx,%eax
    9cc7:	01 c8                	add    %ecx,%eax
    9cc9:	83 c0 14             	add    $0x14,%eax
    9ccc:	8b 04 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%eax
    9cd3:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9cd6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    9cd9:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    9cdd:	0f 8e 97 fe ff ff    	jle    9b7a <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    9ce3:	e9 ed 01 00 00       	jmp    9ed5 <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    9ce8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9cef:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9cf6:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9cf9:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9cff:	05 94 03 01 00       	add    $0x10394,%eax
    9d04:	8b 40 0c             	mov    0xc(%eax),%eax
    9d07:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    9d0a:	e9 5f 01 00 00       	jmp    9e6e <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9d0f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    9d16:	e9 fd 00 00 00       	jmp    9e18 <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    9d1b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    9d22:	e9 e1 00 00 00       	jmp    9e08 <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    9d27:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9d2a:	89 d0                	mov    %edx,%eax
    9d2c:	01 c0                	add    %eax,%eax
    9d2e:	01 c2                	add    %eax,%edx
    9d30:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9d33:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    9d37:	01 c2                	add    %eax,%edx
    9d39:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9d3c:	01 d0                	add    %edx,%eax
    9d3e:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    9d41:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9d44:	89 d0                	mov    %edx,%eax
    9d46:	01 c0                	add    %eax,%eax
    9d48:	01 c2                	add    %eax,%edx
    9d4a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9d4d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9d50:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    9d53:	89 d0                	mov    %edx,%eax
    9d55:	01 c0                	add    %eax,%eax
    9d57:	01 d0                	add    %edx,%eax
    9d59:	01 c8                	add    %ecx,%eax
    9d5b:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9d5e:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    9d61:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9d66:	89 c8                	mov    %ecx,%eax
    9d68:	f7 ea                	imul   %edx
    9d6a:	c1 fa 02             	sar    $0x2,%edx
    9d6d:	89 c8                	mov    %ecx,%eax
    9d6f:	c1 f8 1f             	sar    $0x1f,%eax
    9d72:	29 c2                	sub    %eax,%edx
    9d74:	89 d0                	mov    %edx,%eax
    9d76:	89 c2                	mov    %eax,%edx
    9d78:	89 d0                	mov    %edx,%eax
    9d7a:	c1 e0 03             	shl    $0x3,%eax
    9d7d:	01 d0                	add    %edx,%eax
    9d7f:	c1 e0 04             	shl    $0x4,%eax
    9d82:	89 c2                	mov    %eax,%edx
    9d84:	8b 45 0c             	mov    0xc(%ebp),%eax
    9d87:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9d8a:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    9d8d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9d92:	89 d8                	mov    %ebx,%eax
    9d94:	f7 ea                	imul   %edx
    9d96:	c1 fa 02             	sar    $0x2,%edx
    9d99:	89 d8                	mov    %ebx,%eax
    9d9b:	c1 f8 1f             	sar    $0x1f,%eax
    9d9e:	89 d1                	mov    %edx,%ecx
    9da0:	29 c1                	sub    %eax,%ecx
    9da2:	89 c8                	mov    %ecx,%eax
    9da4:	c1 e0 03             	shl    $0x3,%eax
    9da7:	01 c8                	add    %ecx,%eax
    9da9:	01 c0                	add    %eax,%eax
    9dab:	29 c3                	sub    %eax,%ebx
    9dad:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    9daf:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9db2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9db7:	89 d8                	mov    %ebx,%eax
    9db9:	f7 ea                	imul   %edx
    9dbb:	c1 fa 02             	sar    $0x2,%edx
    9dbe:	89 d8                	mov    %ebx,%eax
    9dc0:	c1 f8 1f             	sar    $0x1f,%eax
    9dc3:	29 c2                	sub    %eax,%edx
    9dc5:	89 d0                	mov    %edx,%eax
    9dc7:	89 c2                	mov    %eax,%edx
    9dc9:	89 d0                	mov    %edx,%eax
    9dcb:	c1 e0 03             	shl    $0x3,%eax
    9dce:	01 d0                	add    %edx,%eax
    9dd0:	c1 e0 04             	shl    $0x4,%eax
    9dd3:	89 c2                	mov    %eax,%edx
    9dd5:	8b 45 08             	mov    0x8(%ebp),%eax
    9dd8:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9ddb:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9dde:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9de3:	89 d8                	mov    %ebx,%eax
    9de5:	f7 ea                	imul   %edx
    9de7:	c1 fa 02             	sar    $0x2,%edx
    9dea:	89 d8                	mov    %ebx,%eax
    9dec:	c1 f8 1f             	sar    $0x1f,%eax
    9def:	29 c2                	sub    %eax,%edx
    9df1:	89 d0                	mov    %edx,%eax
    9df3:	c1 e0 03             	shl    $0x3,%eax
    9df6:	01 d0                	add    %edx,%eax
    9df8:	01 c0                	add    %eax,%eax
    9dfa:	29 c3                	sub    %eax,%ebx
    9dfc:	89 da                	mov    %ebx,%edx
    9dfe:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9e01:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    9e04:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    9e08:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9e0b:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    9e0e:	0f 8c 13 ff ff ff    	jl     9d27 <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9e14:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    9e18:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    9e1c:	0f 8e f9 fe ff ff    	jle    9d1b <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    9e22:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9e26:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9e29:	89 d0                	mov    %edx,%eax
    9e2b:	c1 e0 03             	shl    $0x3,%eax
    9e2e:	01 d0                	add    %edx,%eax
    9e30:	c1 e0 02             	shl    $0x2,%eax
    9e33:	01 d0                	add    %edx,%eax
    9e35:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9e38:	01 d0                	add    %edx,%eax
    9e3a:	83 c0 14             	add    $0x14,%eax
    9e3d:	8b 04 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%eax
    9e44:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    9e47:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e4a:	8d 48 01             	lea    0x1(%eax),%ecx
    9e4d:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9e50:	89 d0                	mov    %edx,%eax
    9e52:	c1 e0 03             	shl    $0x3,%eax
    9e55:	01 d0                	add    %edx,%eax
    9e57:	c1 e0 02             	shl    $0x2,%eax
    9e5a:	01 d0                	add    %edx,%eax
    9e5c:	01 c8                	add    %ecx,%eax
    9e5e:	83 c0 14             	add    $0x14,%eax
    9e61:	8b 04 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%eax
    9e68:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9e6b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    9e6e:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    9e72:	0f 8e 97 fe ff ff    	jle    9d0f <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    9e78:	eb 5b                	jmp    9ed5 <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9e7a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9e81:	eb 4c                	jmp    9ecf <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    9e83:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9e8a:	eb 39                	jmp    9ec5 <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    9e8c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9e8f:	89 d0                	mov    %edx,%eax
    9e91:	c1 e0 03             	shl    $0x3,%eax
    9e94:	01 d0                	add    %edx,%eax
    9e96:	c1 e0 04             	shl    $0x4,%eax
    9e99:	89 c2                	mov    %eax,%edx
    9e9b:	8b 45 0c             	mov    0xc(%ebp),%eax
    9e9e:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9ea1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9ea4:	89 d0                	mov    %edx,%eax
    9ea6:	c1 e0 03             	shl    $0x3,%eax
    9ea9:	01 d0                	add    %edx,%eax
    9eab:	c1 e0 04             	shl    $0x4,%eax
    9eae:	89 c2                	mov    %eax,%edx
    9eb0:	8b 45 08             	mov    0x8(%ebp),%eax
    9eb3:	01 c2                	add    %eax,%edx
    9eb5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9eb8:	dd 04 c2             	fldl   (%edx,%eax,8)
    9ebb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9ebe:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    9ec1:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    9ec5:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9ec9:	7e c1                	jle    9e8c <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9ecb:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9ecf:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    9ed3:	7e ae                	jle    9e83 <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    9ed5:	83 c4 34             	add    $0x34,%esp
    9ed8:	5b                   	pop    %ebx
    9ed9:	5e                   	pop    %esi
    9eda:	5f                   	pop    %edi
    9edb:	5d                   	pop    %ebp
    9edc:	c3                   	ret    

00009edd <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9edd:	55                   	push   %ebp
    9ede:	89 e5                	mov    %esp,%ebp
    9ee0:	56                   	push   %esi
    9ee1:	53                   	push   %ebx
    9ee2:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    9ee8:	8b 45 18             	mov    0x18(%ebp),%eax
    9eeb:	8b 00                	mov    (%eax),%eax
    9eed:	8b 40 10             	mov    0x10(%eax),%eax
    9ef0:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    9ef3:	8b 45 18             	mov    0x18(%ebp),%eax
    9ef6:	8b 40 08             	mov    0x8(%eax),%eax
    9ef9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9efc:	8b 45 18             	mov    0x18(%ebp),%eax
    9eff:	8b 00                	mov    (%eax),%eax
    9f01:	8b 40 1c             	mov    0x1c(%eax),%eax
    9f04:	83 f8 01             	cmp    $0x1,%eax
    9f07:	75 16                	jne    9f1f <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    9f09:	8b 45 18             	mov    0x18(%ebp),%eax
    9f0c:	8b 00                	mov    (%eax),%eax
    9f0e:	8b 40 20             	mov    0x20(%eax),%eax
    9f11:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9f14:	85 c0                	test   %eax,%eax
    9f16:	74 07                	je     9f1f <III_stereo+0x42>
    9f18:	b8 01 00 00 00       	mov    $0x1,%eax
    9f1d:	eb 05                	jmp    9f24 <III_stereo+0x47>
    9f1f:	b8 00 00 00 00       	mov    $0x0,%eax
    9f24:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9f27:	8b 45 18             	mov    0x18(%ebp),%eax
    9f2a:	8b 00                	mov    (%eax),%eax
    9f2c:	8b 40 1c             	mov    0x1c(%eax),%eax
    9f2f:	83 f8 01             	cmp    $0x1,%eax
    9f32:	75 16                	jne    9f4a <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    9f34:	8b 45 18             	mov    0x18(%ebp),%eax
    9f37:	8b 00                	mov    (%eax),%eax
    9f39:	8b 40 20             	mov    0x20(%eax),%eax
    9f3c:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9f3f:	85 c0                	test   %eax,%eax
    9f41:	74 07                	je     9f4a <III_stereo+0x6d>
    9f43:	b8 01 00 00 00       	mov    $0x1,%eax
    9f48:	eb 05                	jmp    9f4f <III_stereo+0x72>
    9f4a:	b8 00 00 00 00       	mov    $0x0,%eax
    9f4f:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9f52:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9f59:	eb 12                	jmp    9f6d <III_stereo+0x90>
      is_pos[i] = 7;
    9f5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f5e:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    9f65:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9f69:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9f6d:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    9f74:	7e e5                	jle    9f5b <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    9f76:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    9f7a:	0f 85 18 0a 00 00    	jne    a998 <III_stereo+0xabb>
    9f80:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9f84:	0f 84 0e 0a 00 00    	je     a998 <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    9f8a:	8b 45 14             	mov    0x14(%ebp),%eax
    9f8d:	8b 40 10             	mov    0x10(%eax),%eax
    9f90:	85 c0                	test   %eax,%eax
    9f92:	0f 84 10 08 00 00    	je     a7a8 <III_stereo+0x8cb>
    9f98:	8b 45 14             	mov    0x14(%ebp),%eax
    9f9b:	8b 40 14             	mov    0x14(%eax),%eax
    9f9e:	83 f8 02             	cmp    $0x2,%eax
    9fa1:	0f 85 01 08 00 00    	jne    a7a8 <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    9fa7:	8b 45 14             	mov    0x14(%ebp),%eax
    9faa:	8b 40 18             	mov    0x18(%eax),%eax
    9fad:	85 c0                	test   %eax,%eax
    9faf:	0f 84 d0 04 00 00    	je     a485 <III_stereo+0x5a8>
         {  int max_sfb = 0;
    9fb5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    9fbc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9fc3:	e9 1b 03 00 00       	jmp    a2e3 <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    9fc8:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    9fcf:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9fd6:	e9 0f 01 00 00       	jmp    a0ea <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9fdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fde:	8d 48 01             	lea    0x1(%eax),%ecx
    9fe1:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9fe4:	89 d0                	mov    %edx,%eax
    9fe6:	c1 e0 03             	shl    $0x3,%eax
    9fe9:	01 d0                	add    %edx,%eax
    9feb:	c1 e0 02             	shl    $0x2,%eax
    9fee:	01 d0                	add    %edx,%eax
    9ff0:	01 c8                	add    %ecx,%eax
    9ff2:	83 c0 14             	add    $0x14,%eax
    9ff5:	8b 0c 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%ecx
    9ffc:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9fff:	89 d0                	mov    %edx,%eax
    a001:	c1 e0 03             	shl    $0x3,%eax
    a004:	01 d0                	add    %edx,%eax
    a006:	c1 e0 02             	shl    $0x2,%eax
    a009:	01 d0                	add    %edx,%eax
    a00b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a00e:	01 d0                	add    %edx,%eax
    a010:	83 c0 14             	add    $0x14,%eax
    a013:	8b 04 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%eax
    a01a:	29 c1                	sub    %eax,%ecx
    a01c:	89 c8                	mov    %ecx,%eax
    a01e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    a021:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a024:	89 d0                	mov    %edx,%eax
    a026:	c1 e0 03             	shl    $0x3,%eax
    a029:	01 d0                	add    %edx,%eax
    a02b:	c1 e0 02             	shl    $0x2,%eax
    a02e:	01 d0                	add    %edx,%eax
    a030:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a033:	01 d0                	add    %edx,%eax
    a035:	83 c0 14             	add    $0x14,%eax
    a038:	8b 14 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%edx
    a03f:	89 d0                	mov    %edx,%eax
    a041:	01 c0                	add    %eax,%eax
    a043:	01 c2                	add    %eax,%edx
    a045:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a048:	83 c0 01             	add    $0x1,%eax
    a04b:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    a04f:	01 d0                	add    %edx,%eax
    a051:	83 e8 01             	sub    $0x1,%eax
    a054:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    a057:	e9 80 00 00 00       	jmp    a0dc <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    a05c:	8b 45 08             	mov    0x8(%ebp),%eax
    a05f:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    a065:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a068:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a06d:	89 c8                	mov    %ecx,%eax
    a06f:	f7 ea                	imul   %edx
    a071:	c1 fa 02             	sar    $0x2,%edx
    a074:	89 c8                	mov    %ecx,%eax
    a076:	c1 f8 1f             	sar    $0x1f,%eax
    a079:	89 d3                	mov    %edx,%ebx
    a07b:	29 c3                	sub    %eax,%ebx
    a07d:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a080:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a085:	89 c8                	mov    %ecx,%eax
    a087:	f7 ea                	imul   %edx
    a089:	c1 fa 02             	sar    $0x2,%edx
    a08c:	89 c8                	mov    %ecx,%eax
    a08e:	c1 f8 1f             	sar    $0x1f,%eax
    a091:	29 c2                	sub    %eax,%edx
    a093:	89 d0                	mov    %edx,%eax
    a095:	c1 e0 03             	shl    $0x3,%eax
    a098:	01 d0                	add    %edx,%eax
    a09a:	01 c0                	add    %eax,%eax
    a09c:	29 c1                	sub    %eax,%ecx
    a09e:	89 ca                	mov    %ecx,%edx
    a0a0:	89 d8                	mov    %ebx,%eax
    a0a2:	c1 e0 03             	shl    $0x3,%eax
    a0a5:	01 d8                	add    %ebx,%eax
    a0a7:	01 c0                	add    %eax,%eax
    a0a9:	01 d0                	add    %edx,%eax
    a0ab:	dd 04 c6             	fldl   (%esi,%eax,8)
    a0ae:	d9 ee                	fldz   
    a0b0:	df e9                	fucomip %st(1),%st
    a0b2:	7a 0a                	jp     a0be <III_stereo+0x1e1>
    a0b4:	d9 ee                	fldz   
    a0b6:	df e9                	fucomip %st(1),%st
    a0b8:	dd d8                	fstp   %st(0)
    a0ba:	74 18                	je     a0d4 <III_stereo+0x1f7>
    a0bc:	eb 02                	jmp    a0c0 <III_stereo+0x1e3>
    a0be:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    a0c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0c3:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    a0c6:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    a0cd:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    a0d4:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    a0d8:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    a0dc:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    a0e0:	0f 8f 76 ff ff ff    	jg     a05c <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    a0e6:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    a0ea:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    a0ee:	0f 8f e7 fe ff ff    	jg     9fdb <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    a0f4:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a0f7:	83 c0 01             	add    $0x1,%eax
    a0fa:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    a0fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a100:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a103:	7e 0b                	jle    a110 <III_stereo+0x233>
                  max_sfb = sfb;
    a105:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a108:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    a10b:	e9 f5 00 00 00       	jmp    a205 <III_stereo+0x328>
    a110:	e9 f0 00 00 00       	jmp    a205 <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a115:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a118:	8d 48 01             	lea    0x1(%eax),%ecx
    a11b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a11e:	89 d0                	mov    %edx,%eax
    a120:	c1 e0 03             	shl    $0x3,%eax
    a123:	01 d0                	add    %edx,%eax
    a125:	c1 e0 02             	shl    $0x2,%eax
    a128:	01 d0                	add    %edx,%eax
    a12a:	01 c8                	add    %ecx,%eax
    a12c:	83 c0 14             	add    $0x14,%eax
    a12f:	8b 0c 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%ecx
    a136:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a139:	89 d0                	mov    %edx,%eax
    a13b:	c1 e0 03             	shl    $0x3,%eax
    a13e:	01 d0                	add    %edx,%eax
    a140:	c1 e0 02             	shl    $0x2,%eax
    a143:	01 d0                	add    %edx,%eax
    a145:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a148:	01 d0                	add    %edx,%eax
    a14a:	83 c0 14             	add    $0x14,%eax
    a14d:	8b 04 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%eax
    a154:	29 c1                	sub    %eax,%ecx
    a156:	89 c8                	mov    %ecx,%eax
    a158:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    a15b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a15e:	89 d0                	mov    %edx,%eax
    a160:	c1 e0 03             	shl    $0x3,%eax
    a163:	01 d0                	add    %edx,%eax
    a165:	c1 e0 02             	shl    $0x2,%eax
    a168:	01 d0                	add    %edx,%eax
    a16a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a16d:	01 d0                	add    %edx,%eax
    a16f:	83 c0 14             	add    $0x14,%eax
    a172:	8b 14 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%edx
    a179:	89 d0                	mov    %edx,%eax
    a17b:	01 c0                	add    %eax,%eax
    a17d:	01 c2                	add    %eax,%edx
    a17f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a182:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a186:	01 d0                	add    %edx,%eax
    a188:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    a18b:	eb 6e                	jmp    a1fb <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    a18d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    a190:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a193:	89 d0                	mov    %edx,%eax
    a195:	01 c0                	add    %eax,%eax
    a197:	01 d0                	add    %edx,%eax
    a199:	c1 e0 02             	shl    $0x2,%eax
    a19c:	01 d0                	add    %edx,%eax
    a19e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a1a1:	01 d0                	add    %edx,%eax
    a1a3:	83 c0 52             	add    $0x52,%eax
    a1a6:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    a1aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a1ad:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    a1b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a1b7:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a1be:	83 f8 07             	cmp    $0x7,%eax
    a1c1:	74 30                	je     a1f3 <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a1c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a1c6:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a1cd:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a1d3:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a1d9:	dd 05 00 e8 00 00    	fldl   0xe800
    a1df:	de c9                	fmulp  %st,%st(1)
    a1e1:	dd 1c 24             	fstpl  (%esp)
    a1e4:	e8 1d b6 ff ff       	call   5806 <tan>
    a1e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a1ec:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    a1f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    a1f7:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a1fb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a1ff:	7f 8c                	jg     a18d <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    a201:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    a205:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a209:	0f 8e 06 ff ff ff    	jle    a115 <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    a20f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a212:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a218:	05 bc 03 01 00       	add    $0x103bc,%eax
    a21d:	8b 50 0c             	mov    0xc(%eax),%edx
    a220:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a223:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a229:	05 b8 03 01 00       	add    $0x103b8,%eax
    a22e:	8b 40 0c             	mov    0xc(%eax),%eax
    a231:	29 c2                	sub    %eax,%edx
    a233:	89 d0                	mov    %edx,%eax
    a235:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    a238:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a23b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a241:	05 b8 03 01 00       	add    $0x103b8,%eax
    a246:	8b 50 0c             	mov    0xc(%eax),%edx
    a249:	89 d0                	mov    %edx,%eax
    a24b:	01 c0                	add    %eax,%eax
    a24d:	01 c2                	add    %eax,%edx
    a24f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a252:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a256:	01 d0                	add    %edx,%eax
    a258:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    a25b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a25e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a264:	05 c0 03 01 00       	add    $0x103c0,%eax
    a269:	8b 50 0c             	mov    0xc(%eax),%edx
    a26c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a26f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a275:	05 bc 03 01 00       	add    $0x103bc,%eax
    a27a:	8b 40 0c             	mov    0xc(%eax),%eax
    a27d:	29 c2                	sub    %eax,%edx
    a27f:	89 d0                	mov    %edx,%eax
    a281:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    a284:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a287:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a28d:	05 bc 03 01 00       	add    $0x103bc,%eax
    a292:	8b 50 0c             	mov    0xc(%eax),%edx
    a295:	89 d0                	mov    %edx,%eax
    a297:	01 c0                	add    %eax,%eax
    a299:	01 c2                	add    %eax,%edx
    a29b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a29e:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a2a2:	01 d0                	add    %edx,%eax
    a2a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    a2a7:	eb 30                	jmp    a2d9 <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    a2a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a2ac:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a2b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a2b6:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    a2bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a2c0:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a2c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a2ca:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    a2d1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    a2d5:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a2d9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a2dd:	7f ca                	jg     a2a9 <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    a2df:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a2e3:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    a2e7:	0f 8e db fc ff ff    	jle    9fc8 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    a2ed:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    a2f1:	0f 8f 89 01 00 00    	jg     a480 <III_stereo+0x5a3>
             {  i = 2;
    a2f7:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    a2fe:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    a305:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    a30c:	eb 63                	jmp    a371 <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    a30e:	8b 45 08             	mov    0x8(%ebp),%eax
    a311:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a317:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a31a:	89 d0                	mov    %edx,%eax
    a31c:	c1 e0 03             	shl    $0x3,%eax
    a31f:	01 d0                	add    %edx,%eax
    a321:	01 c0                	add    %eax,%eax
    a323:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a326:	01 d0                	add    %edx,%eax
    a328:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a32b:	d9 ee                	fldz   
    a32d:	df e9                	fucomip %st(1),%st
    a32f:	7a 0a                	jp     a33b <III_stereo+0x45e>
    a331:	d9 ee                	fldz   
    a333:	df e9                	fucomip %st(1),%st
    a335:	dd d8                	fstp   %st(0)
    a337:	74 23                	je     a35c <III_stereo+0x47f>
    a339:	eb 02                	jmp    a33d <III_stereo+0x460>
    a33b:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    a33d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a340:	89 d0                	mov    %edx,%eax
    a342:	c1 e0 03             	shl    $0x3,%eax
    a345:	01 d0                	add    %edx,%eax
    a347:	01 c0                	add    %eax,%eax
    a349:	89 c2                	mov    %eax,%edx
    a34b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a34e:	01 d0                	add    %edx,%eax
    a350:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    a353:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    a35a:	eb 15                	jmp    a371 <III_stereo+0x494>
                   } else
                   {  ss--;
    a35c:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    a360:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    a364:	79 0b                	jns    a371 <III_stereo+0x494>
                      {  i--;
    a366:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    a36a:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    a371:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    a375:	79 97                	jns    a30e <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    a377:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    a37e:	eb 04                	jmp    a384 <III_stereo+0x4a7>
                   i++;
    a380:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    a384:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a387:	89 d0                	mov    %edx,%eax
    a389:	c1 e0 03             	shl    $0x3,%eax
    a38c:	01 d0                	add    %edx,%eax
    a38e:	c1 e0 02             	shl    $0x2,%eax
    a391:	01 d0                	add    %edx,%eax
    a393:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a396:	01 d0                	add    %edx,%eax
    a398:	8b 04 85 40 03 01 00 	mov    0x10340(,%eax,4),%eax
    a39f:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    a3a2:	7e dc                	jle    a380 <III_stereo+0x4a3>
                   i++;
                sfb = i;
    a3a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a3a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    a3aa:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a3ad:	89 d0                	mov    %edx,%eax
    a3af:	c1 e0 03             	shl    $0x3,%eax
    a3b2:	01 d0                	add    %edx,%eax
    a3b4:	c1 e0 02             	shl    $0x2,%eax
    a3b7:	01 d0                	add    %edx,%eax
    a3b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a3bc:	01 d0                	add    %edx,%eax
    a3be:	8b 04 85 40 03 01 00 	mov    0x10340(,%eax,4),%eax
    a3c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    a3c8:	e9 a9 00 00 00       	jmp    a476 <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    a3cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a3d0:	8d 48 01             	lea    0x1(%eax),%ecx
    a3d3:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a3d6:	89 d0                	mov    %edx,%eax
    a3d8:	c1 e0 03             	shl    $0x3,%eax
    a3db:	01 d0                	add    %edx,%eax
    a3dd:	c1 e0 02             	shl    $0x2,%eax
    a3e0:	01 d0                	add    %edx,%eax
    a3e2:	01 c8                	add    %ecx,%eax
    a3e4:	8b 0c 85 40 03 01 00 	mov    0x10340(,%eax,4),%ecx
    a3eb:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a3ee:	89 d0                	mov    %edx,%eax
    a3f0:	c1 e0 03             	shl    $0x3,%eax
    a3f3:	01 d0                	add    %edx,%eax
    a3f5:	c1 e0 02             	shl    $0x2,%eax
    a3f8:	01 d0                	add    %edx,%eax
    a3fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a3fd:	01 d0                	add    %edx,%eax
    a3ff:	8b 04 85 40 03 01 00 	mov    0x10340(,%eax,4),%eax
    a406:	29 c1                	sub    %eax,%ecx
    a408:	89 c8                	mov    %ecx,%eax
    a40a:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    a40d:	eb 5d                	jmp    a46c <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    a40f:	8b 45 10             	mov    0x10(%ebp),%eax
    a412:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a415:	83 c2 3e             	add    $0x3e,%edx
    a418:	8b 14 90             	mov    (%eax,%edx,4),%edx
    a41b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a41e:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    a425:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a428:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a42f:	83 f8 07             	cmp    $0x7,%eax
    a432:	74 30                	je     a464 <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a434:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a437:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a43e:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a444:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a44a:	dd 05 00 e8 00 00    	fldl   0xe800
    a450:	de c9                	fmulp  %st,%st(1)
    a452:	dd 1c 24             	fstpl  (%esp)
    a455:	e8 ac b3 ff ff       	call   5806 <tan>
    a45a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a45d:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    a464:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    a468:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a46c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a470:	7f 9d                	jg     a40f <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    a472:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a476:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    a47a:	0f 8e 4d ff ff ff    	jle    a3cd <III_stereo+0x4f0>
    a480:	e9 1e 03 00 00       	jmp    a7a3 <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    a485:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a48c:	e9 08 03 00 00       	jmp    a799 <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    a491:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    a498:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a49f:	e9 0f 01 00 00       	jmp    a5b3 <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a4a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4a7:	8d 48 01             	lea    0x1(%eax),%ecx
    a4aa:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a4ad:	89 d0                	mov    %edx,%eax
    a4af:	c1 e0 03             	shl    $0x3,%eax
    a4b2:	01 d0                	add    %edx,%eax
    a4b4:	c1 e0 02             	shl    $0x2,%eax
    a4b7:	01 d0                	add    %edx,%eax
    a4b9:	01 c8                	add    %ecx,%eax
    a4bb:	83 c0 14             	add    $0x14,%eax
    a4be:	8b 0c 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%ecx
    a4c5:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a4c8:	89 d0                	mov    %edx,%eax
    a4ca:	c1 e0 03             	shl    $0x3,%eax
    a4cd:	01 d0                	add    %edx,%eax
    a4cf:	c1 e0 02             	shl    $0x2,%eax
    a4d2:	01 d0                	add    %edx,%eax
    a4d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a4d7:	01 d0                	add    %edx,%eax
    a4d9:	83 c0 14             	add    $0x14,%eax
    a4dc:	8b 04 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%eax
    a4e3:	29 c1                	sub    %eax,%ecx
    a4e5:	89 c8                	mov    %ecx,%eax
    a4e7:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    a4ea:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a4ed:	89 d0                	mov    %edx,%eax
    a4ef:	c1 e0 03             	shl    $0x3,%eax
    a4f2:	01 d0                	add    %edx,%eax
    a4f4:	c1 e0 02             	shl    $0x2,%eax
    a4f7:	01 d0                	add    %edx,%eax
    a4f9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a4fc:	01 d0                	add    %edx,%eax
    a4fe:	83 c0 14             	add    $0x14,%eax
    a501:	8b 14 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%edx
    a508:	89 d0                	mov    %edx,%eax
    a50a:	01 c0                	add    %eax,%eax
    a50c:	01 c2                	add    %eax,%edx
    a50e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a511:	83 c0 01             	add    $0x1,%eax
    a514:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    a518:	01 d0                	add    %edx,%eax
    a51a:	83 e8 01             	sub    $0x1,%eax
    a51d:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    a520:	e9 80 00 00 00       	jmp    a5a5 <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    a525:	8b 45 08             	mov    0x8(%ebp),%eax
    a528:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    a52e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a531:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a536:	89 c8                	mov    %ecx,%eax
    a538:	f7 ea                	imul   %edx
    a53a:	c1 fa 02             	sar    $0x2,%edx
    a53d:	89 c8                	mov    %ecx,%eax
    a53f:	c1 f8 1f             	sar    $0x1f,%eax
    a542:	89 d3                	mov    %edx,%ebx
    a544:	29 c3                	sub    %eax,%ebx
    a546:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a549:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a54e:	89 c8                	mov    %ecx,%eax
    a550:	f7 ea                	imul   %edx
    a552:	c1 fa 02             	sar    $0x2,%edx
    a555:	89 c8                	mov    %ecx,%eax
    a557:	c1 f8 1f             	sar    $0x1f,%eax
    a55a:	29 c2                	sub    %eax,%edx
    a55c:	89 d0                	mov    %edx,%eax
    a55e:	c1 e0 03             	shl    $0x3,%eax
    a561:	01 d0                	add    %edx,%eax
    a563:	01 c0                	add    %eax,%eax
    a565:	29 c1                	sub    %eax,%ecx
    a567:	89 ca                	mov    %ecx,%edx
    a569:	89 d8                	mov    %ebx,%eax
    a56b:	c1 e0 03             	shl    $0x3,%eax
    a56e:	01 d8                	add    %ebx,%eax
    a570:	01 c0                	add    %eax,%eax
    a572:	01 d0                	add    %edx,%eax
    a574:	dd 04 c6             	fldl   (%esi,%eax,8)
    a577:	d9 ee                	fldz   
    a579:	df e9                	fucomip %st(1),%st
    a57b:	7a 0a                	jp     a587 <III_stereo+0x6aa>
    a57d:	d9 ee                	fldz   
    a57f:	df e9                	fucomip %st(1),%st
    a581:	dd d8                	fstp   %st(0)
    a583:	74 18                	je     a59d <III_stereo+0x6c0>
    a585:	eb 02                	jmp    a589 <III_stereo+0x6ac>
    a587:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    a589:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a58c:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    a58f:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    a596:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    a59d:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    a5a1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    a5a5:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    a5a9:	0f 8f 76 ff ff ff    	jg     a525 <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    a5af:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    a5b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    a5b7:	0f 89 e7 fe ff ff    	jns    a4a4 <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    a5bd:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a5c0:	83 c0 01             	add    $0x1,%eax
    a5c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    a5c6:	e9 f0 00 00 00       	jmp    a6bb <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a5cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a5ce:	8d 48 01             	lea    0x1(%eax),%ecx
    a5d1:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a5d4:	89 d0                	mov    %edx,%eax
    a5d6:	c1 e0 03             	shl    $0x3,%eax
    a5d9:	01 d0                	add    %edx,%eax
    a5db:	c1 e0 02             	shl    $0x2,%eax
    a5de:	01 d0                	add    %edx,%eax
    a5e0:	01 c8                	add    %ecx,%eax
    a5e2:	83 c0 14             	add    $0x14,%eax
    a5e5:	8b 0c 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%ecx
    a5ec:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a5ef:	89 d0                	mov    %edx,%eax
    a5f1:	c1 e0 03             	shl    $0x3,%eax
    a5f4:	01 d0                	add    %edx,%eax
    a5f6:	c1 e0 02             	shl    $0x2,%eax
    a5f9:	01 d0                	add    %edx,%eax
    a5fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a5fe:	01 d0                	add    %edx,%eax
    a600:	83 c0 14             	add    $0x14,%eax
    a603:	8b 04 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%eax
    a60a:	29 c1                	sub    %eax,%ecx
    a60c:	89 c8                	mov    %ecx,%eax
    a60e:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    a611:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a614:	89 d0                	mov    %edx,%eax
    a616:	c1 e0 03             	shl    $0x3,%eax
    a619:	01 d0                	add    %edx,%eax
    a61b:	c1 e0 02             	shl    $0x2,%eax
    a61e:	01 d0                	add    %edx,%eax
    a620:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a623:	01 d0                	add    %edx,%eax
    a625:	83 c0 14             	add    $0x14,%eax
    a628:	8b 14 85 4c 03 01 00 	mov    0x1034c(,%eax,4),%edx
    a62f:	89 d0                	mov    %edx,%eax
    a631:	01 c0                	add    %eax,%eax
    a633:	01 c2                	add    %eax,%edx
    a635:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a638:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a63c:	01 d0                	add    %edx,%eax
    a63e:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    a641:	eb 6e                	jmp    a6b1 <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    a643:	8b 4d 10             	mov    0x10(%ebp),%ecx
    a646:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a649:	89 d0                	mov    %edx,%eax
    a64b:	01 c0                	add    %eax,%eax
    a64d:	01 d0                	add    %edx,%eax
    a64f:	c1 e0 02             	shl    $0x2,%eax
    a652:	01 d0                	add    %edx,%eax
    a654:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a657:	01 d0                	add    %edx,%eax
    a659:	83 c0 52             	add    $0x52,%eax
    a65c:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    a660:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a663:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    a66a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a66d:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a674:	83 f8 07             	cmp    $0x7,%eax
    a677:	74 30                	je     a6a9 <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a679:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a67c:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a683:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a689:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a68f:	dd 05 00 e8 00 00    	fldl   0xe800
    a695:	de c9                	fmulp  %st,%st(1)
    a697:	dd 1c 24             	fstpl  (%esp)
    a69a:	e8 67 b1 ff ff       	call   5806 <tan>
    a69f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a6a2:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    a6a9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    a6ad:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a6b1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a6b5:	7f 8c                	jg     a643 <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    a6b7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    a6bb:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a6bf:	0f 8e 06 ff ff ff    	jle    a5cb <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    a6c5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a6c8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a6ce:	05 bc 03 01 00       	add    $0x103bc,%eax
    a6d3:	8b 50 0c             	mov    0xc(%eax),%edx
    a6d6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a6d9:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a6df:	05 b8 03 01 00       	add    $0x103b8,%eax
    a6e4:	8b 40 0c             	mov    0xc(%eax),%eax
    a6e7:	29 c2                	sub    %eax,%edx
    a6e9:	89 d0                	mov    %edx,%eax
    a6eb:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    a6ee:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a6f1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a6f7:	05 b8 03 01 00       	add    $0x103b8,%eax
    a6fc:	8b 50 0c             	mov    0xc(%eax),%edx
    a6ff:	89 d0                	mov    %edx,%eax
    a701:	01 c0                	add    %eax,%eax
    a703:	01 c2                	add    %eax,%edx
    a705:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a708:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a70c:	01 d0                	add    %edx,%eax
    a70e:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    a711:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a714:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a71a:	05 c0 03 01 00       	add    $0x103c0,%eax
    a71f:	8b 50 0c             	mov    0xc(%eax),%edx
    a722:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a725:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a72b:	05 bc 03 01 00       	add    $0x103bc,%eax
    a730:	8b 40 0c             	mov    0xc(%eax),%eax
    a733:	29 c2                	sub    %eax,%edx
    a735:	89 d0                	mov    %edx,%eax
    a737:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    a73a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a73d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a743:	05 bc 03 01 00       	add    $0x103bc,%eax
    a748:	8b 50 0c             	mov    0xc(%eax),%edx
    a74b:	89 d0                	mov    %edx,%eax
    a74d:	01 c0                	add    %eax,%eax
    a74f:	01 c2                	add    %eax,%edx
    a751:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a754:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a758:	01 d0                	add    %edx,%eax
    a75a:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    a75d:	eb 30                	jmp    a78f <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    a75f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a762:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a769:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a76c:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    a773:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a776:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a77d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a780:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    a787:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    a78b:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a78f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a793:	7f ca                	jg     a75f <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    a795:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a799:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    a79d:	0f 8e ee fc ff ff    	jle    a491 <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    a7a3:	e9 f0 01 00 00       	jmp    a998 <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    a7a8:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    a7af:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    a7b6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    a7bd:	eb 63                	jmp    a822 <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    a7bf:	8b 45 08             	mov    0x8(%ebp),%eax
    a7c2:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a7c8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a7cb:	89 d0                	mov    %edx,%eax
    a7cd:	c1 e0 03             	shl    $0x3,%eax
    a7d0:	01 d0                	add    %edx,%eax
    a7d2:	01 c0                	add    %eax,%eax
    a7d4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a7d7:	01 d0                	add    %edx,%eax
    a7d9:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a7dc:	d9 ee                	fldz   
    a7de:	df e9                	fucomip %st(1),%st
    a7e0:	7a 0a                	jp     a7ec <III_stereo+0x90f>
    a7e2:	d9 ee                	fldz   
    a7e4:	df e9                	fucomip %st(1),%st
    a7e6:	dd d8                	fstp   %st(0)
    a7e8:	74 23                	je     a80d <III_stereo+0x930>
    a7ea:	eb 02                	jmp    a7ee <III_stereo+0x911>
    a7ec:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    a7ee:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a7f1:	89 d0                	mov    %edx,%eax
    a7f3:	c1 e0 03             	shl    $0x3,%eax
    a7f6:	01 d0                	add    %edx,%eax
    a7f8:	01 c0                	add    %eax,%eax
    a7fa:	89 c2                	mov    %eax,%edx
    a7fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a7ff:	01 d0                	add    %edx,%eax
    a801:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    a804:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    a80b:	eb 15                	jmp    a822 <III_stereo+0x945>
            } else
            {  ss--;
    a80d:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    a811:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    a815:	79 0b                	jns    a822 <III_stereo+0x945>
               {  i--;
    a817:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    a81b:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    a822:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    a826:	79 97                	jns    a7bf <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    a828:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    a82f:	eb 04                	jmp    a835 <III_stereo+0x958>
            i++;
    a831:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    a835:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a838:	89 d0                	mov    %edx,%eax
    a83a:	c1 e0 03             	shl    $0x3,%eax
    a83d:	01 d0                	add    %edx,%eax
    a83f:	c1 e0 02             	shl    $0x2,%eax
    a842:	01 d0                	add    %edx,%eax
    a844:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a847:	01 d0                	add    %edx,%eax
    a849:	8b 04 85 40 03 01 00 	mov    0x10340(,%eax,4),%eax
    a850:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    a853:	7e dc                	jle    a831 <III_stereo+0x954>
            i++;
         sfb = i;
    a855:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a858:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    a85b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a85e:	89 d0                	mov    %edx,%eax
    a860:	c1 e0 03             	shl    $0x3,%eax
    a863:	01 d0                	add    %edx,%eax
    a865:	c1 e0 02             	shl    $0x2,%eax
    a868:	01 d0                	add    %edx,%eax
    a86a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a86d:	01 d0                	add    %edx,%eax
    a86f:	8b 04 85 40 03 01 00 	mov    0x10340(,%eax,4),%eax
    a876:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    a879:	e9 a9 00 00 00       	jmp    a927 <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    a87e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a881:	8d 48 01             	lea    0x1(%eax),%ecx
    a884:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a887:	89 d0                	mov    %edx,%eax
    a889:	c1 e0 03             	shl    $0x3,%eax
    a88c:	01 d0                	add    %edx,%eax
    a88e:	c1 e0 02             	shl    $0x2,%eax
    a891:	01 d0                	add    %edx,%eax
    a893:	01 c8                	add    %ecx,%eax
    a895:	8b 0c 85 40 03 01 00 	mov    0x10340(,%eax,4),%ecx
    a89c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a89f:	89 d0                	mov    %edx,%eax
    a8a1:	c1 e0 03             	shl    $0x3,%eax
    a8a4:	01 d0                	add    %edx,%eax
    a8a6:	c1 e0 02             	shl    $0x2,%eax
    a8a9:	01 d0                	add    %edx,%eax
    a8ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a8ae:	01 d0                	add    %edx,%eax
    a8b0:	8b 04 85 40 03 01 00 	mov    0x10340(,%eax,4),%eax
    a8b7:	29 c1                	sub    %eax,%ecx
    a8b9:	89 c8                	mov    %ecx,%eax
    a8bb:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    a8be:	eb 5d                	jmp    a91d <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    a8c0:	8b 45 10             	mov    0x10(%ebp),%eax
    a8c3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a8c6:	83 c2 3e             	add    $0x3e,%edx
    a8c9:	8b 14 90             	mov    (%eax,%edx,4),%edx
    a8cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a8cf:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    a8d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a8d9:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a8e0:	83 f8 07             	cmp    $0x7,%eax
    a8e3:	74 30                	je     a915 <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a8e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a8e8:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a8ef:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a8f5:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a8fb:	dd 05 00 e8 00 00    	fldl   0xe800
    a901:	de c9                	fmulp  %st,%st(1)
    a903:	dd 1c 24             	fstpl  (%esp)
    a906:	e8 fb ae ff ff       	call   5806 <tan>
    a90b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a90e:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    a915:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    a919:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a91d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a921:	7f 9d                	jg     a8c0 <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    a923:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a927:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    a92b:	0f 8e 4d ff ff ff    	jle    a87e <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    a931:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a934:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a93a:	05 90 03 01 00       	add    $0x10390,%eax
    a93f:	8b 00                	mov    (%eax),%eax
    a941:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a944:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a947:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a94d:	05 94 03 01 00       	add    $0x10394,%eax
    a952:	8b 00                	mov    (%eax),%eax
    a954:	ba 40 02 00 00       	mov    $0x240,%edx
    a959:	29 c2                	sub    %eax,%edx
    a95b:	89 d0                	mov    %edx,%eax
    a95d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    a960:	eb 30                	jmp    a992 <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    a962:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a965:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a96c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a96f:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    a976:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a979:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a980:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a983:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    a98a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a98e:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a992:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a996:	7f ca                	jg     a962 <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a998:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a99f:	eb 55                	jmp    a9f6 <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    a9a1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a9a8:	eb 42                	jmp    a9ec <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    a9aa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a9b1:	eb 2f                	jmp    a9e2 <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    a9b3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a9b6:	89 d0                	mov    %edx,%eax
    a9b8:	c1 e0 03             	shl    $0x3,%eax
    a9bb:	01 d0                	add    %edx,%eax
    a9bd:	c1 e0 09             	shl    $0x9,%eax
    a9c0:	89 c2                	mov    %eax,%edx
    a9c2:	8b 45 0c             	mov    0xc(%ebp),%eax
    a9c5:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a9c8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a9cb:	89 d0                	mov    %edx,%eax
    a9cd:	c1 e0 03             	shl    $0x3,%eax
    a9d0:	01 d0                	add    %edx,%eax
    a9d2:	01 c0                	add    %eax,%eax
    a9d4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a9d7:	01 d0                	add    %edx,%eax
    a9d9:	d9 ee                	fldz   
    a9db:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    a9de:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a9e2:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a9e6:	7e cb                	jle    a9b3 <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    a9e8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a9ec:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a9f0:	7e b8                	jle    a9aa <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a9f2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a9f6:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    a9fa:	7e a5                	jle    a9a1 <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    a9fc:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    aa00:	0f 85 3d 02 00 00    	jne    ac43 <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    aa06:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    aa0d:	e9 25 02 00 00       	jmp    ac37 <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    aa12:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    aa19:	e9 0b 02 00 00       	jmp    ac29 <III_stereo+0xd4c>
            i = (sb*18)+ss;
    aa1e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa21:	89 d0                	mov    %edx,%eax
    aa23:	c1 e0 03             	shl    $0x3,%eax
    aa26:	01 d0                	add    %edx,%eax
    aa28:	01 c0                	add    %eax,%eax
    aa2a:	89 c2                	mov    %eax,%edx
    aa2c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    aa2f:	01 d0                	add    %edx,%eax
    aa31:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    aa34:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa37:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    aa3e:	83 f8 07             	cmp    $0x7,%eax
    aa41:	0f 85 2c 01 00 00    	jne    ab73 <III_stereo+0xc96>
               if ( ms_stereo ) {
    aa47:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    aa4b:	0f 84 b5 00 00 00    	je     ab06 <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    aa51:	8b 4d 08             	mov    0x8(%ebp),%ecx
    aa54:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa57:	89 d0                	mov    %edx,%eax
    aa59:	c1 e0 03             	shl    $0x3,%eax
    aa5c:	01 d0                	add    %edx,%eax
    aa5e:	01 c0                	add    %eax,%eax
    aa60:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aa63:	01 d0                	add    %edx,%eax
    aa65:	dd 04 c1             	fldl   (%ecx,%eax,8)
    aa68:	8b 45 08             	mov    0x8(%ebp),%eax
    aa6b:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    aa71:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa74:	89 d0                	mov    %edx,%eax
    aa76:	c1 e0 03             	shl    $0x3,%eax
    aa79:	01 d0                	add    %edx,%eax
    aa7b:	01 c0                	add    %eax,%eax
    aa7d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aa80:	01 d0                	add    %edx,%eax
    aa82:	dd 04 c1             	fldl   (%ecx,%eax,8)
    aa85:	de c1                	faddp  %st,%st(1)
    aa87:	dd 05 08 e8 00 00    	fldl   0xe808
    aa8d:	de f9                	fdivrp %st,%st(1)
    aa8f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    aa92:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa95:	89 d0                	mov    %edx,%eax
    aa97:	c1 e0 03             	shl    $0x3,%eax
    aa9a:	01 d0                	add    %edx,%eax
    aa9c:	01 c0                	add    %eax,%eax
    aa9e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aaa1:	01 d0                	add    %edx,%eax
    aaa3:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    aaa6:	8b 45 0c             	mov    0xc(%ebp),%eax
    aaa9:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    aaaf:	8b 4d 08             	mov    0x8(%ebp),%ecx
    aab2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aab5:	89 d0                	mov    %edx,%eax
    aab7:	c1 e0 03             	shl    $0x3,%eax
    aaba:	01 d0                	add    %edx,%eax
    aabc:	01 c0                	add    %eax,%eax
    aabe:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aac1:	01 d0                	add    %edx,%eax
    aac3:	dd 04 c1             	fldl   (%ecx,%eax,8)
    aac6:	8b 45 08             	mov    0x8(%ebp),%eax
    aac9:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    aacf:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aad2:	89 d0                	mov    %edx,%eax
    aad4:	c1 e0 03             	shl    $0x3,%eax
    aad7:	01 d0                	add    %edx,%eax
    aad9:	01 c0                	add    %eax,%eax
    aadb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aade:	01 d0                	add    %edx,%eax
    aae0:	dd 04 c1             	fldl   (%ecx,%eax,8)
    aae3:	de e9                	fsubrp %st,%st(1)
    aae5:	dd 05 08 e8 00 00    	fldl   0xe808
    aaeb:	de f9                	fdivrp %st,%st(1)
    aaed:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aaf0:	89 d0                	mov    %edx,%eax
    aaf2:	c1 e0 03             	shl    $0x3,%eax
    aaf5:	01 d0                	add    %edx,%eax
    aaf7:	01 c0                	add    %eax,%eax
    aaf9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aafc:	01 d0                	add    %edx,%eax
    aafe:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    ab01:	e9 1f 01 00 00       	jmp    ac25 <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    ab06:	8b 4d 08             	mov    0x8(%ebp),%ecx
    ab09:	8b 55 e8             	mov    -0x18(%ebp),%edx
    ab0c:	89 d0                	mov    %edx,%eax
    ab0e:	c1 e0 03             	shl    $0x3,%eax
    ab11:	01 d0                	add    %edx,%eax
    ab13:	01 c0                	add    %eax,%eax
    ab15:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    ab18:	01 d0                	add    %edx,%eax
    ab1a:	dd 04 c1             	fldl   (%ecx,%eax,8)
    ab1d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    ab20:	8b 55 e8             	mov    -0x18(%ebp),%edx
    ab23:	89 d0                	mov    %edx,%eax
    ab25:	c1 e0 03             	shl    $0x3,%eax
    ab28:	01 d0                	add    %edx,%eax
    ab2a:	01 c0                	add    %eax,%eax
    ab2c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    ab2f:	01 d0                	add    %edx,%eax
    ab31:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    ab34:	8b 45 0c             	mov    0xc(%ebp),%eax
    ab37:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    ab3d:	8b 45 08             	mov    0x8(%ebp),%eax
    ab40:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    ab46:	8b 55 e8             	mov    -0x18(%ebp),%edx
    ab49:	89 d0                	mov    %edx,%eax
    ab4b:	c1 e0 03             	shl    $0x3,%eax
    ab4e:	01 d0                	add    %edx,%eax
    ab50:	01 c0                	add    %eax,%eax
    ab52:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    ab55:	01 d0                	add    %edx,%eax
    ab57:	dd 04 c3             	fldl   (%ebx,%eax,8)
    ab5a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    ab5d:	89 d0                	mov    %edx,%eax
    ab5f:	c1 e0 03             	shl    $0x3,%eax
    ab62:	01 d0                	add    %edx,%eax
    ab64:	01 c0                	add    %eax,%eax
    ab66:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    ab69:	01 d0                	add    %edx,%eax
    ab6b:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    ab6e:	e9 b2 00 00 00       	jmp    ac25 <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    ab73:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    ab77:	0f 84 94 00 00 00    	je     ac11 <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    ab7d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    ab80:	8b 55 e8             	mov    -0x18(%ebp),%edx
    ab83:	89 d0                	mov    %edx,%eax
    ab85:	c1 e0 03             	shl    $0x3,%eax
    ab88:	01 d0                	add    %edx,%eax
    ab8a:	01 c0                	add    %eax,%eax
    ab8c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    ab8f:	01 d0                	add    %edx,%eax
    ab91:	dd 04 c1             	fldl   (%ecx,%eax,8)
    ab94:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ab97:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    ab9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aba1:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    aba8:	d9 e8                	fld1   
    abaa:	de c1                	faddp  %st,%st(1)
    abac:	de f9                	fdivrp %st,%st(1)
    abae:	de c9                	fmulp  %st,%st(1)
    abb0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    abb3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    abb6:	89 d0                	mov    %edx,%eax
    abb8:	c1 e0 03             	shl    $0x3,%eax
    abbb:	01 d0                	add    %edx,%eax
    abbd:	01 c0                	add    %eax,%eax
    abbf:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    abc2:	01 d0                	add    %edx,%eax
    abc4:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    abc7:	8b 45 0c             	mov    0xc(%ebp),%eax
    abca:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    abd0:	8b 4d 08             	mov    0x8(%ebp),%ecx
    abd3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    abd6:	89 d0                	mov    %edx,%eax
    abd8:	c1 e0 03             	shl    $0x3,%eax
    abdb:	01 d0                	add    %edx,%eax
    abdd:	01 c0                	add    %eax,%eax
    abdf:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    abe2:	01 d0                	add    %edx,%eax
    abe4:	dd 04 c1             	fldl   (%ecx,%eax,8)
    abe7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    abea:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    abf1:	d9 e8                	fld1   
    abf3:	de c1                	faddp  %st,%st(1)
    abf5:	d9 e8                	fld1   
    abf7:	de f1                	fdivp  %st,%st(1)
    abf9:	de c9                	fmulp  %st,%st(1)
    abfb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    abfe:	89 d0                	mov    %edx,%eax
    ac00:	c1 e0 03             	shl    $0x3,%eax
    ac03:	01 d0                	add    %edx,%eax
    ac05:	01 c0                	add    %eax,%eax
    ac07:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    ac0a:	01 d0                	add    %edx,%eax
    ac0c:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    ac0f:	eb 14                	jmp    ac25 <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    ac11:	c7 44 24 04 a0 d7 00 	movl   $0xd7a0,0x4(%esp)
    ac18:	00 
    ac19:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    ac20:	e8 3c a7 ff ff       	call   5361 <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    ac25:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    ac29:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    ac2d:	0f 8e eb fd ff ff    	jle    aa1e <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    ac33:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    ac37:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    ac3b:	0f 8e d1 fd ff ff    	jle    aa12 <III_stereo+0xb35>
    ac41:	eb 54                	jmp    ac97 <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    ac43:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    ac4a:	eb 45                	jmp    ac91 <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    ac4c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    ac53:	eb 32                	jmp    ac87 <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    ac55:	8b 4d 08             	mov    0x8(%ebp),%ecx
    ac58:	8b 55 e8             	mov    -0x18(%ebp),%edx
    ac5b:	89 d0                	mov    %edx,%eax
    ac5d:	c1 e0 03             	shl    $0x3,%eax
    ac60:	01 d0                	add    %edx,%eax
    ac62:	01 c0                	add    %eax,%eax
    ac64:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    ac67:	01 d0                	add    %edx,%eax
    ac69:	dd 04 c1             	fldl   (%ecx,%eax,8)
    ac6c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    ac6f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    ac72:	89 d0                	mov    %edx,%eax
    ac74:	c1 e0 03             	shl    $0x3,%eax
    ac77:	01 d0                	add    %edx,%eax
    ac79:	01 c0                	add    %eax,%eax
    ac7b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    ac7e:	01 d0                	add    %edx,%eax
    ac80:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    ac83:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    ac87:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    ac8b:	7e c8                	jle    ac55 <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    ac8d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    ac91:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    ac95:	7e b5                	jle    ac4c <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    ac97:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    ac9d:	5b                   	pop    %ebx
    ac9e:	5e                   	pop    %esi
    ac9f:	5d                   	pop    %ebp
    aca0:	c3                   	ret    

0000aca1 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    aca1:	55                   	push   %ebp
    aca2:	89 e5                	mov    %esp,%ebp
    aca4:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    aca7:	a1 a0 05 01 00       	mov    0x105a0,%eax
    acac:	85 c0                	test   %eax,%eax
    acae:	74 68                	je     ad18 <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    acb0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    acb7:	eb 4f                	jmp    ad08 <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    acb9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    acbc:	dd 04 c5 60 05 01 00 	fldl   0x10560(,%eax,8)
    acc3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    acc6:	dd 04 c5 60 05 01 00 	fldl   0x10560(,%eax,8)
    accd:	de c9                	fmulp  %st,%st(1)
    accf:	d9 e8                	fld1   
    acd1:	de c1                	faddp  %st,%st(1)
    acd3:	dd 1c 24             	fstpl  (%esp)
    acd6:	e8 de ac ff ff       	call   59b9 <sqrt>
    acdb:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    acde:	d9 e8                	fld1   
    ace0:	dc 75 e0             	fdivl  -0x20(%ebp)
    ace3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    ace6:	dd 1c c5 00 06 01 00 	fstpl  0x10600(,%eax,8)
         ca[i] = Ci[i]/sq;
    aced:	8b 45 e8             	mov    -0x18(%ebp),%eax
    acf0:	dd 04 c5 60 05 01 00 	fldl   0x10560(,%eax,8)
    acf7:	dc 75 e0             	fdivl  -0x20(%ebp)
    acfa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    acfd:	dd 1c c5 40 06 01 00 	fstpl  0x10640(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    ad04:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    ad08:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    ad0c:	7e ab                	jle    acb9 <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    ad0e:	c7 05 a0 05 01 00 00 	movl   $0x0,0x105a0
    ad15:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    ad18:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    ad1f:	eb 4c                	jmp    ad6d <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    ad21:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ad28:	eb 39                	jmp    ad63 <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    ad2a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ad2d:	89 d0                	mov    %edx,%eax
    ad2f:	c1 e0 03             	shl    $0x3,%eax
    ad32:	01 d0                	add    %edx,%eax
    ad34:	c1 e0 04             	shl    $0x4,%eax
    ad37:	89 c2                	mov    %eax,%edx
    ad39:	8b 45 0c             	mov    0xc(%ebp),%eax
    ad3c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    ad3f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ad42:	89 d0                	mov    %edx,%eax
    ad44:	c1 e0 03             	shl    $0x3,%eax
    ad47:	01 d0                	add    %edx,%eax
    ad49:	c1 e0 04             	shl    $0x4,%eax
    ad4c:	89 c2                	mov    %eax,%edx
    ad4e:	8b 45 08             	mov    0x8(%ebp),%eax
    ad51:	01 c2                	add    %eax,%edx
    ad53:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad56:	dd 04 c2             	fldl   (%edx,%eax,8)
    ad59:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad5c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    ad5f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ad63:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    ad67:	7e c1                	jle    ad2a <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    ad69:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    ad6d:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    ad71:	7e ae                	jle    ad21 <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    ad73:	8b 45 10             	mov    0x10(%ebp),%eax
    ad76:	8b 40 10             	mov    0x10(%eax),%eax
    ad79:	85 c0                	test   %eax,%eax
    ad7b:	74 1a                	je     ad97 <III_antialias+0xf6>
    ad7d:	8b 45 10             	mov    0x10(%ebp),%eax
    ad80:	8b 40 14             	mov    0x14(%eax),%eax
    ad83:	83 f8 02             	cmp    $0x2,%eax
    ad86:	75 0f                	jne    ad97 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    ad88:	8b 45 10             	mov    0x10(%ebp),%eax
    ad8b:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    ad8e:	85 c0                	test   %eax,%eax
    ad90:	75 05                	jne    ad97 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    ad92:	e9 1c 01 00 00       	jmp    aeb3 <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    ad97:	8b 45 10             	mov    0x10(%ebp),%eax
    ad9a:	8b 40 10             	mov    0x10(%eax),%eax
    ad9d:	85 c0                	test   %eax,%eax
    ad9f:	74 1e                	je     adbf <III_antialias+0x11e>
    ada1:	8b 45 10             	mov    0x10(%ebp),%eax
    ada4:	8b 40 18             	mov    0x18(%eax),%eax
    ada7:	85 c0                	test   %eax,%eax
    ada9:	74 14                	je     adbf <III_antialias+0x11e>
     (gr_info->block_type == 2))
    adab:	8b 45 10             	mov    0x10(%ebp),%eax
    adae:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    adb1:	83 f8 02             	cmp    $0x2,%eax
    adb4:	75 09                	jne    adbf <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    adb6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    adbd:	eb 07                	jmp    adc6 <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    adbf:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    adc6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    adcd:	e9 d5 00 00 00       	jmp    aea7 <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    add2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    add9:	e9 bb 00 00 00       	jmp    ae99 <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    adde:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ade1:	89 d0                	mov    %edx,%eax
    ade3:	c1 e0 03             	shl    $0x3,%eax
    ade6:	01 d0                	add    %edx,%eax
    ade8:	c1 e0 04             	shl    $0x4,%eax
    adeb:	89 c2                	mov    %eax,%edx
    aded:	8b 45 08             	mov    0x8(%ebp),%eax
    adf0:	01 c2                	add    %eax,%edx
    adf2:	b8 11 00 00 00       	mov    $0x11,%eax
    adf7:	2b 45 f4             	sub    -0xc(%ebp),%eax
    adfa:	dd 04 c2             	fldl   (%edx,%eax,8)
    adfd:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    ae00:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ae03:	8d 50 01             	lea    0x1(%eax),%edx
    ae06:	89 d0                	mov    %edx,%eax
    ae08:	c1 e0 03             	shl    $0x3,%eax
    ae0b:	01 d0                	add    %edx,%eax
    ae0d:	c1 e0 04             	shl    $0x4,%eax
    ae10:	89 c2                	mov    %eax,%edx
    ae12:	8b 45 08             	mov    0x8(%ebp),%eax
    ae15:	01 c2                	add    %eax,%edx
    ae17:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae1a:	dd 04 c2             	fldl   (%edx,%eax,8)
    ae1d:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    ae20:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ae23:	89 d0                	mov    %edx,%eax
    ae25:	c1 e0 03             	shl    $0x3,%eax
    ae28:	01 d0                	add    %edx,%eax
    ae2a:	c1 e0 04             	shl    $0x4,%eax
    ae2d:	89 c2                	mov    %eax,%edx
    ae2f:	8b 45 0c             	mov    0xc(%ebp),%eax
    ae32:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    ae35:	b8 11 00 00 00       	mov    $0x11,%eax
    ae3a:	2b 45 f4             	sub    -0xc(%ebp),%eax
    ae3d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ae40:	dd 04 d5 00 06 01 00 	fldl   0x10600(,%edx,8)
    ae47:	dc 4d d8             	fmull  -0x28(%ebp)
    ae4a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ae4d:	dd 04 d5 40 06 01 00 	fldl   0x10640(,%edx,8)
    ae54:	dc 4d d0             	fmull  -0x30(%ebp)
    ae57:	de e9                	fsubrp %st,%st(1)
    ae59:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    ae5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ae5f:	8d 50 01             	lea    0x1(%eax),%edx
    ae62:	89 d0                	mov    %edx,%eax
    ae64:	c1 e0 03             	shl    $0x3,%eax
    ae67:	01 d0                	add    %edx,%eax
    ae69:	c1 e0 04             	shl    $0x4,%eax
    ae6c:	89 c2                	mov    %eax,%edx
    ae6e:	8b 45 0c             	mov    0xc(%ebp),%eax
    ae71:	01 c2                	add    %eax,%edx
    ae73:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae76:	dd 04 c5 00 06 01 00 	fldl   0x10600(,%eax,8)
    ae7d:	dc 4d d0             	fmull  -0x30(%ebp)
    ae80:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae83:	dd 04 c5 40 06 01 00 	fldl   0x10640(,%eax,8)
    ae8a:	dc 4d d8             	fmull  -0x28(%ebp)
    ae8d:	de c1                	faddp  %st,%st(1)
    ae8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae92:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    ae95:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ae99:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    ae9d:	0f 8e 3b ff ff ff    	jle    adde <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    aea3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    aea7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aeaa:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    aead:	0f 8c 1f ff ff ff    	jl     add2 <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    aeb3:	c9                   	leave  
    aeb4:	c3                   	ret    

0000aeb5 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    aeb5:	55                   	push   %ebp
    aeb6:	89 e5                	mov    %esp,%ebp
    aeb8:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    aebe:	a1 80 06 01 00       	mov    0x10680,%eax
    aec3:	85 c0                	test   %eax,%eax
    aec5:	0f 85 59 02 00 00    	jne    b124 <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    aecb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    aed2:	eb 29                	jmp    aefd <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    aed4:	db 45 f4             	fildl  -0xc(%ebp)
    aed7:	dd 05 10 e8 00 00    	fldl   0xe810
    aedd:	de c1                	faddp  %st,%st(1)
    aedf:	dd 05 18 e8 00 00    	fldl   0xe818
    aee5:	de c9                	fmulp  %st,%st(1)
    aee7:	dd 1c 24             	fstpl  (%esp)
    aeea:	e8 53 a8 ff ff       	call   5742 <sin>
    aeef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aef2:	dd 1c c5 a0 06 01 00 	fstpl  0x106a0(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    aef9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aefd:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    af01:	7e d1                	jle    aed4 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    af03:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    af0a:	eb 2c                	jmp    af38 <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    af0c:	db 45 f4             	fildl  -0xc(%ebp)
    af0f:	dd 05 10 e8 00 00    	fldl   0xe810
    af15:	de c1                	faddp  %st,%st(1)
    af17:	dd 05 18 e8 00 00    	fldl   0xe818
    af1d:	de c9                	fmulp  %st,%st(1)
    af1f:	dd 1c 24             	fstpl  (%esp)
    af22:	e8 1b a8 ff ff       	call   5742 <sin>
    af27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    af2a:	83 c0 24             	add    $0x24,%eax
    af2d:	dd 1c c5 a0 06 01 00 	fstpl  0x106a0(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    af34:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    af38:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    af3c:	7e ce                	jle    af0c <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    af3e:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    af45:	eb 13                	jmp    af5a <inv_mdct+0xa5>
         win[1][i] = 1.0;
    af47:	8b 45 f4             	mov    -0xc(%ebp),%eax
    af4a:	83 c0 24             	add    $0x24,%eax
    af4d:	d9 e8                	fld1   
    af4f:	dd 1c c5 a0 06 01 00 	fstpl  0x106a0(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    af56:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    af5a:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    af5e:	7e e7                	jle    af47 <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    af60:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    af67:	eb 34                	jmp    af9d <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    af69:	db 45 f4             	fildl  -0xc(%ebp)
    af6c:	dd 05 10 e8 00 00    	fldl   0xe810
    af72:	de c1                	faddp  %st,%st(1)
    af74:	dd 05 20 e8 00 00    	fldl   0xe820
    af7a:	de e9                	fsubrp %st,%st(1)
    af7c:	dd 05 00 e8 00 00    	fldl   0xe800
    af82:	de c9                	fmulp  %st,%st(1)
    af84:	dd 1c 24             	fstpl  (%esp)
    af87:	e8 b6 a7 ff ff       	call   5742 <sin>
    af8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    af8f:	83 c0 24             	add    $0x24,%eax
    af92:	dd 1c c5 a0 06 01 00 	fstpl  0x106a0(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    af99:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    af9d:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    afa1:	7e c6                	jle    af69 <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    afa3:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    afaa:	eb 13                	jmp    afbf <inv_mdct+0x10a>
         win[1][i] = 0.0;
    afac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    afaf:	83 c0 24             	add    $0x24,%eax
    afb2:	d9 ee                	fldz   
    afb4:	dd 1c c5 a0 06 01 00 	fstpl  0x106a0(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    afbb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    afbf:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    afc3:	7e e7                	jle    afac <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    afc5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    afcc:	eb 13                	jmp    afe1 <inv_mdct+0x12c>
         win[3][i] = 0.0;
    afce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    afd1:	83 c0 6c             	add    $0x6c,%eax
    afd4:	d9 ee                	fldz   
    afd6:	dd 1c c5 a0 06 01 00 	fstpl  0x106a0(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    afdd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    afe1:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    afe5:	7e e7                	jle    afce <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    afe7:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    afee:	eb 34                	jmp    b024 <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    aff0:	db 45 f4             	fildl  -0xc(%ebp)
    aff3:	dd 05 10 e8 00 00    	fldl   0xe810
    aff9:	de c1                	faddp  %st,%st(1)
    affb:	dd 05 28 e8 00 00    	fldl   0xe828
    b001:	de e9                	fsubrp %st,%st(1)
    b003:	dd 05 00 e8 00 00    	fldl   0xe800
    b009:	de c9                	fmulp  %st,%st(1)
    b00b:	dd 1c 24             	fstpl  (%esp)
    b00e:	e8 2f a7 ff ff       	call   5742 <sin>
    b013:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b016:	83 c0 6c             	add    $0x6c,%eax
    b019:	dd 1c c5 a0 06 01 00 	fstpl  0x106a0(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    b020:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b024:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    b028:	7e c6                	jle    aff0 <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    b02a:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    b031:	eb 13                	jmp    b046 <inv_mdct+0x191>
         win[3][i] =1.0;
    b033:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b036:	83 c0 6c             	add    $0x6c,%eax
    b039:	d9 e8                	fld1   
    b03b:	dd 1c c5 a0 06 01 00 	fstpl  0x106a0(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    b042:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b046:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b04a:	7e e7                	jle    b033 <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    b04c:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    b053:	eb 2c                	jmp    b081 <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    b055:	db 45 f4             	fildl  -0xc(%ebp)
    b058:	dd 05 10 e8 00 00    	fldl   0xe810
    b05e:	de c1                	faddp  %st,%st(1)
    b060:	dd 05 18 e8 00 00    	fldl   0xe818
    b066:	de c9                	fmulp  %st,%st(1)
    b068:	dd 1c 24             	fstpl  (%esp)
    b06b:	e8 d2 a6 ff ff       	call   5742 <sin>
    b070:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b073:	83 c0 6c             	add    $0x6c,%eax
    b076:	dd 1c c5 a0 06 01 00 	fstpl  0x106a0(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    b07d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b081:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b085:	7e ce                	jle    b055 <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    b087:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b08e:	eb 2c                	jmp    b0bc <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    b090:	db 45 f4             	fildl  -0xc(%ebp)
    b093:	dd 05 10 e8 00 00    	fldl   0xe810
    b099:	de c1                	faddp  %st,%st(1)
    b09b:	dd 05 00 e8 00 00    	fldl   0xe800
    b0a1:	de c9                	fmulp  %st,%st(1)
    b0a3:	dd 1c 24             	fstpl  (%esp)
    b0a6:	e8 97 a6 ff ff       	call   5742 <sin>
    b0ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b0ae:	83 c0 48             	add    $0x48,%eax
    b0b1:	dd 1c c5 a0 06 01 00 	fstpl  0x106a0(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    b0b8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b0bc:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    b0c0:	7e ce                	jle    b090 <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    b0c2:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    b0c9:	eb 13                	jmp    b0de <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    b0cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b0ce:	83 c0 48             	add    $0x48,%eax
    b0d1:	d9 ee                	fldz   
    b0d3:	dd 1c c5 a0 06 01 00 	fstpl  0x106a0(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    b0da:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b0de:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b0e2:	7e e7                	jle    b0cb <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    b0e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b0eb:	eb 21                	jmp    b10e <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    b0ed:	db 45 f4             	fildl  -0xc(%ebp)
    b0f0:	dd 05 30 e8 00 00    	fldl   0xe830
    b0f6:	de c9                	fmulp  %st,%st(1)
    b0f8:	dd 1c 24             	fstpl  (%esp)
    b0fb:	e8 e1 a6 ff ff       	call   57e1 <cos>
    b100:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b103:	dd 1c c5 20 0b 01 00 	fstpl  0x10b20(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    b10a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b10e:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    b115:	7e d6                	jle    b0ed <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    b117:	a1 80 06 01 00       	mov    0x10680,%eax
    b11c:	83 c0 01             	add    $0x1,%eax
    b11f:	a3 80 06 01 00       	mov    %eax,0x10680
    }

    for(i=0;i<36;i++)
    b124:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b12b:	eb 17                	jmp    b144 <inv_mdct+0x28f>
       out[i]=0;
    b12d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b130:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b137:	8b 45 0c             	mov    0xc(%ebp),%eax
    b13a:	01 d0                	add    %edx,%eax
    b13c:	d9 ee                	fldz   
    b13e:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    b140:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b144:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b148:	7e e3                	jle    b12d <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    b14a:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    b14e:	0f 85 85 01 00 00    	jne    b2d9 <inv_mdct+0x424>
       N=12;
    b154:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    b15b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b162:	e9 63 01 00 00       	jmp    b2ca <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    b167:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b16e:	e9 df 00 00 00       	jmp    b252 <inv_mdct+0x39d>
             sum = 0.0;
    b173:	d9 ee                	fldz   
    b175:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    b178:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b17f:	e9 8f 00 00 00       	jmp    b213 <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    b184:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b187:	89 d0                	mov    %edx,%eax
    b189:	01 c0                	add    %eax,%eax
    b18b:	01 c2                	add    %eax,%edx
    b18d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b190:	01 d0                	add    %edx,%eax
    b192:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b199:	8b 45 08             	mov    0x8(%ebp),%eax
    b19c:	01 d0                	add    %edx,%eax
    b19e:	dd 00                	fldl   (%eax)
    b1a0:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    b1a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b1a9:	01 c0                	add    %eax,%eax
    b1ab:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    b1b1:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    b1b7:	dd 05 38 e8 00 00    	fldl   0xe838
    b1bd:	de f1                	fdivp  %st,%st(1)
    b1bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b1c2:	01 c0                	add    %eax,%eax
    b1c4:	8d 50 01             	lea    0x1(%eax),%edx
    b1c7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b1ca:	89 c1                	mov    %eax,%ecx
    b1cc:	c1 e9 1f             	shr    $0x1f,%ecx
    b1cf:	01 c8                	add    %ecx,%eax
    b1d1:	d1 f8                	sar    %eax
    b1d3:	01 d0                	add    %edx,%eax
    b1d5:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    b1db:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    b1e1:	de c9                	fmulp  %st,%st(1)
    b1e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b1e6:	01 c0                	add    %eax,%eax
    b1e8:	83 c0 01             	add    $0x1,%eax
    b1eb:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    b1f1:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    b1f7:	de c9                	fmulp  %st,%st(1)
    b1f9:	dd 1c 24             	fstpl  (%esp)
    b1fc:	e8 e0 a5 ff ff       	call   57e1 <cos>
    b201:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    b207:	dd 45 e0             	fldl   -0x20(%ebp)
    b20a:	de c1                	faddp  %st,%st(1)
    b20c:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    b20f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b213:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b216:	89 c2                	mov    %eax,%edx
    b218:	c1 ea 1f             	shr    $0x1f,%edx
    b21b:	01 d0                	add    %edx,%eax
    b21d:	d1 f8                	sar    %eax
    b21f:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b222:	0f 8f 5c ff ff ff    	jg     b184 <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    b228:	8b 55 10             	mov    0x10(%ebp),%edx
    b22b:	89 d0                	mov    %edx,%eax
    b22d:	c1 e0 03             	shl    $0x3,%eax
    b230:	01 d0                	add    %edx,%eax
    b232:	c1 e0 02             	shl    $0x2,%eax
    b235:	8b 55 ec             	mov    -0x14(%ebp),%edx
    b238:	01 d0                	add    %edx,%eax
    b23a:	dd 04 c5 a0 06 01 00 	fldl   0x106a0(,%eax,8)
    b241:	dc 4d e0             	fmull  -0x20(%ebp)
    b244:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b247:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    b24e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b252:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b255:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    b258:	0f 8c 15 ff ff ff    	jl     b173 <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    b25e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b265:	eb 57                	jmp    b2be <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    b267:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b26a:	89 d0                	mov    %edx,%eax
    b26c:	01 c0                	add    %eax,%eax
    b26e:	01 d0                	add    %edx,%eax
    b270:	01 c0                	add    %eax,%eax
    b272:	89 c2                	mov    %eax,%edx
    b274:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b277:	01 d0                	add    %edx,%eax
    b279:	83 c0 06             	add    $0x6,%eax
    b27c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b283:	8b 45 0c             	mov    0xc(%ebp),%eax
    b286:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b289:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b28c:	89 d0                	mov    %edx,%eax
    b28e:	01 c0                	add    %eax,%eax
    b290:	01 d0                	add    %edx,%eax
    b292:	01 c0                	add    %eax,%eax
    b294:	89 c2                	mov    %eax,%edx
    b296:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b299:	01 d0                	add    %edx,%eax
    b29b:	83 c0 06             	add    $0x6,%eax
    b29e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b2a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    b2a8:	01 d0                	add    %edx,%eax
    b2aa:	dd 00                	fldl   (%eax)
    b2ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b2af:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    b2b6:	de c1                	faddp  %st,%st(1)
    b2b8:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    b2ba:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b2be:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b2c1:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    b2c4:	7c a1                	jl     b267 <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    b2c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b2ca:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    b2ce:	0f 8e 93 fe ff ff    	jle    b167 <inv_mdct+0x2b2>
    b2d4:	e9 da 00 00 00       	jmp    b3b3 <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    b2d9:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    b2e0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b2e7:	e9 bb 00 00 00       	jmp    b3a7 <inv_mdct+0x4f2>
         sum = 0.0;
    b2ec:	d9 ee                	fldz   
    b2ee:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    b2f1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b2f8:	eb 6a                	jmp    b364 <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    b2fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b2fd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b304:	8b 45 08             	mov    0x8(%ebp),%eax
    b307:	01 d0                	add    %edx,%eax
    b309:	dd 00                	fldl   (%eax)
    b30b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b30e:	01 c0                	add    %eax,%eax
    b310:	8d 50 01             	lea    0x1(%eax),%edx
    b313:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b316:	89 c1                	mov    %eax,%ecx
    b318:	c1 e9 1f             	shr    $0x1f,%ecx
    b31b:	01 c8                	add    %ecx,%eax
    b31d:	d1 f8                	sar    %eax
    b31f:	01 c2                	add    %eax,%edx
    b321:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b324:	01 c0                	add    %eax,%eax
    b326:	83 c0 01             	add    $0x1,%eax
    b329:	89 d1                	mov    %edx,%ecx
    b32b:	0f af c8             	imul   %eax,%ecx
    b32e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    b333:	89 c8                	mov    %ecx,%eax
    b335:	f7 ea                	imul   %edx
    b337:	c1 fa 05             	sar    $0x5,%edx
    b33a:	89 c8                	mov    %ecx,%eax
    b33c:	c1 f8 1f             	sar    $0x1f,%eax
    b33f:	29 c2                	sub    %eax,%edx
    b341:	89 d0                	mov    %edx,%eax
    b343:	c1 e0 03             	shl    $0x3,%eax
    b346:	01 d0                	add    %edx,%eax
    b348:	c1 e0 04             	shl    $0x4,%eax
    b34b:	29 c1                	sub    %eax,%ecx
    b34d:	89 ca                	mov    %ecx,%edx
    b34f:	dd 04 d5 20 0b 01 00 	fldl   0x10b20(,%edx,8)
    b356:	de c9                	fmulp  %st,%st(1)
    b358:	dd 45 e0             	fldl   -0x20(%ebp)
    b35b:	de c1                	faddp  %st,%st(1)
    b35d:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    b360:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b364:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b367:	89 c2                	mov    %eax,%edx
    b369:	c1 ea 1f             	shr    $0x1f,%edx
    b36c:	01 d0                	add    %edx,%eax
    b36e:	d1 f8                	sar    %eax
    b370:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b373:	7f 85                	jg     b2fa <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    b375:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b378:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b37f:	8b 45 0c             	mov    0xc(%ebp),%eax
    b382:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b385:	8b 55 10             	mov    0x10(%ebp),%edx
    b388:	89 d0                	mov    %edx,%eax
    b38a:	c1 e0 03             	shl    $0x3,%eax
    b38d:	01 d0                	add    %edx,%eax
    b38f:	c1 e0 02             	shl    $0x2,%eax
    b392:	8b 55 ec             	mov    -0x14(%ebp),%edx
    b395:	01 d0                	add    %edx,%eax
    b397:	dd 04 c5 a0 06 01 00 	fldl   0x106a0(,%eax,8)
    b39e:	dc 4d e0             	fmull  -0x20(%ebp)
    b3a1:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    b3a3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b3a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b3aa:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    b3ad:	0f 8c 39 ff ff ff    	jl     b2ec <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    b3b3:	c9                   	leave  
    b3b4:	c3                   	ret    

0000b3b5 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    b3b5:	55                   	push   %ebp
    b3b6:	89 e5                	mov    %esp,%ebp
    b3b8:	53                   	push   %ebx
    b3b9:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    b3bf:	a1 a4 05 01 00       	mov    0x105a4,%eax
    b3c4:	85 c0                	test   %eax,%eax
    b3c6:	74 6f                	je     b437 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    b3c8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b3cf:	eb 56                	jmp    b427 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    b3d1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b3d8:	eb 43                	jmp    b41d <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    b3da:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b3e1:	eb 30                	jmp    b413 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    b3e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b3e6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    b3e9:	89 c2                	mov    %eax,%edx
    b3eb:	c1 e2 03             	shl    $0x3,%edx
    b3ee:	01 c2                	add    %eax,%edx
    b3f0:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b3f3:	89 c2                	mov    %eax,%edx
    b3f5:	89 c8                	mov    %ecx,%eax
    b3f7:	c1 e0 03             	shl    $0x3,%eax
    b3fa:	01 c8                	add    %ecx,%eax
    b3fc:	c1 e0 06             	shl    $0x6,%eax
    b3ff:	01 c2                	add    %eax,%edx
    b401:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b404:	01 d0                	add    %edx,%eax
    b406:	d9 ee                	fldz   
    b408:	dd 1c c5 a0 0f 01 00 	fstpl  0x10fa0(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    b40f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b413:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    b417:	7e ca                	jle    b3e3 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    b419:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b41d:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    b421:	7e b7                	jle    b3da <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    b423:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b427:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    b42b:	7e a4                	jle    b3d1 <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    b42d:	c7 05 a4 05 01 00 00 	movl   $0x0,0x105a4
    b434:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b437:	8b 45 18             	mov    0x18(%ebp),%eax
    b43a:	8b 40 10             	mov    0x10(%eax),%eax
    b43d:	85 c0                	test   %eax,%eax
    b43f:	74 10                	je     b451 <III_hybrid+0x9c>
    b441:	8b 45 18             	mov    0x18(%ebp),%eax
    b444:	8b 40 18             	mov    0x18(%eax),%eax
    b447:	85 c0                	test   %eax,%eax
    b449:	74 06                	je     b451 <III_hybrid+0x9c>
    b44b:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    b44f:	7e 08                	jle    b459 <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    b451:	8b 45 18             	mov    0x18(%ebp),%eax
    b454:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b457:	eb 05                	jmp    b45e <III_hybrid+0xa9>
    b459:	b8 00 00 00 00       	mov    $0x0,%eax
    b45e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    b461:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    b464:	89 44 24 08          	mov    %eax,0x8(%esp)
    b468:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    b46e:	89 44 24 04          	mov    %eax,0x4(%esp)
    b472:	8b 45 08             	mov    0x8(%ebp),%eax
    b475:	89 04 24             	mov    %eax,(%esp)
    b478:	e8 38 fa ff ff       	call   aeb5 <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    b47d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b484:	e9 83 00 00 00       	jmp    b50c <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    b489:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b48c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b493:	8b 45 0c             	mov    0xc(%ebp),%eax
    b496:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    b499:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b49c:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    b4a3:	8b 45 10             	mov    0x10(%ebp),%eax
    b4a6:	8b 4d 14             	mov    0x14(%ebp),%ecx
    b4a9:	89 c2                	mov    %eax,%edx
    b4ab:	c1 e2 03             	shl    $0x3,%edx
    b4ae:	01 c2                	add    %eax,%edx
    b4b0:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b4b3:	89 c2                	mov    %eax,%edx
    b4b5:	89 c8                	mov    %ecx,%eax
    b4b7:	c1 e0 03             	shl    $0x3,%eax
    b4ba:	01 c8                	add    %ecx,%eax
    b4bc:	c1 e0 06             	shl    $0x6,%eax
    b4bf:	01 c2                	add    %eax,%edx
    b4c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b4c4:	01 d0                	add    %edx,%eax
    b4c6:	dd 04 c5 a0 0f 01 00 	fldl   0x10fa0(,%eax,8)
    b4cd:	de c1                	faddp  %st,%st(1)
    b4cf:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    b4d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b4d4:	83 c0 12             	add    $0x12,%eax
    b4d7:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    b4de:	8b 45 10             	mov    0x10(%ebp),%eax
    b4e1:	8b 4d 14             	mov    0x14(%ebp),%ecx
    b4e4:	89 c2                	mov    %eax,%edx
    b4e6:	c1 e2 03             	shl    $0x3,%edx
    b4e9:	01 c2                	add    %eax,%edx
    b4eb:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b4ee:	89 c2                	mov    %eax,%edx
    b4f0:	89 c8                	mov    %ecx,%eax
    b4f2:	c1 e0 03             	shl    $0x3,%eax
    b4f5:	01 c8                	add    %ecx,%eax
    b4f7:	c1 e0 06             	shl    $0x6,%eax
    b4fa:	01 c2                	add    %eax,%edx
    b4fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b4ff:	01 d0                	add    %edx,%eax
    b501:	dd 1c c5 a0 0f 01 00 	fstpl  0x10fa0(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    b508:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b50c:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b510:	0f 8e 73 ff ff ff    	jle    b489 <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    b516:	81 c4 54 01 00 00    	add    $0x154,%esp
    b51c:	5b                   	pop    %ebx
    b51d:	5d                   	pop    %ebp
    b51e:	c3                   	ret    

0000b51f <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    b51f:	55                   	push   %ebp
    b520:	89 e5                	mov    %esp,%ebp
    b522:	57                   	push   %edi
    b523:	56                   	push   %esi
    b524:	53                   	push   %ebx
    b525:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    b528:	be 00 00 00 00       	mov    $0x0,%esi
    b52d:	e9 1c 01 00 00       	jmp    b64e <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    b532:	bb 00 00 00 00       	mov    $0x0,%ebx
    b537:	e9 06 01 00 00       	jmp    b642 <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    b53c:	89 f0                	mov    %esi,%eax
    b53e:	c1 e0 08             	shl    $0x8,%eax
    b541:	89 c2                	mov    %eax,%edx
    b543:	8b 45 08             	mov    0x8(%ebp),%eax
    b546:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    b549:	89 75 e0             	mov    %esi,-0x20(%ebp)
    b54c:	db 45 e0             	fildl  -0x20(%ebp)
    b54f:	dd 05 40 e8 00 00    	fldl   0xe840
    b555:	de c9                	fmulp  %st,%st(1)
    b557:	dd 05 48 e8 00 00    	fldl   0xe848
    b55d:	de c1                	faddp  %st,%st(1)
    b55f:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    b562:	83 c0 01             	add    $0x1,%eax
    b565:	89 45 e0             	mov    %eax,-0x20(%ebp)
    b568:	db 45 e0             	fildl  -0x20(%ebp)
    b56b:	de c9                	fmulp  %st,%st(1)
    b56d:	dd 1c 24             	fstpl  (%esp)
    b570:	e8 6c a2 ff ff       	call   57e1 <cos>
    b575:	dd 05 50 e8 00 00    	fldl   0xe850
    b57b:	de c9                	fmulp  %st,%st(1)
    b57d:	dd 1c df             	fstpl  (%edi,%ebx,8)
    b580:	dd 04 df             	fldl   (%edi,%ebx,8)
    b583:	d9 ee                	fldz   
    b585:	d9 c9                	fxch   %st(1)
    b587:	df e9                	fucomip %st(1),%st
    b589:	dd d8                	fstp   %st(0)
    b58b:	72 47                	jb     b5d4 <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    b58d:	89 f0                	mov    %esi,%eax
    b58f:	c1 e0 08             	shl    $0x8,%eax
    b592:	89 c2                	mov    %eax,%edx
    b594:	8b 45 08             	mov    0x8(%ebp),%eax
    b597:	01 c2                	add    %eax,%edx
    b599:	89 f0                	mov    %esi,%eax
    b59b:	c1 e0 08             	shl    $0x8,%eax
    b59e:	89 c1                	mov    %eax,%ecx
    b5a0:	8b 45 08             	mov    0x8(%ebp),%eax
    b5a3:	01 c8                	add    %ecx,%eax
    b5a5:	dd 04 d8             	fldl   (%eax,%ebx,8)
    b5a8:	dd 05 10 e8 00 00    	fldl   0xe810
    b5ae:	de c1                	faddp  %st,%st(1)
    b5b0:	d9 7d e6             	fnstcw -0x1a(%ebp)
    b5b3:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    b5b7:	b4 0c                	mov    $0xc,%ah
    b5b9:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    b5bd:	d9 6d e4             	fldcw  -0x1c(%ebp)
    b5c0:	db 5d e0             	fistpl -0x20(%ebp)
    b5c3:	d9 6d e6             	fldcw  -0x1a(%ebp)
    b5c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    b5c9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    b5cc:	db 45 e0             	fildl  -0x20(%ebp)
    b5cf:	dd 1c da             	fstpl  (%edx,%ebx,8)
    b5d2:	eb 45                	jmp    b619 <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    b5d4:	89 f0                	mov    %esi,%eax
    b5d6:	c1 e0 08             	shl    $0x8,%eax
    b5d9:	89 c2                	mov    %eax,%edx
    b5db:	8b 45 08             	mov    0x8(%ebp),%eax
    b5de:	01 c2                	add    %eax,%edx
    b5e0:	89 f0                	mov    %esi,%eax
    b5e2:	c1 e0 08             	shl    $0x8,%eax
    b5e5:	89 c1                	mov    %eax,%ecx
    b5e7:	8b 45 08             	mov    0x8(%ebp),%eax
    b5ea:	01 c8                	add    %ecx,%eax
    b5ec:	dd 04 d8             	fldl   (%eax,%ebx,8)
    b5ef:	dd 05 10 e8 00 00    	fldl   0xe810
    b5f5:	de e9                	fsubrp %st,%st(1)
    b5f7:	d9 7d e6             	fnstcw -0x1a(%ebp)
    b5fa:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    b5fe:	b4 0c                	mov    $0xc,%ah
    b600:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    b604:	d9 6d e4             	fldcw  -0x1c(%ebp)
    b607:	db 5d e0             	fistpl -0x20(%ebp)
    b60a:	d9 6d e6             	fldcw  -0x1a(%ebp)
    b60d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    b610:	89 45 e0             	mov    %eax,-0x20(%ebp)
    b613:	db 45 e0             	fildl  -0x20(%ebp)
    b616:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    b619:	89 f0                	mov    %esi,%eax
    b61b:	c1 e0 08             	shl    $0x8,%eax
    b61e:	89 c2                	mov    %eax,%edx
    b620:	8b 45 08             	mov    0x8(%ebp),%eax
    b623:	01 d0                	add    %edx,%eax
    b625:	89 f2                	mov    %esi,%edx
    b627:	89 d1                	mov    %edx,%ecx
    b629:	c1 e1 08             	shl    $0x8,%ecx
    b62c:	8b 55 08             	mov    0x8(%ebp),%edx
    b62f:	01 ca                	add    %ecx,%edx
    b631:	dd 04 da             	fldl   (%edx,%ebx,8)
    b634:	dd 05 58 e8 00 00    	fldl   0xe858
    b63a:	de c9                	fmulp  %st,%st(1)
    b63c:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    b63f:	83 c3 01             	add    $0x1,%ebx
    b642:	83 fb 1f             	cmp    $0x1f,%ebx
    b645:	0f 8e f1 fe ff ff    	jle    b53c <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    b64b:	83 c6 01             	add    $0x1,%esi
    b64e:	83 fe 3f             	cmp    $0x3f,%esi
    b651:	0f 8e db fe ff ff    	jle    b532 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    b657:	83 c4 1c             	add    $0x1c,%esp
    b65a:	5b                   	pop    %ebx
    b65b:	5e                   	pop    %esi
    b65c:	5f                   	pop    %edi
    b65d:	5d                   	pop    %ebp
    b65e:	c3                   	ret    

0000b65f <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    b65f:	55                   	push   %ebp
    b660:	89 e5                	mov    %esp,%ebp
    b662:	57                   	push   %edi
    b663:	56                   	push   %esi
    b664:	53                   	push   %ebx
    b665:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    b66b:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    b671:	bb c0 d7 00 00       	mov    $0xd7c0,%ebx
    b676:	b8 00 04 00 00       	mov    $0x400,%eax
    b67b:	89 d7                	mov    %edx,%edi
    b67d:	89 de                	mov    %ebx,%esi
    b67f:	89 c1                	mov    %eax,%ecx
    b681:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    b683:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    b689:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    b68c:	81 c4 14 10 00 00    	add    $0x1014,%esp
    b692:	5b                   	pop    %ebx
    b693:	5e                   	pop    %esi
    b694:	5f                   	pop    %edi
    b695:	5d                   	pop    %ebp
    b696:	c3                   	ret    

0000b697 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    b697:	55                   	push   %ebp
    b698:	89 e5                	mov    %esp,%ebp
    b69a:	57                   	push   %edi
    b69b:	56                   	push   %esi
    b69c:	53                   	push   %ebx
    b69d:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    b6a0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    b6a7:	a1 a8 05 01 00       	mov    0x105a8,%eax
    b6ac:	85 c0                	test   %eax,%eax
    b6ae:	74 6f                	je     b71f <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    b6b0:	c7 44 24 04 c0 e7 00 	movl   $0xe7c0,0x4(%esp)
    b6b7:	00 
    b6b8:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    b6bf:	e8 15 a8 ff ff       	call   5ed9 <mem_alloc>
    b6c4:	a3 a0 33 01 00       	mov    %eax,0x133a0
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    b6c9:	c7 44 24 04 c3 e7 00 	movl   $0xe7c3,0x4(%esp)
    b6d0:	00 
    b6d1:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    b6d8:	e8 fc a7 ff ff       	call   5ed9 <mem_alloc>
    b6dd:	a3 a4 33 01 00       	mov    %eax,0x133a4
		create_syn_filter(*filter);
    b6e2:	a1 a4 33 01 00       	mov    0x133a4,%eax
    b6e7:	89 04 24             	mov    %eax,(%esp)
    b6ea:	e8 30 fe ff ff       	call   b51f <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    b6ef:	c7 44 24 04 c6 e7 00 	movl   $0xe7c6,0x4(%esp)
    b6f6:	00 
    b6f7:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    b6fe:	e8 d6 a7 ff ff       	call   5ed9 <mem_alloc>
    b703:	a3 a8 33 01 00       	mov    %eax,0x133a8
		read_syn_window(window);
    b708:	a1 a8 33 01 00       	mov    0x133a8,%eax
    b70d:	89 04 24             	mov    %eax,(%esp)
    b710:	e8 4a ff ff ff       	call   b65f <read_syn_window>
		init = 0;
    b715:	c7 05 a8 05 01 00 00 	movl   $0x0,0x105a8
    b71c:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    b71f:	8b 45 0c             	mov    0xc(%ebp),%eax
    b722:	8b 04 85 ac 05 01 00 	mov    0x105ac(,%eax,4),%eax
    b729:	83 e8 40             	sub    $0x40,%eax
    b72c:	25 ff 03 00 00       	and    $0x3ff,%eax
    b731:	89 c2                	mov    %eax,%edx
    b733:	8b 45 0c             	mov    0xc(%ebp),%eax
    b736:	89 14 85 ac 05 01 00 	mov    %edx,0x105ac(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    b73d:	8b 15 a0 33 01 00    	mov    0x133a0,%edx
    b743:	8b 45 0c             	mov    0xc(%ebp),%eax
    b746:	8b 04 85 ac 05 01 00 	mov    0x105ac(,%eax,4),%eax
    b74d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b750:	c1 e1 0a             	shl    $0xa,%ecx
    b753:	01 c8                	add    %ecx,%eax
    b755:	c1 e0 03             	shl    $0x3,%eax
    b758:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    b75b:	bb 00 00 00 00       	mov    $0x0,%ebx
    b760:	eb 40                	jmp    b7a2 <SubBandSynthesis+0x10b>
		sum = 0;
    b762:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    b764:	be 00 00 00 00       	mov    $0x0,%esi
    b769:	eb 26                	jmp    b791 <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    b76b:	89 f0                	mov    %esi,%eax
    b76d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b774:	8b 45 08             	mov    0x8(%ebp),%eax
    b777:	01 d0                	add    %edx,%eax
    b779:	dd 00                	fldl   (%eax)
    b77b:	a1 a4 33 01 00       	mov    0x133a4,%eax
    b780:	89 da                	mov    %ebx,%edx
    b782:	c1 e2 05             	shl    $0x5,%edx
    b785:	01 f2                	add    %esi,%edx
    b787:	dd 04 d0             	fldl   (%eax,%edx,8)
    b78a:	de c9                	fmulp  %st,%st(1)
    b78c:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    b78e:	83 c6 01             	add    $0x1,%esi
    b791:	83 fe 1f             	cmp    $0x1f,%esi
    b794:	7e d5                	jle    b76b <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    b796:	89 d8                	mov    %ebx,%eax
    b798:	c1 e0 03             	shl    $0x3,%eax
    b79b:	01 f8                	add    %edi,%eax
    b79d:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    b79f:	83 c3 01             	add    $0x1,%ebx
    b7a2:	83 fb 3f             	cmp    $0x3f,%ebx
    b7a5:	7e bb                	jle    b762 <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    b7a7:	bf 00 00 00 00       	mov    $0x0,%edi
    b7ac:	e9 c7 00 00 00       	jmp    b878 <SubBandSynthesis+0x1e1>
		sum = 0;
    b7b1:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    b7b3:	bb 00 00 00 00       	mov    $0x0,%ebx
    b7b8:	eb 4c                	jmp    b806 <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    b7ba:	89 d8                	mov    %ebx,%eax
    b7bc:	c1 e0 05             	shl    $0x5,%eax
    b7bf:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b7c2:	a1 a8 33 01 00       	mov    0x133a8,%eax
    b7c7:	89 f2                	mov    %esi,%edx
    b7c9:	c1 e2 03             	shl    $0x3,%edx
    b7cc:	01 d0                	add    %edx,%eax
    b7ce:	dd 00                	fldl   (%eax)
    b7d0:	a1 a0 33 01 00       	mov    0x133a0,%eax
    b7d5:	8d 53 01             	lea    0x1(%ebx),%edx
    b7d8:	d1 fa                	sar    %edx
    b7da:	c1 e2 06             	shl    $0x6,%edx
    b7dd:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    b7e0:	8b 55 0c             	mov    0xc(%ebp),%edx
    b7e3:	8b 14 95 ac 05 01 00 	mov    0x105ac(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b7ea:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    b7ec:	89 d1                	mov    %edx,%ecx
    b7ee:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b7f4:	8b 55 0c             	mov    0xc(%ebp),%edx
    b7f7:	c1 e2 0a             	shl    $0xa,%edx
    b7fa:	01 ca                	add    %ecx,%edx
    b7fc:	dd 04 d0             	fldl   (%eax,%edx,8)
    b7ff:	de c9                	fmulp  %st,%st(1)
    b801:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    b803:	83 c3 01             	add    $0x1,%ebx
    b806:	83 fb 0f             	cmp    $0xf,%ebx
    b809:	7e af                	jle    b7ba <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    b80b:	dd 05 60 e8 00 00    	fldl   0xe860
    b811:	de c9                	fmulp  %st,%st(1)
    b813:	d9 7d d6             	fnstcw -0x2a(%ebp)
    b816:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    b81a:	b4 0c                	mov    $0xc,%ah
    b81c:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    b820:	d9 6d d4             	fldcw  -0x2c(%ebp)
    b823:	db 5d e0             	fistpl -0x20(%ebp)
    b826:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    b829:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    b830:	7e 15                	jle    b847 <SubBandSynthesis+0x1b0>
    b832:	89 f8                	mov    %edi,%eax
    b834:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b837:	8b 45 10             	mov    0x10(%ebp),%eax
    b83a:	01 d0                	add    %edx,%eax
    b83c:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    b841:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b845:	eb 2e                	jmp    b875 <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    b847:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    b84e:	7d 15                	jge    b865 <SubBandSynthesis+0x1ce>
    b850:	89 f8                	mov    %edi,%eax
    b852:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b855:	8b 45 10             	mov    0x10(%ebp),%eax
    b858:	01 d0                	add    %edx,%eax
    b85a:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    b85f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b863:	eb 10                	jmp    b875 <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    b865:	89 f8                	mov    %edi,%eax
    b867:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b86a:	8b 45 10             	mov    0x10(%ebp),%eax
    b86d:	01 c2                	add    %eax,%edx
    b86f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    b872:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    b875:	83 c7 01             	add    $0x1,%edi
    b878:	83 ff 1f             	cmp    $0x1f,%edi
    b87b:	0f 8e 30 ff ff ff    	jle    b7b1 <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    b881:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    b884:	83 c4 2c             	add    $0x2c,%esp
    b887:	5b                   	pop    %ebx
    b888:	5e                   	pop    %esi
    b889:	5f                   	pop    %edi
    b88a:	5d                   	pop    %ebp
    b88b:	c3                   	ret    

0000b88c <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    b88c:	55                   	push   %ebp
    b88d:	89 e5                	mov    %esp,%ebp
    b88f:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    b892:	8b 45 10             	mov    0x10(%ebp),%eax
    b895:	8b 40 08             	mov    0x8(%eax),%eax
    b898:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    b89b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    b8a2:	eb 75                	jmp    b919 <out_fifo+0x8d>
    b8a4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    b8ab:	eb 62                	jmp    b90f <out_fifo+0x83>
            (*psampFrames)++;
    b8ad:	8b 45 14             	mov    0x14(%ebp),%eax
    b8b0:	8b 00                	mov    (%eax),%eax
    b8b2:	8d 50 01             	lea    0x1(%eax),%edx
    b8b5:	8b 45 14             	mov    0x14(%ebp),%eax
    b8b8:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    b8ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b8c1:	eb 40                	jmp    b903 <out_fifo+0x77>
                if (!(k%1600) && k) {
    b8c3:	8b 0d ac 33 01 00    	mov    0x133ac,%ecx
    b8c9:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    b8ce:	89 c8                	mov    %ecx,%eax
    b8d0:	f7 ea                	imul   %edx
    b8d2:	c1 fa 09             	sar    $0x9,%edx
    b8d5:	89 c8                	mov    %ecx,%eax
    b8d7:	c1 f8 1f             	sar    $0x1f,%eax
    b8da:	29 c2                	sub    %eax,%edx
    b8dc:	89 d0                	mov    %edx,%eax
    b8de:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    b8e4:	29 c1                	sub    %eax,%ecx
    b8e6:	89 c8                	mov    %ecx,%eax
    b8e8:	85 c0                	test   %eax,%eax
    b8ea:	75 13                	jne    b8ff <out_fifo+0x73>
    b8ec:	a1 ac 33 01 00       	mov    0x133ac,%eax
    b8f1:	85 c0                	test   %eax,%eax
    b8f3:	74 0a                	je     b8ff <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    b8f5:	c7 05 ac 33 01 00 00 	movl   $0x0,0x133ac
    b8fc:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    b8ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b903:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b906:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b909:	7c b8                	jl     b8c3 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    b90b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    b90f:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    b913:	7e 98                	jle    b8ad <out_fifo+0x21>
    b915:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    b919:	8b 45 fc             	mov    -0x4(%ebp),%eax
    b91c:	3b 45 0c             	cmp    0xc(%ebp),%eax
    b91f:	7c 83                	jl     b8a4 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    b921:	c9                   	leave  
    b922:	c3                   	ret    

0000b923 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    b923:	55                   	push   %ebp
    b924:	89 e5                	mov    %esp,%ebp
    b926:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    b929:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    b930:	00 
    b931:	8b 45 08             	mov    0x8(%ebp),%eax
    b934:	89 04 24             	mov    %eax,(%esp)
    b937:	e8 8b a8 ff ff       	call   61c7 <getbits>
    b93c:	8b 55 0c             	mov    0xc(%ebp),%edx
    b93f:	89 02                	mov    %eax,(%edx)
}
    b941:	c9                   	leave  
    b942:	c3                   	ret    

0000b943 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    b943:	55                   	push   %ebp
    b944:	89 e5                	mov    %esp,%ebp
    b946:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b949:	8b 45 08             	mov    0x8(%ebp),%eax
    b94c:	8b 40 0c             	mov    0xc(%eax),%eax
    b94f:	83 c0 1e             	add    $0x1e,%eax
    b952:	8b 14 85 00 01 01 00 	mov    0x10100(,%eax,4),%edx
    b959:	89 d0                	mov    %edx,%eax
    b95b:	c1 e0 03             	shl    $0x3,%eax
    b95e:	01 d0                	add    %edx,%eax
    b960:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    b963:	89 45 ec             	mov    %eax,-0x14(%ebp)
    b966:	db 45 ec             	fildl  -0x14(%ebp)
    b969:	8b 45 08             	mov    0x8(%ebp),%eax
    b96c:	8b 40 10             	mov    0x10(%eax),%eax
    b96f:	dd 04 c5 c0 01 01 00 	fldl   0x101c0(,%eax,8)
    b976:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b978:	d9 7d ea             	fnstcw -0x16(%ebp)
    b97b:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    b97f:	b4 0c                	mov    $0xc,%ah
    b981:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    b985:	d9 6d e8             	fldcw  -0x18(%ebp)
    b988:	db 5d fc             	fistpl -0x4(%ebp)
    b98b:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    b98e:	8b 45 08             	mov    0x8(%ebp),%eax
    b991:	8b 40 14             	mov    0x14(%eax),%eax
    b994:	85 c0                	test   %eax,%eax
    b996:	74 04                	je     b99c <main_data_slots+0x59>
    b998:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    b99c:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    b9a0:	8b 45 08             	mov    0x8(%ebp),%eax
    b9a3:	8b 40 08             	mov    0x8(%eax),%eax
    b9a6:	85 c0                	test   %eax,%eax
    b9a8:	74 04                	je     b9ae <main_data_slots+0x6b>
		nSlots -= 2;
    b9aa:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    b9ae:	8b 45 10             	mov    0x10(%ebp),%eax
    b9b1:	83 f8 01             	cmp    $0x1,%eax
    b9b4:	75 06                	jne    b9bc <main_data_slots+0x79>
		nSlots -= 17;
    b9b6:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    b9ba:	eb 04                	jmp    b9c0 <main_data_slots+0x7d>
	else
		nSlots -=32;
    b9bc:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    b9c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    b9c3:	c9                   	leave  
    b9c4:	c3                   	ret    
