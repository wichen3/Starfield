Particle[] odd = new OddballParticle[1];
Particle[] norm = new NormalParticle[1000];
Particle[] jumbo = new JumboParticle[1];
void setup()
{
	size(500,500);
	for(int j = 0; j < odd.length; j++)
	{
		odd[j] = new OddballParticle(250,250);
	}
	for(int l = 0; l < norm.length; l++)
	{
		norm[l] = new NormalParticle();
	}
	for(int o = 0; o < jumbo.length; o++)
	{
		jumbo[o] = new JumboParticle();
	}
}
void draw()
{
	background(0);
	for(int i = 0; i < odd.length; i++)
	{
		odd[i].show();
		odd[i].move();
	}
	for(int p = 0; p < norm.length; p++)
	{
		norm[p].show();
		norm[p].move();
		norm[p].reset();
	}
	for(int u = 0; u < jumbo.length; u++)
	{
		jumbo[u].show();
		jumbo[u].move();
		jumbo[u].reset();
		jumbo[u].check();
	}
}
class NormalParticle implements Particle
{
	double dTheta, dX, dY, dSpeed;
	int myColor, myColor2, myColor3;
	NormalParticle()
	{
		dX = 250;
		dY = 250;
		dTheta = Math.random() * 361;
		dSpeed = 3;
		myColor = (int)(Math.random() * 256) + 30;
		myColor2 = (int)(Math.random() * 256) + 30;
		myColor3 = (int)(Math.random() * 256) + 30;
	}
	public void move()
	{
		dX += (Math.cos((float)dTheta) * dSpeed);
		dY += (Math.sin((float)dTheta) * dSpeed);
	}
	public void show()
	{
		fill(myColor, myColor2, myColor3);
		ellipse((float)dX, (float)dY, 5, 5);
	}
	public void reset()
	{
		if(dX >= 500 || dX <= 0)
		{
			dX = 250;
			dY = 250;
			dSpeed = dSpeed + 0.15;
			dTheta = Math.random() * 1080;
		}
		else if(dY >= 500 || dY <= 0)
		{
			dY = 250;
			dX = 250;
			dSpeed = dSpeed + .15;
			dTheta = Math.random() * 1080;
		}
	}
	public void check()
	{
		if(dSpeed >= 9)
		{
			background(0);
			fill(192);
			ellipse(250, 250, 200, 200);
			fill(170);
			noStroke();
			ellipse(250, 250, 20, 20);
			ellipse(265, 280, 20, 20);
			ellipse(200, 220, 20, 20);
			ellipse(210, 260, 20, 20);
			ellipse(234, 188, 20, 20);
			ellipse(310, 230, 20, 20);
			ellipse(301, 189, 20, 20);
			ellipse(203, 290, 20, 20);
			ellipse(315, 260, 20, 20);
			ellipse(180, 301, 20, 20);
			textSize(30);
			text("WELCOME TO THE MOON!", 80, 400);
			myColor = 255;
			myColor2 = 255;
			myColor3 = 255;
		}
		else if(dSpeed >= 9.3)
		{
			noLoop();
		}
	}
}
interface Particle
{
	public void show();
	public void move();
	public void reset();
	public void check();
}
class OddballParticle implements Particle
{
	double dSpeed, dTheta, dX, dY;
	OddballParticle(int x, int y)
	{
		dX = x;
		dY = y;
		dTheta = Math.random() * 10;
		dSpeed = .25;
	}
	public void move()
	{
		dX += (int)(Math.random() * 7) - 3;
		dY += (int)(Math.random() * 7) - 3;
	}
	public void show() 
	{
		fill(0,255,255);
		rect((float)dX , (float)dY , 10, 10);
	}
	public void reset()
	{
		
	}
	public void check()
	{

	}
}
class JumboParticle extends NormalParticle
{
	int mySize;
	JumboParticle()
	{
		mySize = 30;
	}
	public void show()
	{
		fill(255,0,0);
		ellipse(250, 250, mySize, mySize);
	}
}

