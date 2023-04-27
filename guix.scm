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

(use-modules (guix packages)
             (guix licenses)
             (guix utils)
             (guix gexp)
             (guix build-system gnu)
             (gnu packages)
             (gnu packages autotools)
             (gnu packages guile)
             (gnu packages guile-xyz)
             (gnu packages pkg-config)
             (gnu packages texinfo))

(define %srcdir
  (or (current-source-directory) "."))

(package
  (name "glorri")
  (version "0.0.0")
  (source (local-file (dirname %srcdir) #:recursive? #t))
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
  (license gpl3+))
