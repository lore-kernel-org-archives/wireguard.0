Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B329FC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 26 Nov 2021 09:18:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8dd6c73a;
	Fri, 26 Nov 2021 09:18:03 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5bba1655
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Nov 2021 09:18:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=OhpFHPuK0zvzhtlQsS1vFlQufUWHmUP+q+Thg5MWZaJIbLViNzwrBcU6KXEHBCUtljfhNoN3FTzVnbAy0mwaFc5GdHigrnbqMEae5C5cPaxWL3g9AKfJa+mAkIIGMr3P1up4u+JGuaKGpoxJA7dx3O7/gCa+Hj1KYKBLSgw2k6w2AQX6hi2wrFv4iglhz/ybRmOw7yhzZChejgJJn5Fwd8piZz+oe7QQj0AH8HrxUByPHzK4Ms3mci422M46TevbPfmpJfdRDGoi/XIvWeuCjr5fGtdcTi2jCf5liFzHOWp1KRQ2A6lzr4WF0QKbD4g66yEoDFqr12Rex9VLbsGKvQ==;
 s=purelymail1; d=thezest.dev; v=1;
 bh=kjlq6stxaV8n1xYIckRe8J4dP6V7Japnowfkz290MGw=; h=Received:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=k0zGt/fRB/h7WgSfsj6YjikBPaxlxWDjeulCH6ozd+A4vtYDH0TxNwTaEUJtakueTHE54Vt0znDiJzQeH3Myq0RLPV3WCXGkbpzr8FO0JvQYV2rCCFsLgfQKmV7bMMA3jmwPQbmi8xCvzWe03DWMmW0g2CFi6pfBFZqPMxO8ngqHMjLHEBPE7e0a7WqGJDUW90449oEI4znX7xEFXjSaOfgSDVqZj+rekH7obtgyjR+D1bFU4Srd0dXCLT0WobWP+1LAI48lwNKf2nEnQDvzYqHS2VfajVwyfDNe9Dq4KX3rBmJcKqe4XqgcoqWbPBcx9KIXve2Im6cCVsqDcxxcaQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=kjlq6stxaV8n1xYIckRe8J4dP6V7Japnowfkz290MGw=;
 h=Feedback-ID:Received:From:To; 
Feedback-ID: 1188:367:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by ip-172-30-0-12.ec2.internal (JAMES SMTP Server ) with ESMTPA ID
 -1382316362; Fri, 26 Nov 2021 09:17:38 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 26 Nov 2021 09:17:38 +0000
From: lazerl0rd@thezest.dev
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Bruno UT1 <bandry@ut1.org>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: [Windows Client] Out of date Title scare my users
In-Reply-To: <CAHmME9rwFyJ4W3nnbTWq0e0X_P_FOQx6Z3kcuUhcYuYjkc0atQ@mail.gmail.com>
References: <1da227e6-5b12-40ca-a6de-3117835a2f16@ut1.org>
 <CAHmME9oqvV9E9cVXeF5nVpumE0fJgdASaBqG6aCPyS-NLq9rXQ@mail.gmail.com>
 <ccf4971633fdd62807ff51ddf7de1299@purelymail.com>
 <406a9568-8f70-b222-4e08-23fc5884847e@ut1.org>
 <CAHmME9roq+Qp7TFA4h3KZDuTd6DYJ68y2j9__MrX3+FDdtwVbA@mail.gmail.com>
 <CAHmME9rwFyJ4W3nnbTWq0e0X_P_FOQx6Z3kcuUhcYuYjkc0atQ@mail.gmail.com>
User-Agent: Purely Mail via Roundcube/1.5.0
Message-ID: <2b0136d9581406195d542696db53d8cd@purelymail.com>
X-Sender: lazerl0rd@thezest.dev
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

I assume you've chosen the "reword" route instead of any larger changes, 
for the better or worse (though as Bruno said, it would be great if 5) 
is considered somewhere down the line).

Since this route was chosen, I suggest that we also reword the update 
prompt itself as I feel that is equally responsible for users "freaking 
out". After all, it is literally telling users to contact their sysadmin 
instantly for each update. I propose something along the lines of the 
following patch (though I guess il8n will be a bit of a pain):

```
 From 76ea8a81cf327527089bfea8209bf4f2faa1b6cf Mon Sep 17 00:00:00 2001
 From: Diab Neiroukh <lazerl0rd@thezest.dev>
Date: Fri, 26 Nov 2021 09:12:15 +0000
Subject: [PATCH] ui: Don't explicitly tell users to contact their 
sysadmin for
  updates.

The wording used here practically told users to instantly contact their
system administrators for every update. We can reword it to instead to
implicitly suggest that they contact their system administrator if
the update has not been applied for "a relatively long time".

Signed-off-by: Diab Neiroukh <lazerl0rd@thezest.dev>
---
  ui/updatepage.go | 2 +-
  zgotext.go       | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/updatepage.go b/ui/updatepage.go
index 96fc87f3..76a8dced 100644
--- a/ui/updatepage.go
+++ b/ui/updatepage.go
@@ -65,7 +65,7 @@ func NewUpdatePage() (*UpdatePage, error) {
  	button.SetText(l18n.Sprintf("Update Now"))

  	if !IsAdmin {
-		button.SetText(l18n.Sprintf("Please ask the system administrator to 
update."))
+		button.SetText(l18n.Sprintf("There is an update available. The system 
administrator should update soon."))
  		button.SetEnabled(false)
  		status.SetText(l18n.Sprintf("Status: Waiting for administrator"))
  	}
diff --git a/zgotext.go b/zgotext.go
index efbb9a80..e35974aa 100644
--- a/zgotext.go
+++ b/zgotext.go
@@ -235,7 +235,7 @@ var messageKeyToIndex = map[string]int{
  	"Packet with invalid IP version from %v":                              
  215,
  	"Peer":                                                                
  100,
  	"Persistent keepalive:":                                               
  54,
-	"Please ask the system administrator to update.":                      
  275,
+	"There is an update available. The system administrator should update 
soon.":                         275,
  	"Preshared key:":                                                      
  51,
  	"Protocol version must be 1":                                          
  85,
  	"Public key:":                                                         
  46,
-- 
2.34.0
```

On 2021-11-26 08:47, Jason A. Donenfeld wrote:
> https://git.zx2c4.com/wireguard-windows/commit/?id=8120d07dd5fc9a5e545419fe13490086ce920f31
> 
> Is this okay with both of you?
