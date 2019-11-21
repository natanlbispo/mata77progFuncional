;; Macro

;;1
(define-syntax (pipe-v1 stx)
  (syntax-case stx ()
      [(_ val-expr) #'val-expr]
      )
  )
  
;;2

(define-syntax (pipe-v2 stx)
  (syntax-case stx ()
    [(_ val-expr) #'val-expr]
    [(_ val-expr (fn-expr arg-expr ...))
          #'(fn-expr val-expr arg-expr ...)]
    )
)

;;3 

define-syntax (pipe-v3 stx)
  (syntax-case stx ()
    [(_ val-expr) #'val-expr]
    [(_ val-expr (fn-expr arg-expr ...) clause ...)
          #'(pipe-v3 (fn-expr val-expr arg-expr ...) clause ...)]
    )
)

;;4
(define-syntax (pipe-v4 stx)
  (syntax-case stx ()
    [(_ val-expr) #'val-expr]
    [(_ val-expr (fn-expr arg-expr ...) clause ...)
          #'(pipe-v4 (fn-expr val-expr arg-expr ...) clause ...)]
    [(_ val-expr id-fn-expr clause ...)
          #'(pipe-v4 (id-fn-expr val-expr) clause ...)]
    )
)


;;5



;; condicional

(define (lat? l)
  (cond
    [(null? l) #t]
    [(non-atom? (first l)) #f]
    [else (lat? (rest l))]
))

;; if com recursividade - função somatorio

(define (soma-numeros l)
  (if (null? l)
    0
    (+ (first l) (soma-numeros (rest l)))))

;; com acumulador

(define (soma-numeros2 l a)
  (if (null? l)
    a
    (soma-numeros2 (rest l) (+ (first l) a))
  ))

;; removendo elementos da lista

(define (rmembro a l)
  (cond
    [(null? l) '()]
    [(eq? a (first l)) (rest l)]
    [else (cons (first l)
      (rmembro a (rest l)))]
))

;; substituição

(define (substitui a b l)
  (cond
    [(null? l) l]
    [(eq? a (first l)) (cons b (substitui a b (rest l)))]
    [else (cons (first l) (substitui a b (rest l)))]
))

;; recursividade em estruturas complexas

(define (membro*? a l)
  (cond
    [(null? l) #f]
    [(list? (first l)) (or (membro*? a (first l))
                            (membro*? a (rest l)))]
    [(eq? a (first l)) #t]
    [else (membro*? a (rest l))]
))

;;definindo variaveis 

(let [(a 100)
  (b 50)]
  (gcd a b)) 
  
;; numero variavel de parametros

(define (lista . numeros)
  numeros)

;; rest e apply 

(define (soma . lista)
  (if (null? lista)
    0
    (+ (first lista) (apply soma (rest lista)))
)) 

;; funções anonimas

(lambda (x y) (+ x y))

;; recebendo funções como parametro

(remove* '(4) '(2 3 4 1 10) <=)

;; função map

(map (lambda (number)
  (+ 1 number))
  '(1 2 3 4))

;; reduce
(foldl + 0 '(1 2 3 4))
