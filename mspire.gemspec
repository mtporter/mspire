# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mspire"
  s.version = "0.6.25"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John T. Prince", "Simon Chiang"]
  s.date = "2012-03-13"
  s.description = "mass spectrometry proteomics, lipidomics, and tools, a rewrite of mspire, merging of ms-* gems"
  s.email = "jtprince@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/bin.rb",
    "lib/core_ext/array/in_groups.rb",
    "lib/cv.rb",
    "lib/cv/param.rb",
    "lib/cv/referenceable_param_group_ref.rb",
    "lib/io/bookmark.rb",
    "lib/merge.rb",
    "lib/ms.rb",
    "lib/ms/cv.rb",
    "lib/ms/cv/param.rb",
    "lib/ms/cv/paramable.rb",
    "lib/ms/digester.rb",
    "lib/ms/error_rate/decoy.rb",
    "lib/ms/error_rate/qvalue.rb",
    "lib/ms/fasta.rb",
    "lib/ms/ident.rb",
    "lib/ms/ident/peptide.rb",
    "lib/ms/ident/peptide/db.rb",
    "lib/ms/ident/peptide_hit.rb",
    "lib/ms/ident/peptide_hit/qvalue.rb",
    "lib/ms/ident/pepxml.rb",
    "lib/ms/ident/pepxml/modifications.rb",
    "lib/ms/ident/pepxml/msms_pipeline_analysis.rb",
    "lib/ms/ident/pepxml/msms_run_summary.rb",
    "lib/ms/ident/pepxml/parameters.rb",
    "lib/ms/ident/pepxml/sample_enzyme.rb",
    "lib/ms/ident/pepxml/search_database.rb",
    "lib/ms/ident/pepxml/search_hit.rb",
    "lib/ms/ident/pepxml/search_hit/modification_info.rb",
    "lib/ms/ident/pepxml/search_result.rb",
    "lib/ms/ident/pepxml/search_summary.rb",
    "lib/ms/ident/pepxml/spectrum_query.rb",
    "lib/ms/ident/protein.rb",
    "lib/ms/ident/protein_group.rb",
    "lib/ms/ident/search.rb",
    "lib/ms/isotope.rb",
    "lib/ms/isotope/aa.rb",
    "lib/ms/isotope/distribution.rb",
    "lib/ms/isotope/nist_isotope_info.yml",
    "lib/ms/mascot.rb",
    "lib/ms/mass.rb",
    "lib/ms/mass/aa.rb",
    "lib/ms/molecular_formula.rb",
    "lib/ms/mzml.rb",
    "lib/ms/mzml/activation.rb",
    "lib/ms/mzml/chromatogram.rb",
    "lib/ms/mzml/chromatogram_list.rb",
    "lib/ms/mzml/component.rb",
    "lib/ms/mzml/contact.rb",
    "lib/ms/mzml/cv.rb",
    "lib/ms/mzml/data_array.rb",
    "lib/ms/mzml/data_array_container_like.rb",
    "lib/ms/mzml/data_processing.rb",
    "lib/ms/mzml/file_content.rb",
    "lib/ms/mzml/file_description.rb",
    "lib/ms/mzml/index_list.rb",
    "lib/ms/mzml/instrument_configuration.rb",
    "lib/ms/mzml/isolation_window.rb",
    "lib/ms/mzml/list.rb",
    "lib/ms/mzml/plms1.rb",
    "lib/ms/mzml/precursor.rb",
    "lib/ms/mzml/processing_method.rb",
    "lib/ms/mzml/product.rb",
    "lib/ms/mzml/referenceable_param_group.rb",
    "lib/ms/mzml/run.rb",
    "lib/ms/mzml/sample.rb",
    "lib/ms/mzml/scan.rb",
    "lib/ms/mzml/scan_list.rb",
    "lib/ms/mzml/scan_settings.rb",
    "lib/ms/mzml/selected_ion.rb",
    "lib/ms/mzml/software.rb",
    "lib/ms/mzml/source_file.rb",
    "lib/ms/mzml/spectrum.rb",
    "lib/ms/mzml/spectrum_list.rb",
    "lib/ms/obo.rb",
    "lib/ms/peak.rb",
    "lib/ms/peak/point.rb",
    "lib/ms/plms1.rb",
    "lib/ms/quant/qspec.rb",
    "lib/ms/quant/qspec/protein_group_comparison.rb",
    "lib/ms/spectrum.rb",
    "lib/ms/spectrum/centroid.rb",
    "lib/ms/spectrum_like.rb",
    "lib/ms/user_param.rb",
    "lib/mspire.rb",
    "lib/obo/ims.rb",
    "lib/obo/ms.rb",
    "lib/obo/ontology.rb",
    "lib/obo/unit.rb",
    "lib/openany.rb",
    "lib/write_file_or_string.rb",
    "mspire.gemspec",
    "obo/ims.obo",
    "obo/ms.obo",
    "obo/unit.obo",
    "script/mzml_read_binary.rb",
    "spec/bin_spec.rb",
    "spec/ms/cv/param_spec.rb",
    "spec/ms/digester_spec.rb",
    "spec/ms/error_rate/qvalue_spec.rb",
    "spec/ms/fasta_spec.rb",
    "spec/ms/ident/peptide/db_spec.rb",
    "spec/ms/ident/pepxml/sample_enzyme_spec.rb",
    "spec/ms/ident/pepxml/search_hit/modification_info_spec.rb",
    "spec/ms/ident/pepxml_spec.rb",
    "spec/ms/ident/protein_group_spec.rb",
    "spec/ms/isotope/aa_spec.rb",
    "spec/ms/isotope/distribution_spec.rb",
    "spec/ms/isotope_spec.rb",
    "spec/ms/mass_spec.rb",
    "spec/ms/molecular_formula_spec.rb",
    "spec/ms/mzml/cv_spec.rb",
    "spec/ms/mzml/data_array_spec.rb",
    "spec/ms/mzml/file_content_spec.rb",
    "spec/ms/mzml/file_description_spec.rb",
    "spec/ms/mzml/index_list_spec.rb",
    "spec/ms/mzml/plms1_spec.rb",
    "spec/ms/mzml/referenceable_param_group_spec.rb",
    "spec/ms/mzml_spec.rb",
    "spec/ms/peak_spec.rb",
    "spec/ms/plms1_spec.rb",
    "spec/ms/quant/qspec_spec.rb",
    "spec/ms/spectrum_spec.rb",
    "spec/ms/user_param_spec.rb",
    "spec/mspire_spec.rb",
    "spec/obo_spec.rb",
    "spec/spec_helper.rb",
    "spec/testfiles/ms/ident/peptide/db/uni_11_sp_tr.fasta",
    "spec/testfiles/ms/ident/peptide/db/uni_11_sp_tr.msd_clvg2.min_aaseq4.yml",
    "spec/testfiles/ms/mzml/j24z.idx_comp.3.mzML",
    "spec/testfiles/ms/mzml/mspire_simulated.MSn.check.mzML",
    "spec/testfiles/ms/mzml/openms.noidx_nocomp.12.mzML",
    "spec/testfiles/ms/quant/kill_extra_tabs.rb",
    "spec/testfiles/ms/quant/max_quant_output.provenance.txt",
    "spec/testfiles/ms/quant/max_quant_output.txt",
    "spec/testfiles/ms/quant/pdcd5_final.killedextratabs.tsv",
    "spec/testfiles/ms/quant/pdcd5_final.killedextratabs.tsv_qspecgp",
    "spec/testfiles/ms/quant/pdcd5_final.killedextratabs.tsv_qspecgp.csv",
    "spec/testfiles/ms/quant/pdcd5_final.txt",
    "spec/testfiles/ms/quant/pdcd5_final.txt_qspecgp",
    "spec/testfiles/ms/quant/pdcd5_lfq_qspec.CSV.csv",
    "spec/testfiles/ms/quant/pdcd5_lfq_qspec.csv",
    "spec/testfiles/ms/quant/pdcd5_lfq_qspec.oneprot.csv",
    "spec/testfiles/ms/quant/pdcd5_lfq_qspec.oneprot.tsv",
    "spec/testfiles/ms/quant/pdcd5_lfq_qspec.oneprot.tsv_qspecgp",
    "spec/testfiles/ms/quant/pdcd5_lfq_qspec.oneprot.tsv_qspecgp.csv",
    "spec/testfiles/ms/quant/pdcd5_lfq_qspec.txt",
    "spec/testfiles/ms/quant/pdcd5_lfq_tabdel.txt",
    "spec/testfiles/ms/quant/pdcd5_lfq_tabdel.txt_qspecgp",
    "spec/testfiles/ms/quant/remove_rest_of_proteins.rb",
    "spec/testfiles/ms/quant/unlog_transform.rb",
    "spec/testfiles/plms1/output.key"
  ]
  s.homepage = "http://github.com/princelab/mspire"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "mass spectrometry proteomics, lipidomics, and tools"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_runtime_dependency(%q<bsearch>, [">= 1.5.0"])
      s.add_runtime_dependency(%q<andand>, [">= 1.3.1"])
      s.add_runtime_dependency(%q<obo>, [">= 0.1.0"])
      s.add_runtime_dependency(%q<builder>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<trollop>, [">= 1.16.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_dependency(%q<bsearch>, [">= 1.5.0"])
      s.add_dependency(%q<andand>, [">= 1.3.1"])
      s.add_dependency(%q<obo>, [">= 0.1.0"])
      s.add_dependency(%q<builder>, [">= 3.0.0"])
      s.add_dependency(%q<trollop>, [">= 1.16.2"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1.5"])
    s.add_dependency(%q<bsearch>, [">= 1.5.0"])
    s.add_dependency(%q<andand>, [">= 1.3.1"])
    s.add_dependency(%q<obo>, [">= 0.1.0"])
    s.add_dependency(%q<builder>, [">= 3.0.0"])
    s.add_dependency(%q<trollop>, [">= 1.16.2"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

