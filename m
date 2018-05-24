Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e347ca92
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 13:57:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c8a76ed
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 13:57:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ea32c8e
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 13:56:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6e4fa471
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 13:56:37 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id 11-v6so1517830ois.8
 for <wireguard@lists.zx2c4.com>; Thu, 24 May 2018 06:59:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <f40f4b86-90a6-ff2c-4d17-7d2a278c201b@higgsboson.tk>
References: <1527119825.1012882.1382673952.168165E8@webmail.messagingengine.com>
 <1527135367.1083058.1382934352.4E96D38A@webmail.messagingengine.com>
 <f40f4b86-90a6-ff2c-4d17-7d2a278c201b@higgsboson.tk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 24 May 2018 15:59:11 +0200
Message-ID: <CAHmME9pB9RHNQQwNMKDLLrmXZ63OMqQWtipOZeDuiPk_ZzqRZA@mail.gmail.com>
Subject: Re: [wireguard-android] 'roaming' from LTE to WiFi with version
 0.0.20180523
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@higgsboson.tk>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, May 24, 2018 at 3:57 PM, J=C3=B6rg Thalheim <joerg@higgsboson.tk> w=
rote:
>
>
> On 2018-05-24 05:16, nnet wrote:
>> So this is how it ends:
>>
>> 05-23 20:33:45.323  9600  9619 D WireGuard/GoBackend/wireguard: peer(AsM=
M=E2=80=A6SeWg) - Sending handshake initiation
>> 05-23 20:33:45.326  9600  9619 E WireGuard/GoBackend/wireguard: peer(AsM=
M=E2=80=A6SeWg) - Failed to send handshake initiation write udp6 [::]:46719=
->[]:41414: sendto: network is unreachable
>> 05-23 20:33:45.326  9600  9619 D WireGuard/GoBackend/wireguard: peer(AsM=
M=E2=80=A6SeWg) - Awaiting keypair
>> 05-23 20:33:50.367  9600  9678 D WireGuard/GoBackend/wireguard: peer(AsM=
M=E2=80=A6SeWg) - Sending handshake initiation
>> 05-23 20:33:50.376  9600  9678 E WireGuard/GoBackend/wireguard: peer(AsM=
M=E2=80=A6SeWg) - Failed to send handshake initiation write udp6 [::]:46719=
->[snip]:41414: sendto: network is unreachable
>> 05-23 20:36:10.188  9600 11291 D WireGuard/GoBackend/wireguard: peer(AsM=
M=E2=80=A6SeWg): Handshake did not complete after 20 attempts, giving up
>> 05-23 20:39:12.258  9600  9677 D WireGuard/GoBackend/wireguard: :peer(As=
MM=E2=80=A6SeWg) Removing all keys, since we haven't received a new one in =
540 seconds
>>
>> Interestingly it's trying to send out to an IPv6 address. The peer endpo=
int IP is IPv4 only (the LTE is IPv4-in-6).
>
> In the wg command it resolves the domain once and picks the preferred pro=
tocol family of the system (which is ipv6 when its available).
> Since this is only done once it will stick to ipv6 for ever until the VPN=
 is reconfigured by wg.
> This is an unsolved known problem.

That's *not* what's going on here. This is an issue with how Go
sockets handle IP addresses and their preference for v4-mapped-v6.
