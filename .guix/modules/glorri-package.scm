;;; Glorri --- Lorri, but in Guile for Guix.
;;; Copyright © 2023 Karl Hallsby <karl@hallsby.com>
;;;
;;; This file is part of Glorri.
;;;
;;; Glorri is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; Glorri is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with Glorri.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; GNU Guix development package.  To build and install, run:
;;
;;   guix package -f guix.scm
;;
;; To use as the basis for a development environment, run:
;;
;;   guix shell -D -f guix.scm
;;
;;; Code:

(define-module (glorri-package)
  #:use-module (guix packages)
  #:use-module (guix licenses)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download) ;For git-predicate
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages texinfo))

(define vcs-file?
  ;; Return true if the given file is under version control.
  (or (git-predicate
       (string-append (current-source-directory) "/../.."))
      (const #t)))

(define-public glorri
  (package
    (name "glorri")
    (version "0.0.0")
    (source (local-file "../.." "glorri-checkout"
                        #:recursive? #t
                        #:select? vcs-file?))
    (build-system gnu-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'bootstrap
           (lambda _ (zero? (system* "sh" "bootstrap")))))))
    (native-inputs (list autoconf automake pkg-config texinfo))
    (inputs (list guile-3.0))
    (synopsis "Lorri, but in Guile for Guix")
    (description "Glorri is an automatic environment manager, like Lorri for Nix.")
    (home-page "http://github.com/KarlJoad/glorri")
    (license gpl3+)))

glorri
