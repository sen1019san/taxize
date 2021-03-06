% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/synonyms.R
\name{synonyms}
\alias{synonyms}
\alias{synonyms.default}
\alias{synonyms.tsn}
\alias{synonyms.tpsid}
\alias{synonyms.nbnid}
\alias{synonyms.wormsid}
\alias{synonyms.iucn}
\alias{synonyms.pow}
\alias{synonyms.ids}
\alias{synonyms_df}
\title{Retrieve synonyms from various sources given input taxonomic
names or identifiers}
\usage{
synonyms(...)

\method{synonyms}{default}(sci_id, db = NULL, rows = NA, x = NULL, ...)

\method{synonyms}{tsn}(id, ...)

\method{synonyms}{tpsid}(id, ...)

\method{synonyms}{nbnid}(id, ...)

\method{synonyms}{wormsid}(id, ...)

\method{synonyms}{iucn}(id, ...)

\method{synonyms}{pow}(id, ...)

\method{synonyms}{ids}(id, ...)

synonyms_df(x)
}
\arguments{
\item{...}{Other passed arguments to internal functions \verb{get_*()} and
functions to gather synonyms.}

\item{sci_id}{Vector of taxa names (character) or IDs (character or numeric)}

\item{db}{character; database to query. either \code{itis}, \code{tropicos},
\code{nbn}, \code{worms}, or \code{pow}. Note that each taxonomic data source has their own
identifiers, so that if you provide the wrong \code{db} value for the identifier
you could get a result, but it will likely be wrong (not what you were
expecting). If using tropicos, we  recommend getting an API key;
see \link{taxize-authentication}}

\item{rows}{(numeric) Any number from 1 to infinity. If the default NA, all
rows are considered. Note that this parameter is ignored if you pass in a
taxonomic id of any of the acceptable classes: tsn, tpsid, nbnid, ids.}

\item{x}{For \code{synonyms()}: deprecated, see \code{sci_id}. For \code{synonyms_df()},
the output of \code{synonyms()}}

\item{id}{character; identifiers, returned by \code{\link[=get_tsn]{get_tsn()}}, \code{\link[=get_tpsid]{get_tpsid()}},
\code{\link[=get_nbnid]{get_nbnid()}}, \code{\link[=get_wormsid]{get_wormsid()}}, \code{\link[=get_pow]{get_pow()}}}
}
\value{
A named list of results with three types of output in each slot:
\itemize{
\item if the name was not found: \code{NA_character_}
\item if the name was found but no synonyms found, an empty data.frame (0 rows)
\item if the name was found, and synonyms found, a data.frames with the
synonyms - the column names vary by data source
}
}
\description{
Retrieve synonyms from various sources given input taxonomic
names or identifiers
}
\details{
If IDs are supplied directly (not from the \verb{get_*()} functions)
you must specify the type of ID.

For \code{db = "itis"} you can pass in a parameter \code{accepted} to
toggle whether only accepted names are used \code{accepted = TRUE}, or if
all are used \code{accepted = FALSE}. The default is \code{accepted = FALSE}

Note that IUCN requires an API key. See \link[rredlist:rredlist-package]{rredlist::rredlist-package}
for help on authentiating with IUCN Redlist
}
\examples{
\dontrun{
# Plug in taxon IDs
synonyms(183327, db="itis")
synonyms("25509881", db="tropicos")
synonyms("NBNSYS0000004629", db='nbn')
synonyms(105706, db='worms')
synonyms(12392, db='iucn')
synonyms('urn:lsid:ipni.org:names:358881-1', db='pow')

# Plug in taxon names directly
synonyms("Pinus contorta", db="itis")
synonyms("Puma concolor", db="itis")
synonyms(c("Poa annua",'Pinus contorta','Puma concolor'), db="itis")
synonyms("Poa annua", db="tropicos")
synonyms("Pinus contorta", db="tropicos")
synonyms(c("Poa annua",'Pinus contorta'), db="tropicos")
synonyms("Pinus sylvestris", db='nbn')
synonyms('Pomatomus', db='worms')
synonyms('Pomatomus saltatrix', db='worms')
synonyms('Lithocarpus mindanaensis', db='pow')
synonyms('Poa annua', db='pow')
synonyms(c('Poa annua', 'Pinus contorta', 'foo bar'), db='pow')

# not accepted names, with ITIS
## looks for whether the name given is an accepted name,
## and if not, uses the accepted name to look for synonyms
synonyms("Acer drummondii", db="itis")
synonyms("Spinus pinus", db="itis")

# Use get_* methods
synonyms(get_tsn("Poa annua"))
synonyms(get_tpsid("Poa annua"))
synonyms(get_nbnid("Carcharodon carcharias"))
synonyms(get_iucn('Loxodonta africana'))
synonyms(get_pow('Lithocarpus mindanaensis'))

# Pass many ids from class "ids"
out <- get_ids(names="Poa annua", db = c('itis','tropicos'))
synonyms(out)

# Use the rows parameter to select certain rows
synonyms("Poa annua", db='tropicos', rows=1)
synonyms("Poa annua", db='tropicos', rows=1:3)
synonyms("Pinus sylvestris", db='nbn', rows=1:3)

# Use curl options
synonyms("Poa annua", db='tropicos', rows=1, verbose = TRUE)
synonyms("Poa annua", db='itis', rows=1, verbose = TRUE)


# combine many outputs together
x <- synonyms(c("Osmia bicornis", "Osmia rufa", "Osmia"), db = "itis")
synonyms_df(x)

## note here how Pinus contorta is dropped due to no synonyms found
synonyms_df(x)

## note here that ids are taxon identifiers b/c you start with them
x <- synonyms(c(25509881, 13100094), db="tropicos")
synonyms_df(x)

## NBN
x <- synonyms(c('Aglais io', 'Usnea hirta', 'Arctostaphylos uva-ursi'),
  db="nbn")
synonyms_df(x)
}
}
\seealso{
\code{\link[=get_tsn]{get_tsn()}} \code{\link[=get_tpsid]{get_tpsid()}} \code{\link[=get_nbnid]{get_nbnid()}}
\code{\link[=get_wormsid]{get_wormsid()}} \code{\link[=get_iucn]{get_iucn()}} \code{\link[=get_pow]{get_pow()}}
}
