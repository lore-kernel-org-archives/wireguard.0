Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95685C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Jan 2022 15:47:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 639b0259;
	Tue, 25 Jan 2022 15:45:48 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [2607:f8b0:4864:20::133])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9a79993c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Jan 2022 15:45:46 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id i14so17154162ila.11
 for <wireguard@lists.zx2c4.com>; Tue, 25 Jan 2022 07:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y32vGI8H1ETkuSZ+ijfvVLS6XLN3uSbu7X5oJM89XVQ=;
 b=AJ0NMUMv6aQmEPRI50yZG7RxzPod6yArYWV6TMVwkczGIdP6q2YRJe1yjS+0IAwn4X
 mFCNZ16ZjHy127yuQZFGaXdmfXf+WEl+2oY6DrveK0aO65N/jz8aK3VZj+S9aVRTASDM
 /TLOFR3kSaxHuRVdJyMTQY45s0Tyk8zudP7nwRDyk30EBBSDLPYqgEwlfWwmeiZUleb6
 vMuXp6tDQU0Ze2X1691yHidQjnyLrdhHFKSn6DvbYoWmGqvLPao5hcFaRqqm3cm9Lbgl
 tUH+EFiwp0hVJio23lg3dDKEn5Dise9lgkGkeLzI0plSlVyQq3kyxzPIsYf3k8p/wZTH
 sdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y32vGI8H1ETkuSZ+ijfvVLS6XLN3uSbu7X5oJM89XVQ=;
 b=tdWdw78SSPcATEzdBQjoKFO6QJUg0azOkdrabgRghqFkNV+dJ5BIDIJx/HO7wS5h9t
 RVcKpAFrOqCO9dttK33dFGcAc2jltCNJ8LOCHuAq2ZRrmyVff3uDyNp8EqxGX8ekg1Jg
 njGLwCrVoR5K4rFQBZwwo4ALCQu3K/xOxuNLQog2YZ4ScgkrRIXT8yRfP+/KwZMiNpmC
 d/QrrGMlcgoIQqOTLFJ9WGmzutL3AWG+aPa0HqLpQwi4qny+YQhE6RKpdUG26bILENQE
 A91KV4l0AIUhdXhQ4wlhBs1F8JRbwtIGcwCYjkH9xMxXLr7vaon2uIidT4Et8zRHhYYz
 5pJQ==
X-Gm-Message-State: AOAM532s8yeZgmPQwKKko0n8FkHk1vCf8o2+ObI6D9Mz+2JLhwMx8TlP
 sVP2Hf0anlV3xDeGU5COqUxo+0Tal4ixL5N/fnc=
X-Google-Smtp-Source: ABdhPJz4RMGmvIfg8kejOdPn7ScapeR6UMZBQHBl8TEyRWAKTCtPXIaVTlZPEaW/q1Bko8mq5lSGYioOedf9xxtuCSc=
X-Received: by 2002:a92:ab10:: with SMTP id v16mr11863438ilh.293.1643125545355; 
 Tue, 25 Jan 2022 07:45:45 -0800 (PST)
MIME-Version: 1.0
References: <CAMTfdYou8TjP0TikezEjSWG-Rxtb8JzpPLcKOyOmE8B9sQpi8Q@mail.gmail.com>
 <CABBZOs=1po1VvKY+Rq6i1AOybXQHar+k+mzDFH9hAdd3uRc8fg@mail.gmail.com>
In-Reply-To: <CABBZOs=1po1VvKY+Rq6i1AOybXQHar+k+mzDFH9hAdd3uRc8fg@mail.gmail.com>
From: Alessio Nossa <alessio.nossa+list@gmail.com>
Date: Tue, 25 Jan 2022 16:45:34 +0100
Message-ID: <CAMTfdYp19s=AefZvK-eDAmGSodSCxmrBa_61G7fpGqOaPMUnWw@mail.gmail.com>
Subject: Re: Contributing to iOS app
To: Houman <houmie@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I am aware of the bug reported by Houman. To get around this problem I
have implemented a workaround: when the action needs to make changes
to the configuration, the main app is launched and the user can then
specify in Shortcut's action a URL to open when the action is
completed (default will be "shortcuts://"). This workaround has been
used by other apps like Working Copy [1] (in "Clone repository from"
action) for actions that need to be executed by the main app.
With this solution you cannot return results of the operation to
Shortcuts, but you can successfully get the work done and if something
went wrong, there is Wireguard's log to check.

One thing I had to change in the app to accomplish this is to move
TunnelsManager initialization from MainViewController to AppDelegate.
It will not slow down app startup since it is an asynchronous action
and I think it is fine to initialize the main component of the app's
logic, outside the view hierarchy.

Hopefully, one day the bug will be fixed and moving the action logic
to Intents Extension will be straightforward.

Regards,
Alessio

[1]: https://workingcopyapp.com/

Il giorno mar 25 gen 2022 alle ore 15:52 Houman <houmie@gmail.com> ha scrit=
to:
>
> Shortcut integration for Wireguard on iOS would be amazing. But did you a=
ctually get it working?
>
> I think due to this Apple bug that has been open for years: https://devel=
oper.apple.com/forums/thread/96020, it is not possible to work with Siri sh=
ortcuts on the network extension.
> But if your solution works, it would be amazing!!
>
> Regards,
> Houman
>
> On Tue, 25 Jan 2022 at 14:20, Alessio Nossa <alessio.nossa+list@gmail.com=
> wrote:
>>
>> Hello,
>> I=E2=80=99d like to contribute to wireguard-apple with Shortcuts integra=
tion
>> for the iOS app (this is a feature in the todo-list too).
>> The implementation is almost complete, I=E2=80=99d like to be allowed to=
 merge
>> my contribution with the main app (or to have information on how I can
>> submit my contributions).
>>
>> Kind regards,
>> Alessio Nossa
