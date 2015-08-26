class AdminController < ApplicationController
    
    def index
        @admin=params[:admin]
        @sb = AdminHome.new
        @b = Board.new
        @nav = Navbar.new
        @menu = Menu.new
        
        @mod = params[:mod]
        @mod = 0 if params[:mod].nil?
        @id = params[:id].to_i
        @id = 0 if params[:id].nil?
        
        if @admin=="m_sb" && @mod =="1"
            @sb = AdminHome.find(params[:id])
        end
        if @admin=="m_b" && @mod =="1"
            @b = Board.find(params[:id])
        end
        if @admin=="m_nav" && @mod =="1"
            @nav = Navbar.find(params[:id])
        end
        if @admin=="m_menu" && @mod =="1"
            @menu = Menu.find(params[:id])
        end
        
    end

    def m_nav
        nav = Navbar.new
        nav = Navbar.find(params[:id]) if params[:mod]=="1"

        
        nav.index = params[:index]
        nav.level = params[:level]
        nav.title = params[:title]
        nav.style_class = params[:style_class]
        nav.ltype = params[:ltype]
        nav.url = params[:url]
        nav.icon = params[:icon]
        nav.xs = params[:xs]
        nav.sm = params[:sm]
        nav.md = params[:md]
        nav.lg = params[:lg]
        
        nav.xs = 1 if params[:xs].nil? || params[:xs] == 0
        nav.sm = 1 if params[:sm].nil? || params[:sm] == 0
        nav.md = 1 if params[:md].nil? || params[:md] == 0
        nav.lg = 1 if params[:lg].nil? || params[:lg] == 0

        nav.save
        redirect_to '/admin/index?admin=navbar'
    end
    
    def del_nav
        nav = Navbar.find(params[:id])
        nav.delete
        redirect_to '/admin/index?admin=navbar'
    end

    def m_sb
        sb = AdminHome.new
        sb = AdminHome.find(params[:id]) if params[:mod] == "1"
        sb.board_name = params[:name]
        sb.board_title = params[:title]
        sb.board_subtitle = params[:subtitle]
        sb.level = params[:level]
        sb.max_length = params[:max_length]
        sb.board_post = params[:board_post]
        sb.save
        redirect_to '/admin/index?admin=sampleboard'
    end
    
    def del_sb
        sb = AdminHome.find(params[:id])
        sb.delete
        redirect_to '/admin/index?admin=sampleboard'
    end
    
    def m_menu
        m = Menu.new
        m = Menu.find(params[:id]) if params[:mod] == "1"
        m.title = params[:title]
        m.level = params[:level]
        m.icon = params[:icon]
        m.index = params[:index]
        m.url = params[:url]
        m.ltype = params[:ltype]
        m.navbar_id = params[:navbar_id]
        m.save
        redirect_to '/admin/index?admin=menu'
    end
    
    def m_b
        b = Board.new
        b = Board.find(params[:id]) if params[:mod] == "1"
        b.board_name = params[:board_name]
        b.content = params[:content]
        b.title = params[:title]
        b.flag = params[:flag]
        b.position1 = params[:position1]
        b.position2 = params[:position2]
        b.level_admin = params[:level_admin]
        b.level_read = params[:level_read]
        b.level_list = params[:level_list]
        b.level_comment = params[:level_comment]
        b.level_delete = params[:level_delete]
        b.level_modify = params[:level_modify]
        b.level_write = params[:level_write]
        b.save
        
        redirect_to '/admin/index?admin=board'
    end
    
    def del_b
        b = Board.find(params[:id])
        b.delete
        redirect_to '/admin/index?admin=board'
    end
    
end
