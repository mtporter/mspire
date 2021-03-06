
require 'mspire/ident/protein_group'
require 'mspire/ident/protein'
require 'mspire/ident/peptide_hit'

module Mspire

  # An Mspire::Ident::ProteinGroup is an array of proteins that responds to
  # :peptide_hits.  All protein level identifications should be stored in a
  # proteingroup object.
  #
  # An Mspire::Ident::Protein is an object representing a protein (:id,
  # :sequence, :description).  Note, it is not a protein hit (use a
  # ProteinGroup)
  #  
  # An Mspire::Ident::PeptideHit is an object representing a match between an
  # amino acid sequence and a spectrum.
  #
  # Typical usage:
  #
  #     require 'mspire/ident'
  #
  #     hit1 = PeptideHit.new(:id => 1, :aaseq => 'PEPTIDE', :search =>
  #     Mspire::Ident::Search.new, etc...)
  #     peptide_hits = [hit1, hit2, ...]
  #
  #     protein_groups = Mspire::Ident::ProteinGroup.peptide_hits_to_protein_groups(peptide_hits)
  #     protein_groups.first.peptide_hits  # => the peptide hits in that group
  module Ident
    # returns the filetype (if possible)
    def self.filetype(file)
      if file =~ /\.srf$/i
        :srf
      end
    end
  end
end
