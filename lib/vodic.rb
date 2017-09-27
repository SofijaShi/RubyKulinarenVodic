require 'restorant'
class Vodic

	class Konfiguracija

		@@akcii = ['pregled', 'prebaraj', 'dodaj', 'izlezi']

		def self:akcii; @@akcii; end

	end

	def initialize(path=nil)
		Restorant.filepath = path

		if Restorant.postoi_baza?
			puts "Najdena e bazata na restorani."
		elsif Restorant.sozdadi_baza
			puts "Sozdadena e bazata na restorani."
		else
			puts "Se gasam.\n\n"
			exit!	
	end

	def lansiraj!
		voved
		until rezultat == :quit
			akcija = primi_akcija
			rezultat = izvrsi(odgovor_na_korisnik)
		end
		zaklucok
	end

	def primi_akcija
		akcija = nil
		until Vodic::Konfiguracija.akcii.include?(akcija)
			puts 'Mozni komandi: ' + Vodic::Konfiguracija.akcii.join(', ') if akcija 
			print "> "
			odgovor_na_korisnik = gets.chomp
			akcija = odgovor_na_korisnik.downcase.strip
		end
			return akcija

	end

	def izvrsi(akcija)

		case akcija
		when "pregled"
			puts "Pregleduvame..."
		when 'prebaraj'
			puts 'Prebaruvanje...'
		when 'dodaj'
			dodaj
		when 'izlezi'
			return :quit
		else
			puts "\nZalam, ne ja razbiram ovaa komanda.\n\n"
		end
	end

	def dodaj
		puts "\nDodaj restorant\n\n".upcase
		restorant = Restorant.new

		print "Ime na restoranot: "
		restorant.ime = gets.chome.strip
		print "Vid na gotvenje: "
		restorant.kujna = gets.chome.strip
		print "Procesna cena: "
		restorant.cena = gets.chome.strip

		if restorant.zacuvaj
			puts "\nRestorantot e dodaden\n\n"
		else
			puts "\nNastana greska: restorantot ne e dodaden\n\n"
	end

	def voved
		puts "\n\n<<< Dobrodojdovte vo naogjacot na restorani >>>\n\n"
		puts "Ova e interaktiven vodic so cel da vi pomogne da go pronajdete vasiot sleden obrok.\n\n"
	end

	def zaklucok
		puts "\n<<< Zbogum i dobar apetit! >>>\n\n\n"
	end

	def zacuvaj
		return false unless Restorant.koristi_baza?
		File.open(@@adresa_na_fajl, "a") do |file|
			file.puts "#{[@ime, @kujna, @cena].join("\t")}\n"
		end
		return true
	end

end