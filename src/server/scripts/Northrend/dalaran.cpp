/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* Script Data Start
SDName: Dalaran
SDAuthor: WarHead, MaXiMiUS
SD%Complete: 99%
SDComment: For what is 63990+63991? Same function but don't work correct...
SDCategory: Dalaran
Script Data End */

#include "ScriptPCH.h"

/*******************************************************
 * npc_mageguard_dalaran
 *******************************************************/

enum Spells
{
    SPELL_TRESPASSER_A = 54028,
    SPELL_TRESPASSER_H = 54029
};

enum NPCs // All outdoor guards are within 35.0f of these NPCs
{
    NPC_APPLEBOUGH_A = 29547,
    NPC_SWEETBERRY_H = 29715,
};

class npc_mageguard_dalaran : public CreatureScript
{
public:
    npc_mageguard_dalaran() : CreatureScript("npc_mageguard_dalaran") { }

    struct npc_mageguard_dalaranAI : public Scripted_NoMovementAI
    {
        npc_mageguard_dalaranAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
        {
            pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            pCreature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_NORMAL, true);
            pCreature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_MAGIC, true);
        }

        void Reset(){}

        void EnterCombat(Unit* /*pWho*/){}

        void AttackStart(Unit* /*pWho*/){}

        void MoveInLineOfSight(Unit *pWho)
        {
            if (!pWho || !pWho->IsInWorld() || pWho->GetZoneId() != 4395)
                return;

            if (!me->IsWithinDist(pWho, 65.0f, false))
                return;

            Player *pPlayer = pWho->GetCharmerOrOwnerPlayerOrPlayerItself();

            if (!pPlayer || pPlayer->isGameMaster() || pPlayer->IsBeingTeleported())
                return;

            switch (me->GetEntry())
            {
                case 29254:
                    if (pPlayer->GetTeam() == HORDE)              // Horde unit found in Alliance area
                    {
                        if (GetClosestCreatureWithEntry(me, NPC_APPLEBOUGH_A, 32.0f))
                        {
                            if (me->isInBackInMap(pWho, 12.0f))   // In my line of sight, "outdoors", and behind me
                                DoCast(pWho, SPELL_TRESPASSER_A); // Teleport the Horde unit out
                        }
                        else                                      // In my line of sight, and "indoors"
                            DoCast(pWho, SPELL_TRESPASSER_A);     // Teleport the Horde unit out
                    }
                    break;
                case 29255:
                    if (pPlayer->GetTeam() == ALLIANCE)           // Alliance unit found in Horde area
                    {
                        if (GetClosestCreatureWithEntry(me, NPC_SWEETBERRY_H, 32.0f))
                        {
                            if (me->isInBackInMap(pWho, 12.0f))   // In my line of sight, "outdoors", and behind me
                                DoCast(pWho, SPELL_TRESPASSER_H); // Teleport the Alliance unit out
                        }
                        else                                      // In my line of sight, and "indoors"
                            DoCast(pWho, SPELL_TRESPASSER_H);     // Teleport the Alliance unit out
                    }
                    break;
            }
            me->SetOrientation(me->GetHomePosition().GetOrientation());
            return;
        }

        void UpdateAI(const uint32 /*diff*/){}
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_mageguard_dalaranAI(creature);
    }
};

/*######
## npc_hira_snowdawn
######*/

enum eHiraSnowdawn
{
    SPELL_COLD_WEATHER_FLYING                   = 54197
};

#define GOSSIP_TEXT_TRAIN_HIRA "I seek training to ride a steed."

class npc_hira_snowdawn : public CreatureScript
{
public:
    npc_hira_snowdawn() : CreatureScript("npc_hira_snowdawn") { }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (!pCreature->isVendor() || !pCreature->isTrainer())
            return false;

        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_TRAIN_HIRA, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRAIN);

        if (pPlayer->getLevel() >= 80 && pPlayer->HasSpell(SPELL_COLD_WEATHER_FLYING))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

        return true;
    }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_TRAIN)
            pPlayer->SEND_TRAINERLIST(pCreature->GetGUID());

        if (uiAction == GOSSIP_ACTION_TRADE)
            pPlayer->SEND_VENDORLIST(pCreature->GetGUID());

        return true;
    }
};

/*######
## npc_archmage_vargoth http://www.wowhead.com/item=44738
######*/

enum eArchmageVargoth
{
    ZONE_DALARAN                                = 4395,
    ITEM_ACANE_MAGIC_MASTERY                    = 43824,
    SPELL_CREATE_FAMILAR                        = 61457,
    SPELL_FAMILAR_PET                           = 61472,
    ITEM_FAMILAR_PET                            = 44738
};

#define GOSSIP_TEXT_FAMILIAR_WELCOME "I have a book that might interest you. Would you like to take a look?"
#define GOSSIP_TEXT_FAMILIAR_THANKS  "Thank you! I will be sure to notify you if I find anything else."

class npc_archmage_vargoth : public CreatureScript
{
public:
    npc_archmage_vargoth() : CreatureScript("npc_archmage_vargoth") { }

    bool OnGossipHello (Player* pPlayer, Creature* pCreature)
    {
        if (pCreature->isQuestGiver() && pCreature->GetZoneId() != ZONE_DALARAN)
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        if(pPlayer->HasItemCount(ITEM_ACANE_MAGIC_MASTERY,1,false))
        {
            if(!pPlayer->HasSpell(SPELL_FAMILAR_PET) && !pPlayer->HasItemCount(ITEM_FAMILAR_PET,1,true))
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TEXT_FAMILIAR_WELCOME, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }
        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
        return true;
    }

    bool OnGossipSelect (Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();

        switch (uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TEXT_FAMILIAR_THANKS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
                pPlayer->SEND_GOSSIP_MENU(40000, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                pCreature->CastSpell(pPlayer,SPELL_CREATE_FAMILAR,false);
                pPlayer->CLOSE_GOSSIP_MENU();
                break;
        }
        return true;
    }
};

/*######
## npc_steampowered_auctioneer
######*/

#define GOSSIP_TEXT_ID_STEAM  14764 

class npc_steampowered_auctioneer : public CreatureScript
{
public:
    npc_steampowered_auctioneer() : CreatureScript("npc_steampowered_auctioneer") { }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (!pCreature->isAuctioner())
            return false;

        if (pPlayer->GetSkillValue(SKILL_ENGINERING) > 349)
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_AUCTION);

        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXT_ID_STEAM, pCreature->GetGUID());

        return true;
    }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();

        if (uiAction == GOSSIP_ACTION_AUCTION)
            pPlayer->GetSession()->SendAuctionHello(pCreature->GetGUID(), pCreature);

        return true;
    }
};

/*######
## Kaluak Fishing Evento
## 38294 Elder
## http://www.wowhead.com/quest=24803 "Kalu'ak Fishing Derby"
######*/

enum Kaluak
{
    QUEST_KALUAK_FISHING_DERBY  = 24803,
    //HOLYDAY_FISHING_KALUAK      = 52, // Mover a SharedDefines.h enum HolidayIds
};

class npc_kaluak_fishing : public CreatureScript
{
public:
    npc_kaluak_fishing() : CreatureScript("npc_kaluak_fishing") {}

    struct npc_kaluak_fishingAI : public ScriptedAI
    {
        npc_kaluak_fishingAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            bEventoEmpieza = bEventoTerminado = bEventoGanadorBusqueda = false;
            Reset();        
        }

        bool bEventoEmpieza;
        bool bEventoTerminado;
        bool bEventoGanadorBusqueda;

        void Reset() {}

        void Aggro(Unit *who) {}

        void UpdateAI(const uint32 diff)
        {
            if (!bEventoEmpieza && time(NULL) % 60 == 0 && IsHolidayActive(HOLYDAY_FISHING_KALUAK))
            {
                sLog->outDebug("Kaluak: npc_kaluak_fishing Anuncia Comienzo HOLYDAY_FISHING_KALUAK");                
                me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                bEventoEmpieza = true;
            }

            if (bEventoEmpieza && !bEventoTerminado && time(NULL) % 60 == 0 && !IsHolidayActive(HOLYDAY_FISHING_KALUAK))
            {
                sLog->outDebug("Kaluak: npc_kaluak_fishing Anuncia Termino HOLYDAY_FISHING_KALUAK");
                bEventoTerminado = true;
            }
            return;
            DoMeleeAttackIfReady();
        }
    };

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pCreature->isQuestGiver())
        {
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());
            //pPlayer->SEND_GOSSIP_MENU(, pCreature->GetGUID()); Faltante Gosiip ID correcto
            return true;
        }

        //pPlayer->SEND_GOSSIP_MENU(, pCreature->GetGUID());  Faltante Gosiip ID correcto
        return true;
    }

    bool ChooseReward(Player* pPlayer, Creature* pCreature, const Quest *pQuest, uint32 item)
    {
        if (pQuest->GetQuestId() == QUEST_KALUAK_FISHING_DERBY && ((npc_kaluak_fishingAI*)(pCreature->AI()))->bEventoGanadorBusqueda == true)
        {            
            pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            return true;
       }
    }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_kaluak_fishingAI (pCreature);
    }
};

void AddSC_dalaran()
{
    new npc_mageguard_dalaran;
    new npc_hira_snowdawn;
    new npc_archmage_vargoth;
    new npc_steampowered_auctioneer;
    new npc_kaluak_fishing;
}
