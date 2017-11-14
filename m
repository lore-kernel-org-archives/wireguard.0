Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f016abe
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 14:04:18 +0000 (UTC)
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
 [74.125.82.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae820a03
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 14:04:18 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id g104so4608124otg.7
 for <wireguard@lists.zx2c4.com>; Tue, 14 Nov 2017 06:08:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5E8A8905-15B2-43DB-BC28-415D0A13216B@lonnie.abelbeck.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <CAKXLc7efXWWg16XZtAEVCskG8hWWJj0ge+FDax-X5onR2AWU2Q@mail.gmail.com>
 <5E8A8905-15B2-43DB-BC28-415D0A13216B@lonnie.abelbeck.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 14 Nov 2017 15:08:04 +0100
Message-ID: <CAKXLc7cVKvRONzK67TV+7skeEtLmgbqmoNrBP6go2anp-y6USw@mail.gmail.com>
Subject: Re: Roaming Mischief
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
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

On Tue, Nov 14, 2017 at 2:53 PM, Lonnie Abelbeck
<lists@lonnie.abelbeck.com> wrote:
>
> On Nov 14, 2017, at 4:30 AM, Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:
>> As for the syntax, and I hate to suggest that, adding a new option
>> (breaking compatibility) like "AllowRoaming=yes|1" with default
>> AllowRoaming=no is what I would like, instead of somewhat vague "!" at
>> the end.
>
> Kalin, I don't care for the somewhat vague "!"  notation either ... reads NOT to me.
>
> But, I would not break compatibility, I suggest adding a "paranoid option" EndpointFixed ...
> --
> EndpointFixed - Optional, defaults to 0|no, endpoint roaming is enabled by default,. Set EndpointFixed to 1|yes to disable endpoint roaming.  Ignored if Endpoint is not defined.
> --
>
> As a side-benefit, the documentation of this option provides some quick-reference documentation to the operation of WireGuard.
>
Yep! +1

Kalin.
