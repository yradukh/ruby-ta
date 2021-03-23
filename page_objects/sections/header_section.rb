# frozen_string_literal: true

class HeaderSection < SitePrism::Section
  element :header, '#header'
  element :header_title, '#header > h1'
end
