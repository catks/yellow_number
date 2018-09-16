module YellowNumber
  module Search
    module Strategies
      #
      ## Class responsible to fetch contacts from Vivo
      class VivoStrategy
        START_URL = 'https://meuvivofixo.vivo.com.br/servlet/Satellite?c=Page&pagename=MeuVivoFixo/Page/TemplateGlobalAreaAberta&cid=1382552299089&token=wFXnsitFkjcyQw7qmg76Kq9y8vsXcrhrpk_gV1-EpDRX7sSCKJ3L6nDG9T8Yw61TQwADQavR-Ww'.freeze

        def initialize(browser:)
          @browser = browser
        end

        # Returns a Contact Collection
        def call(address)
          go_to_form
          fill_form(address)
          get_all_contacts
        end

        private

        def go_to_form
          @browser.goto START_URL
          @browser.links.select{ |el| el.text == 'Por Endereço' }.first.click
          @browser.buttons.select{ |el| el.text == 'Confirmar' }.first.click
        end

        def fill_form(address)
          @browser.text_field(name: 'LOGRADOURO_ASSINANTE').wait_until_present.set(address[:street])
          @browser.text_field(name: 'NUM_LOGR_ASSINANTE').set(address[:number])
          @browser.text_field(name: 'NUM_LOGR_ASSINANTE_ATE').set(address[:number])
          @browser.text_field(name: 'CIDADE_ASSINANTE').set(address[:city])
          @browser.link(id: 'btnPesquisar').click
        end

        def get_all_contacts
          if pagination_present?
            pagination_links.map.with_index do |_, index|
              pagination_links[index].click
              get_current_page_contacts
            end.flatten
          else
            get_current_page_contacts
          end
        end

        def get_current_page_contacts
          @browser.table(class: 'tabelaResultado').wait_until_present.tables.map do |table|
            {
              name: table.tbody.tds.first.text,
              address: table.tbody.tds[1].text,
              number: table.tbody.tds[2].text
            }
          end
        end

        def pagination_present?
          @browser.table(class: 'tabelaResultado').wait_until_present.td(class: 'pagination').present?
        end

        # Elements
        def pagination_links
          @browser.table(class: 'tabelaResultado').td(class: 'pagination').as
        end
      end
    end
  end
end
