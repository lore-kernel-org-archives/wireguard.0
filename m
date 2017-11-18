Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb4c4401
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Nov 2017 09:35:08 +0000 (UTC)
Received: from netz.smurf.noris.de (netz.smurf.noris.de [213.95.21.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c29e333
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Nov 2017 09:35:08 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by netz.extern.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1eFzaS-0005Bn-PT
 for wireguard@lists.zx2c4.com; Sat, 18 Nov 2017 09:38:58 +0000
Subject: Re: Roaming Mischief
To: wireguard@lists.zx2c4.com
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <CAKUy5axhFKvgeGY1FrP5S4UON2QPV=7jQjZM268qG-M3RCAcVw@mail.gmail.com>
 <593d6d3a-550e-a14d-4c1d-f7ee8e731d87@gmail.com>
 <CAKUy5axo5jO=6qv1XEsHvOUkcm6z7r4UW1hV+Oeomq_dJqQXJg@mail.gmail.com>
 <cdf48a39-3d81-5269-dbb4-93929cdf081f@gmail.com>
 <CAKUy5ayo2jWAaA-D2UmtO6q4YUe-KP4u1+3VF32-kvbHbjZLsA@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <4cd6a9b8-b317-3fdb-d758-08a546bc5acf@urlichs.de>
Date: Sat, 18 Nov 2017 10:38:55 +0100
MIME-Version: 1.0
In-Reply-To: <CAKUy5ayo2jWAaA-D2UmtO6q4YUe-KP4u1+3VF32-kvbHbjZLsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 17.11.2017 19:46, Markus Woschank wrote:
> After some more thoughts, in the scenario that you are describing,
> where does persisting the state on the roaming peer help?
> The roaming peer has the fixed peer's address in his configuration
> (his IP does not change), and the remote side did not suspend.
> Am I missing something here?

Simple example: a mobile IP phone. Rebooting your telephony server
causes you to drop the connection to the client until _it_ next issues a
call. However, if you persist the phone's address, you don't lose
incoming service.

-- 
-- Matthias Urlichs
