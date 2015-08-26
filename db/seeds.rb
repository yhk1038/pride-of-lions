# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

board = Board.create(   level_read: 1,
                        level_admin: 5,
                        level_comment: 1,
                        level_delete: 5,
                        level_list: 0,
                        level_modify: 5,
                        level_write: 1,
                        title: "Question_Board",
                        content: "This is a QnA-Board.",
                        flag: "",
                        position1: 1,
                        position2: 2,
                        board_name: "question"
                    )
board = Board.create(   level_read: 1,
                        level_admin: 5,
                        level_comment: 1,
                        level_delete: 5,
                        level_list: 0,
                        level_modify: 5,
                        level_write: 5,
                        title: "Notice_Board",
                        content: "This is a notice-Board.",
                        flag: "",
                        position1: 1,
                        position2: 1,
                        board_name: "notice"
                    )
board = Board.create(   level_read: 1,
                        level_admin: 5,
                        level_comment: 1,
                        level_delete: 5,
                        level_list: 0,
                        level_modify: 5,
                        level_write: 5,
                        title: "Lions News",
                        content: "This is a notice-Board.",
                        flag: "",
                        position1: 1,
                        position2: 1,
                        board_name: "lion_news"
                    )
a = Digest::SHA256.hexdigest "a"
user = User.create( user_email: "a@a.a",
                    user_password: a,
                    user_name: "현민",
                    user_team: "2거사자",
                    user_sex: 1,
                    user_univ: 9,
                    user_level: 10,
                    user_phone: "010-7135-9955"
                )
a = Digest::SHA256.hexdigest "a"
user = User.create( user_email: "yhk1038@hanmail.net",
                    user_password: a,
                    user_name: "용현",
                    user_team: "재철이는코끼리를타고",
                    user_sex: 1,
                    user_univ: 9,
                    user_level: 10,
                    user_phone: "010-2482-4541"
                )
                

nav = Navbar.create(    index: 1,
                        title: "알림",
                        icon: "glyphicon-bullhorn",
                        style_class: "notice",
                        level: 0,
                        ltype: "dropdown",
                        xs: 2
                        )
nav = Navbar.create(    index: 2,
                        title: "Portfolios",
                        level: 0,
                        ltype: "dropdown",
                        xs: 2,
                        sm: 2
                        )
nav = Navbar.create(    index: 3,
                        title: "Community",
                        level: 0,
                        ltype: "dropdown",
                        xs: 2,
                        sm: 2
                        )
nav = Navbar.create(    index: 4,
                        title: "Campus",
                        level: 0,
                        ltype: "link",
                        xs: 2,
                        sm: 2
                        )
nav = Navbar.create(    index: 5,
                        title: "Admin",
                        level: 0,
                        ltype: "link",
                        url: "/admin/index",
                        xs: 2,
                        sm: 2
                        )
                        
menu = Menu.create(     navbar_id: 1,
                        index: 1,
                        ltype: "header",
                        title: "NEWS",
                        level: 0
                        )
menu = Menu.create(     navbar_id: 1,
                        index: 2,
                        ltype: "link",
                        title: "공지사항",
                        url: "/board/index?board_name=notice"
                        )
menu = Menu.create(     navbar_id: 1,
                        index: 3,
                        ltype: "link",
                        title: "Lion's News",
                        url: "/board/index?board_name=lion_news"
                        )
menu = Menu.create(     navbar_id: 1,
                        index: 4,
                        ltype: "divider"
                        )
menu = Menu.create(     navbar_id: 1,
                        index: 5,
                        ltype: "link",
                        title: "질문게시판",
                        url: "/board/index?board_name=question"
                        )
                        
menu = Menu.create(     navbar_id: 2,
                        index: 1,
                        ltype: "link",
                        title: "구경하기",
                        url: "/main/look_portfolio"
                        )
menu = Menu.create(     navbar_id: 2,
                        index: 2,
                        ltype: "link",
                        title: "내 포트폴리오",
                        url: "/main/my_portfolio"
                        )