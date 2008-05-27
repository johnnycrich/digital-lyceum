package comps.scheduling.samples
{	
	import comps.scheduling.scheduleClasses.layout.HorizontalLinesLayoutItem;
	import comps.scheduling.scheduleClasses.layout.IHorizontalLinesLayout;
	import comps.scheduling.scheduleClasses.lineRenderer.ILineRenderer;
	import comps.scheduling.scheduleClasses.viewers.HorizontalLinesViewer;
	
	public class AlternatingHorizontalLinesViewer extends HorizontalLinesViewer
	{
		override protected function render( layout : IHorizontalLinesLayout ) : void 
		{
			var lineRenderer : ILineRenderer = super.getLineRendererForStyling();
			
			var length : Number = layout.items.length;
			for( var i : int = 0; i < length; i++ )
			{
				var item : HorizontalLinesLayoutItem = layout.items[ i ];
				var currentRow : Number = Math.floor( item.y / layout.rowHeight );
				lineRenderer.weight = currentRow % 2 ? 0 : 2;
				
				super.drawLineForItem( item, lineRenderer );
			}
		}
	}
}