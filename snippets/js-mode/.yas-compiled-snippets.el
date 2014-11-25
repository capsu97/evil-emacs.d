;;; Compiled snippets and support files for `js-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js-mode
                     '(("cc" "React.createClass({\n$0\n});\n" "React.createClass" nil nil nil nil nil nil)
                       ("cdm" "componentDidMount: function(${1:rootNode}) {\n$0\n}\n" "React#componentDidMount" nil nil nil nil nil nil)
                       ("cdu" "componentDidUpdate: function(${1:prevProps}, ${2:prevState}, ${3:rootNode}) {\n$0\n}\n" "React#componentDidUpdate" nil nil nil nil nil nil)
                       ("cwm" "componentWillMount: function() {\n$0\n}\n" "React#componentWillMount" nil nil nil nil nil nil)
                       ("cwrp" "componentWillReceiveProps: function(${1:nextProps}) {\n$0\n}\n" "React#componentWillReceiveProps" nil nil nil nil nil nil)
                       ("cwu" "componentWillUpdate: function(${1:nextProps}, ${2:nextState}) {\n$0\n}\n" "React#componentWillUpdate" nil nil nil nil nil nil)
                       ("cwum" "componentWillUnmount: function() {\n$0\n}\n" "React#componentWillUnmount" nil nil nil nil nil nil)
                       ("gdp" "getDefaultProps: function() {\n$0\n}\n" "React#getDefaultProps" nil nil nil nil nil nil)
                       ("gis" "getInitialState: function() {\n$0\n}\n" "React#getInitialState" nil nil nil nil nil nil)
                       ("r" "render: function() {\n$0\n}" "React#render" nil nil nil nil nil nil)
                       ("rc" "React.renderComponent(\n$1,\n$0\n);\n" "React.renderComponent" nil nil nil nil nil nil)
                       ("scu" "shouldComponentUpdate: function(${1:nextProps}, ${2:nextState}) {\n$0\n}\n" "React#shouldComponentUpdate" nil nil nil nil nil nil)
                       ("sp" "this.setProps({$0});\n" "React#setProps" nil nil nil nil nil nil)
                       ("ss" "this.setState({$0});\n" "React#setState" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Mon Nov 17 19:05:31 2014
