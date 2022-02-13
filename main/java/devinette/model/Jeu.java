package devinette.model;

import java.util.Random;

public class Jeu {
	private int mistere;
	private int essai;
	private String status;

	public Jeu(){
		Random rand = new Random();
		this.mistere = rand.nextInt((10 - 1) + 1) + 1;
		this.essai = 3;
		this.status = "New Jeu";
	}

	public int getMistere() {
		return mistere;
	}

	public int getEssai() {
		return essai;
	}

	public void setEssai(int essai) {
		this.essai = essai;
	}

	public void getResultat(int nb){

		if( this.essai > 1 ){
			if( nb == this.mistere ){
				this.status = "gagné";
			}
			else{
				this.essai -= 1;
				this.status = "en cours";
			}
		}
		else{
			this.status = "perdu";
		}

	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
