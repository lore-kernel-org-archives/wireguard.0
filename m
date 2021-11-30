Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F4EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Nov 2021 10:12:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 80f8cb9b;
	Tue, 30 Nov 2021 10:12:16 +0000 (UTC)
Received: from vidar.ut-capitole.fr (vidar-alt-1.ut-capitole.fr
 [193.49.48.246])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7cb9c8a7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Nov 2021 10:12:14 +0000 (UTC)
Received: from [10.172.1.6] (wg-a19600.ut-capitole.fr [10.172.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bandry)
 by vidar.ut-capitole.fr (Postfix) with ESMTPSA id 02FEC40C5342;
 Tue, 30 Nov 2021 11:12:14 +0100 (CET)
Message-ID: <091c01e5-30bb-71d1-a863-999d6dbae7dd@ut1.org>
Date: Tue, 30 Nov 2021 11:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Windows Client] Out of date Title scare my users
Content-Language: en-US
To: lazerl0rd@thezest.dev, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <1da227e6-5b12-40ca-a6de-3117835a2f16@ut1.org>
 <CAHmME9oqvV9E9cVXeF5nVpumE0fJgdASaBqG6aCPyS-NLq9rXQ@mail.gmail.com>
 <ccf4971633fdd62807ff51ddf7de1299@purelymail.com>
 <406a9568-8f70-b222-4e08-23fc5884847e@ut1.org>
 <CAHmME9roq+Qp7TFA4h3KZDuTd6DYJ68y2j9__MrX3+FDdtwVbA@mail.gmail.com>
 <CAHmME9rwFyJ4W3nnbTWq0e0X_P_FOQx6Z3kcuUhcYuYjkc0atQ@mail.gmail.com>
 <2b0136d9581406195d542696db53d8cd@purelymail.com>
From: Bruno UT1 <bandry@ut1.org>
In-Reply-To: <2b0136d9581406195d542696db53d8cd@purelymail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

I validate what Diab said. It's a good start, hoping option 5 will be 
possible later.

Thank you for changes.

Have a good day.

Le 26/11/2021 à 10:17, lazerl0rd@thezest.dev a écrit :
> I assume you've chosen the "reword" route instead of any larger 
> changes, for the better or worse (though as Bruno said, it would be 
> great if 5) is considered somewhere down the line).
>
> Since this route was chosen, I suggest that we also reword the update 
> prompt itself as I feel that is equally responsible for users 
> "freaking out". After all, it is literally telling users to contact 
> their sysadmin instantly for each update. I propose something along 
> the lines of the following patch (though I guess il8n will be a bit of 
> a pain):
>
> ```
> From 76ea8a81cf327527089bfea8209bf4f2faa1b6cf Mon Sep 17 00:00:00 2001
> From: Diab Neiroukh <lazerl0rd@thezest.dev>
> Date: Fri, 26 Nov 2021 09:12:15 +0000
> Subject: [PATCH] ui: Don't explicitly tell users to contact their 
> sysadmin for
>  updates.
>
> The wording used here practically told users to instantly contact their
> system administrators for every update. We can reword it to instead to
> implicitly suggest that they contact their system administrator if
> the update has not been applied for "a relatively long time".
>
> Signed-off-by: Diab Neiroukh <lazerl0rd@thezest.dev>
> ---
>  ui/updatepage.go | 2 +-
>  zgotext.go       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/updatepage.go b/ui/updatepage.go
> index 96fc87f3..76a8dced 100644
> --- a/ui/updatepage.go
> +++ b/ui/updatepage.go
> @@ -65,7 +65,7 @@ func NewUpdatePage() (*UpdatePage, error) {
>      button.SetText(l18n.Sprintf("Update Now"))
>
>      if !IsAdmin {
> -        button.SetText(l18n.Sprintf("Please ask the system 
> administrator to update."))
> +        button.SetText(l18n.Sprintf("There is an update available. 
> The system administrator should update soon."))
>          button.SetEnabled(false)
>          status.SetText(l18n.Sprintf("Status: Waiting for 
> administrator"))
>      }
> diff --git a/zgotext.go b/zgotext.go
> index efbb9a80..e35974aa 100644
> --- a/zgotext.go
> +++ b/zgotext.go
> @@ -235,7 +235,7 @@ var messageKeyToIndex = map[string]int{
>      "Packet with invalid IP version from 
> %v":                               215,
> "Peer":  100,
>      "Persistent 
> keepalive:":                                                54,
> -    "Please ask the system administrator to 
> update.":                       275,
> +    "There is an update available. The system administrator should 
> update soon.":                         275,
>      "Preshared 
> key:":                                                       51,
>      "Protocol version must be 
> 1":                                           85,
>      "Public key:":  46,
