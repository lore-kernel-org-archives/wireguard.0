Return-Path: mailings@roelf.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 822dab71
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jul 2017 18:34:09 +0000 (UTC)
Received: from mail.aperture-laboratories.science
 (mail.aperture-laboratories.science [176.31.38.83])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a6ce05c
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jul 2017 18:34:09 +0000 (UTC)
Received: from mail.aperture-laboratories.science (localhost [127.0.0.1])
 by mail.aperture-laboratories.science (Postfix) with ESMTP id 8EDE043E60
 for <wireguard@lists.zx2c4.com>; Sat,  8 Jul 2017 19:03:34 +0000 (UTC)
Received: from [172.20.140.18] (unknown [185.116.236.30])
 by mail.aperture-laboratories.science (Postfix) with ESMTPSA id C696843E2A
 for <wireguard@lists.zx2c4.com>; Sat,  8 Jul 2017 19:03:33 +0000 (UTC)
Subject: Re: Indefinite queuing for unconnected peers (Was: problem wireguard
 + ospf + unconnected tunnels)
To: wireguard@lists.zx2c4.com
References: <1499116162.70598782@f401.i.mail.ru>
 <20170708142156.GB13268@tuxmachine.polynome.dn42>
From: "Roelf \"rewbycraft\" Wichertjes" <mailings+wireguard@roelf.org>
Message-ID: <e8d47dd3-c3ff-ad54-a844-ec4876ba89b2@roelf.org>
Date: Sat, 8 Jul 2017 20:51:59 +0200
MIME-Version: 1.0
In-Reply-To: <20170708142156.GB13268@tuxmachine.polynome.dn42>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I can personally see there being use in both the getting sendto errors 
but also in simply dropping the packets (depending on the software you 
have communicating over wireguard). So rather than change it entirely, I 
would suggest making that an option of some sort.

As an aside, a single interface producing sendto() failures shouldn't, 
in my opinion, cause quagga's ospfd to refuse to operate on other 
interfaces.

On 07/08/2017 04:21 PM, Baptiste Jonglez wrote:
> Hi,
> 
> The current approach is to queue all outgoing packets for an indefinite
> amount of time when the peer is not connected or reachable.
> 
> I think it does not make much sense, and leads to the kind of issue you
> mention here.  The initial goal was probably to queue packets just long
> enough to be able to complete a handshake with the peer, which makes a lot
> of sense (it would be annoying to drop the first packet of any outgoing
> connection).  But the handshake should not take more than hundreds of
> milliseconds.
> 
> Maybe Wireguard should drop packets from this queue after a few seconds?
> Would it be hard to implement?
> 
> Baptiste
> 
> On Tue, Jul 04, 2017 at 12:09:22AM +0300, ae wrote:
>> situation
>> 2 tunnels
>> 1 normal - 2nd with unconnected ending
>> + ospfd quagge
>>
>> At start everything works fine - but after ~ 30-60 seconds - the ospf stops working
>>
>> This is due to the fact that the ospf daemon sends packets from the same socket on different interfaces - and in the tunnel interface everything goes fine - but in the 2nd packets accumulate
>> And after a certain accumulation - the socket of the demon daemon stops working on sending completely "No buffer space available "
>>
>> Is it possible to fix this with settings?
>>
> 
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
> 
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
