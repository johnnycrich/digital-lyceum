package comps.scheduling.samples
{	
	import comps.scheduling.scheduleClasses.layout.IVerticalLinesLayout;
	import comps.scheduling.scheduleClasses.layout.VerticalLinesLayoutItem;
	import comps.scheduling.scheduleClasses.lineRenderer.ILineRenderer;
	import comps.scheduling.scheduleClasses.lineRenderer.LineRenderer;
	import comps.scheduling.scheduleClasses.viewers.VerticalLinesViewer;
	
	public class SolidVerticalLinesViewer extends VerticalLinesViewer 
	{
		override protected function render( layout : IVerticalLinesLayout ) : void 
		{
			var lineRenderer : ILineRenderer = new LineRenderer();
			lineRenderer.weight = verticalGridLineThickness;
			lineRenderer.color = verticalGridLineColor;
			lineRenderer.alpha = verticalGridLineAlpha;
			
			for each( var item : VerticalLinesLayoutItem in layout.items )
			{
				super.drawLineForItem( item, lineRenderer );
			}
		}		
		
	}
}