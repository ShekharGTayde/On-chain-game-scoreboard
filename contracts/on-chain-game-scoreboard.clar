;; 0b Chain Game Scoreboard
;; Tracks players' scores on-chain

;; Error constants
(define-constant err-invalid-score (err u100))

;; Map: player principal :- score
(define-map scores principal uint)

;; Function 1: Update player score
(define-public (update-score (player principal) (new-score uint))
  (begin
    (asserts! (>= new-score u0) err-invalid-score)
    (map-set scores player new-score)
    (ok true)
  )
)

;; Function 2: Get player score
(define-read-only (get-score (player principal))
  (ok (default-to u0 (map-get? scores player)))
)
