class Restorant

	@@adresa_na_fajl = nil
	def self.adresa_na_fajl=(path=nil)
		@@adresa_na_fajl = File.join(APP_OSNOVA, path)
	end

	zemi_detali :ime, :kujna, :cena

	def self.postoi_baza?
		if @@adresa_na_fajl && File.exists?(@@adresa_na_fajl)
			return true
		else
			return false
	end



	def self.sozdadi_baza
		File.open(@@adresa_na_fajl, 'w') unless postoi_baza?
	end

	def self.zacuvani_restorani
	end

end
