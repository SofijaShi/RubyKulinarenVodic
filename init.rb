# Za zapocnuvanje na programata lansiraj go ovoj fajl

APP_OSNOVA = File.dirname(__FILE__)

$:.unshift(File.join(APP_OSNOVA, 'lib'))
require 'vodic'

vodic = Vodic.new('restoranti.txt')
vodic.lansiraj!