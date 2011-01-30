/* Copyright (C) 2008 - 2009 Trinity <http://www.trinitycore.org/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#include "ScriptPCH.h"
#include "BattlefieldMgr.h"
#include "BattlefieldWG.h"
#include "Battlefield.h"
#include "ScriptSystem.h"
#include "WorldSession.h"
#include "ObjectMgr.h"

#define GOSSIP_HELLO_DEMO1  "Build catapult."
#define GOSSIP_HELLO_DEMO2  "Build demolisher."
#define GOSSIP_HELLO_DEMO3  "Build siege engine."
#define GOSSIP_HELLO_DEMO4  "I cannot build more!"

enum eWGqueuenpctext
{
    WG_NPCQUEUE_TEXT_H_NOWAR = 14775,
    WG_NPCQUEUE_TEXT_H_QUEUE = 14790,
    WG_NPCQUEUE_TEXT_H_WAR   = 14777,
    WG_NPCQUEUE_TEXT_A_NOWAR = 14782,
    WG_NPCQUEUE_TEXT_A_QUEUE = 14791,
    WG_NPCQUEUE_TEXT_A_WAR   = 14781,
    WG_NPCQUEUE_TEXTOPTION_JOIN = -1850507,
};

class npc_demolisher_engineerer : public CreatureScript
{
public:
    npc_demolisher_engineerer() : CreatureScript("npc_demolisher_engineerer") { }
    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pCreature->isQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        BattlefieldWG *BfWG = (BattlefieldWG*)sBattlefieldMgr.GetBattlefieldByBattleId(1);

        if (!BfWG)
            return true;

        if(BfWG->GetData(pCreature->GetEntry()==30400 ?BATTLEFIELD_WG_DATA_MAX_VEHICLE_H:BATTLEFIELD_WG_DATA_MAX_VEHICLE_A)>BfWG->GetData(pCreature->GetEntry()==30400 ?BATTLEFIELD_WG_DATA_VEHICLE_H:BATTLEFIELD_WG_DATA_VEHICLE_H)){
            if (pPlayer->HasAura(SPELL_CORPORAL))
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO1, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF);
            else if (pPlayer->HasAura(SPELL_LIEUTENANT))
            {
               pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO1, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF);
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO2, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF+1);
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO3, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF+2);
            }
        }
        else
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO4, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF+9);

        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->CLOSE_GOSSIP_MENU();

        BattlefieldWG *BfWG = (BattlefieldWG*)sBattlefieldMgr.GetBattlefieldByBattleId(1);

        if (!BfWG)
            return true;

        if(BfWG->GetData(pCreature->GetEntry()==30400 ?BATTLEFIELD_WG_DATA_MAX_VEHICLE_H:BATTLEFIELD_WG_DATA_MAX_VEHICLE_A)>BfWG->GetData(pCreature->GetEntry()==30400 ?BATTLEFIELD_WG_DATA_VEHICLE_H:BATTLEFIELD_WG_DATA_VEHICLE_H)){
            switch(uiAction - GOSSIP_ACTION_INFO_DEF)
            {
                case 0: pPlayer->CastSpell(pPlayer, 56663, false, NULL, NULL, pCreature->GetGUID()); break;
                case 1: pPlayer->CastSpell(pPlayer, 56575, false, NULL, NULL, pCreature->GetGUID()); break;
                case 2: pPlayer->CastSpell(pPlayer, pPlayer->GetTeamId() ? 61408 : 56661, false, NULL, NULL, pCreature->GetGUID()); break;
            }
            //spell 49899 Emote : 406 from sniff
            //INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES ('49899', '0', '1', '406', '0', '0', '0', '0', '0', '0');
            if(Creature *creature= pCreature->FindNearestCreature(27852,30.0f,true))
                creature->CastSpell(creature,49899,true);
        }
        return true;
    }
};

class npc_wg_spiritguide : public CreatureScript
{
public:
    npc_wg_spiritguide() : CreatureScript("npc_wg_spiritguide") { }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pCreature->isQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        BattlefieldWG *BfWG = (BattlefieldWG*)sBattlefieldMgr.GetBattlefieldByBattleId(BATTLEFIELD_BATTLEID_WG);
        if (BfWG)
        {
            GraveYardVect gy=BfWG->GetGraveYardVect();
            for(uint8 i=0;i<gy.size();i++)
            {
                if(gy[i]->GetControlTeamId()==pPlayer->GetTeamId())
                {
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT,sObjectMgr.GetTrinityStringForDBCLocale(((BfGraveYardWG*)gy[i])->GetTextId()), GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF+i);
                }
            }
        }

        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* pPlayer, Creature* /*pCreature*/, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->CLOSE_GOSSIP_MENU();

        BattlefieldWG *BfWG = (BattlefieldWG*)sBattlefieldMgr.GetBattlefieldByBattleId(BATTLEFIELD_BATTLEID_WG);
        if (BfWG)
        {
            GraveYardVect gy=BfWG->GetGraveYardVect();
            for(uint8 i=0;i<gy.size();i++)
            {
                if(uiAction-GOSSIP_ACTION_INFO_DEF==i && gy[i]->GetControlTeamId()==pPlayer->GetTeamId())
                {
                   const WorldSafeLocsEntry* ws=sWorldSafeLocsStore.LookupEntry(gy[i]->GetGraveYardId());
                    pPlayer->TeleportTo(ws->map_id,ws->x,ws->y,ws->z,0);
               }
            }
        }
        return true;
    }
};

class npc_wg_dalaran_queue : public CreatureScript
{
public:
    npc_wg_dalaran_queue() : CreatureScript("npc_wg_dalaran_queue") { }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
       if (pCreature->isQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        BattlefieldWG *BfWG = (BattlefieldWG*)sBattlefieldMgr.GetBattlefieldByBattleId(BATTLEFIELD_BATTLEID_WG);
        if (BfWG)
        {

            if(BfWG->IsWarTime())
            {
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT,sObjectMgr.GetTrinityStringForDBCLocale(WG_NPCQUEUE_TEXTOPTION_JOIN), GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF);
                pPlayer->SEND_GOSSIP_MENU(BfWG->GetDefenderTeam()?WG_NPCQUEUE_TEXT_H_WAR:WG_NPCQUEUE_TEXT_A_WAR, pCreature->GetGUID());
            }
            else
            {
                uint32 uiTime=BfWG->GetTimer()/1000;
                pPlayer->SendUpdateWorldState(4354,time(NULL)+uiTime);
                if(uiTime<15*MINUTE)
                {
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT,sObjectMgr.GetTrinityStringForDBCLocale(WG_NPCQUEUE_TEXTOPTION_JOIN), GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF);
                    pPlayer->SEND_GOSSIP_MENU(BfWG->GetDefenderTeam()?WG_NPCQUEUE_TEXT_H_QUEUE:WG_NPCQUEUE_TEXT_A_QUEUE, pCreature->GetGUID());
                }
                else
                {
                    pPlayer->SEND_GOSSIP_MENU(BfWG->GetDefenderTeam()?WG_NPCQUEUE_TEXT_H_NOWAR:WG_NPCQUEUE_TEXT_A_NOWAR, pCreature->GetGUID());
                }
            }
        }
        return true;
    }

    bool OnGossipSelect(Player* pPlayer, Creature* /*pCreature*/, uint32 /*uiSender*/, uint32 /*uiAction*/)
    {
        pPlayer->CLOSE_GOSSIP_MENU();

        BattlefieldWG *BfWG = (BattlefieldWG*)sBattlefieldMgr.GetBattlefieldByBattleId(BATTLEFIELD_BATTLEID_WG);
        if (BfWG)
        {
            if(BfWG->IsWarTime()){
                pPlayer->GetSession()->SendBfInvitePlayerToWar(BATTLEFIELD_BATTLEID_WG,4197,20);
            }
            else
            {
                uint32 uiTime=BfWG->GetTimer()/1000;
                if(uiTime<15*MINUTE)
                    pPlayer->GetSession()->SendBfInvitePlayerToQueue(BATTLEFIELD_BATTLEID_WG);
            }
        }
        return true;
    }
};

void AddSC_wintergrasp()
{
   new npc_wg_dalaran_queue();
   new npc_wg_spiritguide();
   new npc_demolisher_engineerer();    
}