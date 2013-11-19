from flask import Flask, render_template, url_for

app = Flask(__name__)

@app.route('/')
def index():

	css_file = url_for('static', filename='css/bootstrap.min.css')
	js_angular_ctrl = url_for('static', filename='bootstrap/assets/js/angular.ctrl.js')

	navigation = [ { 'href' : '/', 'caption': 'Hem' }, { 'href' : '/yolo', 'caption': 'yolo' } ]

	return render_template('startpage.html', 
								navigation=navigation, 
								css_file=css_file,
								js_angular_ctrl=js_angular_ctrl)




@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name)

@app.route('/user/<username>')
def show_user_profile(username):
    # show the user profile for that user
    return 'User %s' % username

@app.route('/post/<int:post_id>')
def show_post(post_id):
    # show the post with the given id, the id is an integer
    return 'Post %d' % post_id

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=80, debug=True)
