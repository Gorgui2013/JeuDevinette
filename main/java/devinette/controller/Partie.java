package devinette.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
// import javax.servlet.http.HttpSession;

import devinette.model.Jeu;

/**
 * Servlet implementation class Partie
 */
@WebServlet(name="partie", urlPatterns={"/", "*.path"})
public class Partie extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	Jeu jouer;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Partie() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		this.session = request.getSession();
		if(path.equals("/partie.path")) {
			if(this.session.getAttribute("partie") != null) {
				this.jouer = (Jeu) this.session.getAttribute("partie");
			} else {
				this.jouer = new Jeu();
			}
		} else if(path.equals("/rejouer.path")) {
			this.jouer = new Jeu();
			this.jouer.setStatus("en cours");
			this.session.setAttribute("partie", jouer);
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
