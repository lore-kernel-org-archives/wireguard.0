Return-Path: stunnel@attglobal.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bb8473e
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 07:35:50 +0000 (UTC)
Received: from dnvrco-cmomta03.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa0e2ea8
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 07:35:50 +0000 (UTC)
Subject: Re: Cannot ping Windows machines on server network
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
References: <9fa638b5-3f03-a35b-5341-8e7240193bd4@attglobal.net>
 <CAKXLc7f+5KTcNQfAfo-JhghJA=kyfj20F2fPyGU502L65-t0Eg@mail.gmail.com>
From: Eddie <stunnel@attglobal.net>
Message-ID: <869ea224-e7eb-85af-0297-a473bfb124a9@attglobal.net>
Date: Thu, 26 Apr 2018 00:36:41 -0700
MIME-Version: 1.0
In-Reply-To: <CAKXLc7f+5KTcNQfAfo-JhghJA=kyfj20F2fPyGU502L65-t0Eg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Yes.  All the internal Windows machines are pingable from my server, all 
other machines in the internal network.  Just not from a client 
connected via wireguard.

Cheers.


On 4/25/2018 10:03 PM, Kalin KOZHUHAROV wrote:
> On Thu, Apr 26, 2018 at 1:06 AM, Eddie <stunnel@attglobal.net> wrote:
>> They are pingable from the server and all other machines on the network.
>> There are no routing of firewall rules anywhere that call out these 2
>> machines either by IP or name.
>>
> Are you sure they are pingable? By default Windows client boxes not
> reply to ping.
>
> The 1st answer that came up:
> https://answers.microsoft.com/en-us/windows/forum/windows_7-networking/how-to-enable-ping-response-in-windows-7/5aff5f8d-f138-4c9a-8646-5b3a99f1cae6
>
> Kalin.
>
>
