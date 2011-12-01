/**
 * User: Dan Sumption
 * Date: 27/11/11
 * Time: 03:41
 */
package org.sumption.sorcerer
{
    import flash.display.DisplayObjectContainer;

    import org.robotlegs.base.MediatorMap;

    import org.robotlegs.mvcs.SignalContext;
    import org.sumption.sorcerer.controller.AddTileCommand;
    import org.sumption.sorcerer.controller.ZoomInCommand;
    import org.sumption.sorcerer.controller.ZoomOutCommand;
    import org.sumption.sorcerer.controller.moving.MovePartyMacroCommand;
    import org.sumption.sorcerer.controller.startup.AddPartyCommand;
    import org.sumption.sorcerer.controller.startup.LoadCardsAsyncCommand;
    import org.sumption.sorcerer.controller.startup.StartupCommand;
    import org.sumption.sorcerer.controller.turns.NextPlayerCommand;
    import org.sumption.sorcerer.model.CardsModel;
    import org.sumption.sorcerer.model.MapModel;
    import org.sumption.sorcerer.model.PartiesModel;
    import org.sumption.sorcerer.service.CardDataLoader;
    import org.sumption.sorcerer.signal.AddParty;
    import org.sumption.sorcerer.signal.CardsLoaded;
    import org.sumption.sorcerer.signal.EnterCavern;
    import org.sumption.sorcerer.signal.PartyAdded;
    import org.sumption.sorcerer.signal.AddTile;
    import org.sumption.sorcerer.signal.DisableInput;
    import org.sumption.sorcerer.signal.EnableInput;
    import org.sumption.sorcerer.signal.MoveParty;
    import org.sumption.sorcerer.signal.NextPlayer;
    import org.sumption.sorcerer.signal.Render;
    import org.sumption.sorcerer.signal.Startup;
    import org.sumption.sorcerer.signal.ZoomIn;
    import org.sumption.sorcerer.signal.ZoomOut;
    import org.sumption.sorcerer.view.ApplicationMediator;
    import org.sumption.sorcerer.view.encounter.EncounterMediator;
    import org.sumption.sorcerer.view.encounter.EncounterView;
    import org.sumption.sorcerer.view.map.MapMediator;
    import org.sumption.sorcerer.view.PartiesMediator;
    import org.sumption.sorcerer.view.map.MapView;
    import org.sumption.sorcerer.view.parties.PartiesView;

    public class ApplicationContext extends SignalContext
    {
        public function ApplicationContext(contextView:flash.display.DisplayObjectContainer)
        {
            super(contextView);
        }

        override public function startup():void
        {
            trace(this + ".startup");
            var startup:Startup = new Startup();
            signalCommandMap.mapSignal(startup, StartupCommand);
            
            trace("\n Signals -> commands");
            signalCommandMap.mapSignalClass(Startup, StartupCommand, true);
            signalCommandMap.mapSignalClass(AddParty, AddPartyCommand);
            signalCommandMap.mapSignalClass(AddTile, AddTileCommand);
            signalCommandMap.mapSignalClass(NextPlayer, NextPlayerCommand);
            signalCommandMap.mapSignalClass(MoveParty, MovePartyMacroCommand);
            signalCommandMap.mapSignalClass(ZoomIn, ZoomInCommand);
            signalCommandMap.mapSignalClass(ZoomOut, ZoomOutCommand);

            trace("\n Signals -> mediators");
            injector.mapSingleton(CardsLoaded);
            injector.mapSingleton(PartyAdded);
            injector.mapSingleton(EnableInput);
            injector.mapSingleton(DisableInput);
            injector.mapSingleton(EnterCavern);
            injector.mapSingleton(Render);

            trace("\n Model");

            injector.mapSingleton(MapModel);
            injector.mapSingleton(CardsModel);
            injector.mapSingleton(PartiesModel);

            trace("\n Services");
            injector.mapSingleton(CardDataLoader);

            trace("\n View");
            mediatorMap.mapView(MapView, MapMediator);
            mediatorMap.mapView(PartiesView, PartiesMediator);
            mediatorMap.mapView(EncounterView, EncounterMediator);

            trace("\n ApplicationMediator");
            mediatorMap.mapView(Sorcerer, ApplicationMediator);

            trace("\n Initialise data");
            startup.dispatch();
        }
    }
}
