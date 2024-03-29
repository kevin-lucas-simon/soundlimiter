JsOsaDAS1.001.00bplist00�Vscriptob c l a s s   S o u n d L i m i t e r   { 
 	 c o n s t r u c t o r ( c o n t e x t )   { 
 	 	 / /   p r o g r a m   c o n f i g 
 	 	 t h i s . a p p N a m e   =   " S o u n d L i m i t e r " ; 
 	 	 t h i s . c o n f i g F i l e N a m e   =   " s o u n d l i m i t e r . c o n f i g . t x t " ; 
 	 	 t h i s . i d l e T i m e I n S e c   =   0 . 5 ; 
 	 	 
 	 	 / /   u s e r   ( d e f a u l t )   c o n f i g 
 	 	 t h i s . c o n f i g   =   { 
 	 	 	 i n t e r n a l S p e a k e r :   " M a c B o o k   P r o - L a u t s p r e c h e r " , 
 	 	 	 m a x V o l u m e :   5 0 , 
 	 	 	 o n l y O n H e a d p h o n e s :   t r u e , 
 	 	 	 d i s a b l e H e a d p h o n e N o t i f i c a t i o n s :   f a l s e 
 	 	 } ; 
 	 	 
 	 	 t h i s . i n i t ( c o n t e x t ) ; 
 	 } 
     
 	 i n i t ( c o n t e x t )   { 
 	 	 t h i s . a p p   =   A p p l i c a t i o n . c u r r e n t A p p l i c a t i o n ( ) ; 
 	 	 t h i s . a p p . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 	 	 
 	 	 t h i s . l o a d C o n f i g ( c o n t e x t ,   t h i s . c o n f i g F i l e N a m e ) ; 
 	 	 
 	 	 t h i s . h e a d P h o n e s C o n n e c t e d   =   ! t h i s . o n I n t e r n a l S p e a k e r ( ) ; 
 	 	 t h i s . p r e v i o u s V o l u m e   =   n u l l ; 
 	 
 	 	 t h i s . a p p . d i s p l a y N o t i f i c a t i o n ( " " ,   { 
 	 	 	 w i t h T i t l e :   t h i s . a p p N a m e , 
 	 	 	 s u b t i t l e :   t h i s . v o l u m e L i m i t T e x t , 
 	 	 } ) ; 
 	 	 
 	 	 t h i s . i d l e ( ) ; 
 	 } 
 	 
 	 i d l e ( )   { 
 	 	 t h i s . c h e c k H e a d P h o n e s ( ) ; 
 	 	 t h i s . l i m i t V o l u m e ( ) ; 
 	 	 
 	 	 r e t u r n   t h i s . i d l e T i m e I n S e c ; 
 	 } 
 
 	 g e t   c u r r e n t V o l u m e ( )   { 
 	 	 c o n s t   {   o u t p u t V o l u m e   }   =   t h i s . a p p . g e t V o l u m e S e t t i n g s ( ) ; 
 	 	 r e t u r n   o u t p u t V o l u m e ; 
 	 } 
 
 	 g e t   s h o u l d L i m i t V o l u m e ( )   { 
 	 	 r e t u r n   ( 
 	 	 	 ( t h i s . h e a d P h o n e s C o n n e c t e d   | |   ! t h i s . c o n f i g . o n l y O n H e a d p h o n e s )   & & 
 	 	 	 t h i s . c u r r e n t V o l u m e   >   t h i s . c o n f i g . m a x V o l u m e 
 	 	 ) ; 
 	 } 
 	 
 	 g e t   v o l u m e L i m i t T e x t ( )   { 
 	 	 r e t u r n   ` L i m i t i n g   y o u r   h e a d p h o n e s   t o   $ { t h i s . c o n f i g . m a x V o l u m e } %   t o   p r o t e c t   y o u r   e a r s ` 
 	 } 
 
 	 o n I n t e r n a l S p e a k e r ( )   { 
 	 	 / /   s e a r c h   f o r   c u r r e n t l y   r u n n i n g   ( d e f a u l t )   o u t p u t   d e v i c e   a n d   c o m p a r e   i t ' s   n a m e   w i t h   o u r   c o n f i g u r a t i o n 
 	 	 c o n s t   a u d i o A p p C o n t e x t   =   t h i s . a p p . d o S h e l l S c r i p t ( " s y s t e m _ p r o f i l e r   S P A u d i o D a t a T y p e " ) ; 
 	 	 c o n s t   r e g e x   =   n e w   R e g E x p ( " D e f a u l t   O u t p u t   D e v i c e :   Y e s ( ? : ( ? ! O u t p u t   S o u r c e :   ) [ \ \ s \ \ S ] ) * O u t p u t   S o u r c e :   "   +   t h i s . c o n f i g . i n t e r n a l S p e a k e r   +   " ( ? : . * ) $ " ,   " g m " ) ; 
         
 	 	 r e t u r n   r e g e x . t e s t ( a u d i o A p p C o n t e x t ) ; 
 	 } 
 
 	 c h e c k H e a d P h o n e s ( )   { 
 	 	 i f   ( t h i s . c o n f i g . o n l y O n H e a d p h o n e s )   { 
 	 	 	 c o n s t   a r e H e a d p h o n e s C o n n e c t e d   =   ! t h i s . o n I n t e r n a l S p e a k e r ( ) ; 
 	 	 	 c o n s t   w e r e H e a d p h o n e s C o n n e c t e d   =   t h i s . h e a d P h o n e s C o n n e c t e d ; 
 	 	 	 
 	 	 	 i f   ( a r e H e a d p h o n e s C o n n e c t e d   ! = =   w e r e H e a d p h o n e s C o n n e c t e d )   { 
 	 	 	 	 i f   ( a r e H e a d p h o n e s C o n n e c t e d )   { 
 	 	 	 	 	 t h i s . h e a d P h o n e s C o n n e c t e d   =   t r u e ; 
 	 	 	 	 	 t h i s . l i m i t V o l u m e ( ) ; 
 	 	 	 	 	 i f   ( ! t h i s . c o n f i g . d i s a b l e H e a d p h o n e N o t i f i c a t i o n s )   { 
 	 	 	 	 	 	 t h i s . a p p . d i s p l a y N o t i f i c a t i o n ( " " ,   { 
 	 	 	 	 	 	 	 w i t h T i t l e :   "�<ߧ   H e a d p h o n e s   c o n n e c t e d " , 
 	 	 	 	 	 	 	 s u b t i t l e :   t h i s . v o l u m e L i m i t T e x t , 
 	 	 	 	 	 	 } ) ; 
 	 	 	 	 	 } 
 	 	 	 	 } 
 	 	 	 	 e l s e   { 
   	 	 	 	 	 t h i s . h e a d P h o n e s C o n n e c t e d   =   f a l s e ; 
 	 	 	 	 	 i f   ( ! t h i s . c o n f i g . d i s a b l e H e a d p h o n e N o t i f i c a t i o n s )   { 
 	 	 	 	 	 	 t h i s . a p p . d i s p l a y N o t i f i c a t i o n ( " " ,   { 
 	 	 	 	 	 	 	 w i t h T i t l e :   "�=�   H e a d p h o n e s   d i s c o n n e c t e d " , 
 	 	 	 	 	 	 	 s u b t i t l e :   " S t o p p i n g   v o l u m e   l i m i t ,   b e   c a r e f u l " , 
 	 	 	 	 	 	 } ) ; 
 	 	 	 	 	 } 
 	 	 	 	 } 
 	 	 	 } 
 	 	 } 
 	 } 
 
 	 l i m i t V o l u m e ( )   { 
 	 	 i f   ( t h i s . s h o u l d L i m i t V o l u m e )   { 
 	 	 	 t h i s . a p p . b e e p ( ) ; 
 	 	 	 t h i s . a p p . s e t V o l u m e ( n u l l ,   {   o u t p u t V o l u m e :   t h i s . c o n f i g . m a x V o l u m e   } ) ; 
 	 	 } 
 	 } 
 	 
 	 l o a d C o n f i g ( c o n t e x t ,   c o n f i g F i l e N a m e )   { 
 	 	 / /   e x t r a c t   c u r r e n t   f o l d e r   c o n t e x t   t o   g e t   c o n f i g   f i l e   p a t h 
 	 	 c o n s t   c u r r e n t P a t h   =   t h i s . a p p . p a t h T o ( c o n t e x t ) . t o S t r i n g ( ) ; 
 	 	 c o n s t   c o n f i g F i l e P a t h   =   c u r r e n t P a t h . r e p l a c e ( / \ / [ ^ / ] + $ / ,   " " )   +   " / "   +   c o n f i g F i l e N a m e ; 
 	 
 	 	 t r y   { 
 	 	 	 / /   l o a d   c o n f i g   f r o m   f i l e 
 	 	 	 O b j e c t . a s s i g n ( t h i s . c o n f i g ,   J S O N . p a r s e ( t h i s . a p p . r e a d ( P a t h ( c o n f i g F i l e P a t h ) ) ) ) ; 
 	 	 }   c a t c h   { 
 	 	 	 / /   c r e a t e   n e w   c o n f i g   f i l e 
 	 	 	 t h i s . p r o m p t U s e r F o r I n i t i a l C o n f i g ( ) ; 
 	 	 	 t r y   { 
 	 	 	 	 t h i s . w r i t e T e x t T o F i l e ( J S O N . s t r i n g i f y ( t h i s . c o n f i g ,   n u l l ,   2 ) ,   c o n f i g F i l e P a t h ) ; 
 	 	 	 }   c a t c h   ( e )   { 
 	 	 	 	 c o n s o l e . l o g ( e ) ; 
 	 	 	 } 
 	 	 } 
 	 } 
 	 
 	 p r o m p t U s e r F o r I n i t i a l C o n f i g ( )   { 
 	 	 / /   a s k   f o r   m a x V o l u m e 
 	 	 l e t   m a x V o l u m e   =   n u l l ; 
 	 	 w h i l e   ( ! ( m a x V o l u m e   >   0   & &   m a x V o l u m e   < =   1 0 0 ) )   { 
 	 	 	 l e t   u s e r R e s p o n s e   =   t h i s . a p p . d i s p l a y D i a l o g ( " W h a t   p e r c e n t a g e   d o   y o u   w a n t   t o   l i m i t   y o u r   v o l u m e   t o ?   ( 1 - 1 0 0 % ) " ,   { 
 	 	 	 	 d e f a u l t A n s w e r :   " 5 0 " , 
 	 	 	 	 w i t h I c o n :   " n o t e " , 
 	 	 	 	 b u t t o n s :   [ " C o n t i n u e " ] , 
 	 	 	 	 d e f a u l t B u t t o n :   " C o n t i n u e " 
 	 	 	 } ) ; 
 	 	 	 m a x V o l u m e   =   N u m b e r ( u s e r R e s p o n s e . t e x t R e t u r n e d ) ; 
 	 	 } 
 	 	 t h i s . c o n f i g . m a x V o l u m e   =   m a x V o l u m e ; 
 	 } 
 	 
 	 w r i t e T e x t T o F i l e ( t e x t ,   f i l e )   { 
         	 t r y   { 
 	                 / /   c o n v e r t   t h e   f i l e   t o   a   s t r i n g 
                 	 l e t   f i l e S t r i n g   =   f i l e . t o S t r i n g ( ) ; 
   
 	                 / /   o p e n   t h e   f i l e   f o r   w r i t i n g 
 	 	 	 l e t   o p e n e d F i l e   =   t h i s . a p p . o p e n F o r A c c e s s ( P a t h ( f i l e S t r i n g ) ,   {   w r i t e P e r m i s s i o n :   t r u e   } ) ; 
   
 	 	 	 / /   w r i t e   t h e   n e w   c o n t e n t   t o   t h e   f i l e 
 	 	 	 t h i s . a p p . w r i t e ( t e x t ,   {   t o :   o p e n e d F i l e ,   s t a r t i n g A t :   0   } ) ; 
   
 	 	 	 / /   c l o s e   t h e   f i l e 
 	 	 	 t h i s . a p p . c l o s e A c c e s s ( o p e n e d F i l e ) ; 
 	 	 }   c a t c h ( e r r o r )   { 
 	 	 	 t r y   { 
 	 	 	 	 / /   c l o s e   t h e   f i l e 
 	 	 	 	 t h i s . a p p . c l o s e A c c e s s ( f i l e ) ; 
 	 	 	 }   c a t c h ( e r r o r )   { 
 	 	 	 	 / /   r e p o r t   t h e   e r r o r   i s   c l o s i n g   f a i l e d 
 	 	 	 	 c o n s o l e . l o g ( ` C o u l d n ' t   c l o s e   f i l e :   $ { e r r o r }   ( I s   t h e   s c r i p t   r u n n i n g   d i r e c t l y   i n   t h e   e d i t o r ? ) ` ) ; 
 	 	 	 } 
 	 	 } 
 	 } 
 } 
 
 v a r   S o u n d L i m i t e r I n s t a n c e   =   n e w   S o u n d L i m i t e r ( t h i s ) ; 
 
 f u n c t i o n   i d l e ( )   { 
 	 r e t u r n   S o u n d L i m i t e r I n s t a n c e . i d l e ( ) ; 
 } 
                              "�jscr  ��ޭ