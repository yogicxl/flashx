package FlashX.Graphics.Vertices
{
	public class TextureVertex extends BasicVertex
	{
		private var texture:Texture;
		
		public function TextureVertex(position:IVector, texture:Texture)
		{
			this.Position = position;
			this.Texture = texture;
		}
	}
}