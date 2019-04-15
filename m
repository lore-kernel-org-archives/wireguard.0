Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D850C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9962120830
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=certusllc.us header.i=@certusllc.us header.b="YDHL+C9m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9962120830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=certusllc.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74d44412;
	Mon, 6 May 2019 20:28:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4396b04
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Apr 2019 05:35:42 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5ba4b8c
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Apr 2019 05:35:41 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id z9so12003740lfh.6
 for <wireguard@lists.zx2c4.com>; Sun, 14 Apr 2019 22:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=certusllc.us; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=F9k9vwnCk1BxhzELe+INCYwiK8pJNUNgytGHxKlKBP4=;
 b=YDHL+C9mw+NEemYcUvLOUhvf0mQVXsOl1U40Q5Ge8umjrv7BC2w6zK4oBPMGrChVNm
 AT3ZRxmusl+DaOL1AjKO+mCsQ9hO3hI/aMCL0pXzF5lSEZ+GPNd0FBEoIdTHvDIekcSL
 zkzVFNc/FT8J6lKLqK3WBj1GrrW1ZxhuHQ/2lATGXffkywbcy1987ltz1ShAVUHYnt4j
 shA0PA5bNGL65/VcoU5LVRWTKa02E4ZsJi4DXhDIOptV9HXpUM55wvkXVwrQY3LeFdNJ
 5PjubWu6icK371XCHAtUkY8tHw855a06/hkY2076eEsqJeK+1zbEedd8NGNwyluTQt9G
 XXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=F9k9vwnCk1BxhzELe+INCYwiK8pJNUNgytGHxKlKBP4=;
 b=RGc7lvgXA0BEDS/i/1LxLQ0g0cfq6GG0jrXV6gnbmonINjgNs+gc4sEg2LvCixAYgP
 +3XfWUBiAEjVx07TQ10qw+eCFHqJ3bf5A40C3e5+hs/rbGNTu0G+VszEJ9vMwtvtM9ds
 LKJ1/JMikcEny8r+WVri7Py7ExLUflbYtSgXLFgKhRZD0l1lO36m6SXqfWFcc5U80d3c
 UmvIkSyYHVrioJcZ6YDxGsbUpPDmgxW9jdgNJlQdsRbry7QqEE0NmV2ZLTMg7zzaWOzt
 gJRXNfsHuMFUyy/9QQ5B8I3dlTubcEKKRxinVrpkf041OW9irTs3shHy7dYxrk7GubQi
 R7jg==
X-Gm-Message-State: APjAAAWOYu0P6vTOe0nFBI5Hs188eTD96RUBdyURxtm/vqlu1Oy6BHut
 KODNK6c39sNz6jmTSpHZjNMYydkF5Vm/SJxLzSjHF5Tuxqs=
X-Google-Smtp-Source: APXvYqyTjasuSxyLkDuIM2rHTT8mt97ScVBr1capaE/f9rj4m+VEqEVUym/P4qv6EHsmLMhn6bVP0Bx5XgD5/KrjVzs=
X-Received: by 2002:ac2:5625:: with SMTP id b5mr15782275lff.137.1555306539740; 
 Sun, 14 Apr 2019 22:35:39 -0700 (PDT)
MIME-Version: 1.0
From: Eric Atkin <eatkin@certusllc.us>
Date: Sun, 14 Apr 2019 23:35:03 -0600
Message-ID: <CABt5tOUhxdSngF0VrpGvenoHBg5vNcBSV+aUGJWmbSJ9iCtKSg@mail.gmail.com>
Subject: Peer names
To: wireguard@lists.zx2c4.com
Content-Type: multipart/mixed; boundary="000000000000d197a505868b0567"
X-Mailman-Approved-At: Mon, 06 May 2019 22:28:35 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
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

--000000000000d197a505868b0567
Content-Type: multipart/alternative; boundary="000000000000d197a205868b0565"

--000000000000d197a205868b0565
Content-Type: text/plain; charset="UTF-8"

I find identifying peers in `wg show` output by the public key to be human
un-friendly. The following patch adds an optional "alias". I am not a
kernel developer or even a competent C developer. I think there are memory
leaks here and perhaps other issues, but it does work and demonstrates the
concept. This is as far as I can take it. Is this of interest or help to
anyone who could get it across the finish line?
Eric Atkin

--000000000000d197a205868b0565
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I find identifying peers in `wg show` output by the public=
 key to be human un-friendly. The following patch adds an optional &quot;al=
ias&quot;. I am not a kernel developer or even a competent C developer. I t=
hink there are memory leaks here and perhaps other issues, but it does work=
 and demonstrates the concept. This is as far as I can take it. Is this of =
interest or help to anyone who could get it across the finish line?<div>Eri=
c Atkin</div><div><br></div><div><br></div></div>

--000000000000d197a205868b0565--

--000000000000d197a505868b0567
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-Add-peer-aliases.patch"
Content-Disposition: attachment; filename="0001-Add-peer-aliases.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_juhxa96g0>
X-Attachment-Id: f_juhxa96g0

RnJvbSBmMWU4MmI2NjBlOWQ4ZTJjYzViMmFiNmJiMGMzMTc1OGIwNDVlZWIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFcmljIEF0a2luIDxlYXRraW5AY2VydHVzbGxjLnVzPgpEYXRl
OiBTdW4sIDE0IEFwciAyMDE5IDIzOjI1OjU4IC0wNjAwClN1YmplY3Q6IFtQQVRDSF0gQWRkIHBl
ZXIgYWxpYXNlcwoKLS0tCiBzcmMvbmV0bGluay5jICAgICAgICAgIHwgIDYgKysrKystCiBzcmMv
cGVlci5oICAgICAgICAgICAgIHwgIDEgKwogc3JjL3Rvb2xzL2NvbmZpZy5jICAgICB8IDEyICsr
KysrKysrKysrLQogc3JjL3Rvb2xzL2NvbnRhaW5lcnMuaCB8ICAxICsKIHNyYy90b29scy9pcGMu
YyAgICAgICAgfCAgNiArKysrKysKIHNyYy90b29scy9zaG93LmMgICAgICAgfCAgMiArKwogc3Jj
L3VhcGkvd2lyZWd1YXJkLmggICB8ICAxICsKIDcgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zcmMvbmV0bGluay5jIGIvc3JjL25l
dGxpbmsuYwppbmRleCBiMTc5YjMxLi42ZmVlNmI4IDEwMDY0NAotLS0gYS9zcmMvbmV0bGluay5j
CisrKyBiL3NyYy9uZXRsaW5rLmMKQEAgLTEyMiw3ICsxMjIsOCBAQCBnZXRfcGVlcihzdHJ1Y3Qg
d2dfcGVlciAqcGVlciwgc3RydWN0IGFsbG93ZWRpcHNfbm9kZSAqKm5leHRfYWxsb3dlZGlwc19u
b2RlLAogCQlpZiAoZmFpbCkKIAkJCWdvdG8gZXJyOwogCi0JCWlmIChubGFfcHV0KHNrYiwgV0dQ
RUVSX0FfTEFTVF9IQU5EU0hBS0VfVElNRSwKKwkJaWYgKChwZWVyLT5hbGlhcyAmJiBubGFfcHV0
X3N0cmluZyhza2IsIFdHUEVFUl9BX0FMSUFTLCBwZWVyLT5hbGlhcykpIHx8CisJCQlubGFfcHV0
KHNrYiwgV0dQRUVSX0FfTEFTVF9IQU5EU0hBS0VfVElNRSwKIAkJCSAgICBzaXplb2YobGFzdF9o
YW5kc2hha2UpLCAmbGFzdF9oYW5kc2hha2UpIHx8CiAJCSAgICBubGFfcHV0X3UxNihza2IsIFdH
UEVFUl9BX1BFUlNJU1RFTlRfS0VFUEFMSVZFX0lOVEVSVkFMLAogCQkJCXBlZXItPnBlcnNpc3Rl
bnRfa2VlcGFsaXZlX2ludGVydmFsKSB8fApAQCAtNDI2LDYgKzQyNyw5IEBAIHN0YXRpYyBpbnQg
c2V0X3BlZXIoc3RydWN0IHdnX2RldmljZSAqd2csIHN0cnVjdCBubGF0dHIgKiphdHRycykKIAkJ
dXBfd3JpdGUoJnBlZXItPmhhbmRzaGFrZS5sb2NrKTsKIAl9CiAKKwlpZiAoYXR0cnNbV0dQRUVS
X0FfQUxJQVNdKQorCQlwZWVyLT5hbGlhcyA9IG5sYV9zdHJkdXAoYXR0cnNbV0dQRUVSX0FfQUxJ
QVNdLCBHRlBfS0VSTkVMKTsKKwogCWlmIChhdHRyc1tXR1BFRVJfQV9FTkRQT0lOVF0pIHsKIAkJ
c3RydWN0IHNvY2thZGRyICphZGRyID0gbmxhX2RhdGEoYXR0cnNbV0dQRUVSX0FfRU5EUE9JTlRd
KTsKIAkJc2l6ZV90IGxlbiA9IG5sYV9sZW4oYXR0cnNbV0dQRUVSX0FfRU5EUE9JTlRdKTsKZGlm
ZiAtLWdpdCBhL3NyYy9wZWVyLmggYi9zcmMvcGVlci5oCmluZGV4IDIzYWY0MDkuLjIxZGIzMzMg
MTAwNjQ0Ci0tLSBhL3NyYy9wZWVyLmgKKysrIGIvc3JjL3BlZXIuaApAQCAtNjQsNiArNjQsNyBA
QCBzdHJ1Y3Qgd2dfcGVlciB7CiAJdTY0IGludGVybmFsX2lkOwogCXN0cnVjdCBuYXBpX3N0cnVj
dCBuYXBpOwogCWJvb2wgaXNfZGVhZDsKKwljaGFyICphbGlhczsKIH07CiAKIHN0cnVjdCB3Z19w
ZWVyICp3Z19wZWVyX2NyZWF0ZShzdHJ1Y3Qgd2dfZGV2aWNlICp3ZywKZGlmZiAtLWdpdCBhL3Ny
Yy90b29scy9jb25maWcuYyBiL3NyYy90b29scy9jb25maWcuYwppbmRleCBkNTEwZWE3Li43MmM0
M2NlIDEwMDY0NAotLS0gYS9zcmMvdG9vbHMvY29uZmlnLmMKKysrIGIvc3JjL3Rvb2xzL2NvbmZp
Zy5jCkBAIC0xNzQsNiArMTc0LDE0IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwYXJzZV9pcChzdHJ1
Y3Qgd2dhbGxvd2VkaXAgKmFsbG93ZWRpcCwgY29uc3QgY2hhciAqdmFsdWUpCiAJcmV0dXJuIHRy
dWU7CiB9CiAKK3N0YXRpYyBpbmxpbmUgYm9vbCBwYXJzZV9hbGlhcyhjaGFyICoqYWxpYXMsIGNv
bnN0IGNoYXIgKnZhbHVlKSB7CisJaWYgKCEoKmFsaWFzID0gc3RyZHVwKHZhbHVlKSkpIHsKKwkJ
cGVycm9yKCJzdHJkdXAiKTsKKwkJcmV0dXJuIGZhbHNlOworCX0KKwlyZXR1cm4gdHJ1ZTsKK30K
Kwogc3RhdGljIGlubGluZSBib29sIHBhcnNlX2VuZHBvaW50KHN0cnVjdCBzb2NrYWRkciAqZW5k
cG9pbnQsIGNvbnN0IGNoYXIgKnZhbHVlKQogewogCWNoYXIgKm11dGFibGUgPSBzdHJkdXAodmFs
dWUpOwpAQCAtNDM1LDcgKzQ0Myw5IEBAIHN0YXRpYyBib29sIHByb2Nlc3NfbGluZShzdHJ1Y3Qg
Y29uZmlnX2N0eCAqY3R4LCBjb25zdCBjaGFyICpsaW5lKQogCQl9IGVsc2UKIAkJCWdvdG8gZXJy
b3I7CiAJfSBlbHNlIGlmIChjdHgtPmlzX3BlZXJfc2VjdGlvbikgewotCQlpZiAoa2V5X21hdGNo
KCJFbmRwb2ludCIpKQorCQlpZiAoa2V5X21hdGNoKCJBbGlhcyIpKQorCQkJcmV0ID0gcGFyc2Vf
YWxpYXMoJmN0eC0+bGFzdF9wZWVyLT5hbGlhcywgdmFsdWUpOworCQllbHNlIGlmIChrZXlfbWF0
Y2goIkVuZHBvaW50IikpCiAJCQlyZXQgPSBwYXJzZV9lbmRwb2ludCgmY3R4LT5sYXN0X3BlZXIt
PmVuZHBvaW50LmFkZHIsIHZhbHVlKTsKIAkJZWxzZSBpZiAoa2V5X21hdGNoKCJQdWJsaWNLZXki
KSkgewogCQkJcmV0ID0gcGFyc2Vfa2V5KGN0eC0+bGFzdF9wZWVyLT5wdWJsaWNfa2V5LCB2YWx1
ZSk7CmRpZmYgLS1naXQgYS9zcmMvdG9vbHMvY29udGFpbmVycy5oIGIvc3JjL3Rvb2xzL2NvbnRh
aW5lcnMuaAppbmRleCA1OWEyMTNlLi5lOTYxMTkyIDEwMDY0NAotLS0gYS9zcmMvdG9vbHMvY29u
dGFpbmVycy5oCisrKyBiL3NyYy90b29scy9jb250YWluZXJzLmgKQEAgLTQyLDYgKzQyLDcgQEAg
ZW51bSB7CiBzdHJ1Y3Qgd2dwZWVyIHsKIAl1aW50MzJfdCBmbGFnczsKIAorCWNoYXIgKmFsaWFz
OwogCXVpbnQ4X3QgcHVibGljX2tleVtXR19LRVlfTEVOXTsKIAl1aW50OF90IHByZXNoYXJlZF9r
ZXlbV0dfS0VZX0xFTl07CiAKZGlmZiAtLWdpdCBhL3NyYy90b29scy9pcGMuYyBiL3NyYy90b29s
cy9pcGMuYwppbmRleCA3YWIzYTYyLi4xMzNhYTM4IDEwMDY0NAotLS0gYS9zcmMvdG9vbHMvaXBj
LmMKKysrIGIvc3JjL3Rvb2xzL2lwYy5jCkBAIC01OTAsNiArNTkwLDggQEAgYWdhaW46CiAJCXVp
bnQzMl90IGZsYWdzID0gMDsKIAogCQlwZWVyX25lc3QgPSBtbmxfYXR0cl9uZXN0X3N0YXJ0X2No
ZWNrKG5saCwgU09DS0VUX0JVRkZFUl9TSVpFLCAwKTsKKwkJaWYgKHBlZXItPmFsaWFzKQorCQkJ
bW5sX2F0dHJfcHV0X3N0cihubGgsIFdHUEVFUl9BX0FMSUFTLCBwZWVyLT5hbGlhcyk7CiAJCWlm
ICghcGVlcl9uZXN0KQogCQkJZ290byB0b29iaWdfcGVlcnM7CiAJCWlmICghbW5sX2F0dHJfcHV0
X2NoZWNrKG5saCwgU09DS0VUX0JVRkZFUl9TSVpFLCBXR1BFRVJfQV9QVUJMSUNfS0VZLCBzaXpl
b2YocGVlci0+cHVibGljX2tleSksIHBlZXItPnB1YmxpY19rZXkpKQpAQCAtNzgzLDYgKzc4NSwx
MCBAQCBzdGF0aWMgaW50IHBhcnNlX3BlZXIoY29uc3Qgc3RydWN0IG5sYXR0ciAqYXR0ciwgdm9p
ZCAqZGF0YSkKIAkJaWYgKCFtbmxfYXR0cl92YWxpZGF0ZShhdHRyLCBNTkxfVFlQRV9VNjQpKQog
CQkJcGVlci0+dHhfYnl0ZXMgPSBtbmxfYXR0cl9nZXRfdTY0KGF0dHIpOwogCQlicmVhazsKKwlj
YXNlIFdHUEVFUl9BX0FMSUFTOgorCQlpZiAoIW1ubF9hdHRyX3ZhbGlkYXRlKGF0dHIsIE1OTF9U
WVBFX1NUUklORykpCisJCQlwZWVyLT5hbGlhcyA9IHN0cmR1cChtbmxfYXR0cl9nZXRfc3RyKGF0
dHIpKTsKKwkJYnJlYWs7CiAJY2FzZSBXR1BFRVJfQV9BTExPV0VESVBTOgogCQlyZXR1cm4gbW5s
X2F0dHJfcGFyc2VfbmVzdGVkKGF0dHIsIHBhcnNlX2FsbG93ZWRpcHMsIHBlZXIpOwogCX0KZGlm
ZiAtLWdpdCBhL3NyYy90b29scy9zaG93LmMgYi9zcmMvdG9vbHMvc2hvdy5jCmluZGV4IGZmMDg5
N2QuLmZmMTY3YTMgMTAwNjQ0Ci0tLSBhL3NyYy90b29scy9zaG93LmMKKysrIGIvc3JjL3Rvb2xz
L3Nob3cuYwpAQCAtMjI2LDYgKzIyNiw4IEBAIHN0YXRpYyB2b2lkIHByZXR0eV9wcmludChzdHJ1
Y3Qgd2dkZXZpY2UgKmRldmljZSkKIAl9CiAJZm9yX2VhY2hfd2dwZWVyKGRldmljZSwgcGVlcikg
ewogCQl0ZXJtaW5hbF9wcmludGYoVEVSTUlOQUxfRkdfWUVMTE9XIFRFUk1JTkFMX0JPTEQgInBl
ZXIiIFRFUk1JTkFMX1JFU0VUICI6ICIgVEVSTUlOQUxfRkdfWUVMTE9XICIlcyIgVEVSTUlOQUxf
UkVTRVQgIlxuIiwga2V5KHBlZXItPnB1YmxpY19rZXkpKTsKKwkJaWYgKHBlZXItPmFsaWFzKQor
CQkJdGVybWluYWxfcHJpbnRmKCIgICIgVEVSTUlOQUxfQk9MRCAiYWxpYXMiIFRFUk1JTkFMX1JF
U0VUICI6ICVzXG4iLCBwZWVyLT5hbGlhcyk7CiAJCWlmIChwZWVyLT5mbGFncyAmIFdHUEVFUl9I
QVNfUFJFU0hBUkVEX0tFWSkKIAkJCXRlcm1pbmFsX3ByaW50ZigiICAiIFRFUk1JTkFMX0JPTEQg
InByZXNoYXJlZCBrZXkiIFRFUk1JTkFMX1JFU0VUICI6ICVzXG4iLCBtYXNrZWRfa2V5KHBlZXIt
PnByZXNoYXJlZF9rZXkpKTsKIAkJaWYgKHBlZXItPmVuZHBvaW50LmFkZHIuc2FfZmFtaWx5ID09
IEFGX0lORVQgfHwgcGVlci0+ZW5kcG9pbnQuYWRkci5zYV9mYW1pbHkgPT0gQUZfSU5FVDYpCmRp
ZmYgLS1naXQgYS9zcmMvdWFwaS93aXJlZ3VhcmQuaCBiL3NyYy91YXBpL3dpcmVndWFyZC5oCmlu
ZGV4IDA3MWNlNDEuLmI5N2ZmMTYgMTAwNjQ0Ci0tLSBhL3NyYy91YXBpL3dpcmVndWFyZC5oCisr
KyBiL3NyYy91YXBpL3dpcmVndWFyZC5oCkBAIC0xNzQsNiArMTc0LDcgQEAgZW51bSB3Z3BlZXJf
YXR0cmlidXRlIHsKIAlXR1BFRVJfQV9UWF9CWVRFUywKIAlXR1BFRVJfQV9BTExPV0VESVBTLAog
CVdHUEVFUl9BX1BST1RPQ09MX1ZFUlNJT04sCisJV0dQRUVSX0FfQUxJQVMsCiAJX19XR1BFRVJf
QV9MQVNUCiB9OwogI2RlZmluZSBXR1BFRVJfQV9NQVggKF9fV0dQRUVSX0FfTEFTVCAtIDEpCi0t
IAoyLjIxLjAKCg==
--000000000000d197a505868b0567
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--000000000000d197a505868b0567--
