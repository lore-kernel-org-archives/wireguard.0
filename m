Return-Path: s.gottschall@dd-wrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11624182
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 17:36:11 +0000 (UTC)
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de [185.84.6.167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c35e6966
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 17:36:11 +0000 (UTC)
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180118` Available
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <b96c067bafcb48c3@frisell.zx2c4.com>
 <f2e330d7-d4cb-f317-5774-05136fcb8b48@dd-wrt.com>
 <CAHmME9r5gkLJw3_mxxxNRjdk=HRsupm2Y9RFGLfSWC5G2o0NQA@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <3c3ae663-329c-26f2-227b-68ef6e1b8c0a@dd-wrt.com>
Date: Thu, 18 Jan 2018 18:39:39 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9r5gkLJw3_mxxxNRjdk=HRsupm2Y9RFGLfSWC5G2o0NQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Am 18.01.2018 um 18:27 schrieb Jason A. Donenfeld:
> Thanks for the feedback. Indeed I'll have to go through this and
> un-inline a few functions, and retest for performance.
>
> If you wind up doing this iteratively and testing, please let me know
> what you find.
i will do some benchmarks later. i already did this
another interesting patch i made locally was compiling all sources as 
single by including a c files into a single small c source.
this allows me to set all functions to static, so the compiler will 
remove unused code and is able to uninline things which are neccessary
side effect. the compiled ko binary is 20% smaller :-)
>
> Jason
>

-- 
Mit freundlichen Grüssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Stubenwaldallee 21a, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Geschäftsführer: Peter Steinhäuser, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565
