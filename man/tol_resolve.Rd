% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tol_resolve.R
\name{tol_resolve}
\alias{tol_resolve}
\title{Resolve names using Open Tree of Life (OTL) resolver}
\usage{
tol_resolve(
  names = NULL,
  context_name = NULL,
  do_approximate_matching = TRUE,
  ids = NULL,
  include_suppressed = FALSE,
  ...
)
}
\arguments{
\item{names}{(character) taxon names to be queried}

\item{context_name}{name of the taxonomic context to be searched
(length-one character vector). Must match (case sensitive) one
of the values returned by \code{\link[rotl:tnrs_contexts]{rotl::tnrs_contexts()}}.}

\item{do_approximate_matching}{(logical) A logical indicating whether or not
to perform approximate string (a.k.a. \dQuote{fuzzy}) matching. Using \code{FALSE}
will greatly improve speed. Default: \code{TRUE}}

\item{ids}{An array of OTL ids to use for identifying names. These
will be assigned to each name in the names array. If ids is
provided, then ids and names must be identical in length.}

\item{include_suppressed}{(logical) Ordinarily, some quasi-taxa, such as
incertae sedis buckets and other non-OTUs, are suppressed from TNRS
results. If this parameter is true, these quasi-taxa are allowed as
possible TNRS results. Default: \code{FALSE}}

\item{...}{Curl options passed on to \code{httr::POST} within
\code{\link[rotl:tnrs_match_names]{rotl::tnrs_match_names()}}}
}
\value{
A data frame summarizing the results of the query. The
original query output is appended as an attribute to the
returned object (and can be obtained using
\code{attr(object, "original_response")}).
}
\description{
Resolve names using Open Tree of Life (OTL) resolver
}
\examples{
\dontrun{
tol_resolve(names=c("echinodermata", "xenacoelomorpha",
  "chordata", "hemichordata"))
tol_resolve(c("Hyla", "Salmo", "Diadema", "Nautilus"))
tol_resolve(c("Hyla", "Salmo", "Diadema", "Nautilus"),
  context_name = "Animals")

turducken_spp <- c("Meleagris gallopavo", "Anas platyrhynchos",
  "Gallus gallus")
tol_resolve(turducken_spp, context_name="Animals")
}
}
\references{
https://github.com/OpenTreeOfLife/germinator/wiki/TNRS-API-v3#match_names
}
\seealso{
\code{\link[=gnr_resolve]{gnr_resolve()}}, \code{\link[=tnrs]{tnrs()}}
}
\author{
Francois Michonneau \email{francois.michonneau@gmail.com}
Scott Chamberlain \email{myrmecocystus@gmail.com}
}
\keyword{names}
\keyword{resolve}
\keyword{taxonomy}
