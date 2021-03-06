% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/segments.R
\name{geneUsage}
\alias{geneUsage}
\title{Gene usage.}
\usage{
geneUsage(
  .data,
  .genes = HUMAN_TRBV_MITCR,
  .quant = c(NA, "read.count", "umi.count", "read.prop", "umi.prop"),
  .norm = F,
  .ambig = F
)
}
\arguments{
\item{.data}{Cloneset data frame or a list with clonesets.}

\item{.genes}{Either one of the gene alphabet (e.g., HUMAN_TRBV, \link{genealphabets}) or list with two gene alphabets for computing 
joint distribution.}

\item{.quant}{Which column to use for the quantity of clonotypes: NA for computing only number of genes without using clonotype counts, 
"read.count" for the "Read.count" column, "umi.count" for the "Umi.count" column, "read.prop" for the "Read.proportion" column,
"umi.prop" for the "Umi.proportion" column.}

\item{.norm}{If T then return proportions of resulting counting of genes.}

\item{.ambig}{If F than remove from counting genes which are not presented in the given gene alphabet(s).}
}
\value{
If \code{.data} is a cloneset and \code{.genes} is NOT a list than return a data frame with first column "Gene" with genes and second with counts / proportions.

If \code{.data} is a list with clonesets and \code{.genes} is NOT a list than return a data frame with first column "Gene" 
with genes and other columns with counts / proportions for each cloneset in the input list.

If \code{.data} is a cloneset and \code{.genes} IS a list than return a matrix with gene segments for the first gene in \code{.genes}
and column names for the second gene in \code{.genes}. See "Examples".

If \code{.data} is a list with clonesets and \code{.genes} IS a list than return a list with matrices like in the previous case.
}
\description{
Compute frequencies or counts of gene segments ("V / J - usage").
}
\examples{
\dontrun{
# Load your data
data(twb)
# compute V-segments frequencies of human TCR beta.
seg <- geneUsage(twb, HUMAN_TRBV, .norm = T)
# plot V-segments frequencies as a heatmap
vis.heatmap(seg, .labs = c("Sample", "V gene"))
# plot V-segments frequencies directly from clonesets
vis.gene.usage(twb, HUMAN_TRBV)
# plot V-segments frequencies from the gene frequencies
vis.gene.usage(seg, NA)
# Compute V-J joint usage.
geneUsage(twb, list(HUMAN_TRBV, HUMAN_TRBJ))
# for future:
# geneUsage(twb, "human", "trbv")
}
}
\seealso{
\code{\link{genealphabets}}, \code{\link{vis.gene.usage}}, \code{\link{pca.segments}}
}
