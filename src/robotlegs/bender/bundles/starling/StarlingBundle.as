package robotlegs.bender.bundles.starling
{
	
	import robotlegs.bender.bundles.shared.configs.StarlingContextViewListenerConfig;
	import robotlegs.bender.extensions.contextView.ContextViewExtension;
	import robotlegs.bender.extensions.contextView.StageSyncExtension;
	import robotlegs.bender.extensions.contextView.StarlingContextViewExtension;
	import robotlegs.bender.extensions.directCommandMap.DirectCommandMapExtension;
	import robotlegs.bender.extensions.enhancedLogging.InjectableLoggerExtension;
	import robotlegs.bender.extensions.enhancedLogging.TraceLoggingExtension;
	import robotlegs.bender.extensions.eventCommandMap.EventCommandMapExtension;
	import robotlegs.bender.extensions.eventDispatcher.EventDispatcherExtension;
	import robotlegs.bender.extensions.localEventMap.LocalEventMapExtension;
	import robotlegs.bender.extensions.mediatorMap.MediatorMapExtension;
	import robotlegs.bender.extensions.mediatorMap.StarlingMediatorMapExtension;
	import robotlegs.bender.extensions.modularity.ModularityExtension;
	import robotlegs.bender.extensions.modularity.StarlingModularityExtension;
	import robotlegs.bender.extensions.stageSync.StarlingStageSyncExtension;
	import robotlegs.bender.extensions.viewManager.ManualStageObserverExtension;
	import robotlegs.bender.extensions.viewManager.ManualStarlingStageObserverExtension;
	import robotlegs.bender.extensions.viewManager.StageCrawlerExtension;
	import robotlegs.bender.extensions.viewManager.StageObserverExtension;
	import robotlegs.bender.extensions.viewManager.StarlingStageObserverExtension;
	import robotlegs.bender.extensions.viewManager.StarlingViewManagerExtension;
	import robotlegs.bender.extensions.viewManager.ViewManagerExtension;
	import robotlegs.bender.extensions.viewProcessorMap.ViewProcessorMapExtension;
	import robotlegs.bender.extensions.vigilance.VigilanceExtension;
	import robotlegs.bender.framework.api.IBundle;
	import robotlegs.bender.framework.api.IContext;
	
	
	public class StarlingBundle implements IBundle
	{
		public function extend( context:IContext ):void
		{
			context.install(
					TraceLoggingExtension,
					VigilanceExtension,
					InjectableLoggerExtension,
					StarlingContextViewExtension,
//					ContextViewExtension,
					EventDispatcherExtension,
					StarlingModularityExtension,
//					ModularityExtension,
					DirectCommandMapExtension,
					EventCommandMapExtension,
					LocalEventMapExtension,
					StarlingViewManagerExtension,
//					ViewManagerExtension,
					StarlingStageObserverExtension,
//					ManualStarlingStageObserverExtension,
//					StageObserverExtension,
					StarlingMediatorMapExtension,
//					MediatorMapExtension,
					ViewProcessorMapExtension,
//					StageCrawlerExtension,
					StarlingStageSyncExtension
//					StageSyncExtension
			);
			
			context.configure( StarlingContextViewListenerConfig );
		}
	}
}