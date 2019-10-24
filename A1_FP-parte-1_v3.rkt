#lang racket
(define nota (lambda (n1 n2) (* n1 n2)))
;; (nota 10 10)

(define (nota2 n1 n2) (+ n1 n2))

(define (extrai str b e)
  (substring str b e))

;; (extrai "nome" 2 3)

;; Lista
'(a b c)

;; (a b) != (a.b) -> aqui é par, b não é c

;; Retorna cabeça Lista
(define a '(a b c))
(first a)

;; Retorna cabeça par
(define par '(a . b))
(car par)

;;Reotorna cauda Lista
(define (cauda cau)
  (rest cau)
  )
(cauda '(a b c))

;;Retorna cauda Par
(define (cauda2 cau)
  (cdr cau)
  )
(cauda2 '(1 . 2))

;;Encadear cdr e car (entendi não)
(cadr '(a b c))

;;
(define A '((a)(bc) d (e(fg))))
(rest A)

;; Juntando Listas
(define A1 '((a)))
(define A2 '((bc) d (e(fg))))
(cons A1 A2)

;;Juntar calda(A1) com cabeça(A2) 
(define A3 '(a b c))
(define A4 '(c d e))
(append A3 A4)

;;Listar
(list 'a 'b)
(list '(a b c))

;;
(length '(a b c))

;;
(reverse '(a b c))

;;
(list? '(a b c)) ;;#t

;; Tipos Primitivos

;;Booleans
#t ;;true
#f ;;false

;;Comparação

(boolean? #f)
(= 2 (+ 1 1))
(= 2 (+ 1 0))

(eq? 1 1) ;;#t

;;condicionais qualquer valor conta como certo
(if '() "certo" "errado")

;; Números
(define n1 3.14)
(complex? n1)
(= n1 3.14)
(define n2 4+9i)
(real-part n2)
(imag-part n2)
;; Soma de fração
(+ 1/3 1/5);;8/15
;;-----
(> 2 1) ;;#t
(sqrt 9) ;;3
(expt 3 2) ;;9
;;
(exact? 3.1);;se o número é fração
(exact? 3+4i) ;; true
(exact? 3.0+4i) ;; false
;;Caracteres
(integer->char 65)
(char->integer #\A)
;;Strings
(display "Apple\n")

;;
(define (juntaString j1 j2)
  (string-append j1 j2)
  )
(juntaString "um-" "dois")

;;
(define (retiraString j1 j2 j3)
  (substring j1 j2 j3)
  )
(retiraString "teste" 4 5)

;;
(string-length "teste")

;;
(string? "teste") ;;#t
(string? 1) ;;#f

;;
(pair? 1) ;;#f

;;Funções Variáticas
(* 1 2 3) ;; 1*2*3 = 6
(< 1 2 3) ;; 1 < 2 < 3 #t